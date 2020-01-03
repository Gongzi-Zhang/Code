#/usr/bin/perl
use strict
use warnings

# reference is a scalar value that can refer to any other Perl data type

# reference
## if one use a reference like a string, you get something like:
## SCALAR(0x80f5dec), ARRAY(0xbfcd1387), HASH(bfcea8240)
my $var = "Hello";
my $ref = \$var;
print $ref;	# SCALAR(0x...)

# use a reference
## when using a reference, one can omit the curly brackets whenever the thing inside them is an atomic scalar variable
@$aref == @{$aref}
$$aref[1] == ${$aref}[1]
my @arr = (
    [1, 2],
    [3, 4], );
${$arr[0]}[1];	# 2
$$arr[0][1] == ${$arr}[0][1];	# WRONG
