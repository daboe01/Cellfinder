use lib qw{/Users/Shared/bin /Users/Shared/bin/Cellfinder2 /srv/www/Cellfinder2/ /HHB/bin/Cellfinder/ /Users/boehringer/src/daboe01_Cellfinder/Cellfinder/ /Users/daboe01/src/daboe01_Cellfinder/Cellfinder /Users/boehringer/src/privatePerl /Users/daboe01/src/privatePerl};
use Mojolicious::Lite;
use Mojolicious::Plugin::Database;
use cellfinder_image;
use SQL::Abstract;
use Apache::Session::File;
use Data::Dumper;
use Mojo::UserAgent;
use POSIX;
use Try::Tiny;
use URI::Encode qw(uri_decode);
use Archive::Zip;
use Mojo::JSON qw(decode_json encode_json);

# enable receiving uploads up to 1GB
$ENV{MOJO_MAX_MESSAGE_SIZE} = 1_073_741_824;

plugin 'database', {
            dsn      => 'dbi:Pg:dbname=cellfinder;user=root;host=auginfo',
            username => 'root',
            password => 'root',
            options  => { 'pg_enable_utf8' => 1, AutoCommit => 1 },
            helper   => 'db'
};

# turn cache off
hook after_dispatch => sub {
    my $tx = shift;
    my $e = Mojo::Date->new(time-100);
    $tx->res->headers->header(Expires => $e);
};

# <!> fixme: implement https://blog.darkpan.com/article/6/Perl-and-Google-Authenticator.html here
any '/DB/session_key/:key'=> [key =>qr/[-\da-z_]+/i] => sub {
    my $self = shift;
    my $key = $self->param('key');
    my $sessionid = '';

    # detect internet access
    my $is_external = $self->req->headers->header('X-Forwarded-For')? 1:0;
    my  %session;
    tie %session, 'Apache::Session::File', undef , {Transaction => 0};
    $sessionid = $session{_session_id};
    $session{is_external} = $is_external;

    $self->render(text => $sessionid );
};


###########################################
# dbi part

# fetch all entities
get '/DB/:table'=> sub
{   my $self = shift;
    my $sql = SQL::Abstract->new;
    my $table = $self->param('table');
    my $sessionid  = $self->param('session');
    my  %session;
    tie %session, 'Apache::Session::File', $sessionid , {Transaction => 0};

    my($stmt, @bind) = $sql->select($table);
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);
app->log->debug( '**************************'.$session{is_external} );
    $self->render( json=> $sth->fetchall_arrayref({}) );
};

# fetch entities by (foreign) key
get '/DB/:table/:col/:pk' => [col=>qr/.+/, pk=>qr/.+/] => sub
{   my $self = shift;
    my $sql = SQL::Abstract->new;
    my $table  = $self->param('table');
    my $pk  = uri_decode( $self->param('pk'));
    my $col  = uri_decode( $self->param('col'));

    warn $pk;
    my($stmt, @bind) = $sql->select($table, undef, {$col=> $pk} );
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);
    $self->render( json=> $sth->fetchall_arrayref({}) );
};

helper getTypeHashForTable => sub { my ($self, $table)=@_;
    my $sth = $self->db->column_info('','',$table,'');
    my $info = $sth->fetchall_arrayref({});
    my $ret={};
    foreach (@$info)
    {   $ret->{$_->{COLUMN_NAME}}=$_->{TYPE_NAME};
    }
    return $ret;
};

# update
put '/DB/:table/:pk/:key'=> [key=>qr/\d+/] => sub
{   my $self    = shift;
    my $table   = $self->param('table');
    my $pk      = uri_decode($self->param('pk'));
    my $key     = uri_decode($self->param('key'));
    my $sql     = SQL::Abstract->new;
    my $jsonR   = decode_json( $self->req->body );

    my $types = $self->getTypeHashForTable($table);
    for (keys %$jsonR)    ## support for nullifying dates and integers with empty string or special string NULL
    {
        $jsonR->{$_}= ($jsonR->{$_} =~/(^NULL$)|(^\s*$)/o && $types->{$_} !~/text|varchar/o )? undef : $jsonR->{$_} ;
    }
    
    app->log->debug($self->req->body);
    my($stmt, @bind) = $sql->update($table, $jsonR, {$pk=>$key});
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);
    app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
    $self->render( json=> {err=> $DBI::errstr} );
};

# insert
post '/DB/:table/:pk'=> sub
{   my $self    = shift;
    my $table   = $self->param('table');
    my $pk      = $self->param('pk');
    my $sql = SQL::Abstract->new;
    my $jsonR   = decode_json( $self->req->body||'{"name":"New"}' );
    my($stmt, @bind) = $sql->insert($table, $jsonR);
    my $sth     = $self->db->prepare($stmt);
    $sth->execute(@bind);
    app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
    my $valpk= $self->db->last_insert_id(undef, undef, $table, $pk);
    $self->render( json=>{err=> $DBI::errstr, pk => $valpk} );
};

# delete
del '/DB/:table/:pk/:key'=> [key=>qr/\d+/] => sub
{   my $self    = shift;
    my $table   = $self->param('table');
    my $pk      = $self->param('pk');
    my $key     = $self->param('key');
    my $sql = SQL::Abstract->new;

    my($stmt, @bind) = $sql->delete($table, {$pk=>$key});
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);
    app->log->debug("err: ".$DBI::errstr ) if $DBI::errstr;
    $self->render( json=>{err=> $DBI::errstr} );
};

#<!> experimental
# fuzzy-fetch entities by (foreign) key
get '/DB/:table/:col/like/:pk' => [pk=>qr/.+/] => sub
{   my $self   = shift;
    my $sql    = SQL::Abstract->new;
    my $table  = $self->param('table');
    my $pk     = $self->param('pk');
    my $col    = $self->param('col');
    app->log->debug( $pk );
    app->log->debug( $col );
    $self->db->quote_identifier($table);
    my $sth = $self->db->prepare(qq/select * from /.$table.qq/ where /.$col.qq/~*?/);
    $sth->execute(($pk));
    my @a;
    my $i=0;
    while(my $c=$sth->fetchrow_hashref())
    {   push @a,$c;
        $i++;
    }
    warn $i;
    #    app->log->debug(Dumper \@a);
    $self->render(json  => \@a);
};

###################################################################
# cellfinder specific part

