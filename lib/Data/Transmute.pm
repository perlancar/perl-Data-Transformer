package Data::Transmute;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(transmute_array transmute_hash);

sub transmute_array {
}

sub transmute_hash {
}

1;
# ABSTRACT: Transmute (transform) data structure using recipe data

=head1 SYNOPSIS

 use Data::Transmute qw(transmute_array transmute_hash);


=head1 DESCRIPTION

This module provides routines to transform a data structure in-place using
recipe which is another data structure (an arrayref of hashes). It is similar to
L<Hash::Transform> except it offers ability to do more complex transformations.


=head1 SEE ALSO

L<Hash::Transform>

=cut
