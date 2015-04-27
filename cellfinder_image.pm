#!/usr/bin/perl


package cellfinder_image;

use lib qw {/Users/boehringer/src/privatePerl /Users/boehringer/bin /HHB/bin};

use DBI;
use Image::Magick;

use TempFileNames;
use LWP::Simple;
use Encode;
use v5.10.0;
use Data::Dumper;
use JSON::XS;
use Statistics::R;
use SQL::Abstract;
use POSIX;

#<!> change me as needed
use constant server_root=>'/Users/Shared/cellfinder';

sub runRCode { my ($RCmd)=@_;
    return undef unless $RCmd;
    my $R= Statistics::R->new(shared=>1);
    $R->startR;
warn $RCmd;
	my $filename=tempFileName('/tmp/cellf');
	$R->send($RCmd."\nwriteLines(out, '$filename')\n1");
	# my $out=$R->get('out');
	my $out;
    $out=readFile($filename) if -e $filename;
    chomp $out;
warn "out is: '$out'";
    $R->stopR;
	return  $out;
}


#<!> fixme hardcoded URL
# is directly called from the backend
sub runSimpleRegistrationRCode { my ($id1,$id2)=@_;
	my $RCmd=<<'ENDOFR'
	read.pointset=function(id){
		d1=read.delim(paste("http://localhost:3000/ANA/results/", id, sep=""))
		return (d1)
	}
	d0= subset(read.pointset(<id1>), select=c(row,col))
	d1= subset(read.pointset(<id2>), select=c(row,col))
	pre.post=data.frame(cbind(row.x=d1$row, col.x=d1$col, row.y=d0$row, col.y=d0$col))
	l= lm(cbind(row.y,col.y) ~ row.x + col.x, data= pre.post)
	out=paste( round(c(t(coef(l)))[c(3:6,1:2)], digits=4), collapse=",")
ENDOFR
;	$RCmd=~s/<id1>/$id1/ogs;
	$RCmd=~s/<id2>/$id2/ogs;
	return  runRCode($RCmd);
}
sub runRANSACRegistrationRCode { my ($id1,$id2, $thresh, $identityradius, $iterations, $aiterations, $cfunc)=@_;
	my $RCmd=<<'ENDOFR'
	source('/Users/Shared/bin/Cellfinder2/bin/ransac4.R')
	out=register.pointsets.out(<id1>, <id2>, <thresh>, <identityradius>, iterations=<iterations>, do.rotate=F <extrapars>)
ENDOFR
;
    $aiterations = $aiterations || '0';
	my $extrapars;
	$extrapars.=", evaluate.agreement.FUN=$cfunc" if($cfunc);
	$extrapars.=", anova.iterations=$aiterations";

	$RCmd=~s/<id1>/$id1/ogs;
	$RCmd=~s/<id2>/$id2/ogs;
	$RCmd=~s/<thresh>/$thresh/ogs;
	$RCmd=~s/<identityradius>/$identityradius/ogs;
	$RCmd=~s/<iterations>/$iterations/ogs;
	$RCmd=~s/<extrapars>/$extrapars/ogs;
 warn $RCmd;
	return runRCode($RCmd);
}
sub runRJSONCode { my ($id,$code)=@_;
	my $RCmd=<<'ENDOFR'
	library(rjson)
	read.pointset=function(id){
		d1=read.delim(paste("http://auginfo/cellfinder_results/0?mode=results&constraint=idanalysis=", id, sep=""))
	#	d1=read.delim(paste("http://localhost:3000/ANA/results/", id, sep=""))
		return (d1)
	}
	d0= subset(read.pointset(<id>), select=c(row,col,tag))
	out=""
	<code>
ENDOFR
;	$RCmd=~s/<id>/$id/ogs;
	$RCmd=~s/<code>/$code/ogs;
	#warn $RCmd;
	my $out=runRCode($RCmd);
    warn $out;
	return $out? JSON::XS->new->utf8->decode($out):undef;
}

