#!/usr/bin/perl
$|=1;	# disable output buffering

use strict;
use warnings;

print "Hello World";	# comments start with a hash symbol

# quotes: only double quote interpolate variables and special chars
print "Hello, " . $name . "\n";
print 'Hello, $name\n';

# scalars
my $animal = "camel";	# use my keyword when first use a variable (required by strict)
my $answer =  42;
$answer = 1_00;		# 100

($<, $>) = ($>, $<);	# swap real and effective uids
## default variable
print;	    # prints contents of $_ by default


# arrays
my @animals = ("camel", "llama", "owl");
my @numbers = (23, 42, 69);
my @mixed = ("camel", 42, 1.23);


# hashes
my %fruit_color = ("apple", "red", "banana", "yellow");
my %fruit_color = ("apple" => "red", "banana" => "yellow");
$fruit_color{"apple"};	    # "red"
$fruit_color->{"apple"};    

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

foreach my @key (keys %hash) {
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
    my $logmessage = shift;
    open my $logfile, ">>", "my.log" or die "Could not open my.log: $!";
    print $logfile $logmessage;
}

logger("We have a logger subroutine!");

# POD: embedded documentation
=head1 Here is a POD
if a line begins with an equal sign and a word, then that text and 
all remaining text up through and including a line beginning 
with =cut will be ignored.

This allows one to intermix the source code with documentation
=cut back to compiler
# Miscellaneous
1 .. 10		# range oeprator, creates a list of numbers or strings


# time
my $starttime = time();
