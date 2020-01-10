package syntax

DECLARATION:
    VAR
	var IDENTIFIER_LIST TYPE [= VALUE_LIST] [, IDENTIFIER_LIST TYPE [=  VALUE_LIST]]
	IDENTIFIER_LIST := VALUE_LIST
	const IDENTIFIER [= VALUE]
    ARRAY
	var IDENTIFIER [n]ARRAY ||
	var IDENTIFIER [n]TYPE
    SLICE
	var IDENTIFIER []SLICE	||
	var IDENTIFIER []TYPE = ARRAY[n, m]
    MAP
	var IDENTIFIER map[TYPE]DATA_TYPE
    POINTER
	var IDENTIFIER *TYPE
    FUNCTION
	func IDENTIFIER(ARGUMENTS) RETURN_TYPES {}
    METHOD
	func RECEIVER IDENTIFIER(ARGUMENTS) RETURN_TYPES {}

TYPE:
    BOOLEAN
	bool

    NUMERIC
	int || int8 (byte)  || int16	|| int32 (rune)	|| int64
	uint	|| uint8    || uint16	|| uint32	|| uint64
	float32	|| float64
	complex64   || complex128

    STRING
	string

DATA_TYPE:
	TYPE	||
	STRUCT	||
	ALIAS	||
	POINTER ||
	ARRAY	||
	SLICE	||
	MAP	||
	FUNCTION

STRUCT:
	type IDENTIFIER struct {
	    IDENTIFIER DATA_TYPE
	    IDENTIFIER DATA_TYPE
	    ...
	}

ALIAS:
	type IDENTIFIER DATA_TYPE

POINTER:
	*TYPE

ARRAY:
	[n]DATA_TYPE

SLICE:
	[]DATA_TYPE

MAP:
	map[TYPE]DATA_TYPE

INTREFACE:
	type IDENTIFIER interface {
	    FUNCTION
	    FUNCTION
	    ...
	}

IDENTIFIER:
	[_a-zA-Z][_a-zA-Z0-9]*


IDENTIFIER_LIST:
	IDENTIFIER (, IDENTIFIER_LIST || NULL)


OPERATORS:
	-- ++
	& || ^
	+ - / * % **
	> <  == <= >=
	= -= += *= /= %=

// for statement
for EXPR1; EXPR2; EXPR3 {}