get '/IMG/:idimage'=> [idimage =>qr/\d+/] => sub
{   my $self=            shift;
    my $spc=            $self->param("spc");
    my $width=          $self->param("width");
    my $idimage=        $self->param('idimage');
    my $idanalysis=     $self->param('idanalysis');
    my $preload=        $self->param('preload');
    my $afterload=      $self->param('afterload');
    my $idcomposition=  $self->param('cmp');
    my $csize=          $self->param('csize');
    my $affine=         $self->param('affine');
    my $idstack=        $self->param('idstack');
    my $rnd=            $self->param('rnd');
    my $exif=           $self->param('exif');
    my $cc=             $self->param('cc');

    my $nocache=0;
    $nocache= 1 if $width;  # ignore cache
    $nocache=-1 if $cc;     # delete cache
    
    $spc="" unless $spc;

    my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage, $width, $nocache, $csize, $affine, $idstack);
    my $p= $f->(0);

    if($exif)
    {
        my @exif = split(/[\r\n]/, $p->Get('format', '%[EXIF:*]'));
        $self->render(json=>\@exif, format =>'json' );
        return;
    }
    if($idstack && $idcomposition && !$idanalysis)
    {   my $compo=cellfinder_image::getObjectFromDBHandID($self->db, 'patch_compositions', $idcomposition);
        if($compo->{type} == 5 && !$idanalysis)  #clusterstacks
        {
            $idanalysis=cellfinder_image::insertObjectIntoTable($self->db, 'analyses', 'id', { idstack=> $idstack } );
        }
    }
    
    $p= cellfinder_image::imageForComposition($self->db, $preload,$f,$p) if($preload); # unused?
    if($idanalysis){
        my $tmpf=$f;
        my $ana=cellfinder_image::getObjectFromDBHandID($self->db, 'analyses', $idanalysis);
        if($ana->{ordering}){
            my $sql=qq{select id, ordering, idcomposition_for_editing from analyses where idimage=? and ordering is not null and ordering < ? and idcomposition_for_editing is not null order by 2};
            my $sth = $self->db->prepare( $sql );
            $sth->execute(($idimage, $ana->{ordering}));
            while ( my $base_ana=$sth->fetchrow_hashref())
            {
                $p= cellfinder_image::imageForComposition($self->db, $base_ana->{idcomposition_for_editing}, $tmpf, $p, 1, $base_ana->{id});
                $tmpf= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage, $width, 1, $csize, $affine, $idstack, undef, undef, $p);

            }
        }
    }

    $p= cellfinder_image::imageForComposition($self->db, $idcomposition, $f, $p, 1, $idanalysis, $idstack) if($idcomposition);
    $p= cellfinder_image::imageForComposition($self->db, $afterload, $f, $p, 1, $idanalysis, $idstack) if($afterload);
    warn $afterload;
    
    if($csize && !$idstack)
    {   $p->Extent(geometry=>$csize, gravity=>'NorthWest', background=>'graya(0%, 0)');
    }

    if(ref $p eq 'Image::Magick')
    {   if($spc eq 'geom')    # geom-query
        {   $self->render(text => join ' ', $p->Get('width', 'height') );
        } elsif ($spc eq 'pixels')
        {
            my $geom=$self->param('geom');
            $geom=~s/ /+/ogs;
            warn $geom;
            $p->Channel($self->param('channel')) if $self->param('channel');
            $p->Crop(geometry=>$geom) if $geom;
            my ($width, $height)= $p->Get('width', 'height');
            my @h=$p->GetPixels(map=> ($self->param('map') || 'I' ), width=>$width, height=>$height, normalize=> ( $self->param('normalize') || '0' ) );
            $self->render(json => \@h );
        }
        elsif(length $spc)
        {   $self->render(text=> $p->Get($spc) );
        }
        else
        {   my $outformat=$self->param('outformat') || 'jpg';
            my $blob= ($p->ImageToBlob(magick=>$outformat))[0];
            if($blob)
            {   $self->render(data => $blob, format =>$outformat);
            } else
            {
                app->log->debug("error: image is empty");
                $self->render(data => 'error', format =>'text' );
            }
        }
    } elsif($p)
    {   if(ref $p eq 'ARRAY')
        {   my $insertagg= $self->param('insertagg');
            if($insertagg)
            {   cellfinder_image::insertAggregation($self->db, $idanalysis, $p);
            } else{
                $self->render(json=>$p, format =>'json' );
            }
        } else
        {   $self->render(text => $p);
        }
    }
};

get '/LASTIMGNAMEID/:imagename/:idtrial'=> [ imagename => qr/[a-z\d_]+/, idtrial => qr/\d+/ ] => sub
{   my $self=       shift;
    my $imagename=  $self->param("imagename");
    my $idtrial=    $self->param("idtrial");
    my $dbh=        $self->db;
    my $sql=qq{SELECT idimage, image_name, last_image.folder_name from (select max(name) as image_name,  linkname, folder_name from folder_content group by folder_name, linkname) last_image
        join folders on folders.linkname=last_image.linkname
        join folder_content on folder_content.name=last_image.image_name
        where idtrial=? and last_image.folder_name=?;
    };
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial, $imagename));
    my $curr=$sth->fetchrow_arrayref();
    $self->render(text => $curr->[0]);
};

get '/IMG/make_tags'=> sub
{   my $self=shift;
    my $sql='INSERT INTO tags (idimage, idtag)  (select images.id as idimage, tag_repository.id as idtag from images join tag_repository on images.idtrial=tag_repository.idtrial left join tags on idimage=images.id and tags.idtag=tag_repository.id where tags.id is null)';
    my $sth = $self->db->prepare($sql);
    $sth->execute();
    $self->render(text=>'OK');
};
post '/IMG/reaggregate_all/:idtrial'=> [idtrial =>qr/\d+/] => sub
{   my $self=shift;
    my $idtrial= $self->param("idtrial");
    my $dbh=$self->db;
    my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);

    $dbh->{AutoCommit}=0;
    my $sql=qq{delete from aggregations using analyses, images where  analyses.idimage=images.id and aggregations.idanalysis=analyses.id and idtrial=?};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial));

    $sql=qq{select distinct analyses.id, idimage from analyses left join aggregations on  aggregations.idanalysis=analyses.id join images on analyses.idimage=images.id  join number_points on number_points.idanalysis=analyses.id where  aggregations.idanalysis is null and idtrial=? order by 2};
    $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial));
    while(my $curr=$sth->fetchrow_arrayref())
    {   my ($idanalysis,$idimage)=($curr->[0],$curr->[1]);
        my $f= cellfinder_image::readImageFunctionForIDAndWidth($dbh, $idimage);
        my $p= $f->(0);
        eval {
            $p= cellfinder_image::imageForComposition($self->db, $trial->{composition_for_aggregation},$f,$p, 1, $idanalysis);
        }
    }
    $dbh->{AutoCommit}=1;
    $self->render(text => 'OK');
};


post '/IMG/reaggregate_folder/:idtrial/:folder_name'=> [idtrial=>qr/[0-9]+/, folder_name =>qr/.+/] => sub
{   my $self=shift;
    my $idtrial=    $self->param("idtrial");
    my $folder_name = $self->param("folder_name");
    my $linkname= $idtrial.$folder_name;
    my $dbh=$self->db;
    my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);

    $dbh->{AutoCommit}=0;
    my $sql=qq{ select distinct analyses.id, analyses.idimage from analyses left join aggregations on  aggregations.idanalysis=analyses.id join images on analyses.idimage=images.id join number_points on number_points.idanalysis=analyses.id
                join folder_content on folder_content.idimage=analyses.idimage 
                where aggregations.idanalysis is null and idtrial=? and linkname=?};

    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial, $linkname));

    my $dsth = $dbh->prepare( qq{delete from aggregations where aggregations.idanalysis=?} );

    while(my $curr=$sth->fetchrow_arrayref())
    {   my ($idanalysis,$idimage)=($curr->[0], $curr->[1]);
        my $f= cellfinder_image::readImageFunctionForIDAndWidth($dbh, $idimage);
        my $p= $f->(0);
        eval {
           $dsth->execute(($idanalysis));
           $p= cellfinder_image::imageForComposition($self->db, $trial->{composition_for_aggregation},$f,$p, 1, $idanalysis);
        }
    }
    $dbh->{AutoCommit}=1;
    $self->render(text => 'OK');
};

