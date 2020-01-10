#!/usr/bin/perl

use strict;
use warnings;
use Term::ReadLine::Perl5;

my $term = Term::ReadLine::Perl5->new('REPL');
my $max	= 10000;    # max lines of history
$term->stifle_history($max);

my $prompt = 'perl> ';
while ( defined ($_ = $term->readline($prompt)) ) {
    if (/quit|exit/)	{die "die";}
    eval $_;
    # my $attribs = $term->Attribs;
    # my $v = $attribs->{history_base};
    # print $v;
    $term->add_history($_);  # write to history file
}
