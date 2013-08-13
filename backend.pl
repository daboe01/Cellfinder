#!/usr/local/ActivePerl-5.14/site/bin/morbo


use lib qw {/srv/www/Cellfinder2/ /HHB/bin/Cellfinder/ /Users/boehringer/src/daboe01_Cellfinder/Cellfinder/ /Users/daboe01/src/daboe01_Cellfinder/Cellfinder /Users/boehringer/src/privatePerl /Users/daboe01/src/privatePerl};
use Mojolicious::Lite;
use Mojolicious::Plugin::Database;
use cellfinder_image;
use SQL::Abstract;
use Data::Dumper;
use Mojo::UserAgent;
use POSIX;
use Try::Tiny;

# enable receiving uploads up to 1GB
$ENV{MOJO_MAX_MESSAGE_SIZE} = 1_073_741_824;

plugin 'database', { 
			dsn	  => 'dbi:Pg:dbname=cellfinder;user=root;host=localhost',
			username => 'root',
			password => 'root',
			options  => { 'pg_enable_utf8' => 1, AutoCommit => 1 },
			helper   => 'db'
};

###########################################
# dbi part

# fetch all entities
get '/DBI/:table'=> sub
{	my $self = shift;
	my $sql = SQL::Abstract->new;
	my $table  = $self->param('table');
    my($stmt, @bind) = $sql->select($table);
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);

	my @a;
	while(my $c=$sth->fetchrow_hashref())
	{	push @a,$c;
	}
	$self->render( json=> \@a );
};

# fetch entities by (foreign) key
get '/DBI/:table/:col/:pk' => [col=>qr/.+/, pk=>qr/.+/] => sub
{	my $self = shift;
	my $sql = SQL::Abstract->new;
	my $table  = $self->param('table');
	my $pk  = $self->param('pk');
	my $col  = $self->param('col');

    my($stmt, @bind) = $sql->select($table,undef, {$col=> $pk} );
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);

	my @a;
	while(my $c=$sth->fetchrow_hashref())
	{	push @a,$c;
	}
	$self-> render( json => \@a );
};

# update
put '/DBI/:table/:pk/:key'=> [key=>qr/\d+/] => sub
{	my $self	= shift;
	my $table	= $self->param('table');
	my $pk		= $self->param('pk');
	my $key		= $self->param('key');
	my $sql		= SQL::Abstract->new;
	my $json_decoder= Mojo::JSON->new;
	my $jsonR   = $json_decoder->decode( $self->req->body );
	app->log->debug($self->req->body);
	my($stmt, @bind) = $sql->update($table, $jsonR, {$pk=>$key});
	my $sth = $self->db->prepare($stmt);
	$sth->execute(@bind);
	app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
	$self->render( json=> {err=> $DBI::errstr} );
};

# insert
post '/DBI/:table/:pk'=> sub
{	my $self	= shift;
	my $table	= $self->param('table');
	my $pk		= $self->param('pk');
	my $sql = SQL::Abstract->new;
	my $json_decoder= Mojo::JSON->new;
	my $jsonR   = $json_decoder->decode( $self->req->body );
app->log->debug($self->req->body);
	my($stmt, @bind) = $sql->insert($table, $jsonR);
	my $sth = $self->db->prepare($stmt);
	$sth->execute(@bind);
	app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
	my $valpk= $self->db->last_insert_id(undef, undef, $table, $pk);
	$self->render( json=>{err=> $DBI::errstr, pk => $valpk} );
};

# delete
del '/DBI/:table/:pk/:key'=> [key=>qr/\d+/] => sub
{	my $self	= shift;
	my $table	= $self->param('table');
	my $pk		= $self->param('pk');
	my $key		= $self->param('key');
	my $sql = SQL::Abstract->new;

	my($stmt, @bind) = $sql->delete($table, {$pk=>$key});
	my $sth = $self->db->prepare($stmt);
	$sth->execute(@bind);
	app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
	$self->render( json=>{err=> $DBI::errstr} );
};

#<!> experimental
# fuzzy-fetch entities by (foreign) key
get '/DBI/:table/:col/like/:pk' => [pk=>qr/.+/] => sub
{	my $self = shift;
	my $sql = SQL::Abstract->new;
	my $table  = $self->param('table');
	my $pk  = $self->param('pk');
	my $col  = $self->param('col');
	app->log->debug( $pk );
	app->log->debug( $col );
	$self->db->quote_identifier($table);
	my $sth = $self->db->prepare(qq/select * from /.$table.qq/ where /.$col.qq/~*?/);
	$sth->execute(($pk));
	my @a;
	my $i=0;
	while(my $c=$sth->fetchrow_hashref())
	{	push @a,$c;
		$i++;
	}
	warn $i;
	#	app->log->debug(Dumper \@a);
	$self->render(json  => \@a);
};