get '/IMG/input_results/:idto/:results'=> [idto =>qr/\d+/,results =>qr/.+/] => sub
{   my $self=shift;
    my $results        = $self->param("results");
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
    {   my $tag;
        $tag=$1 if $y=~s/\(([0-9]+)\)//ogs;
        ($x,$y)=(floor ($x), floor ($y));
        $sth->execute(($idanalysis, $x, $y, $tag));
    }
    $dbh->commit;
    $dbh->{AutoCommit}=1;

    $self->render(text=> 'OK');
};
get '/IMG/delete_all_results/:idto'=> [idto =>qr/\d+/] => sub
{   my $self=shift;
    my $idanalysis  = $self->param("idto");
    my $dbh=$self->db;
    
    my $sql = 'delete from results where idanalysis = ?';
    my $sth = $dbh->prepare($sql);
    $sth->execute(($idanalysis));
    
    $self->render(text=> 'OK');
};

get '/IMG/copy_results/:idfrom/:idto'=> [idfrom =>qr/\d+/,idto =>qr/\d+/] => sub
{   my $self=shift;
    my $idfrom= $self->param("idfrom");
    my $idto  = $self->param("idto");
    my $dbh=$self->db;
    my $sql=qq{insert into results (row,col,tag,idanalysis) (select row,col,tag, ? as idanalysis from results where idanalysis=? order by id)};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idto,$idfrom));
    $self->render(text =>'OK');
};

get '/IMG/delete_images_in_folder/:idtrial/:folder_name'=> [idtrial =>qr/\d+/, folder_name =>qr/.+/] => sub
{   my $self=shift;
    my $idtrial = $self->param("idtrial");
    my $folder_name = $self->param("folder_name");
    my $linkname= $idtrial.$folder_name;
    my $dbh=$self->db;
    my $sql=qq{select idimage from  folder_content where linkname=?};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($linkname));
    while(my $curr=$sth->fetchrow_arrayref())
    {   my $idimage=$curr->[0];
        cellfinder_image::deleteImage($dbh, $idimage);
    }

    $self->render(text =>'OK');
};
post '/IMG/batch_delete_images'=> sub
{   my $self  = shift;
    my $dbh   = $self->db;
    my @ids   = split /,/, $self->req->body;
    foreach my $idimage (@ids)    # delete every single image
    {
        cellfinder_image::deleteImage($dbh, $idimage);
    }
    $self->render(text =>'OK');
};

get '/ANA/results/:idanalysis'=> [idanalysis =>qr/\d+/] => sub
{   my $self=shift;
    my $idanalysis= $self->param("idanalysis");
    my $dbh=$self->db;
    my $sql=qq{select id, row,col,coalesce(tag,0) as tag,idanalysis from results where idanalysis=? order by 1};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idanalysis));
    my $result=    join("\t", qw/id row col tag idanalysis/)."\n";
    while(my $curr=$sth->fetchrow_arrayref())
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    $self->render(text=> $result);
};
get '/ANA/stackresults/:idstack'=> [idstack =>qr/\d+/] => sub
{   my $self=shift;
    my $idstack= $self->param("idstack");
    my $dbh=$self->db;
    my $sql=qq{select results.id, row,col,coalesce(tag,0) as tag,montage_images.idanalysis from montages join montage_images on montages.id=idmontage join analyses on analyses.id=montage_images.idanalysis join results on results.idanalysis=montage_images.idanalysis where montages.id=? order by 1};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idstack));
    my $result=    join("\t", qw/id row col tag idanalysis/)."\n";
    while(my $curr=$sth->fetchrow_arrayref())
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    $self->render(text=> $result);
};
get '/ANA/clusterstackresults/:idstack'=> [idstack =>qr/\d+/] => sub
{   my $self=shift;
    my $idstack= $self->param("idstack");
    my $dbh=$self->db;
    my $sql=qq{select results.id, row,col,coalesce(tag,0) as tag, montage_images.idimage, images.name, parameter from montages join montage_images on montages.id=idmontage join analyses on analyses.idstack=montages.id join results on results.idanalysis=analyses.id join images on images.id=montage_images.idimage where montages.id=? order by 1};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idstack));
    my $result=    join("\t", qw/id row col tag idimage name parameter/)."\n";
    while(my $curr=$sth->fetchrow_arrayref())
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    $self->render(text=> $result);
};
get '/ANA/aggregations/:idtrial'=> [idtrial =>qr/\d+/] => sub
{   my $self=shift;
    my $idtrial= $self->param("idtrial");
    my $dbh=$self->db;
    my $sql=qq{SELECT distinct aggregations.name FROM aggregations join analyses on idanalysis =analyses.id join images on idimage=images.id where idtrial=? order by 1};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial));
    my $a=$sth->fetchall_arrayref();
    my @colnames=map {'"'.$_->[0].'"' } @$a;
    my $colnames= join " text,",@colnames;
    $sql="SELECT * FROM crosstab( 'select idanalysis, images.id as idimage, images.name as image_name, uploadtime, aggregations.name as cat, value from aggregations join analyses on idanalysis=analyses.id join images on idimage=images.id where idtrial=$idtrial  order by 1,2', 'SELECT distinct aggregations.name FROM aggregations join analyses on idanalysis =analyses.id join images on idimage=images.id where idtrial=$idtrial order by 1') AS ct(idanalysis integer, idimage integer, image_name text, uploadtime date, $colnames text)";
    $sth = $dbh->prepare( $sql );
    $sth->execute();
    my $result=    "idanalysis\tidimage\timage_name\tuploadtime\t".join("\t", @colnames)."\n";
    while(my $curr=$sth->fetchrow_arrayref())
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    $self->render(text=>$result);
};
get '/ANA/clusteraggregations/:idtrial'=> [idtrial =>qr/\d+/] => sub
{   my $self=shift;
    my $idtrial= $self->param("idtrial");
    my $dbh=$self->db;
    my $sql=qq{SELECT distinct aggregations.name from montages join analyses on analyses.idstack=montages.id join aggregations on aggregations.idanalysis=analyses.id where idtrial=? order by 1};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial));
    my $a=$sth->fetchall_arrayref();
    my @colnames=map {'"'.$_->[0].'"' } @$a;
    my $colnames= join " text,",@colnames;
    $sql="SELECT * FROM crosstab( 'select idanalysis, montages.name as stack_name, aggregations.name as cat, value from aggregations join analyses on aggregations.idanalysis=analyses.id join montages on idstack=montages.id where idtrial=$idtrial  order by 1,2', 'SELECT distinct aggregations.name FROM aggregations join analyses on aggregations.idanalysis=analyses.id join montages on idstack=montages.id where idtrial=$idtrial order by 1') AS ct(idanalysis integer,  stack_name text, $colnames text)";
    $sth = $dbh->prepare( $sql );
    $sth->execute();
    my $result=    "idanalysis\tstack_name\t".join("\t", @colnames)."\n";
    while(my $curr=$sth->fetchrow_arrayref())
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    $self->render(text=>$result);
};

get '/ANA/tags_image/:idimage'=> [idimage =>qr/\d+/] => sub
{   my $self=shift;
    my $idimage= $self->param("idimage");
    my $dbh=$self->db;
    my $sql="SELECT * FROM tags where idimage=?";
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idimage));
    my $res = $sth->fetchall_arrayref();
    my $colnames = $sth->{NAME};
    my $result=    join("\t", @$colnames)."\n";
    for my $curr (@$res)
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    warn $result;
    $self->render(text=> $result);
};

