# except let, there is some other expressions to do integer math withinin shell
# these alternatives are also integer only

$((expression))	# exchangable with let; other alternative of this expression are:
: (( expression ))
: $[ expression ]

expr $a + $b;	# evaluate expression, not dedicate for math calculation, much weaker than previous methods, don't use it unless must to.

# most powerful: float point calculation
## bc
echo "ibase=3; obase=5; 21" | bc    # input and output base, default 10
echo 'scale=5; sqrt(10)' | bc	# scale: precision, default 0
echo "scale=10; 4*a(1)" | bc -l	# 4π: preload a math library, available functions are:
## s(x):    sine, x is in radians
## c(x):    cosine, radians
## a(x):    arctangent, radians
## l(x):    natural logarithm
## e(x):    exponential
## j(n, x): Bessel function of integer order n of x


## perl
perl -e 'expression'

## python
python -c 'expression'