###################################################################
# cellfinder specific part

get '/IMG/:idimage'=> [idimage =>qr/\d+/] => sub
{	my $self=shift;
	my $spc=			$self->param("spc");
	my $width=			$self->param("width");
	my $idimage	=		$self->param('idimage');
	my $idanalysis=		$self->param('idanalysis');
	my $preload=		$self->param('preload');
	my $afterload=		$self->param('afterload');
	my $idcomposition=	$self->param('cmp');
	my $csize=			$self->param('csize');
	my $affine=			$self->param('affine');
	my $idstack=		$self->param('idstack');
	my $rnd=			$self->param('rnd');

	my $nocache=0;

	$nocache= 1 if(($rnd && $rnd!=1)  || $width);
	$spc="" unless $spc;

	my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage, $width, $nocache, $csize, undef, $idstack);
	my $p= $f->(0);
	$p= cellfinder_image::imageForComposition($self->db, $preload,$f,$p) if($preload);
	$p= cellfinder_image::imageForComposition($self->db, $idcomposition,$f,$p, 1, $idanalysis)	if($idcomposition);
	$p= cellfinder_image::imageForComposition($self->db, $afterload,$f,$p,1) if($afterload);
	$p= cellfinder_image::_distortImage($p, $affine) if($affine);

	if($csize && !$idstack)
	{	$p->Extent(geometry=>$csize, gravity=>'NorthWest', background=>'graya(0%, 0)');
	}

	if(ref $p eq 'Image::Magick')
	{	if($spc eq 'geom')	# geom-query
		{	$self->render(text => join ' ', $p->Get('width', 'height') );
		} elsif(length $spc)
		{	$self->render(text=> $p->Get($spc) );
		}
		else
		{
			$self->render(data => ($p->ImageToBlob(magick=>'jpg'))[0], format =>'jpg' );
		}
	} elsif($p)
	{	if(ref $p eq 'ARRAY')
		{	my $insertagg= $self->param('insertagg');
			if($insertagg)
			{	cellfinder_image::insertAggregation($self->db, $idanalysis, $p);
			} else{
				$self->render(json=>$p, format =>'json' );
			}
		} else
		{	$self->render(text => $p);
		}
	}
};
get '/IMG/make_tags'=> sub
{	my $self=shift;
	my $sql='INSERT INTO tags (idimage, idtag)  (select images.id as idimage, tag_repository.id as idtag from images join tag_repository on images.idtrial=tag_repository.idtrial left join tags on idimage=images.id and tags.idtag=tag_repository.id where tags.id is null)';
	my $sth = $self->db->prepare($sql);
	$sth->execute();
	$self->render(text=>'OK');
};
get '/IMG/reaggregate_all/:idtrial'=> [idtrial =>qr/\d+/] => sub
{	my $self=shift;
	my $idtrial= $self->param("idtrial");
	my $dbh=$self->db;
	my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);
	
	$dbh->{AutoCommit}=0;
	my $sql=qq{delete from aggregations using analyses, images where  analyses.idimage=images.id and aggregations.idanalysis=analyses.id and idtrial=?};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($idtrial));
	
	$sql=qq{select distinct analyses.id, idimage from analyses left join aggregations on  aggregations.idanalysis=analyses.id join images on analyses.idimage=images.id  join number_points on number_points.idanalysis=analyses.id where  aggregations.idanalysis is null and idtrial=?};
	$sth = $dbh->prepare( $sql );
	$sth->execute(($idtrial));
	while(my $curr=$sth->fetchrow_arrayref())
	{	my ($idanalysis,$idimage)=($curr->[0],$curr->[1]);
		my $f= cellfinder_image::readImageFunctionForIDAndWidth($dbh, $idimage);
		my $p= $f->(0);
		$p= cellfinder_image::imageForComposition($self->db, $trial->{composition_for_aggregation},$f,$p, 1, $idanalysis);
	}
	$dbh->{AutoCommit}=1;
	$self->render(text => 'OK');
};
get '/IMG/input_results/:idto/:results'=> [idto =>qr/\d+/,results =>qr/.+/] => sub
{	my $self=shift;
	my $results		= $self->param("results");
	my $idanalysis  = $self->param("idto");
	my $dbh=$self->db;

	$dbh->{AutoCommit}=0;
	my $sql = 'delete from results where idanalysis = ?';
	my $sth = $dbh->prepare($sql);
	$sth->execute(($idanalysis));
	   $sql = 'insert into results (idanalysis, row, col, tag) values (?, ?, ?, ?)';
	   $sth = $dbh->prepare($sql);
	my @result_arr=split/\s+/o, $results;
	my ($x,$y);
	while(($x,$y)= splice @result_arr,0,2)
	{	my $tag;
		$tag=$1 if $y=~s/\(([0-9]+)\)//ogs;
		($x,$y)=(floor ($x), floor ($y));
		$sth->execute(($idanalysis, $x, $y, $tag));
	}
	$dbh->commit;
	$dbh->{AutoCommit}=1;
	
	$self->render(text=> 'OK');
};