sub runEBImageRCode { my ($infile,$code, $idanalysis)=@_;
    # return undef unless -e $infile;
	my $RCmd=<<'ENDOFR'
    library(EBImage)
    library(rjson)
    if(nchar("<infile>") & file.exists("<infile>"))
        e=readImage("<infile>")
    if(nchar("<idanalysis>"))
        d1=read.delim(paste("http://auginfo/cellfinder_results/0?mode=results&constraint=idanalysis=", <idanalysis>, sep=""))
	#	d1=read.delim(paste("http://localhost:3000/ANA/results/", <idanalysis>, sep=""))
    out=""
    <code>
ENDOFR
;	$RCmd=~s/<code>/$code/ogs;
	$RCmd=~s/<infile>/$infile/ogs;
	$RCmd=~s/<idanalysis>/$idanalysis/ogs;
warn $RCmd;
	my $out=runRCode($RCmd);
	return (length $out)? JSON::XS->new->utf8->decode($out):undef;
}


sub insertAggregation{
	my $dbh=shift;
	my $idanalysis=shift;
	my $result=shift;
	use SQL::Abstract;
	my $sql = SQL::Abstract->new;

warn Dumper $result;
	for(sort keys %$result)
	{	next if $_ eq 'idanalysis';
        my $val=$result->{$_};
        $val=sprintf("%8.0f",$val) if $val=~/^[0-9\.+-]+$/o;
		my($stmt, @bind) = $sql->insert('aggregations', {idanalysis => $idanalysis, name=> $_, value => $val });
		my $sth = $dbh->prepare($stmt);
		$sth->execute(@bind);
	}
}

