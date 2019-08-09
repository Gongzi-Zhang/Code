#!/usr/bin/perl

use strict
use warnings

my @animals = ("camel", "llama", "owl");
my @numbers = (23, 42, 69);

# array slice
## arrays are zero-indexed
print $animals[0];	# camel
print $#mixed;		# the index of last element
print $mixed[$#mixed];	# the last element: 1.23
print @array;		# number of elements in an array (in scalar context)
print @animals[0, 1];	# first and second element: "camel", "llama"
print @animals[0..2];	# 0-2 elements: "camel", "llama", "owl"
print @animals[1..$#animals];	# all except the first one


# functions
## sort
my @sorted = sort(@animals);

## reverse
my @backwards = reverse(@numbers);



# special arrays
print @ARGV	# command line arguments
print @_	# the arguments passed to a subroutine