get '/IMG/copy_results/:idfrom/:idto'=> [idfrom =>qr/\d+/,idto =>qr/\d+/] => sub
{	my $self=shift;
	my $idfrom= $self->param("idfrom");
	my $idto  = $self->param("idto");
	my $dbh=$self->db;
	my $sql=qq{insert into results (row,col,tag,idanalysis) (select row,col,tag, ? as idanalysis from results where idanalysis=?)};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($idto,$idfrom));
	$self->render(text =>'OK');
};

get '/IMG/delete_images_in_folder/:idtrial/:folder_name'=> [idtrial =>qr/\d+/, folder_name =>qr/.+/] => sub
{	my $self=shift;
	my $idtrial = $self->param("idtrial");
	my $folder_name = $self->param("folder_name");
	my $linkname= $idtrial.$folder_name;
	my $dbh=$self->db;
	my $sql=qq{select idimage from  folder_content where linkname=?};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($linkname));
	while(my $curr=$sth->fetchrow_arrayref())
	{	my $idimage=$curr->[0];
		cellfinder_image::deleteImage($dbh, $idimage);
	}

	$self->render(text =>'OK');
};

get '/ANA/results/:idanalysis'=> [idanalysis =>qr/\d+/] => sub
{	my $self=shift;
	my $idanalysis= $self->param("idanalysis");
	my $dbh=$self->db;
	my $sql=qq{select id, row,col,coalesce(tag,0) as tag,idanalysis from results where idanalysis=? order by 1};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($idanalysis));
	my $result=	join("\t", qw/id row col tag idanalysis/)."\n";
	while(my $curr=$sth->fetchrow_arrayref())
	{	$result.=join("\t", (@$curr));
		$result.="\n";
	}
	$self->render(text=> $result);
};
get '/ANA/aggregations/:idtrial'=> [idtrial =>qr/\d+/] => sub
{	my $self=shift;
	my $idtrial= $self->param("idtrial");
	my $dbh=$self->db;
	my $sql=qq{SELECT distinct aggregations.name FROM aggregations join analyses on idanalysis =analyses.id join images on idimage=images.id where idtrial=? order by 1};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($idtrial));
	my $a=$sth->fetchall_arrayref();
	my @colnames=map {'"'.$_->[0].'"' } @$a;
	my $colnames= join " text,",@colnames;
	$sql="SELECT * FROM crosstab( 'select idanalysis, images.id as idimage, images.name as image_name, aggregations.name as cat, value from aggregations join analyses on idanalysis=analyses.id join images on idimage=images.id where idtrial=$idtrial  order by 1,2', 'SELECT distinct aggregations.name FROM aggregations join analyses on idanalysis =analyses.id join images on idimage=images.id where idtrial=$idtrial order by 1') AS ct(idanalysis integer, idimage integer, image_name text, $colnames text)";
	$sth = $dbh->prepare( $sql );
	$sth->execute();
	my $result=	"idanalysis\tidimage\timage_name\t".join("\t", @colnames)."\n";
	while(my $curr=$sth->fetchrow_arrayref())
	{	$result.=join("\t", (@$curr));
		$result.="\n";
	}
	$self->render(text=>$result);
	
};
get '/ANA/:table/:idtrial'=> [table=>qr/[^"]+/, idtrial =>qr/\d+/] => sub
{	my $self=shift;
	my $idtrial= $self->param("idtrial");
	my $table= $self->param("table");
	my $dbh=$self->db;
	my $sql="SELECT * FROM \"$table\" where idtrial=$idtrial";
	my $sth = $dbh->prepare( $sql );
	$sth->execute();
	my $res = $sth->fetchall_arrayref();                    
	my $colnames = $sth->{NAME};          
	my $result=	join("\t", @$colnames)."\n";
	for my $curr (@$res)
	{	$result.=join("\t", (@$curr));
		$result.="\n";
	}
	$self->render(text=> $result);
	
};


get '/IMG/STACK/:idstack'=> [idstack =>qr/\d+/] => sub
{	my $self=shift;
	my $spc=			$self->param("spc");
	my $idstack=		$self->param("idstack");
	my $ransac=			$self->param("ransac");
	my $thresh=			$self->param("thresh");
	my $identityradius= $self->param("identityradius");
	my $iterations=		$self->param("iterations");
	my $aiterations=	$self->param("aiterations");
	my $cfunc=			$self->param("cfunc");
	my $idcomposition=	$self->param('cmp');

	if($spc eq 'affine')
	{	my $sql = SQL::Abstract->new;
		my($stmt, @bind) = $sql->select('montage_images',undef, {idmontage => $idstack} );
		my $sth = $self->db->prepare($stmt);
		$sth->execute(@bind);

		while ( my $curr = $sth->fetchrow_hashref() )
		{	next unless $curr->{idanalysis_reference};
			my $par= $ransac?	cellfinder_image::runRANSACRegistrationRCode($curr->{idanalysis_reference}, $curr->{idanalysis}, $thresh, $identityradius, $iterations, $aiterations, $cfunc):
								cellfinder_image::runSimpleRegistrationRCode($curr->{idanalysis_reference}, $curr->{idanalysis});
			my $sql=SQL::Abstract->new();
			my($stmt, @bind) = $sql->update('montage_images', {parameter=> $par}, {id=>$curr->{id} } );
			my $sth =  $self->db->prepare($stmt);
			$sth->execute(@bind);
		}
		$self->render(text => $idstack);
	} elsif($spc eq 'gif')
	{	my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, 0, undef, undef, undef, undef, $idstack, $idcomposition);
		my $p= $f->(0);
		$_->Set(delay=>15) for @$p;		# <!> fixme: make configurable
		my $tempfilename=cellfinder_image::tempFileName('/tmp/cellf');
		$p->Write($tempfilename.'.gif');
		$self->render(data=>cellfinder_image::readFile($tempfilename.'.gif'), format=>'gif');
	}
};

get '/IMG/import/:idtrial/:name/:uri'=> [name=>qr/.+/, uri=>qr/.+/] => sub
{	my $self=shift;
	my $idtrial=	$self->param("idtrial");
	my $name=		$self->param("name");
	my $uri=		$self->param("uri");
	my $ua = Mojo::UserAgent->new;
	my $data=		$ua->get($uri)->res->body;
	my $suffix='.jpg';	# sensible default
	$suffix=$1 if $uri =~/^.+\.(.+)$/o;
	my $idimage= cellfinder_image::uploadImageFromData($self->db, $idtrial, $name, $suffix, $data);
	$self->render(text=>$idimage);
};

post '/IMG/import_stack/:idtrial/:name'=> [name=>qr/.+/] => sub
{	use TempFileNames;
	my $self=shift;
	my $name= $self->param("name");
	my $idtrial= $self->param("idtrial");
	my $json_decoder= Mojo::JSON->new;
	# warn $self->req->body;
	my $jsonR   = $json_decoder->decode( $self->req->body );
	my $suffix='.jpg';	# sensible default
	my @image_ids;
	my $i=0;
	foreach my $dc_name (@$jsonR)	# import every image
	{	my $ua = Mojo::UserAgent->new;
		my $data=$ua->get($dc_name)->res->body;
		$suffix=$1 if $dc_name =~/^.+\.(.+)$/o;
		my $idimage= cellfinder_image::uploadImageFromData($self->db, $idtrial, $name. ($i? "_$i":''), $suffix, $data);
		push @image_ids, $idimage;
		$i++;
	}
	my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
	my $idref;
	foreach my $id (@image_ids)
	{	my $idanalysis=cellfinder_image::insertObjectIntoTable($self->db, 'analyses', 'id', { idimage=> $id } );
		$idref=$idanalysis unless $idref;
		cellfinder_image::insertObjectIntoTable($self->db, 'montage_images', 'id', {idimage=> $id, idanalysis=> $idanalysis, idanalysis_reference=>$idref, idmontage=> $idmontage} );
	}
	$self->render(data=>'OK', format =>'txt' );
};
helper getLastAnaOfImageID => sub { my ($self, $idimage)=@_;
	my $query=qq/select max(id) from analyses where idimage=?/;
	my $sth = $self->db->prepare($query);
	$sth->execute(($idimage));
	my $a=$sth->fetchall_arrayref();
	return $a->[0]->[0] if $a;
	return undef;
};
post '/IMG/makestack/:idtrial/:name'=> [name=>qr/.+/] => sub
{	my $self=shift;
	my $name= $self->param("name");
	my $idtrial= $self->param("idtrial");
	my $json_decoder= Mojo::JSON->new;
	# warn $self->req->body;
	my $jsonR   = $json_decoder->decode( $self->req->body );
	my @image_ids=@$jsonR;
	my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
	my $idref;
	foreach my $id (@image_ids)
	{	my $idanalysis=getLastAnaOfImageID( $id );
		cellfinder_image::insertObjectIntoTable($self->db, 'montage_images', 'id', {idimage=> $id, idanalysis=> $idanalysis, idanalysis_reference=>$idref, idmontage=> $idmontage} );
		$idref=$idanalysis unless $idref;
	}
	$self->render(data=>'OK', format =>'txt' );
};

post '/IMG/analyze/:idtrial/:name'=> [idtrial=>qr/[0-9]+/, name=>qr/.+/] => sub
{	my $self=shift;
	my $idtrial=	$self->param("idtrial");
	my $name=		$self->param("name");
	my $uri=		$self->req->body;
	my $ua = Mojo::UserAgent->new;
	my $data=		$ua->get($uri)->res->body;
	my $suffix='.jpg';	# sensible default
	$suffix=$1 if $uri =~/^.+\.(.+)$/o;

	my $trial = cellfinder_image::getObjectFromDBHandID($self->db, 'trials', $idtrial);
	my $idimage = cellfinder_image::uploadImageFromData($self->db, $idtrial, $name, $suffix, $data);
	my $d={idimage=>$idimage, idcomposition_for_editing=> $trial->{composition_for_editing}, idcomposition_for_analysis=> $trial->{composition_for_celldetection} };
	my $idanalysis=cellfinder_image::insertObjectIntoTable($self->db, 'analyses', 'id', $d );
	my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage);
	cellfinder_image::imageForComposition($self->db, $d->{idcomposition_for_analysis}, $f, $f->(0), 0, $idanalysis);
	$self->render(data=>'OK', format =>'txt' );
};

