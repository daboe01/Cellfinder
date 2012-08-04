#!/usr/local/ActivePerl-5.14/site/bin/morbo

use lib qw {/Users/boehringer/src/daboe01_Cellfinder/Cellfinder/ /Users/daboe01/src/daboe01_Cellfinder/Cellfinder /Users/boehringer/src/privatePerl /Users/daboe01/src/privatePerl};
use Mojolicious::Lite;
use Mojolicious::Plugin::Database;
use cellfinder_image;
use SQL::Abstract;
use Data::Dumper;

plugin 'database', { 
			dsn	  => 'dbi:Pg:dbname=cellfinder;user=root;host=localhost',
			username => 'root',
			password => 'root',
			options  => { 'pg_enable_utf8' => 1, AutoCommit => 1 },
			helper   => 'db'
};

# fetch all entities
get '/DBI/:table'=> sub
{	my $self = shift;
	my $sql = SQL::Abstract->new;
	my $table  = $self->param('table');
	$self->db->quote_identifier($table);
	my $sth = $self->db->prepare(qq/select * from /.$table);
	$sth->execute();
	my @a;
	while(my $c=$sth->fetchrow_hashref())
	{	push @a,$c;
	}

	$self->render(json => \@a );
};

# fetch entities by (foreign) key
get '/DBI/:table/:col/:pk' => [pk=>qr/.+/] => sub
{	my $self = shift;
	my $sql = SQL::Abstract->new;
	my $table  = $self->param('table');
	my $pk  = $self->param('pk');
	my $col  = $self->param('col');
	app->log->debug( $pk );
	app->log->debug( $col );
	$self->db->quote_identifier($table);
	my $sth = $self->db->prepare(qq/select * from /.$table.qq/ where /.$col.qq/=?/);
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

# update
put '/DBI/:table/:pk/:key'=> [key=>qr/\d+/] => sub
{	my $self	= shift;
	my $table	= $self->param('table');
	my $pk		= $self->param('pk');
	my $key		= $self->param('key');
	my $sql = SQL::Abstract->new;
	my $json_decoder= Mojo::JSON->new;
	my $jsonR   = $json_decoder->decode( $self->req->body );
	app->log->debug($self->req->body);
	my($stmt, @bind) = $sql->update($table, $jsonR, {$pk=>$key});
	my $sth = $self->db->prepare($stmt);
	$sth->execute(@bind);
	app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
	$self->render(json => {err=> $DBI::errstr} );
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
	$self->render(json => {err=> $DBI::errstr, pk => $valpk} );
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
	$self->render(json => {err=> $DBI::errstr} );
};

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

	$p= cellfinder_image::imageForComposition($self->db, $preload,$f,$p)		if($preload);
	$p= cellfinder_image::imageForComposition($self->db, $idcomposition,$f,$p)	if($idcomposition);
	$p= cellfinder_image::imageForComposition($self->db, $afterload,$f,$p,1)	if($afterload);

	if(ref $p eq 'Image::Magick')
	{	if($spc eq 'geom')	# geom-query
		{	$self->render_text(join ' ', $p->Get('width', 'height') );
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

get '/IMG/STACK/:idstack'=> [idstack =>qr/\d+/] => sub
{	my $self=shift;
	my $spc=			$self->param("spc");
	my $idstack=		$self->param("idstack");
	if($spc eq 'affine')
	{	my $sql='select * from montage_images where idmontage=?';
		my $sth = $self->db->prepare($sql);
		$sth->execute(($idstack));
		while ( my $curr = $sth->fetchrow_hashref() )
		{	next unless $curr->{idanalysis_reference};
			my $par= cellfinder_image::runSimpleRegistrationRCode($curr->{idanalysis}, $curr->{idanalysis_reference});
			my $sql=SQL::Abstract->new();
			my($stmt, @bind) = $sql->update('montage_images', {parameter=> $par}, {id=>$curr->{id} } );
			my $sth =  $self->db->prepare($stmt);
			$sth->execute(@bind);
		}
	} $self->render_text('');
};


app->start;