sub imageForComposition{
	my $dbh=shift;
	my $idcomposition = shift;
	my $f = shift;
	my $p = shift;
	my $cacheReadDisabled=shift;
	my $idanalysis=shift;
	my $idstack=shift;
	my $curr_cmp = getObjectFromDBHandID($dbh,'patch_compositions', $idcomposition);
	return imageForDBHAndRenderchainIDAndImage($dbh, $curr_cmp->{primary_chain}, $f, $p, $cacheReadDisabled, $idanalysis, $idstack) if($curr_cmp->{primary_chain});
}
sub fetchall_hashref_for_sth{
	my $sth=shift;
	my $arr =  $sth->fetchall_arrayref();
	my @cols=@{$sth->{NAME}};
	my @ret=map
	{	my $ddict;
		for(my $i=0; $i <= $#cols; $i++)
		{	my $val=$_->[$i];
			$ddict-> {$cols[$i]}=$val;
		}
		$ddict;
	} (@{$arr});
	return \@ret;
}

sub tmpfilenameForImgCallParams
{	my $dbh=shift;
	my $readImageFunction=shift;
	my $params=shift;
	my $p=eval('imageForDBHAndRenderchainIDAndImage('.$params.')');
	my $filename=tempFileName('/tmp/cellf');
	$p->Write($filename.'.jpg');
	return $filename.'.jpg';
}

sub imageForDBHAndRenderchainIDAndImage{
	my $dbh=shift;
	my $id= shift;
	my $readImageFunction=shift;
	my $p = shift;
	my $cacheReadDisabled = shift;
	my $idanalysis=shift;
	my $idstack=shift;

	my $idpoint;
	my $idimage=$readImageFunction? $readImageFunction->(1):0;

    warn "** $idimage";

	my $stash;

	my $cachename='/tmp/cellfinder_cache_'.$idimage.'_'.$id.'.jpg';
    unlink $cachename if -e $cachename && $cacheReadDisabled < 0;
	if($idimage && $id && -e  $cachename && !$cacheReadDisabled )
	{	$p = Image::Magick->new();
		$p->Read($cachename);
		warn "cache hit for $cachename";
		return $p;
	}
	$p=$readImageFunction->(0) unless $p;

	# warn $id;
	my $sql=qq/select * from patch_chains_with_parameters where idpatch_chain=?/;
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($id));

	while(my $curr_patch = $sth->fetchrow_hashref())
	{
# warn Dumper $curr_patch;
		if($curr_patch->{params}=~/<handover>/o)
		{	my  $analysis = getObjectFromDBHandID($dbh, 'analyses', $idanalysis);
			my  $handover_params=$analysis->{setup_params};
			$curr_patch->{params}=~s/<handover>/$handover_params/gs;
#warn $handover_params;
			$idimage=0;	# dont write to cache
		}
		if($curr_patch->{patch_type} == 1)	# let do imagemagick do the magick
		{	next unless ref $p eq 'Image::Magick';
			$curr_patch->{params}=~s/"_anonymous_"=>//ogsi;
			if($curr_patch->{patch} eq 'Perl')
			{	$curr_patch->{params}=~s/"//ogs;
# warn $curr_patch->{params};
				eval($curr_patch->{params});
				warn "error: $@" if($@);
			}
			else {	my $code='$p->'.$curr_patch->{patch}.'('.$curr_patch->{params}.')';
					$code=~s/=>"\[([0-9e\., \-\]]+)"/=>[$1/ogs;
					$code=~s/([0-9])\]"/$1]/ogs;
				eval($code);
                #  warn $code;
				warn "error: $@" if($@);
			};
###			warn $curr_patch->{patch};
			warn "error: $@" if($@);
		} elsif($curr_patch->{patch_type} ~~ [3,4,5,6, 7])	# only parameter substitution required
		{	my @arr= map {  $_->[0]=~s/"$//ogs; $_->[1]=~s/"//ogs;$_;}
				map { [ split/=>/o ] }
				map {s/^["\s]+//ogs;$_;}
				split  /[^\\],/o, $curr_patch->{params};
            my $old_p=$p; # preserve image information
			$p=$curr_patch->{patch};
			$p=~s/<$_->[0]>/$_->[1]/gs foreach(@arr);
			$p=~s/<idanalysis>/$idanalysis/gs;
			$p=~s/<idpoint>/$idpoint/gs;
		###  warn $curr_patch->{patch_type} .' '.$p;
			my $result=$p;
			if($curr_patch->{patch_type} == 4)	# sql
			{	my $sth = $dbh->prepare($p);
# warn $p;
				$sth->execute();
				if( $p=~/select/io )
				{	$result=($sth->rows>1)? fetchall_hashref_for_sth($sth):$sth->fetchrow_hashref();
				}
			} elsif ($curr_patch->{patch_type} == 6)	# perl
			{	$p=~s/API::([^(]+)\(/$1(\$dbh, \$idimage, \$idanalysis,\$p,/ogs;
				$result=eval($p);
				warn "error: $@ $p" if($@);
			} elsif ($curr_patch->{patch_type} == 3)	# R/EBImage
			{
warn 'ref is:'. ref $old_p;
                my $filename;
                if(ref $old_p eq 'Image::Magick')
                {
                    $filename=tempFileName('/tmp/cellf');
                    $old_p->Write($filename.'.jpg');
                    chmod 0777, $filename.'.jpg';
                }
                $p=~s/<idimage>/$idimage/ogs;
                $p=~s/<idstack>/$idstack/ogs;
				my $infile=runEBImageRCode($filename? $filename.'.jpg':undef, $p, $idanalysis);
 warn  $p.' '.$infile;
				$p = Image::Magick->new();
				if(!$infile)
				{   $p->Read($filename.'.jpg');				# read it back in just in case R/EBImage did some processing on it
					$idimage=$result=0;
				} elsif(exists $infile->{xpoint} && exists $infile->{ypoint}) # simple points return
				{
					$dbh->{AutoCommit}=0;
					my $sql = 'delete from results where idanalysis = ?';
					my $sth = $dbh->prepare($sql);
					$sth->execute(($idanalysis));
					my $sql = 'insert into results (idanalysis, row, col) values (?, ?, ?)';
					my $sth = $dbh->prepare($sql);
					for(my $i=0; $i< scalar @{$infile->{xpoint}}; $i++)
					{	my ($x,$y)=(floor ($infile->{xpoint}->[$i]), floor ($infile->{ypoint}->[$i]));
						$sth->execute(($idanalysis, $x, $y));
					}

					$dbh->commit;
					$dbh->{AutoCommit}=1;
				} elsif(exists $infile->{xarea} && exists $infile->{yarea}) # ROI return
				{
				} else # result is (probably) an aggregation
				{
					next unless $idanalysis;
					my $sql = 'delete from aggregations where idanalysis = ?';
					my $sth = $dbh->prepare($sql);
					$sth->execute(($idanalysis));
					cellfinder_image::insertAggregation($dbh, $idanalysis, $infile);
					$idimage=0;
				}
				# now perform fixup and aggregation if necessary
				if($idimage)
				{
					my $image = getObjectFromDBHandID($dbh,'images', $idimage);
					my $trial = getObjectFromDBHandID($dbh,'trials', $image->{idtrial});
					cellfinder_image::imageForComposition($dbh, $trial->{composition_for_fixup}, $readImageFunction, undef, undef, $idanalysis) if($trial->{composition_for_fixup});
					cellfinder_image::imageForComposition($dbh, $trial->{composition_for_aggregation}, $readImageFunction, undef, undef, $idanalysis) if($trial->{composition_for_aggregation});
				}
			} elsif ($curr_patch->{patch_type} == 7)	# R/JSON
			{
                next unless $idanalysis;
				my $sql = 'delete from aggregations where idanalysis = ?';
				my $sth = $dbh->prepare($sql);
				$sth->execute(($idanalysis));
                $p=~s/<idimage>/$idimage/ogs;
                $p=~s/<idstack>/$idstack/ogs;
				$result = runRJSONCode($idanalysis, $p);
				cellfinder_image::insertAggregation($dbh, $idanalysis, $result);
			}
			if($result){
				if(ref($stash) eq 'ARRAY')
				{	push(@$stash,$result);
				} else
				{	$stash=[$result];
				}
			}
		}
		elsif($curr_patch->{patch_type} == 2 )				# call external programm
		{	next unless ref $p eq 'Image::Magick';
			my $filename=tempFileName('/tmp/cellf');
			my $filetype='.'.$curr_patch->{filetype};
            $filename.=  '0' x (17-length $filename);
            $p->Write($filename.$filetype);

			my $patchparams=$curr_patch->{params};
			$patchparams=~s/imageForDBHAndRenderchainIDAndImage\(([^\)]+)\)/tmpfilenameForImgCallParams($dbh, $readImageFunction, $1)/oegs;

			my @arr= map {sprintf $_->[0], $_->[1]}
				grep {($_->[0]=~/%/ogs &&  $_->[1]) || (!($_->[0]=~/%/ogs) && $_->[1])}
				map {  $_->[0]=~s/"$//ogs; $_->[1]=~s/\\,/,/ogs; $_->[1]=~s/"//ogs;$_;}
				map { [ split/=>/o ] }
				sort
				map {s/^["\s]+//ogs;$_;}
				split  /(?<!\\),/o, $patchparams;
			my $call=$curr_patch->{patch};
			my @filenamelist=glob($filename.'*'.$filetype);

			my $effective_fn= ((scalar @filenamelist)>1) ?  (join ' ', @filenamelist) : $filename.$filetype;
			my $effective_fn_out=$filename.'_out'.$filetype;
			my $args=join ' ', @arr;
			if( $call=~ /<infiles>/o)
            {	$call=~s/<infiles>/$effective_fn/ogs;
                $call=~s/<args>/$args/ogs;
                $call=~s/<outfile>/$effective_fn_out/ogs;
            } else
            {	$call.=" $args $filename".$filetype;
            }
            $call=~s/<idanalysis>/$idanalysis/gs;
            #     $call.=" >$filename".$filetype.'_out';
            system($call);
            warn($call);
            #   TempFileNames::writeFile('/tmp/cellf_dbg.txt', $call."\n".$effective_fn_out."\n".$curr_patch->{patch}."\n".$filetype."\n");
            #   warn $call;
            if(-e $filename.$filetype.'_out')
            {   my $infile=readFile($filename.$filetype.'_out');
                unlink($filename.$filetype.'_out');
                $infile=~s/\s+$//ogs;
                $p = Image::Magick->new();
                $p->Read($infile);
                unlink($infile);
            } else
            {   $p = Image::Magick->new();
                $p->Read($effective_fn_out);
            }
            foreach my $file (@filenamelist)  # remove all temp files
            {   unlink $file if -e $file; 
            }
            unlink $effective_fn_out if -e $effective_fn_out;
		}
	}
	if($idimage && $id && ref $p eq 'Image::Magick')
	{	$p->Write($cachename) if $cachename;
	}
	return $stash? $stash:$p;
}

sub getObjectFromDBHandID{
	my $dbh  = shift;
	my $table = shift;
	my $id = shift;
	return undef if $id eq 'null' || $id eq 'NULL';
	my $sth = $dbh->prepare( qq/select * from "/.$table.qq/" where id=?/);
	$sth->execute(($id));
	return $sth->fetchrow_hashref();
}
sub insertObjectIntoTable{
	my $dbh  = shift;
	my $table = shift;
	my $pk = shift;
	my $o = shift;

	my $sql = SQL::Abstract->new;
	my($stmt, @bind) = $sql->insert($table, $o);
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
	warn "err: ".$DBI::errstr if $DBI::errstr;
	return $dbh->last_insert_id(undef, undef, $table, $pk);
}

sub uniquelyInsertObjectIntoTable{
	my $dbh  = shift;
	my $table = shift;
	my $pk = shift;
	my $o = shift;

	my $sql = SQL::Abstract->new;
	my($stmt, @bind) = $sql->select($table, undef, $o);
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
	return insertObjectIntoTable($dbh,$table,$pk,$o) unless $sth->fetchrow_hashref();
	return undef;
}
sub dictsForWhereClauseDict{
	my $dbh  = shift;
	my $table = shift;
	my $wc = shift;
    
	my $sql = SQL::Abstract->new;
	my($stmt, @bind) = $sql->select($table, undef, $wc);
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
    my @out;
	while(my $c=$sth->fetchrow_hashref())
	{	push @out,$c;
	}
    return \@out;
}

sub deleteObjectFromTable{
	my $dbh  = shift;
	my $table = shift;
	my $o = shift;

	my $sql = SQL::Abstract->new;
	my($stmt, @bind) = $sql->delete($table, $o);
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
}

sub getMontageForIDImageAndIDStack{ my ($dbh, $idimage, $idstack)=@_;
	my $sql = SQL::Abstract->new;
	my($stmt, @bind) = $sql->select('montage_images', [qw/parameter idanalysis/], {idimage=>, $idimage, idmontage=> $idstack});
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
	return $sth->fetchrow_hashref();
}
sub _pointArrayRForMatrixStringAndOffset{ my ($parameter, $offsetX, $offsetY)=@_;
	my $pointR=eval($parameter);  #<!>fixme replace with JSON deparser
	$pointR->[4]+=$offsetX;
	$pointR->[5]+=$offsetY;
	return $pointR;
}
sub _distortImage{ my ($i, $parameter, $offsetX, $offsetY)=@_;
	my @parameters= split /\|/o, $parameter;
	@parameters = map {	$_=~/^\[/o? $_ : "[$_]" } @parameters;
	$i->Distort(method=>'AffineProjection', points=> _pointArrayRForMatrixStringAndOffset($_, $offsetX, $offsetY) , 'virtual-pixel'=> 'Background') for @parameters;
	return $i;
}

sub resizeImage{ my ($p, $pixels)=@_;
	my ($w,$h)=$p->Get('width', 'height');
	if (0&& $w*$h > 5000000 && -e '/usr/bin/sips')	# use sips on large images whenever poosible
	{	my $filename=tempFileName('/tmp/cellf', '.jpg');
		$p->Write($filename);
		my $max1= floor($w*sqrt($pixels/($w*$h)));
		system('/usr/bin/sips --resampleWidth '. $max1 . ' '. $filename);
		$p = Image::Magick->new();
		$p->Read($filename);
	} else
	{	$p->Resize('@'.$pixels);
	}
	return $p;
}

sub readImageFunctionForIDAndWidth{ my ($dbh, $idimage, $width, $nocache, $ocsize, $affine, $idstack, $idcomposition, $idcomposite)=@_;
	return sub {return undef} if(!$idimage&& !$idstack);
	my $csize=$ocsize;
	$csize=$1 if $ocsize=~/([0-9]+x[0-9]+)/o;
	my ($offX,$offY);
	($offX, $offY)=($1, $2) if $ocsize=~/([-+][0-9]+)([-+][0-9]+)/o;
    #	warn "$ocsize $offX,$offY";
	sub doReadImageFile{ my ($p, $curr_img)=@_;
		my $filename="$curr_img->{idtrial}-$curr_img->{filename}";
		$p = Image::Magick->new(magick=>'jpg') unless $p;
		if($curr_img->{image_repository})
		{	$p->BlobToImage(LWP::Simple::get($curr_img->{image_repository}.'/'.$filename));
		} else
		{	$p->Read(server_root."/".$filename);
			## warn server_root."/$filename";
		} return $p;
	}
	## warn $idimage;
	my $curr_img = getObjectFromDBHandID($dbh,'images_name', $idimage);
	## warn Dumper $curr_img;
	return sub{
        # warn "$offX, $offY";
		return ($nocache? 0: $idimage) if shift;
		$p = Image::Magick->new(magick=>'jpg');
		if($idstack)
		{	my $list=getObjectFromDBHandID($dbh,'montage_image_list',$idstack)->{list};
			my @idarr= split/, /o, $list;
            my $oldi;
			foreach my $id (@idarr)
			{
				my $i=doReadImageFile(undef, getObjectFromDBHandID($dbh,'images_name', $id));
				$i->Extent(geometry=>$csize, gravity=>'NorthWest', background=>'graya(0%, 0)') if $csize;
				my $m=getMontageForIDImageAndIDStack($dbh, $id, $idstack);
				my $parameter=$m->{parameter} || '[1,0,0,1,0,0]';
				_distortImage($i, $parameter, $offX, $offY);
                my $iorig=$i->Clone();
                $i->Composite(image => $oldi, compose => $idcomposite) if $oldi && $idcomposite;
				$i= imageForComposition($dbh, $idcomposition, undef, $i, 0, $m->{idanalysis}) if $idcomposition;
				push @$p, $i;
                $oldi=$iorig;
			}
		} else {
			$p=doReadImageFile($p, $curr_img);
		}
		_distortImage($p, $affine) if $affine;
		$p=resizeImage($p, $width) if $width;
		return $p;
	}
}

sub multiplyAffineMatrixes { my ($m1, $m2)=@_;
	use Math::Matrix;

	my @ac=split /,/, $m1;
	my $ma = new Math::Matrix (	[$ac[0], $ac[1],0],
								[$ac[2], $ac[3],0],
								[$ac[4], $ac[5],1]);
	my @bc=split /,/, $m2;
	my $mb = new Math::Matrix (	[$bc[0], $bc[1],0],
								[$bc[2], $bc[3],0],
								[$bc[4], $bc[5],1]);
	my $mc= $ma->multiply($mb);
	return join ',', ($mc->[0]->[0], $mc->[0]->[1],$mc->[1]->[0],$mc->[1]->[1], $mc->[2]->[0],$mc->[2]->[1]) ;
}

sub reverseAffineMatrix { my ($m1)=@_;
    return undef unless $m1;
	$m1=$1 if $m1=~/^\[(.+)\]$/;
	my ($sx, $rx, $ry, $sy, $tx, $ty) =split /,/, $m1;
	my $det= $sx*$sy - $rx*$ry;
    return undef unless $det;
	my $inverse_sx= 	 $sy/$det;
	my $inverse_rx= (-1)*$rx/$det;
	my $inverse_ry= (-1)*$ry/$det;
	my $inverse_sy=		 $sx/$det;
	my $inverse_tx=	(-1)*$tx*$inverse_sx - $ty*$inverse_ry;
	my $inverse_ty=	(-1)*$tx*$inverse_rx - $ty*$inverse_sy;
	return join ',', ($inverse_sx, $inverse_rx , $inverse_ry, $inverse_sy, $inverse_tx, $inverse_ty) ;
}


sub createImageFromUpload { my ($dbh, $idtrial, $local_filename, $filedataname, $replace_idimage, $timestamp)=@_;
	sub getFilename{ my ($idtrial, $local_filename)=@_;
 warn "** $local_filename";
		my ($filename, $suffix)=$local_filename =~/^(.+)\.([^\.]+)$/;
			$filename=~s/_[0-9]+$//;
		my $dest=server_root.'/'.$idtrial.'-'.$filename;
		if(-e $dest.'.jpg')
		{	my $i=0;
			while(-e $dest.'_'.++$i.'.jpg'){}
			return ($dest.'_'.$i, $suffix, $filename.'_'.$i, $filename.'_'.$i);
		} else
		{	return ($dest, $suffix, $filename, $filename);
		}
	}
	my ($dest, $suffix, $filename, $visible_filename)= getFilename($idtrial, $local_filename);

	my $p = Image::Magick->new();
	$p->Read($filedataname);
	if($replace_idimage)
	{	my $curr_img = getObjectFromDBHandID($dbh,'images', $replace_idimage);
		$dest=server_root.'/'.$idtrial.'-'.$curr_img->{filename};
	} else
	{	$dest.='.jpg';
	}

	$p->Write($dest);

	my $idimage;
	unless($replace_idimage)
	{
		my $d={name=>$visible_filename, filename=>"$filename.jpg", idtrial=>$idtrial};
		$d->{image_time}=$timestamp if($timestamp);
		$idimage=insertObjectIntoTable($dbh, 'images', 'id', $d );
	} else
	{	$idimage=$replace_idimage;
	}
	return ($idimage, $dest);
}

sub uploadImageFromData { my ($dbh, $idtrial, $name, $suffix, $data)=@_;

    sub create_img{ my ($dbh, $idtrial, $name, $suffix, $filename)=@_;
        $name.=".$suffix" if $suffix;
        
        my ($idimage, $upload_dest)=createImageFromUpload($dbh, $idtrial, $name, $filename);
        my $idcomposition;
        my $trial = getObjectFromDBHandID($dbh,'trials', $idtrial);
        $idcomposition= $trial->{composition_for_upload};
        my $f= readImageFunctionForIDAndWidth($dbh, $idimage, undef, 1);
        my $p= $f->(0);
        $p= imageForComposition($dbh, $idcomposition,$f,$p) if($idcomposition);
        $p->Write($upload_dest);
        return $idimage;
    }

    # sorted arrnumber part numerically (schwartzian transform)
    sub sorted_filenamearray{ my ($filename)=@_;
        return
        map  { $_->[0] }
        sort { $a->[1] cmp $b->[1] or $a->[2] <=> $b->[2] }
        map  { [ $_, /^(.+)-(\d+)\.jpg$/ ] }
        glob $filename.'*.jpg';
    }
    
    my $filename=TempFileNames::tempFileName('/tmp/cellf', ".$suffix");
	TempFileNames::writeFile($filename, $data);
    my $idimage;

    if ($suffix =~/tif/i)
    {   my $pages=readCommand('/usr/local/bin/identify -format "%p" '.$filename);
        warn "$pages";
        if ($pages ne '0')
        {   system('/usr/local/bin/convert '.$filename.' '.$filename.'-%d.jpg');
            my @files=sorted_filenamearray($filename);
            
            my $i=1;
            foreach my $cfilename (@files)
            {
                create_img($dbh, $idtrial, $name.' '.sprintf("%04d",$i++), 'tiff', $cfilename);
            }
            $idimage=-1;
        }
    } elsif($suffix =~/mp|m4v/i) # movie
    {   system('/usr/local/bin/convert -deconstruct '.$filename.' '.$filename.'-%d.jpg');
        my @files=sorted_filenamearray($filename);
        my $i=1;
        foreach my $cfilename (@files)
        {
            create_img($dbh, $idtrial, $name.' '.sprintf("%04d",$i++), $suffix, $cfilename);
        }
        $idimage=-1;        
    }
    $idimage=create_img($dbh, $idtrial, $name, $suffix, $filename) unless $idimage == -1;
	return $idimage;
}

sub deleteImage { my ($dbh, $idimage, $notFully)=@_;

	my $image=getObjectFromDBHandID($dbh, 'images', $idimage);
	if($image)
	{	my $dest=server_root.'/'.$image->{idtrial}.'-'.$image->{filename};
		my $sql = 'delete from images where id=?';
		my $sth = $dbh->prepare($sql);
		$sth->execute(($idimage));
		unlink $dest unless $notFully || $sth->err;
	}
}
sub deleteAllImages { my ($dbh, $idtrial, $fully)=@_;
	my $sth = $dbh->prepare( qq/select id from images where idtrial=?/);
	$sth->execute(($idtrial));
	my $a= $sth->fetchall_arrayref();
	for my $currImage (@$a)
	{
		deleteImage($dbh, $currImage->[0], !$fully);
	}
}

sub rebuildFromRepository { my ($dbh, $idtrial, $rebuild_mode)=@_;
	sub peekImage{
		my $dbh  = shift;
		my $name = shift;
		my $idtrial = shift;
		my $sth = $dbh->prepare( qq/select * from images where idtrial=? and name=?/);
		$sth->execute(($idtrial,$name));
		return $sth->fetchrow_hashref();
	}
	my $sql='insert into images (name, filename, idtrial) values (?,?,?)';
	my $sth = $dbh->prepare($sql);
	my @files= glob server_root."/$idtrial-*.jpg";
	foreach my $filename (@files)
	{	my @components=split /\//o, $filename;
		my ($visible_filename)=$components[$#$components]=~/^$idtrial-(.+?)\.jpg$/;
		if($rebuild_mode == 1)
		{	$sth->execute(( $visible_filename, "$visible_filename.jpg", $idtrial ));
		} else
		{	$sth->execute(( $visible_filename, "$visible_filename.jpg", $idtrial )) unless(peekImage($dbh, $visible_filename, $idtrial));
		}
	}
}

sub reapplyUploadFilter { my ($dbh, $idtrial)=@_;
	my $trial = getObjectFromDBHandID($dbh,'trials', $idtrial);
	my $idcomposition= $trial->{composition_for_upload};
	return unless $idcomposition;

	my $sql='select * from images where idtrial=?';
	my $sth = $dbh->prepare($sql);
	$sth->execute(($idtrial));
	while ( my $curr = $sth->fetchrow_hashref() )
	{	my $p= readImageFunctionForIDAndWidth($dbh, $curr->{id}, undef, 1)->();
		$p= imageForComposition($dbh, $idcomposition,undef ,$p);
		my $dest=server_root.'/'.$idtrial.'-'.$curr->{filename};
		$p->Write($dest);
	}
}

sub addStandardAnalysisToAll { my ($dbh, $idtrial)=@_;
	my $trial = getObjectFromDBHandID($dbh,'trials', $idtrial);
	my $idcomposition= $trial->{composition_for_celldetection};
	return unless $idcomposition;

	my $sth = $dbh->prepare( qq/select images.id, images.name from images left join analyses on analyses.idimage=images.id and idcomposition_for_analysis=? where analyses.id is null and idtrial=? order by 2,1/);
	$sth->execute(($idcomposition, $idtrial));
	my $a= $sth->fetchall_arrayref();
	for my $currImage (@$a)
	{	my $idimage=$currImage->[0];
		my $d = { idimage=> $idimage, idcomposition_for_editing => $trial->{composition_for_editing}, idcomposition_for_analysis=> $idcomposition };
		my $idanalysis=insertObjectIntoTable($dbh, 'analyses', 'id', $d );
		my $f= cellfinder_image::readImageFunctionForIDAndWidth($dbh, $idimage);
        eval{
		my $p= $f->(0);
		cellfinder_image::imageForComposition($dbh, $idcomposition,$f,$p, 1, $idanalysis);
        warn "$idimage $idcomposition $idanalysis";
        }
	}
}

1;
