library(FNN)
library(plyr)

DEBUG<-F

nearest.points3=function(matches, P.A, radius){
	matches$dist=sqrt((matches$row-P.A['row'])^2 + (matches$col-P.A['col'])^2 )
	matches=subset(matches, dist<radius, select=c(row,col))
	if(!nrow(matches)) return(data.frame(row=NA,col=NA))
	return(matches)
}

matching.points2=function(image.A, image.B, identity.radius, mode=1){
	A.matrix=cbind(image.A$row, image.A$col)
	B.matrix=cbind(image.B$row, image.B$col)
	AB.matrix=rbind(A.matrix, B.matrix)
	if( max(is.na(AB.matrix)))
	{	if(mode==1) return(data.frame('row.x'=NA,'col.x'=NA,'row.y'=NA,'col.y'=NA));
		if(mode==2) return(NA);
	}
	pairs=get.knn(AB.matrix, k=1, algorithm="kd_tree")

	matches=cbind(c(1:(nrow(A.matrix)+nrow(B.matrix))), pairs$nn.index)
	if(mode==1) match.vector2= pairs$nn.dist<identity.radius
	match.vector=  matches[,1]<nrow(A.matrix)& matches[,2]>nrow(A.matrix)

	if(mode==1) match.vector= match.vector& match.vector2
	A.indices= matches[match.vector,1]
	B.indices= matches[match.vector,2]-nrow(A.matrix)

	points=data.frame(cbind(image.A[A.indices,], image.B[B.indices,]))
	names(points)=c('row.x','col.x','row.y','col.y')

	if(mode==1) return(points);
	if(mode==2) return(sum(abs(pairs$nn.dist[match.vector])));
}


evaluate.agreement.step1=function(I.A, I.B, P.A, identity.radius){
	matches= matching.points2(I.A, I.B, identity.radius, mode=1)
	matches$dist=sqrt((matches$row.x-P.A[['row']])^2 + (matches$col.x-P.A[['col']])^2 )
	n.matches= nrow(subset(matches, dist<100))
	return(n.matches)
}


number.of.matches=function(image.A, image.B, P.A, nearest.in.B, identity.radius){
	nearest.in.B$matches= apply(as.matrix(nearest.in.B), 1, function(x) # aaply
	{	translated.B= image.B
		translated.B$row= translated.B$row+ (P.A[['row']]-x[['row']])
		translated.B$col= translated.B$col+ (P.A[['col']]-x[['col']])
		n.matches= evaluate.agreement.step1(image.A, translated.B, P.A, identity.radius)
		return(n.matches)
	}) #, .parallel=T
	return(nearest.in.B[order(nearest.in.B$matches, decreasing=T),] );
}


# iterate until convergence by means of increasing radius whilst also increasing threshold

perform.ANOVA=function(I.B, current.points, I.B.reset){
	l= lm(cbind(row.x,col.x) ~ row.y + col.y, data= current.points)
	names(I.B)=c("row.y","col.y")
    if( !is.na(max(l$coefficients[,1])) & !is.na(max(l$coefficients[,2])) & abs(min(l$coefficients[,2]))>1e-10 & abs(min(l$coefficients[,1]))>1e-10) #
	{   p =as.data.frame( predict(l, I.B) )
	} else
	{
		p=I.B.reset
	}
	names(p)=c("row","col")
	return (p);
}

point.set.register2=function(I.A,I.B, identity.radius=5){
	if(DEBUG){
		plot(I.A$row,I.A$col , col="green", xlim=c(0,1000), ylim=c(0,600))
		points(I.B$row, I.B$col, col="red")
	}
	best.fit= data.frame(row=NA,col=NA,matches=0)
	all.indices =c(1:nrow(I.A))
#iterations= min(nrow(I.B)/10, 50)	# maybe 50 needs to be adopted
	iterations= nrow(I.B)/10
	for(i in c( iterations:1)){
		if(length(all.indices)< 3) break
		sample.point.A=sample(all.indices,1)
		all.indices = setdiff(all.indices, sample.point.A)
		
		P.A=I.A[sample.point.A,]		#random point in image A
		P.A=c(row=P.A$row, col=P.A$col)
		nearest.in.B= nearest.points3(I.B, P.A, max(I.B$col, I.B$row)*(i/iterations)) # potential corresponding-points in image B with fusion horopter
		peek.fit=number.of.matches(I.A,I.B, P.A, nearest.in.B, identity.radius)[1,] # which of them yields most point-overlays within xx px radius?
		if(DEBUG){
			points(P.A['row'], P.A['col'], col="blue")
		}

		if(peek.fit$matches>best.fit$matches)
		{	final.point = P.A
			best.fit= peek.fit

			I.B$row= I.B$row+ unlist(final.point['row']-best.fit['row'])	# translate to fit
			I.B$col= I.B$col+ unlist(final.point['col']-best.fit['col'])
			if(DEBUG){
				plot(I.A$row,I.A$col , col="green", xlim=c(0,1000), ylim=c(0,600))
				points(I.B$row, I.B$col, col="red")
				points(final.point['row'], final.point['col'], col="black")
			}
		}
	}
#	print(best.fit$matches)
	return(I.B)
}


