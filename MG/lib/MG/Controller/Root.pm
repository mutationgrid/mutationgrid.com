package MG::Controller::Root;
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

=cut

=head2 index

Requests for / 

=cut

sub index :Path :Args(0) { }
sub tech :Local { }
sub pricing :Local { }
sub faq :Local { }
sub contact :Local { }

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found. ' );
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