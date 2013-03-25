#!/usr/local/ActivePerl-5.14/site/bin/morbo

use lib qw {/srv/www/Cellfinder2/ /HHB/bin/Cellfinder/ /Users/boehringer/src/daboe01_Cellfinder/Cellfinder/ /Users/daboe01/src/daboe01_Cellfinder/Cellfinder /Users/boehringer/src/privatePerl /Users/daboe01/src/privatePerl};
use Mojolicious::Lite;
use Mojolicious::Plugin::Database;
use cellfinder_image;
use SQL::Abstract;
use Data::Dumper;
use Mojo::UserAgent;

plugin 'database', { 
			dsn	  => 'dbi:Pg:dbname=cellfinder;user=root;host=auginfo',
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
	$self->render_json( \@a );
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
	$self-> render_json( \@a );
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
	$self->render_json( {err=> $DBI::errstr} );
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
	$self->render_json( {err=> $DBI::errstr, pk => $valpk} );
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
	$self->render_json( {err=> $DBI::errstr} );
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
# imaging part

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

	my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage, $width, $nocache, $csize, $affine, $idstack);
	my $p= $f->(0);
	$p= cellfinder_image::imageForComposition($self->db, $preload,$f,$p) if($preload);
	$p= cellfinder_image::imageForComposition($self->db, $idcomposition,$f,$p, 1, $idanalysis)	if($idcomposition);
	$p= cellfinder_image::imageForComposition($self->db, $afterload,$f,$p,1) if($afterload);
	
	if(ref $p eq 'Image::Magick')
	{	if($spc eq 'geom')	# geom-query
		{	$self->render_text(join ' ', $p->Get('width', 'height') );
		} elsif(length $spc)
		{	$self->render_text($p->Get($spc) );
		}
		else
		{	$self->render_data(($p->ImageToBlob(magick=>'jpg'))[0], format =>'jpg' );
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
		{	$self->render_text($p);
		}
	}
};
get '/IMG/make_tags'=> sub
{	my $self=shift;
	my $sql='INSERT INTO tags (idimage, idtag)  (select images.id as idimage, tag_repository.id as idtag from images join tag_repository on images.idtrial=tag_repository.idtrial left join tags on idimage=images.id and tags.idtag=tag_repository.id where tags.id is null)';
	my $sth = $self->db->prepare($sql);
	$sth->execute();
	$self->render_text('OK');
};

get '/IMG/STACK/:idstack'=> [idstack =>qr/\d+/] => sub
{	my $self=shift;
	my $spc=			$self->param("spc");
	my $idstack=		$self->param("idstack");
	my $ransac=			$self->param("ransac");
	my $thresh=			$self->param("thresh");
	my $identityradius= $self->param("identityradius");
	my $iterations= $self->param("iterations");

	if($spc eq 'affine')
	{	my $sql = SQL::Abstract->new;
		my($stmt, @bind) = $sql->select('montage_images',undef, {idmontage => $idstack} );
		my $sth = $self->db->prepare($stmt);
		$sth->execute(@bind);

		while ( my $curr = $sth->fetchrow_hashref() )
		{	next unless $curr->{idanalysis_reference};
			my $par= $ransac?	cellfinder_image::runRANSACRegistrationRCode($curr->{idanalysis_reference}, $curr->{idanalysis}, $thresh, $identityradius, $iterations):
								cellfinder_image::runSimpleRegistrationRCode($curr->{idanalysis_reference}, $curr->{idanalysis});
warn $par.' '. $curr->{id};
			my $sql=SQL::Abstract->new();
			my($stmt, @bind) = $sql->update('montage_images', {parameter=> $par}, {id=>$curr->{id} } );
			my $sth =  $self->db->prepare($stmt);
			$sth->execute(@bind);
		}
		$self->render_text($idstack);
	} elsif($spc eq 'gif')
	{	my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, 0, undef, undef, undef, undef, $idstack);
		my $p= $f->(0);
		$_->Set(delay=>15) for @$p;		# <!> fixme: make configurable
		my $tempfilename=cellfinder_image::tempFileName('/tmp/cellf');
		$p->Write($tempfilename.'.gif');
		$self->render_data(cellfinder_image::readFile($tempfilename.'.gif'), format=>'gif');
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
	$self->render_text($idimage);
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
	$self->render_data('OK', format =>'txt' );
};
post '/IMG/makestack/:idtrial/:name'=> [name=>qr/.+/] => sub
{	sub getLastAnalysisForImage{
		my $dbh  = shift;
		my $id = shift;
		
		my $sth = $dbh->prepare( qq/select max(id) from analyses where idimage=?/);
		$sth->execute(($id));
		return $sth->fetchall_arrayref()->[0]->[0];
}
	
	my $self=shift;
	my $name= $self->param("name");
	my $idtrial= $self->param("idtrial");
	my $json_decoder= Mojo::JSON->new;
	# warn $self->req->body;
	my $jsonR   = $json_decoder->decode( $self->req->body );
	my @image_ids=@$jsonR;
	my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
	my $idref;
	foreach my $id (@image_ids)
	{	my $idanalysis=getLastAnalysisForImage($self->db,  $id );
		cellfinder_image::insertObjectIntoTable($self->db, 'montage_images', 'id', {idimage=> $id, idanalysis=> $idanalysis, idanalysis_reference=>$idref, idmontage=> $idmontage} );
		$idref=$idanalysis unless $idref;
	}
	$self->render_data('OK', format =>'txt' );
};

post '/IMG/analyze/:idtrial/:name'=> [name=>qr/.+/] => sub
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
	$self->render_data('OK', format =>'txt' );
};


###################################################################
# docscal interface

get '/DC/dir/:piz'=> [piz =>qr/\d{8}/] => sub
{	my $self=shift;
	my $piz= $self->param("piz");
	my $ua = Mojo::UserAgent->new;
	my $data=$ua->get('http://10.250.0.33/docscaldownload/'.$piz.'?peek=1')->res->body;
	$self->render_text( $data);
};
get '/DC/dir/:piz/:type' => [piz =>qr/\d{8}/] => sub
{	my $self=shift;
	my $piz= $self->param("piz");
	my $type= $self->param("type");
	my $ua = Mojo::UserAgent->new;
	my $data=$ua->get('http://10.250.0.33/docscaldownload/'.$piz.'?dir='.$type)->res->body;
	$self->render_text( $data);
};
get '/DC/fetch/:name/:scale'=> [name =>qr/.+/] => sub
{	my $self=shift;
	my $name= $self->param("name");
	my $scale= $self->param("scale");
	my $ua = Mojo::UserAgent->new;
	my $data=$ua->get("http://10.250.0.33/docscaldownload/$name?size=$scale")->res->body;
	$self->render_data($data , format =>'jpg' );
};


<<<<<<< HEAD
app->config(hypnotoad => {listen => ['http://*:3000'], workers => 10, heartbeat_timeout=>600, inactivity_timeout=> 600});
=======
app->config(hypnotoad => {listen => ['http://*:3000'], workers => 10, heartbeat_timeout=>100, inactivity_timeout=> 100});
>>>>>>> compo for viewing
app->start;
