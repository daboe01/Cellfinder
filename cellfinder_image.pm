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

use constant server_root=>'/Library/WebServer/Documents/cellfinder';
#use constant server_root=>'/srv/www/htdocs/cellfinder';

our $R;

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
	$R = Statistics::R->new() unless $R;
	$R->run($RCmd);
	return  $R->get('out');
}
sub runRANSACRegistrationRCode { my ($id1,$id2, $thresh, $identityradius, $iterations)=@_;
	my $RCmd=<<'ENDOFR'
	source('/HHB/bin/ransac4.R')
	out=register.pointsets.out(<id1>, <id2>, <thresh>, <identityradius>, <iterations>, do.rotate=F)
ENDOFR
;	$RCmd=~s/<id1>/$id1/ogs;
	$RCmd=~s/<id2>/$id2/ogs;
	$RCmd=~s/<thresh>/$thresh/ogs;
	$RCmd=~s/<identityradius>/$identityradius/ogs;
	$RCmd=~s/<iterations>/$iterations/ogs;

	$R = Statistics::R->new() unless $R;
	$R->run($RCmd);
	return  $R->get('out');
}
sub runRJSONCode { my ($id,$code)=@_;
	my $RCmd=<<'ENDOFR'
	library(rjson)
	read.pointset=function(id){
		d1=read.delim(paste("http://localhost:3000/ANA/results/", id, sep=""))
		return (d1)
	}
	d0= subset(read.pointset(<id>), select=c(row,col))
	out=""
	<code>
ENDOFR
;	$RCmd=~s/<id>/$id/ogs;
	$RCmd=~s/<code>/$code/ogs;
	$R = Statistics::R->new() unless $R;
	#warn $RCmd;
	$R->run($RCmd);
	my $out=$R->get('out');
	return $out? JSON::XS->new->utf8->decode($out):undef;
}