read.pointset=function(id, rotate90=F, flipH=F, flipV=F){
	d1=read.delim(paste("http://auginfo/cellfinder_results/0?mode=results&constraint=idanalysis=", id, sep=""))
#	d1=read.delim(paste("http://localhost:3000/ANA/results/", id, sep=""))
	if(rotate90)
	{	t= d1$col
		d1$col= d1$row
		d1$row=t
	}
	if(flipH) d1$col=max(d1$col)-d1$col
	if(flipV) d1$row=max(d1$row)-d1$row

	return (d1)
}

evaluate.agreement=function(I.A, I.B, identity.radius){
	points=matching.points2(I.A, I.B, 2, mode=1)
	error.sum=matching.points2(I.A, I.B, 2, mode=2)
	return(error.sum/nrow(points))
}
evaluate.agreement2=function(I.A, I.B, identity.radius){
	points=matching.points2(I.A, I.B, identity.radius, mode=1)
	error.sum=matching.points2(I.A, I.B, identity.radius, mode=2)
	return(error.sum/nrow(points))
}
evaluate.agreement3=function(I.A, I.B, identity.radius){
	return(1-(nrow(matching.points2(I.A, I.B, identity.radius, mode=1))/nrow(matching.points2(I.A, I.B, identity.radius*3, mode=1))))
}
evaluate.agreement4=function(I.A, I.B, identity.radius){
	return(1000-(nrow(matching.points2(I.A, I.B, identity.radius, mode=1))))
}

run.registration=function(I.A, I.B, iterations=7, anova.iterations=20,  thresh=100, identity.radius=5, mode=1, evaluate.agreement.FUN=evaluate.agreement){
	exit.loop=F
	error.sum=evaluate.agreement.FUN(I.A, I.B, identity.radius)
	if(error.sum<thresh) return(I.B)
	for(i in c(1:iterations)){
		I.B=point.set.register2(I.A, I.B, identity.radius )
		error.sum=evaluate.agreement.FUN(I.A, I.B, identity.radius)
		if(DEBUG) print(error.sum)
		if(error.sum<thresh)
		{	exit.loop=T
				break
		}
		I.B.reset=I.B
		if(mode==1& anova.iterations>0)
		{	for(j in 1: anova.iterations){
				set.AB=matching.points2(I.A, I.B, identity.radius*identity.radius*3)
				I.B= perform.ANOVA(I.B, set.AB, I.B.reset)
				if(DEBUG){
					plot(I.A$row,I.A$col , col="green", xlim=c(0,1000), ylim=c(0,600))
					points(I.B$row, I.B$col, col="red")
				}
				error.sum=evaluate.agreement.FUN(I.A, I.B, identity.radius)
				if(error.sum<thresh)
				{	exit.loop=T
					break
				}
			}
		}
		if(exit.loop) break
	}
	if(mode==1 & error.sum>thresh) return(NULL)
	return(I.B)
}

run.robust.registration=function(I.A, I.B,  thresh=100, identity.radius=6, iterations=5, anova.iterations=20, evaluate.agreement.FUN=evaluate.agreement){
	I.A=subset(I.A, select=c(row,col))
	I.B=subset(I.B, select=c(row,col))
	I.B=run.registration(I.A, I.B, iterations=1,  thresh, identity.radius, mode=2, evaluate.agreement.FUN=evaluate.agreement.FUN)
	I.B=run.registration(I.A, I.B, iterations=iterations, anova.iterations=anova.iterations,  thresh, identity.radius, evaluate.agreement.FUN=evaluate.agreement.FUN)
	return (I.B)
}

register.two.pointsets=function(d0, d1, thresh=250, identity.radius=6, iterations=5, anova.iterations=20, do.rotate=F,evaluate.agreement.FUN=evaluate.agreement){
	r=run.robust.registration(d0, d1, thresh, identity.radius, iterations, anova.iterations=anova.iterations, evaluate.agreement.FUN=evaluate.agreement.FUN)
	return(r)
}
register.pointsets.out=function(id1, id2, thresh=250, identity.radius=6, iterations=5, anova.iterations=20, do.rotate=F, evaluate.agreement.FUN=evaluate.agreement){
	d0= read.pointset(id1)
	d1= read.pointset(id2)
	r=register.two.pointsets(d0, d1, thresh, identity.radius, iterations, anova.iterations=anova.iterations, do.rotate, evaluate.agreement.FUN)
	if(!is.null(r))
	{	d1= read.pointset(id2)
		I.B.orig=subset(d1, select=c(row,col))
		pre.post=cbind(I.B.orig,r)
		names(pre.post)=c('row.x','col.x','row.y','col.y')
		l= lm(cbind(row.y,col.y) ~ row.x + col.x, data= pre.post)
		coef(l)
		image.magick= paste( c(t(coef(l)))[c(3:6,1:2)], collapse=",")
		return (image.magick)
	}
	return("")
}

