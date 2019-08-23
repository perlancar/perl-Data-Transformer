package Data::Transmute::Rules::Example;

use strict;
use warnings;

our @RULES = (
    [create_hash_key => {name=>'a', value=>1}],
    [create_hash_key => {name=>'b', value=>2}],
    [rename_hash_key => {from=>'c', to=>'d'}],
);

# ABSTRACT: Example rules module