sub runEBImageRCode { my ($infile,$code)=@_;
	my $RCmd=<<'ENDOFR'
	library(EBImage)
	library(rjson)
	e=readImage("<infile>")
	out=""
	<code>
ENDOFR
;	$RCmd=~s/<code>/$code/ogs;
	$RCmd=~s/<infile>/$infile/ogs;
	$R = Statistics::R->new() unless $R;
	$R->run($RCmd);
	my $out=$R->get('out');
 warn $out;
	return $out? JSON::XS->new->utf8->decode($out):undef;
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
		my($stmt, @bind) = $sql->insert('aggregations', {idanalysis => $idanalysis, name=> $_, value => sprintf("%8.0f",$result->{$_}) });
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
	my $idpoint;
	my $idimage=$readImageFunction? $readImageFunction->(1):0;

	my $stash;

	my $cachename='/tmp/cellfinder_cache_'.$idimage.'_'.$id.'.jpg';
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
	my $old_p;
	while(my $curr_patch = $sth->fetchrow_hashref())
	{	$old_p=$p;
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
			else {	my $code='$p->[0]->'.$curr_patch->{patch}.'('.$curr_patch->{params}.')';
					$code=~s/=>"\[([0-9e\., \-\]]+)"/=>[$1/ogs;
					$code=~s/([0-9])\]"/$1]/ogs;
				 eval($code);
				warn "error: $@" if($@);
			};
###			warn $curr_patch->{patch};
			warn "error: $@" if($@);
		} elsif($curr_patch->{patch_type} ~~ [3,4,5,6, 7])	# only parameter substitution required
		{	my @arr= map {  $_->[0]=~s/"$//ogs; $_->[1]=~s/"//ogs;$_;}
				map { [ split/=>/o ] }
				map {s/^["\s]+//ogs;$_;}
				split  /[^\\],/o, $curr_patch->{params};
			$p=$curr_patch->{patch};
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
			} elsif ($curr_patch->{patch_type} == 3)	# R/EBImage
			{
				next unless ref $old_p eq 'Image::Magick';
				my $filename=tempFileName('/tmp/cellf');
				$old_p->Write($filename.'.jpg');
				my $infile=runEBImageRCode($filename.'.jpg', $p);
				# read it back in just in case R/EBImage did some processing on it
				$p = Image::Magick->new();
				$p->Read($filename.'.jpg');
				if(exists $infile->{xpoint} && exists $infile->{ypoint}) # simple points return
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
				{	next unless $idanalysis;
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
			{	next unless $idanalysis;
				my $sql = 'delete from aggregations where idanalysis = ?';
				my $sth = $dbh->prepare($sql);
				$sth->execute(($idanalysis));
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
			$p->Write($filename.'.jpg');

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
			my @filenamelist=glob($filename."*.jpg");

			my $effective_fn= ((scalar @filenamelist)>1) ?  (join ' ', @filenamelist) : $filename.'.jpg';
			my $effective_fn_out=$filename.'_out.jpg';
			my $args=join ' ', @arr;
			if($curr_patch->{patch_type} == 2)
			{	if( $call=~ /<infiles>/o)
				{	$call=~s/<infiles>/$effective_fn/ogs;
					$call=~s/<args>/$args/ogs;
					$call=~s/<outfile>/$effective_fn_out/ogs;
				} else
				{	$call.=" $args $filename".'.jpg';
				}
				$call=~s/<idanalysis>/$idanalysis/gs;
				$call.=" >$filename".'.jpg'.'_out';
				system($call);
				warn $call;

				my $infile=readFile($filename.'.jpg'.'_out');
				unlink($filename.'.jpg'.'_out');
				$infile=~s/\s+$//ogs;
				$p = Image::Magick->new();
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
					
sub getMontageForIDImageAndIDStack{ my ($dbh, $idimage, $idstack)=@_;
	my $sql = SQL::Abstract->new;
	my($stmt, @bind) = $sql->select('montage_images', [qw/parameter idanalysis/], {idimage=>, $idimage, idmontage=> $idstack});
	my $sth = $dbh->prepare($stmt);
	$sth->execute(@bind);
	return $sth->fetchrow_hashref();
}
sub _distortImage{ my ($i, $parameter)=@_;
	my @parameters= split /\|/o, $parameter;
	@parameters = map {	$_=~/^\[/o? $_ : "[$_]" } @parameters;
	$i->Distort(method=>'AffineProjection', points=>eval($_), 'virtual-pixel'=> 'Background') for @parameters;  #<!>fixme replace with JSON deparser
	return $i;
}

sub readImageFunctionForIDAndWidth{ my ($dbh, $idimage, $width, $nocache, $csize, $affine, $idstack, $idcomposition)=@_;
	return sub {return undef} if(!$idimage&& !$idstack);
	sub doReadImageFile{ my ($p, $curr_img)=@_;
		my $filename="$curr_img->{idtrial}-$curr_img->{filename}";
		$p = Image::Magick->new(magick=>'jpg') unless $p;
		if($curr_img->{image_repository})
		{	$p->BlobToImage(LWP::Simple::get($curr_img->{image_repository}.'/'.$filename));
		} else
		{	$p->Read(server_root."/$filename");
			## warn server_root."/$filename";
		} return $p;
	}
	## warn $idimage;
	my $curr_img = getObjectFromDBHandID($dbh,'images_name', $idimage);
	## warn Dumper $curr_img;
	return sub{
		return ($nocache? 0: $idimage) if shift;
		$p = Image::Magick->new(magick=>'jpg');
		if($idstack)
		{	my $list=getObjectFromDBHandID($dbh,'montage_image_list',$idstack)->{list};
			my @idarr=split/, /o, $list;
			foreach my $id (@idarr)
			{
				my $i=doReadImageFile(undef, getObjectFromDBHandID($dbh,'images_name', $id));
				$i->Extent(geometry=>$csize, gravity=>'Center', background=>'graya(0%, 0)') if $csize;
				my $m=getMontageForIDImageAndIDStack($dbh, $id, $idstack);
				$i= imageForComposition($dbh, $idcomposition, undef, $i, 0, $m->{idanalysis}) if($idcomposition);
				_distortImage($i, $m->{parameter}) if($m->{parameter});
				push @$p,$i;
			}
		} else {
			$p=doReadImageFile($p, $curr_img);
		}
		_distortImage($p, $affine) if($affine);
		$p->Resize('@'.$width) if $width;
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
	my $filename=tempFileName('/tmp/cellf', $suffix);
	TempFileNames::writeFile($filename, $data);
	my ($idimage, $upload_dest)=createImageFromUpload($dbh, $idtrial, $name.".$suffix", $filename);
	my $idcomposition;
	my $trial = getObjectFromDBHandID($dbh,'trials', $idtrial);
	$idcomposition= $trial->{composition_for_upload};
	my $f= readImageFunctionForIDAndWidth($dbh, $idimage, undef, 1);
	my $p= $f->(0);
	$p= imageForComposition($dbh, $idcomposition,$f,$p) if($idcomposition);
	$p->Write($upload_dest);
	return $idimage;
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
1;