# <!> fixme: support "replace" option+ supply id of analysis
get '/IMG/analyze_folder/:idtrial/:folder_name'=> [idtrial=>qr/[0-9]+/, folder_name =>qr/.+/] => sub
{	my $self=shift;
	my $idtrial=	$self->param("idtrial");
	my $folder_name = $self->param("folder_name");
	my $linkname= $idtrial.$folder_name;
	my $dbh=$self->db;

	my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);

	my $sql=qq{select idimage, name from  folder_content where linkname=? order by 2};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($linkname));
	while(my $curr=$sth->fetchrow_arrayref())
	{	my $idimage=$curr->[0];
		my $d={idimage=>$idimage, idcomposition_for_editing=> $trial->{composition_for_editing}, idcomposition_for_analysis=> $trial->{composition_for_celldetection} };
		my $sqldel = SQL::Abstract->new;
		my($stmt, @bind) = $sqldel->delete('analyses', $d);
		my $sthdel = $self->db->prepare($stmt);
		$sthdel->execute(@bind);

		my $idanalysis=cellfinder_image::insertObjectIntoTable($self->db, 'analyses', 'id', $d );
		my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage);
		cellfinder_image::imageForComposition($self->db, $d->{idcomposition_for_analysis}, $f, $f->(0), 0, $idanalysis);
	}
	$self->render(data=>'OK', format =>'txt' );
};


