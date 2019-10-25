#!/usr/bin/perl

use strict;
use warnings;
use autodie;	# die if problem reading or writing a file

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

### STDIN
while (<STDIN>) {
    print;
}

### command line args:
while (<>) {	# without anything inside, <> passes command line arg. to open, which will usually interpreted as file name
    print;
}

### print
print STDERR "This is std error output!";
print $out  $record;	    # print out to file
print $log  $logmessage;

close $in or die "$in: $!";


use Path::Tiny
my $dir = path('foo', 'bar');	# foo/bar
my $iter = $dir->iterator;
while (my $file = $iter->()){
    ...
}

## writing to a file
my $file = $dir->child("file.txt"); # foo/bar/file.txt
my $file_handle = $file->openw_utf8();	# get a file handle (IO::File object) you can write to with a UTF-8 encoding layer
my @list = ('a', 'list', 'of', 'lines');
foreach my $line ( @list ) {
    $file_handle->print($line, "\n");
}

my $file_handle = $file->opena_utf8();	# appending to a file

## reading a file
my $content = $file->slurp_utf8();  # read in the entire contents

my $file_handle = $file->openr_utf8();
while (my $line = $file_handle->getline() ) {
    ...
}

$dir->stringify();  # convert to string
$file->stringify();  # convert to string