get '/ANA/:table/:idtrial'=> [table=>qr/[^"]+/, idtrial =>qr/\d+/] => sub
{   my $self=shift;
    my $idtrial= $self->param("idtrial");
    my $table= $self->param("table");
    my $dbh=$self->db;
    my $sql="SELECT * FROM \"$table\" where idtrial=?";
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($idtrial));
    my $res = $sth->fetchall_arrayref();
    my $colnames = $sth->{NAME};
    my $result=    join("\t", @$colnames)."\n";
    for my $curr (@$res)
    {   $result.=join("\t", (@$curr));
        $result.="\n";
    }
    $self->render(text=> $result);

};


get '/IMG/STACK/:idstack'=> [idstack =>qr/\d+/] => sub
{   my $self=shift;
    my $spc=            $self->param("spc");
    my $idstack=        $self->param("idstack");
    my $ransac=            $self->param("ransac");
    my $idcomposition=    $self->param('cmp');

    if($spc eq 'affine')
    {   my $sql = SQL::Abstract->new;
        my($stmt, @bind) = $sql->select('montage_images',undef, {idmontage => $idstack} );
        my $sth = $self->db->prepare($stmt);
        $sth->execute(@bind);

        while ( my $curr = $sth->fetchrow_hashref() )
        {
            next unless $curr->{idanalysis_reference};
            next if $curr->{id} == $curr->{idanalysis_reference};
            my $par;
            if($ransac)
            {   my $params=$self->getRANSACParams($ransac);
                $par= cellfinder_image::runRANSACRegistrationRCode($curr->{idanalysis_reference}, $curr->{idanalysis}, $params->{thresh}, $params->{identityradius}, $params->{iterations}, $params->{aiterations}, $params->{cfunc});
                eval{
                    $par= cellfinder_image::reverseAffineMatrix(cellfinder_image::runRANSACRegistrationRCode($curr->{idanalysis}, $curr->{idanalysis_reference}, $params->{thresh}, $params->{identityradius}, $params->{iterations}, $params->{aiterations}, $params->{cfunc})) unless $par; # try reversed RANSAC
                }
            } else
            {   $par=cellfinder_image::runSimpleRegistrationRCode($curr->{idanalysis_reference}, $curr->{idanalysis});
            }
            my $sql=SQL::Abstract->new();
            my($stmt, @bind) = $sql->update('montage_images', {parameter=> $par}, {id=> $curr->{id} } );
            my $sth =  $self->db->prepare($stmt);
            $sth->execute(@bind);
        }
        $self->render(text => $idstack);
    } elsif($spc eq 'gif')
    {   my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, 0, undef, undef, undef, undef, $idstack, $idcomposition);
        my $p= $f->(0);
        $_->Set(delay=>15) for @$p;        # <!> fixme: make configurable
        my $tempfilename=cellfinder_image::tempFileName('/tmp/cellf');
        $p->Write($tempfilename.'.gif');
        $self->render(data=>cellfinder_image::readFile($tempfilename.'.gif'), format=>'gif');
    }  elsif($spc eq 'zip')
    {   my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, 0, undef, undef, undef, undef, $idstack, $idcomposition);
        my $p= $f->(0);
        my $zip = Archive::Zip->new();
        my $i=1;
        my $tempfilename=cellfinder_image::tempFileName('/tmp/cellf');
        for(@$p)
        {   my $fname=$tempfilename.sprintf('%04d', $i++).'.jpg';
            $_->Write($fname);
            $zip->addFile($fname);
        }
        $zip->writeToFileNamed($tempfilename.'.zip');
        $self->render(data=>cellfinder_image::readFile($tempfilename.'.zip'), format=>'zip');
        system('rm '.$tempfilename.'*');
    }  elsif($spc eq 'mp4')
    {   my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, 0, undef, undef, undef, undef, $idstack, $idcomposition, $self->param('composite'));
        my $p = $f->(0);
        my $i=1;
        my $tempfilename=cellfinder_image::tempFileName('/tmp/cellf');
        for(@$p)
        {   my $fname=$tempfilename.sprintf('%04d', $i++).'.jpg';
            $_->Write($fname);
        }
        system('/usr/local/bin/ffmpeg -i '.$tempfilename.'%04d.jpg -pix_fmt yuv420p '.$tempfilename.'.mp4');
        $self->render(data=>cellfinder_image::readFile($tempfilename.'.mp4'), format=>'mp4');
        system('rm '.$tempfilename.'*');
    }
};

get '/IMG/STACK/DELALL/:idtrial'=> [idtrial =>qr/\d+/] => sub
{   my $self=shift;
    my $idtrial=        $self->param("idtrial");
    my $sql=qq{delete from montages where idtrial=?};
    my $sth = $self->db->prepare( $sql );
    $sth->execute(($idtrial));
    $self->render(data=>'OK', format =>'txt' );
};

get '/IMG/import/:idtrial/:name/:uri'=> [name=>qr/.+/, uri=>qr/.+/] => sub
{   my $self=shift;
    my $idtrial=    $self->param("idtrial");
    my $name=        $self->param("name");
    my $uri=        $self->param("uri");
    my $ua = Mojo::UserAgent->new;
    my $data=        $ua->get($uri)->res->body;
    my $suffix='.jpg';    # sensible default
    $suffix=$1 if $uri =~/^.+\.(.+)$/o;
    my $idimage= cellfinder_image::uploadImageFromData($self->db, $idtrial, $name, $suffix, $data);
    $self->render(text=>$idimage);
};

