#!/usr/bin/perl

use strict;
use warnings;

# perl's regex support is both broad and deep
if (/foo/)	    {...}   # true if $_ contains "foo"
if ($a =~ /foo/)    {...}   # true if $a contains "foo"

# simple substition
$a =~ s/foo/bar/;	# substitute foo with bar in $a
$a =~ s/foo/bar/g;	# substitute ALL INSTANCES of foo with bar in $a

while (<>) {
    next if /^$/;	# skip blank line
    print;
}

