#!/usr/bin/perl
$|=1;	# disable output buffering

use strict;
use warnings;
use constant PI => 4*atan2(1, 1);   # perl pragma to declare constants
use constant e => exp(1);

print "Hello World";	# comments start with a hash symbol

my $var = "value";  # use 'my' keyword when first use a variable (required by strict)

# scalar: primitive data type
## number
my $num;
$num = 1;
$num = 1_100_.234;
$num = 1.3, 0.9;
$num = 1.2e10, 1.3E-9;
$num = 0b11111111, 0B11111111, 0377, 0xff, 0xFF, 0Xff, 0XFF;
$num = pi;

0.1 + 0.2 != 0.3;

## string
## quotes: only double quote interpolate variables and special chars
my $str;	
$str = "camel";	
$str = "camel\nin desert";	
$str = 'camel\nin desert';	
$str = "camel
in desert"  # allow multilines

## boolean: no reserved word of true or false
## 0, '0', undef, '', (), ('')	are regarded as false, the rest are true
print 'false' unless 0;
print 'false' unless '0';
print 'false' unless undef;
print 'false' unless '';
print 'false' unless ();    # empty array
print 'false' unless ('');  # array of empty string
print 'true'  if [];	    # though empty array, it is true
print 'true'  if {};	    # though empty hash, it is true 

## undef
$var = undef
undef == undef


# expression
print "Hello, " . $name . "\n";	# string concatenation
($<, $>) = ($>, $<);	# swap real and effective uids
## default variable
print;	    # prints contents of $_ by default


# @ARRAY and %HASH are all internally 1-Dimensinoal: they can hold only scalar value: string, number, undef or reference
# arrays
my @strings = ("camel", "llama", "owl");
@strings = qw/camel llama owl/;
my @numbers = (23, 42, 69);
my @mixed = ("camel", 42, 1.23, undef);
## sequential number (letter) arrays: ..
@numbers = (1..10);
@letters = (a..z);

## to extract array element, we can use either $array[index] or @array[index], the difference is that for $, it extracts only one element; while @ allows multi-elements at the same time
print $animals[0];  # 0-based
print @animals[0];  
print $animals[-1]; # negative index is allowed
print @animals[-1]; # negative index is allowed
print @animals[0,2];	# multiple elements: 0 and 2
for my @element (@animals) {
    ...
}

## matrix
my @matrix = ( [1, 2, 3],
	       [4, 5, 6],
	       [7, 8, 9],);

### $matrix[row]->[column] or $matrix[row][column]
$matrix[0]->[1] == $matrix[0][1];   # the pointer dereferencing arrow is optional between two adjacent brackets (only)
${$matrix[0]}[1];   # reference


# hash: hash value must be scalar
my %fruit_color = ("apple", "red", "banana", "yellow");
my %fruit_color = ("apple" => "red", "banana" => "yellow");
$fruit_color{"apple"};	    # "red"
$fruit_color->{"apple"};    

# reference: a scalar value that can refer to other data type, useful to used in hashes
my $sref = \$scalar;   # reference to $scalar
my $aref = \@array;    # reference to @array
my $href = \%hash;	    # reference to %hash

$aref = [1, "foo", undef, 13];	# refer to an anonymous array
$href = { apr => 4, aug => 8 };	# refer to an anonymous hash

@a == @{$aref};	# any place of using an array can be replaced by an array ref in curly braces
%h == %{$aref};	# the same thing for hash
@{$aref}[3] == $aref->[3];  # the dereferencing arrow is not optional
@{$href}{ref} == $href->{ref};

$ref2 = $ref1;	# this doesn't copy the value, but jsut create another reference
$aref = [@{$aref1}];	# to copy an array

my $variables = {
    scalar => {
	description => "single item",
	sigil => '$',
    },

    array => {
	description => "ordered list of item",
	sigil => '@',
    },
    hash => {
	description => "key/value pairs",
	sigil => '%',
    },
}
# control flow
if (condition) {
    ...
} elsif ( other condition ) {
    ...
} else {
    ...
}
### negated version
unless (condition) {	
    ...
}
# which equals to 
if (!condition) {
    ...
}

### post-condition way
print "Yow!" if $zippy;
print "We have no bananas" unless $bananas;


## while
while (condition) {
    ...
}
### negated version
until (condition) {
    ...
}
### post-condition way
print "La La La\n" while 1;

## for, exactly like C:
for ($i = 0; $i <= $max; $i++) {
    ...
}
foreach (@array) {
    print "This elements is $_\n";
}
print $list[$_] foreach 0 .. $max;

foreach my $key (keys %hash) {
    print "The value of $key is $hash{$key}\n";
}

## switch
given ($foo) {
    when (undef) {
	say '$foo is undefined';
    }
    when ("foo") {
	say '$foo is the string "foo"';
    }
    when ([1, 3, 5, 7, 9]) {
	say '$foo is an odd digit';
	continue;
    }
    when ($_ < 100) {
	say '$foo is numerically less than 100';
	break;
    }
    when (\&complicated_check) {
	say 'a complicated check for $foo is true';
    }
    default {
	die q(I don't know what to do with $foo);
    }
}


# subroutines (functions)
sub logger {
    my $logmessage = shift; # shift the first argument to variable
    open my $logfile, ">>", "my.log" or die "Could not open my.log: $!";
    print $logfile $logmessage;
}

logger("We have a logger subroutine!");

## special variable array: @_
sub subroutine {
    foreach (@_) {
	print @_;
    }
}
# POD: embedded documentation
=head1 Here is a POD
if a line begins with an equal sign and a word, then that text and 
all remaining text up through and including a line beginning 
with =cut will be ignored.

This allows one to intermix the source code with documentation
=cut back to compiler


# debugging
DB<1> x $var	# dump out the value of any var

# Miscellaneous
1 .. 10		# range oeprator, creates a list of numbers or strings


# time
my $starttime = time();
