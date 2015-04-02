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
# ABSTRACT: Transmute (transform) data structure using rules data

=head1 SYNOPSIS

 use Data::Transmute qw(transmute_array transmute_hash);

 my %hash = (
     foo => 1,

     one => 2,
     two => 3,

     x_apple => 4,
     x_mango => 5,
 );

 transmute_hash(data => \%hash, rules => [
     # rename a single key, error if old name doesn't exist or new name exists
     ['rename_key', {from=>'foo', to=>'bar'}],

     # rename multiple keys, ignore if old name doesn't exist (ignore=>1) or if
     # new name already exist (replace=>0)
     ['rename_key', {from=>['one', 'two', 'bar', 'unknown'],
                     to  =>['1', '2', 'baz', 'something'],
                     ignore=>1, replace=>0}],

     #
 ]);

 # %hash will become:
 # (
 #     baz => 1,
 #
 #     1 => 2,
 #     2 => 3,
 #
 #     apple => 4,
 #     mango => 5,
 # )


=head1 DESCRIPTION

B<STATUS: EARLY DEVELOPMENT, NOT ALL FEATURES ARE IMPLEMENTED YET.>

This module provides routines to transmute (transform) a data structure in-place
using rules which is another data structure (an arrayref of rule
specifications). It is similar to L<Hash::Transform> except the recipe offers
ability for more complex transformations.

One use-case for this module is to convert/upgrade configuration files.


=head1 RULES

Rules is an array of rule specifications.

Each rule specification: [$funcname, \%args]

$funcname is the name of an actual function. any function can be used.
requirements: accept hash argument. accept C<data>.

\%args: a special arg will be inserted: C<data>.


=head1 FUNCTIONS

=head2 transmute_array(%args)

Transmute an array. Input data is specified in the C<data> argument, which will
be modified in-place (so you'll need to clone it first if you don't want to
modify the original data). Rules is specified in C<rules> argument.

=head2 transmute_hash(%args)

Transmute a hash. Input data is specified in the C<data> argument, which will be
modified in-place (so you'll need to clone it first if you don't want to modify
the original data). Rules is specified in C<rules> argument.


=head1 TODOS

rename_key should not accept multiple from/to, there should be another function
(like map) which feeds each pair to the function. or, should rename_key

rename_key_regex?

insert_key (ignore, replace)

delete_key (ignore by default is 1, but can be set to 0 to error if key doesn't
exist)

delete_key_regex

each_key

key: foo -> rules

element: n -> rules


=head1 SEE ALSO

L<Hash::Transform> is similar in concept. It allows transforming a hash using
rules encoded in a hash. However, the rules only allow for simpler
transformations: rename a key, create a key with a specified value, create a key
that from a string-based join of other keys/strings. For more complex needs,
you'll have to supply a coderef to do the transformation yourself manually.
Another thing I find limiting is that the rules is a hash, which means there is
no way to specify order of processing.

L<Config::Model>, which you can also use to convert/upgrade configuration files.
But I find this module slightly too heavyweight for the simpler needs that I
have, hence I created Data::Transmute.

=cut
