primitive data type: string, number
compound data type: array (numeric array), disctionary (associative array)
oepration:
    string operation
    number operation
	bit operation
    logic operation
    relation operation
    array operation
    hardware operation (system: file, io (format, color), memory and other resource)
function: collection of operations
* struct: collection of data type
* object:
    collection of both data type and operation
* data structure (template)
math function:
    sqrt
    pi, cos, sin, atan
    e, exp, ln, log
    pow, 


* The object of a DSL-based software architecture is to minimise the
semantic distance between the system’s specification and its implementation.

principle: 

design features:
    |-- dynamic
    |-- stack based
    |-- runtime eval
    |-- garbage collection
    |-- lambda calculas
target use
    |-- data query
    |-- list processing 
    |-- string processing 
    |-- pattern matching 
    |-- modeling
technique
    |-- control flow
    |-- data flow
    |-- rules based
    |-- meta programming

paradigm
    |-- functional programming (logic driven)
    |-- OO
    |-- event oriented (driven)

syntax (parsing)
    |-- keywords, operator, delimiters
	|-- precedence: prefix (*, @, $, %, &, +, -, ++, --) > postfix ([], (), {}, ...)
    |-- syntactic sugar
    |-- style (uniformality)
semantic	
    |-- variable substitution (one-time vs unbounded)
    |-- context (scope, namespace): how to access uplevel var
    |-- parameter passing: by value, by reference [as value]
builtin functions
    |-- io (read, print, error)
    |-- subprocess (eval, exec, )
    |-- control (source, import)
    |-- string
    |-- math
    |-- iterator
    |-- generator
data structure
    |-- list (array, set, tuple)
    |-- associate array (dictionary, hash, table, record)
    |-- stack
    |-- queue (pipe), dqueue
    |-- tree (binary tree)
    |-- graph, map
standard libraies
    |-- string, regex
    |-- math (scientific math)
    |-- network (sockets)
    |-- file operation(mv, cp, rename, delete)
    |-- gui
    |-- database
other packages
extensibility
    |-- call programs written in other language
debug
performance (optimization)
safety
embeddability
data as code


# primitive type:
    * normal value
    * all different expressions
    * empty value
    * abnormal value (overflow/underflow)
    * special value (null, NaN, undefined)
## expression
### operations
    * addition/concatentaion
    * multiplication
    * other operations
### conversion between primitive types:
    * implicit conversion
	1. all other types to boolean
	2. all other types to number
	3. all other types to string
	4. special relationship
    * explicit conversion
	1. toInt, toFloat
	2. toString
### comparison
    * equality
	* float number expression: 0.1 + 0.1 + 0.1 != 0.3
    * inequality

# complex type:
## string
    * quotes: "", '', ``
    * properties:
	* length
    * slice (substring)
	* 0-based or 1-based
	* negative index
	* range selection
    * (reverse) search (find)
	* indexOf, lastIndexOf, allIndexOf, includes
	    > begin position [end position]
	* beginsWith, startsWith, endsWith
	* replace
	* regex
    * concatenation (join)
    * toUpperCase, toLowerCase, toReverseCase
    * trim
    * repeat
    * split
	* regex

## array (list)
    * constructor (literal, new object), destructor
    * properties:
	* length
	* type ?
    * slice (subIndex)
	* 0-based or 1-based
	* negative index
	* range selection
    * (reverse) search (find)
	* indexOf, lastIndexOf, allIndexOf (filter), includes
	    > begin position [end position]
    * (reverse) sort
	* customized ordering
    * push (append)/pop (detach), shift/unshift
    * insert, remove
    * join
    * iterator, map (any, every, all), reduce
    * operation of multiarrays
	* addition/subtraction, multiplication
	* equal length, unequal length
    * higher-dim array: matrix
	* transpose
	* row operation
	* column operation
    * parse array
### stack, queue

## associate array (dictionary)
    * constructor (literal, new object), destructor
    * properties
	* length
    * keys
	* expression
	* type
    * iterator, map
    * remove, append
    * (reverse) sort
	* customized ordering
    * join

# control flows
    * if ... else if (elif) ... else ... end (done, fi)
    * switch ... case (when) ... break ... default ... end (done, esac)
    * while ... (do) ... continue (break) ... end (done)
    * do ... while ... continue (break) ... end (done)
    * for ... (in) ... (do) ... continue (break) ... end (done)

# function
    * special syntax (syntax sugar)
    * parameter
	* variable parameters
	* position parameter
	* keyword parameters
	* default value
	* pass by value
	* pass by reference
	    > mutual modification (lock)
    * return value
	* single return value
	* multiple return value
# class
    * constructor, destructor
    * built-in (default) methods, function
    * iterable
	* iterator 
	    > next
# template

# builtin
    * io
	* getopt(s)
    * string
	* regex
    * math
# standard library
