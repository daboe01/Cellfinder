#!/usr/local/ActivePerl-5.14/site/bin/morbo

use Mojolicious::Lite;
use Mojolicious::Plugin::Database;
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
get '/:table'=> sub
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
get '/:table/:col/:pk' => [pk=>qr/.+/] => sub
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

# update
put '/:table/:pk/:key'=> [key=>qr/\d+/] => sub
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
post '/:table/:pk'=> sub
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
del '/:table/:pk/:key'=> [key=>qr/\d+/] => sub
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


app->start;
