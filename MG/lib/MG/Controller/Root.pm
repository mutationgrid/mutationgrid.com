package MG::Controller::Root;
use MIME::Lite;
use DateTime;
use Email::Valid;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MG::Controller::Root - Root Controller for MG

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 auto

Things that always happen.

=cut

sub auto :Private {
   my ($self, $c) = @_;
   $c->stash->{now} = DateTime->now;
}


=head2 index

Requests for / 

=cut

sub index :Path :Args(0) { }
sub tech :Local { }
sub pricing :Local { }
sub faq :Local { }
sub google :Path('google6099ec808a443ea3.html') {
   my ($self, $c) = @_;
   $c->res->body('google-site-verification: google6099ec808a443ea3.html');
   $c->detach;
}


=head2 contact

Display the form. Or, if they just submitted it, send an email.

=cut

sub contact :Local { 
   my ($self, $c) = @_;

   unless ($c->req->param('send')) {
      return 1;  # display form
   }

   my $email = $c->req->param('email') ;
   unless (Email::Valid->address($email)) {
      $email = 'info@mutationgrid.com';
   }
   my $name = $c->req->param('name');

   my $text;
   $text .= "Name:   $name\n";
   $text .= "Email:  $email\n";
   $text .= "Phone:  " .     $c->req->param('phone') .     "\n";
   $text .= "\n" .           $c->req->param('questions') . "\n";

   my $m = MIME::Lite->new(
      From    => $email,
      To      => 'info@mutationgrid.com',
      Subject => "/contact",
      Type    => 'multipart/related',
   );
   $m->attach(
      Type     => 'TEXT',
      Data     => $text,
   );
   $m->send || die "email send failed";
   
   $c->stash->{template} = 'contact_sent.tt';
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    #$c->response->body( 'Page not found. ' );
    $c->stash->{template} = '404.tt';
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Jay Hannah,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
