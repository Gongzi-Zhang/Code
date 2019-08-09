#!/usr/bin/perl

use strict;
use warnings;

# next
LINE: while (<STDIN>) {
    next LINE if /^#/;	    # discard comments
}

# last: immediately exits the loop; the continue block, if any, is not exectued
LINE: while (<STDIN>) {
    last LINE if /^$/;	    # exit when done with header
}

# redo: restarts the loop block without evaluating the conditional again; the continue blcok, if any is not exectued.
while (<>) {
    chomp;
    if (s/\$//) {
	$_ .= <>;
	redo unless eof();
    }
    # now process $_
}
## which equals to
LINE: while (defined($line = <ARGV>)) {
    chomp($line);
    if ($line =~ s/\\$//) {
	$line .= <ARGV>;
	redo LINE unless eof();
    }
    # now process $line
}

# continue
while (<>) {
    m?(fred)?	&& s//WILMA $1 WILMA/;
    m?(barney)?	&& s//BETTY $1 BETTY/;
    m?(homer)?	&& s//MARGE $1 MARGE/;
} continue {
    print "$ARGV $.: $_";
    close ARGV	if eof;	    # reset $.
    reset	if eof;	    # reset ?pat?
}


## if or unless
# Loop control statements don't work in an 'if' or 'unless', because they aren't loops. 
# You can double the braces to make them such, though. Because a block by itself acts as a loop that executes once.

if (/pattern/) {{
    last if /fred/;
    next if /barney/;
}}


# for loop
for ($i = 1; $i < 10; $i++) {
    ...
}
## equals to
$i = 1;	    # well, this definition makes a difference: a gloabl variable rather than a local one
while ($i < 10) {
    ...
} continue {
    $i++;
}

# foreach: it iterates over a normal list value and sets the scalar variable VAR to be each element of the list in turn.
# the foreach loop index variable is an implicit alias for each item in the lsit that you're looping over. If it is a lvalue, you may modify it by modifying VAR inside the loop.
for (@array) { s/foo/bar/ }

for my $elem (@elements) {
    $elem *= 2;
}

for $count (reverse(1..10), "BOOM") {
    print $count, "\n";
    sleep(1);
}

for (1..15) { print "Merry Chrismas\n"; }

foreach $item (split(/:[\\\n:]*/, $ENV{TERMCAP})) {
    print "Item: $item\n";
}
