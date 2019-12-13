# operators in decresing precedence
# - + ~ !	Unitary operators
# **
# * / %
# + -
# << >>		Left/right bit shift, valid for int operands only
# < > <= >=	Relational operators
# eq ne in ni	string comparison
# &		Bit-wise AND
# ^		Bit-wise exclusive OR
# |		Bit-wise OR
# &&		Logical AND
# ||		Logical OR
# x?y:z		if-then-else

expr { "9" == "9.0"}	;# true
expr { "9" eq "9.0"}	;# false

# Math functions
abs	acos	asin	atan
atan2	bool	ceil	cos
cosh	double	entier	exp
floor	fmod	hypot	int
isqrt	log	log10	max
min	pow	rand	round
sin	sinh	sqrt	srand
tan	tanh	wide

expr double()    ;# converts a number to a floating-point number
expr int()	 ;# converts to a int number by truncation the decimal part
expr wide()	 ;# converts to a wide int
expr entire()    ;# converts to an int of appropriate size to hold it without truncation

expr int(1.2/0.1)   ;# 11

set pi1 [expr {4.0*atan(1.0)}]
set pi2 [expr {6.0*asin(0.5)}]

# tcl strategy
* If you add, subtract, multiply and divide two integer numbers, then the result is an integer. If the result fits within the range you have the exact answer. If not, you end up with something that appears to be completely wrong. 

* If you add, subtract, multiply and divide an integer number and a floating-point number, then the integer number is first converted to a floating-point number with the same value and then the computation is done, resulting in a floating-point number.
