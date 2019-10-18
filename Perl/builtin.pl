# perl built in functions

### general: io, 
int
defined
eval
evalbytes
length
print
printf
ref	# judge reference type: SCALAR for scalar ref., ARRAY for array ref. or HASH for hash ref.
require
split /regexp/, $string, $limit	# if the regexp has groupings, then the resulting list contains the matched substrings from the grouping as well
sort

### string
join 'del' @array
substr $string, $begin_pos, $length

### math
abs
cos
sin
atan2 x1, x2	# atan(x1/x2)
exp
log
hex
oct
sqrt

### file operation
chroot
fc 
glob
lc
lcfirst
lstat
mkdir 
ord
pos
quotemeta
readlink
readpipe
rmdir
grep

### system, process, threads
fork
getppid
die

### misc
map
alarm
say
chomp	# remove trailing string, usually '\n', defined in $/ or $INPUT_RECORD_SEPARATOR
chop	# old version of chomp
chr
reverse
stat
study
uc
ucfirst
unlink
unpack
given

# hashed
%ENV

## qw: quote word
my @name = qw(foo bar zorg);
### qw is not a funciton, parentheses is just the delimiter, we can use other delimiters:
@name = qw/foo bar zorg/;
@name = qw{foo bar zorg};
@name = qw[foo bar zorg];
@name = qw'foo bar zorg';
@name = qw"foo bar zorg";
@name = qw!foo bar zorg!;
@name = qw@foo bar zorg@;
