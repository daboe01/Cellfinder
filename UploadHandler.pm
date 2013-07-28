{
    package UploadHandler;
    use Mojo::Base -base;

    use File::Basename 'dirname';
    use IO::All;

    has app       => sub { Mojolicious::Controller->new };
    has files_dir => sub { io( dirname(__FILE__) )->catdir('files') };
    has upload    => sub { Mojo::Upload->new };

    sub list {
        my $self = shift;

        my $list;
        for my $file ( $self->files_dir->all ) {
            next if $file->name =~ /.htaccess/;
            my $download_url =
              $self->app->url_for("/download/@{[ $file->filename ]}");
            my $delete_url =
              $self->app->url_for("/delete/@{[ $file->filename ]}");
            push @$list,
              {
                name        => $file->filename,
                size        => $file->size,
                url         => $download_url,
                delete_url  => $delete_url,
                delete_type => 'DELETE'
              };
        }
        return $list;
    }

    sub do_upload {
        my $self = shift;
        $self->upload->move_to(
            $self->files_dir->catfile( $self->upload->filename ) );
        return $self->list;
    }

    sub download {
        my ( $self, $file ) = @_;
        return $self->files_dir->catfile($file)->all;
    }

    sub delete_upload {
        my ( $self, $file ) = @_;
        $self->files_dir->catfile($file)->unlink;
        return $self->list;
    }
}
1;
