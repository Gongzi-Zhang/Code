#!/usr/bin/perl

use strict;
use warnings;

use Regexp::Debugger;	# debugging regex

# reg expressions are an integral part of the 
# m//, s///, qr// and split operators
# perl's regex support is both broad and deep


# Principle 0 (match as early as possible): Taken as a whole, any regexp will be matched at the earliest possible position in the string.
#
# Principle 1 (greedy matching): The maximal matching quantifiers '?' , '*' , '+' and {n,m} will in general match as much of the string as possible while still allowing the whole regexp to match.
#
# Principle 2 (left to right): If there are two or more elements in a regexp, the leftmost greedy quantifier, if any, will match as much of the string as possible while still allowing the whole regexp to match. The next leftmost greedy quantifier, if any, will try to match as much of the string remaining available to it as possible, while still allowing the whole regexp to match. And so on, until all the regexp elements are satisfied.
#
# Principle 3 (left comes first): In an alternation a|b|c... , the leftmost alternative that allows a match for the whole regexp will be the one used.

$pattern = "foo"
if (/foo/)	    {...}   # true if $_ contains "foo"
if ($a =~ /$pattern/)    {...}   # true if $a contains "foo"
if ($a !~ /$pattern/)    {...}   # not match

# simple substition
$a =~ s/foo/bar/;	# substitute foo with bar in $a
$a =~ s/foo/bar/g;	# substitute ALL INSTANCES of foo with bar in $a

# greedy matching
$x = 'the cat in the hat'
$x =~ /^(.*)(at)(.*)$/;
$1; # 'the cat in the h'
$2; # 'at'
$3; # ''

while (<>) {
    next if /^$/;	# skip blank line
    print;
}


# delimiters: can be anything when preceded by a m
"Hello World" =~ m!World!;
"Hello World" =~ m{World};
"/usr/bin/perl" =~ m"/perl";
## for replacement, the delimiters can be anything
$x =~ s!pattern!substition!e
$x =~ s{pattern}{substition}
$x =~ s{pattern}/substition/e
$x =~ s'pattern'substition'e	# use single quote as del. then the pattern and substition are treated as single-quoted strings

# metacharacters: {}[]()^$.|*+?\
"cat" =~ /\143\x61\x74/;
"housekeeper\n" =~ /keeper$/;
## The special characters for a character class are -]\^$ and are matched using an escape:
$x = 'bcr';
/[\\$x]at/; # match \at, bat, cat, rat

# character classes
/\d/ == /[0-9]/
/\D/ == /[^0-9]/
/\s/ == /[\ \t\r\n\f]/
/\S/ == /[^\s]/
/\w/ == /[0-9a-zA-Z]/
/\w/ == /[^\w]/
/\N/ == /[^\n]
## word anchor: \b matches a boundary between word char and a non-word char \w\W or \W\w
"housecat" =~ /cat\b/;
"catenate" =~ /\bcat/;
"cat"	   =~ /\bcat\b/;
### if apostrophe is included in words, then use wide boudary: \b{wb}
"don't" =~ / .+? \b{wb} /x;

# alternative
$a =~ /this|or|that/;
"cats and dogs" =~ /cat|dog|bird/;  # match cat
"cats and dogs" =~ /dog|cat|bird/;  # match cat
"cats" =~ /c|ca|cat|cats/;  # match c

# extract matching
$time =~ /(\d\d):(\d\d):(\d\d)/;
$hours = $1;
$minutes = $2;
$seconds = $3;
($hours, $minutes, $seconds) = ($time =~ /(\d\d):(\d\d):(\d\d)/);
## nested grouping
/haha(ab(cd|ef)((gi)|j))/;
#    1  2      34

# backrefrence: \g1, \g2, ...
/(\w\w\w)\s\g1/;
## relative backreference (\g{-N}): to refer to the immediate preceding capture group
$x =~ /([a-z](\d)\g{-1}\g{-2})/
## named backreference: ?<name>... | ?'name'... ==> \g{name}
## It is permissible to attach the same name to more than one group, but then only the leftmost one of the eponymous set can be referenced. Outside of the pattern, the named capture group is accessible through the %+ hash
$fmt1 = '(?<y>\d\d\d\d)-(?<m>\d\d)-(?<d>\d\d)';
$fmt2 = '(?<m>\d\d)/(?<d>\d\d)/(?<y>\d\d\d\d)';
$fmt3 = '(?<d>\d\d)\.(?<m>\d\d)\.(?<y>\d\d\d\d)';
for my $d (qw(2006-10-21 15.01.2007 10/31/2005)) {
    if ( $d =~ m{$fmt1|$fmt2|$fmt3} ){
	print "day=$+{d} month=$+{m} year=$+{y}\n";
    }
}
## alternative capture group numbering: (?|...)
$time =~ /(\d\d|\d):(\d\d)|(\d\d)(\d\d)/;   # needs 4 numbers: $1, $2, $3, $4
$hour = $1 || $3;
$minute = $2 || $4;
## it is better if we can group numbers 1 and 2 in second alternative as well
$time =~ /(?|(\d\d|\d):(\d\d)|(\d\d)(\d\d))/;
$hour = $1; $minute = $2;