post '/IMG/import_stack/:idtrial/:name'=> [name=>qr/.+/] => sub
{   use TempFileNames;
    my $self=shift;
    my $name= $self->param("name");
    my $idtrial= $self->param("idtrial");

    my $jsonR   = decode_json( $self->req->body );
    my $suffix='.jpg';    # sensible default
    my @image_ids;
    my $i=0;
    foreach my $dc_name (@$jsonR)    # import every image
    {   my $ua = Mojo::UserAgent->new;
        my $data=$ua->get('http://augimageserver'.$dc_name)->res->body;
        $suffix=$1 if $dc_name =~/^.+\.(.+)$/o;
        my $idimage= cellfinder_image::uploadImageFromData($self->db, $idtrial, $name. ($i? "_$i":''), $suffix, $data);
        push @image_ids, $idimage;
        $i++;
    }
    my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
    my $idref;
    foreach my $id (@image_ids)
    {   my $idanalysis=cellfinder_image::insertObjectIntoTable($self->db, 'analyses', 'id', { idimage=> $id } );
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
{   my $self=shift;
    my $name= $self->param("name");
    my $idtrial= $self->param("idtrial");
    # warn $self->req->body;
    my $jsonR   = decode_json( $self->req->body );
    my @image_ids=@$jsonR;
    my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
    my $idref;
    my $trial = cellfinder_image::getObjectFromDBHandID($self->db, 'trials', $idtrial);
    $self->db->{AutoCommit}=0;
    foreach my $id (@image_ids)
    {   my $idanalysis=$self->getLastAnaOfImageID( $id );
        cellfinder_image::insertObjectIntoTable($self->db, 'montage_images', 'id', {idcomposition_for_editing => $trial->{composition_for_editing}, idimage=> $id, idanalysis=> $idanalysis, idanalysis_reference=>$idref, idmontage=> $idmontage} );
        $idref=$idanalysis unless $idref;
    }
    $self->db->{AutoCommit}=1;
    $self->render(data=>$idmontage, format =>'txt' );
};
helper makeidentiystackFolder => sub { my ($self, $dbh, $idtrial, $folder_name)=@_;
    my $sql=qq{select folder_content.idimage, min(analyses.id) as idanalysis from folder_content join analyses on analyses.idimage = folder_content.idimage where linkname = ? group by folder_content.idimage, name order by name};
    my $sth = $dbh->prepare( $sql );
    my $linkname= $idtrial.$folder_name;
    $sth->execute(($linkname));

    my $first = $sth->fetchrow_arrayref();
    my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);
    my $idmontage=cellfinder_image::insertObjectIntoTable($dbh, 'montages', 'id', {idtrial=> $idtrial, name=> $folder_name} );
    my $idreference=$first->[1];
    cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idcomposition_for_editing => $trial->{composition_for_editing}, idimage=> $first->[0], idanalysis=> $idreference, idmontage=> $idmontage} );
    $dbh->{AutoCommit}=0;
    while(my $curr=$sth->fetchrow_arrayref())
    {
        cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idcomposition_for_editing => $trial->{composition_for_editing}, idimage=> $curr->[0], idanalysis=> $curr->[1], idanalysis_reference=>$idreference, idmontage=> $idmontage, parameter=> '1,0,0,1,0,0'} );
    }
    $dbh->{AutoCommit}=1;
    return $idmontage;
};
post '/IMG/makeidentiystack_folder/:idtrial/:folder_name'=> [idtrial=>qr/[0-9]+/, folder_name =>qr/.+/] => sub
{   my $self=shift;
    my $idtrial=    $self->param("idtrial");
    my $folder_name = $self->param("folder_name");
    my $dbh=$self->db;

    my $idmontage=$self->makeidentiystackFolder($dbh, $idtrial, $folder_name);
    $self->render(data=>$idmontage, format =>'txt' );
};

post '/IMG/analyze/:idtrial/:name'=> [idtrial=>qr/[0-9]+/, name=>qr/.+/] => sub
{   my $self=          shift;
    my $idtrial=      $self->param("idtrial");
    my $name=         $self->param("name");
    my $uri=          $self->req->body;
    my $ua =          Mojo::UserAgent->new;
    my $data=         $ua->get($uri)->res->body;
    my $suffix='.jpg';    # sensible default
    $suffix=$1 if $uri =~/^.+\.(.+)$/o;

    my $trial = cellfinder_image::getObjectFromDBHandID($self->db, 'trials', $idtrial);
    my $idimage = cellfinder_image::uploadImageFromData($self->db, $idtrial, $name, $suffix, $data);
    my $d = { idimage=>$idimage, idcomposition_for_editing => $trial->{composition_for_editing}, idcomposition_for_analysis=> $trial->{composition_for_celldetection} };
    my $idanalysis=cellfinder_image::insertObjectIntoTable($self->db, 'analyses', 'id', $d );
    my $f= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage);
    cellfinder_image::imageForComposition($self->db, $d->{idcomposition_for_analysis}, $f, $f->(0), 0, $idanalysis);

    my $sql='INSERT INTO tags (idimage, idtag)  (select ? as idimage, tag_repository.id as idtag from  tag_repository  where tag_repository.idtrial=?)';
    my $sth = $self->db->prepare($sql);
    $sth->execute(($idimage, $idtrial));

    $self->render(data=>'OK', format =>'txt' );
};

get '/IMG/analyze_folder/:idtrial/:folder_name'=> [idtrial=>qr/[0-9]+/, folder_name =>qr/.+/] => sub
{   my $self=shift;
    my $idtrial=    $self->param("idtrial");
    my $folder_name = $self->param("folder_name");
    my $linkname= $idtrial.$folder_name;
    my $dbh=$self->db;

    my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);

    my $sql=qq{select idimage, name from  folder_content where linkname=? order by 2};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($linkname));
warn $linkname;
    my $sqldel = SQL::Abstract->new;
    while(my $curr=$sth->fetchrow_arrayref())
    {   my $idimage=$curr->[0];
warn Dumper $curr;
        my $d={idimage=>$idimage, idcomposition_for_editing => $trial->{composition_for_editing}, idcomposition_for_analysis=> $trial->{composition_for_celldetection} };
        my($stmt, @bind) = $sqldel->delete('analyses', {idimage=>$idimage} );
        my $sthdel = $dbh->prepare($stmt);
        $sthdel->execute(@bind);
        my $idanalysis=cellfinder_image::insertObjectIntoTable($dbh, 'analyses', 'id', $d );
        my $f= cellfinder_image::readImageFunctionForIDAndWidth($dbh, $idimage);
        cellfinder_image::imageForComposition($dbh, $d->{idcomposition_for_analysis}, $f, $f->(0), 0, $idanalysis);
    }
    $self->render(data=>'OK', format =>'txt' );
};



get '/IMG/automatch_folder/:idtrial/:idransac/:folder_name'=> [idtrial=>qr/[0-9]+/, idransac=>qr/[0-9]+/, folder_name =>qr/.+/] => sub
{   my $self=shift;
    my $idtrial=         $self->param("idtrial");
    my $idransac=        $self->param("idransac");
    my $folder_name =    $self->param("folder_name");

    my $params=$self-> getRANSACParams($idransac);

    my $linkname= $idtrial.$folder_name;
    my $dbh=$self->db;

    my $sql=qq{select idimage, name from  folder_content where linkname=? order by 2};
    my $sth = $dbh->prepare( $sql );
    $sth->execute(($linkname));
    my ($idimage1, $idimage2, $next_idimage);
    while( my $curr=$sth->fetchrow_arrayref() )
    {   $next_idimage=$curr->[0];
        $idimage1=$next_idimage unless $idimage1;
        my ($idana1, $idana2)=($self->getLastAnaOfImageID($idimage1), $self->getLastAnaOfImageID($next_idimage));
        if(!$idana1)
        {   $idimage1=undef;
            next;
        }
        next unless $idana2;
        $idimage2=$next_idimage;
        if($idana1 && $idana2 &&  $idana1 != $idana2)
        {   my $par= cellfinder_image::runRANSACRegistrationRCode($idana1, $idana2,$params->{thresh}, $params->{identityradius}, $params->{iterations}, $params->{aiterations}, $params->{cfunc});
            eval{
               $par= cellfinder_image::reverseAffineMatrix(cellfinder_image::runRANSACRegistrationRCode($idana2, $idana1,$params->{thresh}, $params->{identityradius}, $params->{iterations}, $params->{aiterations}, $params->{cfunc})) unless $par; # try reversed RANSAC
            };
            my $name=$par? "$idana1 $idana2":"X$idana1 $idana2";
            my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=>$name} );
            cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idimage=> $idimage1, idanalysis=> $idana1, idanalysis_reference=>undef,   idmontage=> $idmontage} );
            cellfinder_image::insertObjectIntoTable($dbh, 'montage_images', 'id', {idimage=> $idimage2, idanalysis=> $idana2, idanalysis_reference=>$idana1, idmontage=> $idmontage, parameter=> $par} );
        }
        ($idimage1, $idimage2)=($idimage2, $next_idimage);
    }
    $self->render(data=>'OK', format =>'txt' );
};