get '/IMG/automatch_folder/:idtrial/:folder_name'=> [idtrial=>qr/[0-9]+/, folder_name =>qr/.+/] => sub
{	my $self=shift;
	my $idtrial=		$self->param("idtrial");
	my $folder_name =	$self->param("folder_name");
	my $thresh=			$self->param("thresh");
	my $identityradius= $self->param("identityradius");
	my $iterations=		$self->param("iterations");
	my $aiterations=	$self->param("aiterations");
	my $cfunc=			$self->param("cfunc");

	my $linkname= $idtrial.$folder_name;
	my $dbh=$self->db;

	my $sql=qq{select idimage, name from  folder_content where linkname=? order by 2};
	my $sth = $dbh->prepare( $sql );
	$sth->execute(($linkname));
	my ($idimage1, $idimage2, $next_idimage);
	while( my $curr=$sth->fetchrow_arrayref() )
	{	$next_idimage=$curr->[0];
		$idimage1=$next_idimage unless $idimage1;
		my ($idana1, $idana2)=($self->getLastAnaOfImageID($idimage1), $self->getLastAnaOfImageID($next_idimage));
		if(!$idana1)
		{	$idimage1=undef;
			next;
		}
		next unless $idana2;
		$idimage2=$next_idimage;
		if($idana1 && $idana2 &&  $idana1 != $idana2)
		{	my $par=cellfinder_image::runRANSACRegistrationRCode($idana1, $idana2, $thresh, $identityradius, $iterations, $aiterations, $cfunc);
			if($par)
			{	my $name="$idana1 $idana2";
				my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
				cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idimage=> $idimage1, idanalysis=> $idana1, idanalysis_reference=>undef,   idmontage=> $idmontage} );
				cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idimage=> $idimage2, idanalysis=> $idana2, idanalysis_reference=>$idana1, idmontage=> $idmontage, parameter=> $par} );
			}
		}
		($idimage1, $idimage2)=($idimage2, $next_idimage);
	}
	$self->render(data=>'OK', format =>'txt' );
};