# position info: @- and @+
## @-[0] and @+[0] are the start and end of the entire match
## @-[n] and @+[n] are the start and end of the nth match
$x = "Mmm...donut, thought Homer";
$x =~ /^(Mmm|Yech)\.\.\.(donut|peas)/;
foreach $exp (1..$#-) {
    print "Match $exp: '${$exp}' at position ($-[$exp], $+[$exp])\n";
}
# Match 1: 'Mmm' at position (0,3)
# Match 2: 'donut' at position (6,11)
## non-grouping captures' position: $`, $& and $'
## $` (${^PREMATCH}): the part of the string before the match
## $& (${^MATCH}): the part of the string that matched
## $' (${^POSTMATCH}): the part of the string that after the match
$x = "the cat caught the mouse";
$x =~ /cat/;	# $` = 'the ', $& = 'cat'. $' = ' caught the mouse'
$x =~ /the/;	# $` = '', $& = 'the'. $' = ' cat caught the mouse'
$` == substr($x, 0, $-[0]);
$& == substr($x, $-[0], $+[0]-$-[0]);
$' == substr($x, $+[0]);
## non-capturing grouping: (?:regexp)
/([+-]?\ *(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)/;	# match a number, $1-$4 are set
/([+-]?\ *(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)/;	# match a number faster, only $1 is set
/([+-]?\ *(?:\d+(?:\.\d*)?|\.\d+)([eE][+-]?\d+)?)/; # match a number, $1 = whole number, $2 = exponent
$x = '12aba34ab5';
@num = split /(a|b)+/, $x;	# @num = ('12', 'a', '34', 'a', '5')
@num = split /(?:a|b)+/, $x;	# @num = ('12', '34', '5')

# repetition
# ?: 0|1 times, try 1 first, then 0
# *: 0 or more times, as more times as possible
# +: 1 or more times, at least once, as more times as possible
# {n,}	: at least n times
# {n,m}	: at least n times, but not more than m times
# {n}	: exactly n times
## least (non-greedy) quantifiers
# ??: 0|1 times, try 0 first, then 1
# *?: 0 or more times, as few times as possible
# +?: 1 or more times, at least once, but as few times as possible
# {n,}?	: at least n times, as few times as possible
# {n,m}?: at least n times, but not more than m times, as few times as possible 
# {n}?	: exactly n times, same as {n}, just for notation consistency
## possessive quantifiers
# {n,}+	: at least n times, as many as possible, and don't give anything up (backtracking)
# {n,m}+: n-m times, as many as possible, and don't give anything up
# {n}+	: exactly n times, notation consistency
# ?+	: {0,1}+
# *+	: {0,}+
# ++	: {1,}+

"The programming republic of Perl" =~ /(.??)(m{1,2})(.*)$/;
print $1;   # 'a', because .?? can match earliest at position 'a', though it is non-greedy matching

# modifiers
## /a
### used to restrict the matches of \d, \s and \w to just those in the ASCII range. /aa being more restrictly

## /c: a failed match or changing the target string resets the position. If you don't want it, add /c

## /e: the evaluation modifier /e wraps an eval{...} around the replacement string and evaluated result is used for substitution.
$x = "A 39% hit rate";
$x =~ s!(\d+)%!$1/100!e;    # A 0.39 hit rate

## /g
### in scalar context, /g modifier is a successive matches against a string jump from match to match, keep track of position in the string as it goes along
### in list context, /g returns a list of matched groupings, or if there is no groupings, a list of matches to the whole regex
#### \G: anchor matches at the point where the previous /g match left off
$x = 'cat dog house';
whiel ($x =~ /(\w+)/g) {    
    print "Word is $1, ends at position ", pos $x, "\n";
}

@words = ($x =~ /(\w+)/g);
$words[0];  # 'cat'
$words[1];  # 'dog'
$words[2];  # 'house'

## /i: case-insensitive

## /n: all groups are set to non-capturing
"hello" =~ /(hi|hello)/n;   # $1 is not set

## /r: non-destructive replacement, instead of modifying $_, return the substituion
$x = "Cats are great.";
print $x =~ s/Cat/Dog/r =~ s/Dog/Frog/r =~ s/Frog/Hedgehog/r, "\n"; # "Hedgehogs are great."

## /m, /s:
### multilines or single line, this affect the definition of '.', '^' and '$'
$x = "There once was a girl\nWho programmed in Perl\n";
$x =~ /^Who/;	    # doesn't match, "Who" not at start of string
$x =~ /^Who/s;      # doesn't match, "Who" not at start of string
$x =~ /^Who/m;      # matches, "Who" at start of second line
$x =~ /^Who/sm;     # matches, "Who" at start of second line
$x =~ /girl.Who/;   # doesn't match, "." doesn't match "\n"
$x =~ /girl.Who/s;  # matches, "." matches "\n"
$x =~ /girl.Who/m;  # doesn't match, "." doesn't match "\n"
$x =~ /girl.Who/sm; # matches, "." matches "\n"
$x =~ /^Who/m;	    # matches, "Who" at start of second line
$x =~ /\AWho/m;     # doesn't match, "Who" is not at start of string
$x =~ /girl$/m;     # matches, "girl" at end of first line
$x =~ /girl\Z/m;    # doesn't match, "girl" is not at end of string
$x =~ /Perl\Z/m;    # matches, "Perl" is at newline before end
$x =~ /Perl\z/m;    # doesn't match, "Perl" is not at end of string

## /x:

# catastrophe
## greedy matching and backtracking
## backtracking: match first greedy expression as much characters as possible, and then consider the whole expression, if can't match the whole expression, then backtrack one character, and try to match the whole expression again until matching the whole expression. The same thing for the following greedy expression

"x=x" =~ /.*.*=.*/;	    # this takes 23 steps to match
"x=xx" =~ /.*.*=.*/;    # 33 steps
"x=xxx" =~ /.*.*=.*/;   # 45 steps
"x=xxxxxxxxxxxxxxxxxxxx" =~ /.*(?:.*=.*)/;   # 20 x => 555 steps

## indeterminate quantifiers
$x =~ /(a|b+)*/;    # there are many different ways of partitioning a string of length n between the '+' and '*'