helper deleteOrphanedMIsInTrial => sub { my ($self, $idtrial)=@_;
    my $sql=qq{delete from montages where id in ( select id from (select  montages.id, coalesce(count,0) as count from montages left join  (select count(*), idmontage from montage_images group by idmontage)   a on a.idmontage=montages.id where idtrial=?) a where count<2)};
    my $sth = $self->db->prepare( $sql );
    $sth->execute(($idtrial));
};

get '/IMG/collect/:samebase/:idmontage'=> [samebase => qr/[0-9]+/, idmontage => qr/[0-9]+/] => sub
{   my $self=shift;

    my $idbase = $self->param('samebase');
    my $idmontage = $self->param('idmontage');

    my $sql=qq{update montage_images set idmontage = ? where idanalysis_reference = ?};
    my $sth = $self->db->prepare( $sql );
    $sth->execute( ($idmontage, $idbase) );
    $self->render(data=>'0', format =>'txt' );
};

get '/IMG/autostitch/:idmontage'=> [idmontage =>qr/[0-9]+/] => sub
{   my $self=shift;
    my $idmontage= $self->param('idmontage');
    my $move=1;

    sub iterateAnalysesOfMontageIDAndMatrix { my ($dbh, $move, $idmontage_orig, $current_matrix, $idanalysis_ref, $idanalysis, $idmontage, $idimage, $seenR)=@_;
        $seenR=[] unless $seenR;
        return if $idmontage ~~ @$seenR;
        push @$seenR, $idmontage;
        my $query= qq/select idanalysis, idanalysis_reference, parameter, idmontage, idimage, id from montage_images where (idanalysis_reference=?) and idmontage not in (?,?)/;
        my $sth = $dbh->prepare($query);
        $idmontage = $idmontage_orig  unless $idmontage;

        $sth->execute(($idanalysis, $idmontage, $idmontage_orig));
        my $anchors= $sth->fetchall_arrayref();

        foreach my $curr_anchor (@$anchors)
        {   if( $curr_anchor->[2] )
            {   if ($current_matrix) {
                    $current_matrix = cellfinder_image::multiplyAffineMatrixes($current_matrix, $curr_anchor->[2]);
                } else {
                    $current_matrix = $curr_anchor->[2];
                }
                cellfinder_image::uniquelyInsertObjectIntoTable($dbh, 'montage_images', 'id', {idimage=> $curr_anchor->[4], idanalysis=> $curr_anchor->[0], idanalysis_reference => $idanalysis_ref, idmontage=> $idmontage_orig, parameter=> $current_matrix} );
                cellfinder_image::deleteObjectFromTable($dbh, 'montage_images', {id=> $curr_anchor->[5]}) if($move);
                iterateAnalysesOfMontageIDAndMatrix($dbh, $move, $idmontage_orig, $current_matrix, $idanalysis_ref, $curr_anchor->[0], $curr_anchor->[3], $curr_anchor->[4], $seenR );
            }
        }
    }

    my $query=qq/select idanalysis, idanalysis_reference, parameter, idmontage, idimage, idtrial from montage_images join montages on idmontage=montages.id where idmontage = ? and idanalysis_reference is not null/;
    my $sth = $self->db->prepare($query);
    $sth->execute(($idmontage));
    my $anchor= $sth->fetchrow_hashref();

    iterateAnalysesOfMontageIDAndMatrix($self->db, $move, $idmontage, $anchor->{parameter},  $anchor->{idanalysis_reference}, $anchor->{idanalysis} );
    if($move)
    {
        $self-> deleteOrphanedMIsInTrial($anchor->{idtrial});
        $self->render(data=>'0', format =>'txt' );
    } else
    {   $self->render(data=>$idmontage, format =>'txt' );
    }
};

helper getRANSACParams => sub { my ($self, $idransac)=@_;
    my $compo=cellfinder_image::getObjectFromDBHandID($self->db, 'patch_compositions', $idransac);
    my $paramstr = '{'.cellfinder_image::getObjectFromDBHandID($self->db, 'patch_chains_with_parameters', $compo->{primary_chain})->{params}.'}';
warn "$idransac : $paramstr";
    return eval($paramstr);    #<!> fixme: use real parser
};

get '/IMG/bridgestitch/:idtrial/:idransac/:idmontage1/:idmontage2'=> [idtrial => qr/[0-9]+/, idransac => qr/[0-9]+/, idmontage1 => qr/[0-9]+/, idmontage2 => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idtrial=    $self->param("idtrial");
    my $idransac=   $self->param("idransac");
    my $idmontage1= $self->param('idmontage1');
    my $idmontage2= $self->param('idmontage2');
    my $all=        $self->param('all');

    my $params=$self->getRANSACParams($idransac);

    my $query=qq/select a.idanalysis as ida_a, b.idanalysis as ida_b, a.idimage as idm_a, b.idimage as idm_b from montage_images a, montage_images b where a.idmontage=? and b.idmontage=?/;
    my $sth = $self->db->prepare($query);
    $sth->execute(($idmontage1, $idmontage2));
    while( my $curr=$sth->fetchrow_arrayref() )
    {   my($idana1, $idana2, $idimage1, $idimage2)=($curr->[0], $curr->[1], $curr->[2], $curr->[3]);
        my $par= cellfinder_image::runRANSACRegistrationRCode($idana2, $idana1,$params->{thresh}, $params->{identityradius}, $params->{iterations}, $params->{aiterations}, $params->{cfunc});
        if($par)
        {   my $name="B$idana1 $idana2";
            my $idmontage=cellfinder_image::insertObjectIntoTable($self->db, 'montages', 'id', {idtrial=> $idtrial, name=> $name} );
            cellfinder_image::insertObjectIntoTable($self->db, 'montage_images', 'id', {idimage=> $idimage1, idanalysis=> $idana1, idanalysis_reference=>$idana2, idmontage=> $idmontage, parameter=> $par} );
            last unless $all;
        }
    }
    $self->render(data=>'0', format =>'txt' );
};

helper rebaseMontageID => sub { my ($self, $idmontageimage)=@_;
    my $montage_image=cellfinder_image::getObjectFromDBHandID($self->db, 'montage_images', $idmontageimage);
    my ($oldbase, $newbase, $orig_matrix, $idstack)=(   $montage_image->{idanalysis_reference}, $montage_image->{idanalysis},
                                                        $montage_image->{parameter}, $montage_image->{idmontage} );

    my $inverted_matrix= $orig_matrix? cellfinder_image::reverseAffineMatrix($orig_matrix):'1,0,0,1,0,0';

    my $sql=SQL::Abstract->new();

    my($stmt, @bind) = $sql->select('montage_images',undef, {idmontage => $idstack} );
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);

    while( my $curr_line = $sth->fetchrow_hashref() )
    {   my $matrix= $curr_line->{parameter};
        if($curr_line->{idanalysis} == $newbase)
        {   $matrix=undef;
        } elsif($curr_line->{idanalysis} == $oldbase)
        {   $matrix=$inverted_matrix;
        } else
        {   $matrix = cellfinder_image::multiplyAffineMatrixes($matrix, $inverted_matrix);
        }
        my($stmt, @bind) = $sql->update('montage_images', {parameter=> $matrix, idanalysis_reference=> $newbase}, {id=>$curr_line->{id} } );
        my $sth =  $self->db->prepare($stmt);
        $sth->execute(@bind);
    }
    return $idstack;
};