get '/IMG/autostitch/:idmontage'=> [idmontage =>qr/[0-9]+/] => sub
{	my $self=shift;
	my $idmontage= $self->param('idmontage');

	sub iterateAnalysesOfMontageIDAndMatrix { my ($dbh, $idmontage_orig, $current_matrix, $idanalysis_orig, $idanalysis, $idmontage, $idimage)=@_;
		my $query=qq/select idanalysis, idanalysis_reference, parameter, idmontage, idimage from montage_images where (idanalysis =? or idanalysis_reference=?) and idmontage > ?/;
		my $sth = $dbh->prepare($query);
		$idmontage = $idmontage_orig  unless $idmontage;
		$idanalysis =$idanalysis_orig unless $idanalysis;

		$sth->execute(($idanalysis, $idanalysis, $idmontage));
		my $anchors= $sth->fetchall_arrayref();
	
		foreach my $curr_anchor (@$anchors)
		{	if( $curr_anchor->[2] )
			{	if($current_matrix) {
					$current_matrix = cellfinder_image::multiplyAffineMatrixes($current_matrix, $curr_anchor->[2]);
				} else {
					$current_matrix = $curr_anchor->[2];
				}
				cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idimage=> $curr_anchor->[4], idanalysis=> $curr_anchor->[0], idanalysis=> $curr_anchor->[0], idmontage=> $idmontage_orig, parameter=> $current_matrix} );
				iterateAnalysesOfMontageIDAndMatrix($dbh, $idmontage_orig, $current_matrix, $idanalysis_orig, $curr_anchor->[0], $curr_anchor->[3], $curr_anchor->[4] );
			}
		}
	}

	my $query=qq/select idanalysis, idanalysis_reference, parameter, idmontage, idimage from montage_images where idmontage = ? and idanalysis_reference is not null/;
	my $sth = $self->db->prepare($query);
	$sth->execute(($idmontage));
	my $anchor= $sth->fetchrow_hashref();

	iterateAnalysesOfMontageIDAndMatrix($self->db, $idmontage, $anchor->{parameter},  $anchor->{idanalysis} );

	$self->render(data=>'OK', format =>'txt' );
};



# POST /upload (push one or more files to app)
post '/upload/:idtrial' => [idtrial=>qr/[0-9]+/] => sub {
    my $self    = shift;
	my $idtrial=	$self->param("idtrial");
	my $prefix=		$self->param("prefix") || '';
    my @uploads = $self->req->upload('files[]');
    for my $curr_upload (@uploads) {
		my $upload  = Mojo::Upload->new($curr_upload);
		my $bytes = $upload->slurp;
		my ($filename, $suffix)=$upload->filename =~/^(.+)\.([^\.]+)$/;
		cellfinder_image::uploadImageFromData($self->db, $idtrial, $prefix.$filename, $suffix, $bytes);

    }
    $self->render( json => \@uploads );
};




app->config(hypnotoad => {listen => ['http://*:3000'], workers => 10, heartbeat_timeout=>600, inactivity_timeout=> 600});
app->start;
