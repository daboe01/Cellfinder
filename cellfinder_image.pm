#!/usr/bin/perl


package cellfinder_image;

use lib qw {/Users/boehringer/src/privatePerl /Users/boehringer/bin /HHB/bin};

use DBI;
use Image::Magick;

use Apache2::RequestIO ();
use Apache2::RequestRec ();
use Apache2::Request ();
use TempFileNames;
use LWP::Simple;
use Encode;
use v5.10.0;
use Data::Dumper;
use JSON::XS;
use Statistics::R;
use SQL::Abstract;

use constant server_root=>'/srv/www/htdocs/cellfinder';

sub runSimpleRegistrationRCode { my ($id1,$id2)=@_;
	my $RCmd=<<'ENDOFR'
	read.pointset=function(id){
		d1=read.delim(paste("http://auginfo/cellfinder_results/<idtrial>?mode=results&constraint=idanalysis=", id, sep=""))
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
	warn $RCmd;
	my $R = Statistics::R->new();
	$R->run($RCmd);
	return '['. $R->get('out') . ']';
}

sub imageForComposition{
	my $dbh=shift;
	my $idcomposition = shift;
	my $f = shift;
	my $p = shift;
	my $cacheReadDisabled=shift;
	my $idanalysis=shift;
	
	my $curr_cmp = getObjectFromDBHandID($dbh,'patch_compositions', $idcomposition);
	return imageForDBHAndRenderchainIDAndImage($dbh, $curr_cmp->{primary_chain}, $f, $p, $cacheReadDisabled, $idanalysis) if($curr_cmp->{primary_chain});
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

sub imageForDBHAndRenderchainIDAndImage{
	my $dbh=shift;
	my $id= shift;
	my $readImageFunction=shift;
	my $p = shift;
	my $cacheReadDisabled = shift;
	my $idanalysis=shift;
	$idanalysis= CGIonlyDigits('idanalysis') unless $idanalysis;
	my $idpoint=	CGIonlyDigits('idpoint');

	my $idimage=$readImageFunction? $readImageFunction->(1):0;

	my $stash;
	
	my $cachename='/tmp/cellfinder_cache_'.$idimage.'_'.$id.'.jpg';
	if($idimage && $id && -e  $cachename && !$cacheReadDisabled )
	{	$p = Image::Magick->new();
		$p->Read($cachename);
		#		warn "cache hit for $cachename";
		return $p;
	}
	$p=$readImageFunction->(0) unless $p;

	my $sql=qq/select * from patch_chains_with_parameters where idpatch_chain=?/;
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($id));
	while(my $curr_patch =$sth->fetchrow_hashref())
	{
###		warn Dumper $curr_patch;
		if($curr_patch->{params}=~/<handover>/o)
		{	my  $analysis = getObjectFromDBHandID($dbh,'analyses', $idanalysis);
			my  $handover_params=$analysis->{setup_params};
			if(!$handover_params)
			{	$handover_params=CGIonlyAlphanum('handover_params');
			}
			$curr_patch->{params}=~s/<handover>/$handover_params/gs;
			#warn $handover_params;
			$idimage=0;	# dont write to cache
		}
		if($curr_patch->{patch_type}==1)	# let do imagemagick do the magick
		{	next unless ref $p eq 'Image::Magick';
			$curr_patch->{params}=~s/"_anonymous_"=>//ogsi;
			if($curr_patch->{patch} eq 'Perl') {$curr_patch->{params}=~s/"//ogs;  eval($curr_patch->{params})}
			else {	my $code='$p->[0]->'.$curr_patch->{patch}.'('.$curr_patch->{params}.')';
					$code=~s/=>"\[([0-9e\., \-\]]+)"/=>[$1/ogs;
					$code=~s/([0-9])\]"/$1]/ogs;
				 eval($code);
				#				warn  $code
			};
###			warn $curr_patch->{patch};
			warn "error: $@" if($@);
		} elsif($curr_patch->{patch_type} ~~ [4,5,6])	# only parameter substitution required
		{	my @arr= map {  $_->[0]=~s/"$//ogs; $_->[1]=~s/"//ogs;$_;}
				map { [ split/=>/o ] }
				map {s/^["\s]+//ogs;$_;}
				split  /[^\\],/o, $curr_patch->{params};
			$p=$curr_patch->{patch};
#warn Dumper \@arr;
#warn Dumper $curr_patch;
			$p=~s/<$_->[0]>/$_->[1]/gs foreach(@arr);
			$p=~s/<idanalysis>/$idanalysis/gs;
			$p=~s/<idpoint>/$idpoint/gs;
###			warn $p;
			my $result=$p;
			if($curr_patch->{patch_type} == 4)	# sql
			{	my $sth = $dbh->prepare($p);
#				warn $p;
				$sth->execute();
				if( $p=~/select/io )
				{	$result=($sth->rows>1)? fetchall_hashref_for_sth($sth):$sth->fetchrow_hashref();
				}
			} elsif ($curr_patch->{patch_type} == 6)	# perl
			{	$p=~s/API::([^(]+)\(/$1(\$dbh, \$idimage, \$idanalysis,\$p,/ogs;
				$result=eval($p);
				warn "error: $@ $p" if($@);
			}
			if(ref($stash) eq 'ARRAY')
			{	push(@$stash,$result); 
			} else
			{	$stash=[$result];
			}
		}
		else				# call external programm
		{	next unless ref $p eq 'Image::Magick';
			my @arr= map {sprintf $_->[0], $_->[1]}
				grep {($_->[0]=~/%/ogs &&  $_->[1]) || (!($_->[0]=~/%/ogs) && $_->[1])}
				map {  $_->[0]=~s/"$//ogs; $_->[1]=~s/"//ogs;$_;}
				map { [ split/=>/o ] }
				map {s/^["\s]+//ogs;$_;}
				split  /[^\\],/o, $curr_patch->{params};
			my $call=$curr_patch->{patch}.' '.join ' ', @arr;
			my $filename=tempFileName('/tmp/cellf');
			$p->Write($filename.'.jpg');
			my @filenamelist=glob($filename."*.jpg");
			if((scalar @filenamelist)>1)	# was a stack
			{	$call.=" $filename".'.jpg'." >$filename".'.jpg'.'_out';
				$call=~s/<idanalysis>/$idanalysis/gs;
				system($call);
 warn $call;
			} else
			{	$call.=" $filename".'.jpg'." >$filename".'.jpg'.'_out';
				$call=~s/<idanalysis>/$idanalysis/gs;
				system($call);
 warn $call;
			}
			my $infile=readFile($filename.'.jpg'.'_out');
			unlink($filename.'.jpg'.'_out');
			$infile=~s/\s+$//ogs;
			if($curr_patch->{patch_type} == 3)
			{	$p=$infile;
				$dbh->{AutoCommit}=0;
				my $sql = 'delete from results where idanalysis = ?';
				my $sth = $dbh->prepare($sql);
				$sth->execute(($idanalysis));
				my $sql = 'insert into results (idanalysis, row, col) values (?, ?, ?)';
				my $sth = $dbh->prepare($sql);
				my @lines=split /\n/o, $infile;
				foreach (@lines)
				{	my ($x,$y)=split /\t/o;
					$sth->execute(($idanalysis, $x, $y));
				}
				$dbh->commit;
				$dbh->{AutoCommit}=1;
			} else
			{	$p = Image::Magick->new();
				$p->Read($infile);
			}
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
	my $sth = $dbh->prepare( qq/select * from "/.$table.qq/" where id=?/);
	$sth->execute(($id));
	return $sth->fetchrow_hashref();
}
					
	
sub readImageFunctionForIDAndWidth{ my ($dbh, $idimage, $width, $nocache, $csize, $affine, $idstack)=@_;
	return sub {return undef} if(!$idimage&& !$idstack);
	sub doReadImageFile{ my ($p, $curr_img)=@_;
		my $filename="$curr_img->{idtrial}-$curr_img->{filename}";
		$p = Image::Magick->new(magick=>'jpg') unless $p;
		if($curr_img->{image_repository})
		{	$p->BlobToImage(LWP::Simple::get($curr_img->{image_repository}.'/'.$filename));
		} else
		{	$p->Read(server_root."/$filename");
		}
	}
	my $curr_img = getObjectFromDBHandID($dbh,'images_name', $idimage);
	return sub{
		return ($nocache? 0: $idimage) if shift;
		$p = Image::Magick->new(magick=>'jpg');
		if($idstack)
		{	my $list=getObjectFromDBHandID($dbh,'montage_image_list',$idstack);
			my @idarr=split/,/o, $list;
			foreach my $id (@idarr)
			{	push @$p, doReadImageFile(undef, getObjectFromDBHandID($dbh,'images_name', $id));
			}
		} else {
			doReadImageFile($p, $curr_img);
		}
		if($affine)
		{	$affine="[$affine]" unless $affine=~/^\[/o;
			warn $affine;
			$p->Distort(method=>'AffineProjection', points=>eval($affine), 'virtual-pixel'=> 'Transparent') 	#<!>fixme replace with JSON deparser
		}
		$p->Resize('@'.$width) if $width;
		$p->Extent(geometry=>$csize, gravity=>'Northwest', background=>'graya(0%, 0)') if $csize;
		return $p;
	}
}
sub createImageFromUpload { my ($dbh, $idtrial, $local_filename, $filedataname, $replace_idimage, $timestamp)=@_;
	sub getFilename{ my ($idtrial, $local_filename)=@_;
		my ($filename, $suffix)=$local_filename =~/^([^\.]+)\.(.+)$/;
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
	{	use SQL::Abstract;
		my $sql = SQL::Abstract->new;
		my $d={name=>$visible_filename, filename=>"$filename.jpg", idtrial=>$idtrial};
		$d->{image_time}=$timestamp if($timestamp);
		my($stmt, @bind) = $sql->insert('images', $d);
		my $sth = $dbh->prepare($stmt);
		$sth->execute(@bind);
		$idimage=$dbh->last_insert_id(undef, undef, 'images', 'id');
	} else
	{	$idimage=$replace_idimage;
	}
	return ($idimage, $dest);
}

sub addDefaultAnalysis { my ($dbh, $idimage, $p,$f, $level)=@_;
	my ($width, $height)= $p->Get('width', 'height');
	use SQL::Abstract;
	my $sql = SQL::Abstract->new;
	my $image = getObjectFromDBHandID($dbh,'images', $idimage);
	my $trial = getObjectFromDBHandID($dbh,'trials', $image->{idtrial});
	my $d={idimage=>$idimage, width=> $width, height=>$height, idcomposition_for_editing=> $trial->{composition_for_editing}};
	$d->{idcomposition_for_analysis}=$trial->{composition_for_celldetection} if($level>0);
	my($stmt, @bind) = $sql->insert('analyses', $d);
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
	my $lastid = $dbh->last_insert_id(undef, undef, 'analyses', 'id');
	if($d->{idcomposition_for_analysis})	# perform also analysis
	{	my $p= imageForComposition($dbh, $trial->{composition_for_editing}, $f);
		imageForComposition($dbh, $d->{idcomposition_for_analysis}, $f, $p, 0, $lastid);
		insertAggregation($dbh, $lastid, imageForComposition($dbh, $trial->{composition_for_aggregation}, $f, $p, 0, $lastid)) if($trial->{composition_for_aggregation});
		imageForComposition($dbh, $trial->{composition_for_saving}, $f, $p, 0, $lastid) if($level>1);
	}
	return $lastid;
}
		

sub deleteImage { my ($dbh, $idimage)=@_;
	my $sql = 'select * from images where id=?';
	my $sth = $dbh->prepare($sql);
	$sth->execute(($idimage));
	my $image=$sth->fetchrow_hashref();
	if($image)
	{	my $dest=server_root.'/'.$image->{idtrial}.'-'.$image->{filename};
		unlink $dest;
		my $sql = 'delete from images where id=?';
		my $sth = $dbh->prepare($sql);
		$sth->execute(($idimage));		
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
					
sub insertAggregation{
	my $dbh=shift;
	my $idanalysis=shift;
	my $result=shift;
	use SQL::Abstract;
	my $sql = SQL::Abstract->new;
					
	foreach my $crow (@$result)
	{	for(keys %$crow)
		{	next if $_ eq 'idanalysis';
			my($stmt, @bind) = $sql->insert('aggregations', {idanalysis => $idanalysis, name=> $_, value => sprintf("%8.3f",$crow->{$_}) });
			my $sth = $dbh->prepare($stmt);
			$sth->execute(@bind);
		}
	}
}
					
###
### and here goes the API library...
###

sub getCompoNamed { my ($dbh, $idimage, $idanalysis,$p, $name )=@_;
	if(!$idimage)
	{	my $anaH=getObjectFromDBHandID($dbh,'analyses', $idanalysis);
		$idimage=$anaH->{idimage};
	}
	my $imgH=getObjectFromDBHandID($dbh,'images', $idimage);
	my $sql='select * from patch_compositions where idtrials=? and name=?';
	my $sth=$dbh->prepare($sql);
	$sth->execute(($imgH->{idtrial}, $name));
	return $sth->fetchrow_hashref();
}

		
sub countBlackAndWhitePixels { my ($dbh, $idimage, $idanalysis,$p, $other_p)=@_;
	my @histogram = $other_p -> Histogram();
	
	my($total_count, $black_count, $white_count) = 0;
	
	while (@histogram)
	{	my ($red, $green, $blue, $opacity, $count) = splice(@histogram, 0, 5);
	
		$total_count+= $count;
		$black_count+= $count unless $red;
		$white_count+= $count if $red==0xffff;
	}
	return ($total_count, $black_count, $white_count);
}
		
1;