#<!>fixme
get '/IMG/setup_cam/:source'=> [source =>qr/[0-9a-z]+/i] =>sub
{   my $self=shift;
    my $source = $self->param('source');
    if($source =~ /hhb/i)
    {   Mojo::UserAgent->new->get('http://10.210.21.44/SetChannel.cgi?Channel=3')->res->body;
        sleep(1);
        Mojo::UserAgent->new->get('http://10.210.21.44/ChangeResolution.cgi?ResType=3')->res->body;
    }
    $self->render(data=>'OK', format =>'txt' );
};

get '/IMG/trigger/:loc/:piz'=> [loc =>qr/[0-9a-z]+/i, piz=>qr/[0-9a]{8,9}/i] => sub
{   my $self=shift;
    my $piz = $self->param('piz');
    my $loc = $self->param('loc');
    my $ua = Mojo::UserAgent->new;
    my $data= $ua->get("http://auginfo/scanuploaddocscal/$loc/$piz")->res->body;
    $self->render(data=>'OK', format =>'txt' );
};


get '/IMG/rebase/:idmontageimage'=> [idmontageimage => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idmontageimage = $self->param('idmontageimage');
    my $idstack=$self->rebaseMontageID($idmontageimage);
    $self->render(data=> $idstack, format =>'txt' );
};

helper getFirstObjectInTableForDict => sub { my ($self, $table, $dict)=@_;
    my $sql=SQL::Abstract->new();
    my($stmt, @bind) = $sql->select($table, undef, $dict );
    my $sth = $self->db->prepare($stmt);
    $sth->execute(@bind);
    return $sth->fetchrow_hashref();
};

get '/IMG/rebase_merge/:idmontage'=> [idmontage => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idmontage = $self->param('idmontage');

    my $query=qq/select * from (select a.idmontage as a, b.idmontage as b, c.idmontage as c, a.idanalysis as aa, a.idanalysis_reference as ab, a.parameter from montage_images a join  montage_images b on a.idanalysis=b.idanalysis join montage_images c on a.idanalysis_reference=c.idanalysis where  a.idmontage=?) a where a!=b and a!=c/;
    my $sth = $self->db->prepare($query);
    $sth->execute(($idmontage));
    my $a= $sth->fetchall_arrayref()->[0];
    my ($idmontage_a, $idmontage_b, $idanalysis_a, $idanalysis_b, $parameter)=($a->[1], $a->[2], $a->[3], $a->[4], $a->[5]);

    my $montagea= $self->getFirstObjectInTableForDict('montage_images', {idmontage => $idmontage_a, idanalysis => $idanalysis_a});
    my $montageb= $self->getFirstObjectInTableForDict('montage_images', {idmontage => $idmontage_b, idanalysis => $idanalysis_b});
    if($montageb && $montagea)
    {   my ($idmontageimagea , $idmontageimageb)=($montagea->{id}, $montageb->{id});

        $self->rebaseMontageID($idmontageimageb);
        my $idmontageimagec= cellfinder_image::insertObjectIntoTable($self->db, 'montage_images', 'id', {idimage=> $montagea->{idimage}, idanalysis=> $idanalysis_a, idanalysis_reference=> $idanalysis_b, idmontage=> $idmontage_b, parameter => $parameter} );
        $self->rebaseMontageID($idmontageimagec);
        $self->rebaseMontageID($idmontageimagea);

        my $query=qq{update montage_images set idmontage = ? where idanalysis_reference = ?};
        my $sth = $self->db->prepare( $query );
        $sth->execute( ($montagea->{idmontage}, $idanalysis_a ) );
        my $montage = cellfinder_image::getObjectFromDBHandID($self->db, 'montages', $idmontage);
        $self-> deleteOrphanedMIsInTrial($montage->{idtrial});
    }

    $self->render(data=>  '0', format =>'txt' );
};

get '/IMG/ransac_debug/:idransac/:idmontage/:idanalysis1/:idanalysis2'=> [idransac => qr/[0-9]+/, idmontage => qr/[0-9]+/, idanalysis1 => qr/[0-9]+/, idanalysis2 => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idransac=    $self->param("idransac");
    my $idmontage   = $self->param('idmontage');
    my $idanalysis1 = $self->param('idanalysis1');
    my $idanalysis2 = $self->param('idanalysis2');

    if(!$idransac)    # make flicker gif of exactly 2 images
    {   my $query=qq/select a.idimage, b.idimage, parameter from montage_images join analyses a on a.id= montage_images.idanalysis join analyses b on b.id= montage_images.idanalysis_reference where idmontage=? and montage_images.idanalysis=? and montage_images.idanalysis_reference=?/;
        my $sth = $self->db->prepare($query);
        $sth->execute(($idmontage,$idanalysis1, $idanalysis2));
        my $a= $sth->fetchall_arrayref();
        my ($idimage1, $idimage2, $affine)=($a->[0][0], $a->[0][1], $a->[0][2]);
        my $p = cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage1)->(0);
        my $p1= cellfinder_image::readImageFunctionForIDAndWidth($self->db, $idimage2)->(0);
        $p= cellfinder_image::_distortImage($p, $affine);
        push @$p,$p1;
        $_->Set(delay=>25) for @$p;        # <!> fixme: make configurable
        my $tempfilename=cellfinder_image::tempFileName('/tmp/cellf');
        $p->Write($tempfilename.'.gif');
        $self->render(data=>cellfinder_image::readFile($tempfilename.'.gif'), format=>'gif');
    } else        # run ransac for exactly 2 images
    {   my $params=$self->getRANSACParams($idransac);
        my $par= cellfinder_image::runRANSACRegistrationRCode($idanalysis2, $idanalysis1, $params->{thresh}, $params->{identityradius}, $params->{iterations}, $params->{aiterations}, $params->{cfunc});
        if($par)
        {   my $sql = SQL::Abstract->new;
            my($stmt, @bind) = $sql->update('montage_images', { parameter=> $par }, {idanalysis=> $idanalysis1, idanalysis_reference=> $idanalysis2, idmontage=> $idmontage });
            my $sth = $self->db->prepare($stmt);
            $sth->execute(@bind);
        }
        $self->render(data=> $idmontage, format =>'txt' );
    }
};


