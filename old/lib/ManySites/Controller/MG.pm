package ManySites::Controller::MG;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

ManySites::Controller::MG - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub index :Path :Args(0) { }
sub tech :Local { }
sub pricing :Local { }
sub faq :Local { }
sub contact :Local { }

__PACKAGE__->meta->make_immutable;

1;
