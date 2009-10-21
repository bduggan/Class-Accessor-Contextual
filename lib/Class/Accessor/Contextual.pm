package Class::Accessor::Contextual;

use warnings;
use strict;

=head1 NAME

Class::Accessor::Contextual - context-aware accessors

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

 package Farm;
 use base qw/Class::Accessor::Contextual/;

 Farm->mk_accessors(qw/animals/);

 my $farm = Farm->new();
 $farm->animals([qw/horse pig owl/]);
 print join ' ', $farm->animals;
 # horse pig owl

=head1 DESCRIPTION

This is a simple class derived from Class::Accessor, in
which values which are references to arrays or hashes
are deferenced when called in list context.

=head1 AUTHOR

Brian Duggan, C<< <bduggan at matatu.org> >>

=head1 SEE ALSO

Class::Accessor

=head1 COPYRIGHT & LICENSE

Copyright 2009 Brian Duggan.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

use base 'Class::Accessor';

sub get {
    my $got = shift->SUPER::get(@_);
    return $got unless wantarray;
    return @$got if ref($got) eq 'ARRAY';
    return %$got if ref($got) eq 'HASH';
    return $got;
}

1;
