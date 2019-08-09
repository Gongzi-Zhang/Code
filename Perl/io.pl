#!/usr/bin/perl

use strict;
use warnings;

# files
open (my $in, "<", "input.txt") or die "Can't open input.txt: $!";
open (my $out, ">", "output.txt") or die "Can't open output.txt: $!";
open (my $log, ">>", "my.log") or die "Can't open my.log: $!";

## <> operator
my $line = <$in>;	# read a single line (in scalar context)
my @lines = <$in>;	# read the whole file (in list context)

### loop through each line
while (<$in>) {	    # assigns each line in turn to $_
    print "Just read in this line: $_";
}

### print
print STDERR "This is std error output!";
print $out  $record;	    # print out to file
print $log  $logmessage;

close $in or die "$in: $!";