post '/IMG/rebuildFromRepository/:idtrial'=> [idtrial => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idtrial = $self->param('idtrial');
    my $idstack=cellfinder_image::rebuildFromRepository($self->db, $idtrial, 0);
    $self->render(data=> 'OK', format =>'txt' );
};
post '/IMG/deleteAllImages/:idtrial'=> [idtrial => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idtrial = $self->param('idtrial');
    my $fully = $self->param('fully');
    my $idstack=cellfinder_image::deleteAllImages($self->db, $idtrial, $fully);
    $self->render(data=> 'OK', format =>'txt' );
};
post '/IMG/addStandardAnalysisToAll/:idtrial'=> [idtrial => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idtrial = $self->param('idtrial');
    cellfinder_image::addStandardAnalysisToAll($self->db, $idtrial);
    $self->render(data=> 'OK', format =>'txt' );
};
post '/IMG/deleteAllAnalyses/:idtrial'=> [idtrial => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idtrial = $self->param('idtrial');
    my $sql=qq{delete  from analyses using images where images.id=analyses.idimage and idtrial=?};
    my $sth =  $self->db->prepare( $sql );
    $sth->execute(($idtrial));
    $self->render(data=> 'OK', format =>'txt' );
};
post '/IMG/cluster_all_folders/:idtrial'=> [idtrial => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idtrial = $self->param('idtrial');
    my $dbh=$self->db;
    my $trial = cellfinder_image::getObjectFromDBHandID($dbh, 'trials', $idtrial);
    my $idcomposition=$trial->{composition_for_clustering};
    my $f= cellfinder_image::readImageFunctionForIDAndWidth($dbh, 0);

    my $sth = $dbh->prepare( qq/select distinct folder_name from images join folder_content on folder_content.idimage=images.id where idtrial=? order by 1/);
    $sth->execute(($idtrial));
    my $a= $sth->fetchall_arrayref();
    for my $currImage (@$a)
    {
        my $idmontage=$self->makeidentiystackFolder($dbh, $idtrial, $currImage->[0]);
        my $idanalysis=cellfinder_image::insertObjectIntoTable($dbh, 'analyses', 'id', { idstack=> $idmontage } );
        cellfinder_image::imageForComposition($dbh, $idcomposition, $f, $f->(0), 1, $idanalysis, $idmontage);
        cellfinder_image::imageForComposition($dbh, $trial->{composition_for_aggregation}, $f, undef, undef, $idanalysis) if $trial->{composition_for_aggregation};
    }
    $self->render(data=> 'OK', format =>'txt' );
};

post '/IMG/duplicate_compo/:idcompo'=> [idcompo => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idcompo = $self->param('idcompo');

    my $oldCompo = cellfinder_image::getObjectFromDBHandID($self->db, 'patch_compositions', $idcompo);
    delete $oldCompo->{id};
    $oldCompo->{name}.='_kopie';

    my $newCompoPK=cellfinder_image::insertObjectIntoTable($self->db, 'patch_compositions', 'id', $oldCompo);
    my $chains= cellfinder_image::dictsForWhereClauseDict($self->db, 'patch_chains', {idpatch_composition =>$idcompo} );
    foreach my $currChain (@$chains)
    {
        $currChain->{idpatch_composition}=$newCompoPK;
        my $oldChainPK=$currChain->{id};
        delete $currChain->{id};
        my $newChainPK =cellfinder_image::insertObjectIntoTable($self->db, 'patch_chains', 'id', $currChain );
        my $allPatches =cellfinder_image::dictsForWhereClauseDict($self->db, 'patches', {idpatch_chain =>$oldChainPK});
        foreach my $currPatch (@{$allPatches})
        {   $currPatch->{idpatch_chain}=$newChainPK;
            my $oldPatchPK=$currPatch->{id};
            delete $currPatch->{id};
            my $newPatchPK = cellfinder_image::insertObjectIntoTable($self->db, 'patches', 'id', $currPatch);
            my $allParams= cellfinder_image::dictsForWhereClauseDict($self->db, 'patch_input_values', {idpatch =>$oldPatchPK});
            foreach my $currParam (@{$allParams})
            {   $currParam->{idpatch}=$newPatchPK;
                delete $currParam->{id};
                cellfinder_image::insertObjectIntoTable($self->db, 'patch_input_values', 'id', $currParam);
            }
        }
   }
   $self->render(data=> $newCompoPK, format =>'txt' );
};


post '/IMG/duplicate_chain/:idchain'=> [idchain => qr/[0-9]+/] => sub
{   my $self=shift;
    my $idchain = $self->param('idchain');

    my $currChain = cellfinder_image::getObjectFromDBHandID($self->db, 'patch_chains', $idchain);
    delete $currChain->{id};


    my $newChainPK =cellfinder_image::insertObjectIntoTable($self->db, 'patch_chains', 'id', $currChain );
    my $allPatches =cellfinder_image::dictsForWhereClauseDict($self->db, 'patches', {idpatch_chain =>$idchain});
    foreach my $currPatch (@{$allPatches})
    {   $currPatch->{idpatch_chain}=$newChainPK;
        my $oldPatchPK=$currPatch->{id};
        delete $currPatch->{id};
        my $newPatchPK = cellfinder_image::insertObjectIntoTable($self->db, 'patches', 'id', $currPatch);
        my $allParams= cellfinder_image::dictsForWhereClauseDict($self->db, 'patch_input_values', {idpatch =>$oldPatchPK});
        foreach my $currParam (@{$allParams})
        {   $currParam->{idpatch}=$newPatchPK;
            delete $currParam->{id};
            cellfinder_image::insertObjectIntoTable($self->db, 'patch_input_values', 'id', $currParam);
        }
    }
    $self->render(data=> $newChainPK, format =>'txt' );
};
post '/IMG/rename_probe_regex'=> sub
{
    my $self   = shift;
    my $jsonR  = decode_json( $self->req->body );
    my $find   = $jsonR->[0];
    my $replace= '"'.$jsonR->[1].'"';
    my $probe   = $jsonR->[2];
    $probe =~ s/$find/$replace/eee;
    $self->render(data=>$probe, format =>'txt' );
};

post '/IMG/rename_images_regex/:idtrial'=> [idtrial=>qr/[0-9]+/] => sub
{
    my $self=shift;
    my $idtrial= $self->param("idtrial");
    my $jsonR  = decode_json( $self->req->body );
    my $find   = $jsonR->[0];
    my $replace= '"'.$jsonR->[1].'"';
    my $sql=qq{select id, name from images where idtrial=?};
    my $sth = $self->db->prepare( $sql );
    $sth->execute(($idtrial));

    while(my $curr=$sth->fetchrow_arrayref())
    {
        my $name=$curr->[1];
        my $oldname = $name;
        $name =~ s/$find/$replace/eee;

        if ($name && $oldname ne $name) {
            my $sqla = SQL::Abstract->new();
            my($stmt, @bind) = $sqla->update('images', { name=> $name}, {id=> $curr->[0] } );
            my $sth2= $self->db->prepare($stmt);
            $sth2->execute(@bind);
        }
    }
    $self->render(data=>'OK', format =>'txt' );
};
post '/IMG/reset_imagenames/:idtrial'=> [idtrial=>qr/[0-9]+/] => sub
{
    my $self=shift;
    my $idtrial= $self->param("idtrial");
    my $sql=qq{UPDATE images SET  name=filename where idtrial=?};
    my $sth = $self->db->prepare( $sql );
    $sth->execute(($idtrial));
    $self->render(data=>'OK', format =>'txt' );
};


# POST /upload (push one or more files to app)
post '/upload/:idtrial' => [idtrial=>qr/[0-9]+/] => sub {
    my $self    = shift;
    my $idtrial = $self->param('idtrial');
    my $prefix  = uri_decode( $self->param('prefix') ) || '';
    my @uploads = $self->req->upload('files[]');
    for my $curr_upload (@uploads) {
        my $upload = Mojo::Upload->new($curr_upload);
        my $bytes  = $upload->slurp;
        my($filename, $suffix)=$upload->filename =~/^(.+)\.([^\.]+)$/;
warn $prefix;
        cellfinder_image::uploadImageFromData($self->db, $idtrial, $prefix.$filename, $suffix, $bytes);
    }
    $self->render( json => \@uploads );
};

#use Mojo::Log;
#app->log->level('debug');
app->config(hypnotoad => {listen => ['http://*:3000'], workers => 20, heartbeat_timeout=>600000, inactivity_timeout=> 600000});
app->start;
