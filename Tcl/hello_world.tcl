#!/usr/bin/tclsh

source lib.tcl	    ;# returns the value of the last statement in the script. If there is an error, it will return that error. If there is a return, then source will return immediately, without executing the remainder of the script. If fileName starts with a tilde (~) then $env(HOME) will substituted for the tilde, as is done in the file command.
package require [-exect] packageName [version]	;# load package; if -exect switch is given, only exect version will be loaded; otherwise, any version equal to or greater than the given version will be accepted; this command returns the actual version number, otherwise it generates an error


set starttime [clock clicks -milliseconds]

# everything is a string in tcl

# quote/brace
puts "Hello World!"	;# comments
puts "Hello World!"	# (note the semicolon) this is wrong, can't start comment  within a command
# If you put comments at the end of a Tcl command, remember to precede the pound sign (#) with a semicolon (;).
puts {Hello World! - In Braces}	    ;# quoted with braces: regarded as a single unit (argument)
puts HelloWorld		;# words don't need to be quoted unless they contain white space

# set
set word "Hello World"
puts $word
puts [set word]		;# w/o a new value, set return the value of its argument; so this equals to puts $word
set y [set x "def"]	;# set has a return value

# substition: $var within ""
puts "the word is $word"    ;# allow substitution with ""
puts {The word is $word}    ;# no substitution with {}
puts {There are no substitutions done within braces \n \r \x0a \f \v}
puts {But, the escaped newline at the end of a\
string is still evaluated as a space}
puts "The word is {$word}"  ;# only the outer most quote matters

## backslash at the end of a line, the interpreter will insert a blank space at the location of the ending backslash
puts "Hel\
lo world"	;# Hel lo world
set cmd expr
set x 11
$cmd $x*$x


### command substitution: []
set a 44
set b [expr $a*4]
set c "$a + $b is [expr $a + $b]"   ;# 44 + 176 is 220
set d {$a + $b is [expr $a + $b]}   ;# no substitution: $a + $b is [expr $a + $b]
set e \[literal-sqaure-bracket\]    ;# no substitution when escaped by \


## evaluation
eval arg1 [arg2] ... [argN]
# eval uses concat to merge its arguments into a command string. 
eval puts Not OK    ;# ERROR; two arguments to put
eval [list puts {Not OK}]   ;# correct
eval [list puts "Not OK"]   ;# correct
set cmd "Not OK"
eval puts $cmd	    ;# ERROR

## indirect substitution
subst [-nobackslashes] [-nocommands] [-novaraibles] "string"	;# performs a substitution pass without performing any execution of commands except those required for the substitution to occur
# if any of the -no... switches are present, then the corresponding substitutions will not be done

# string
## subcommands
string length "string"
string index "string" index	    ;# return the index'th char from string (0-based)
string range "string" first last    ;# index are the same as that in list
string compare "str1" "str2"	    ;# -1 => less; 0 => equal; 1 => greater
string first "string" "substr"	    ;# return the first index of substr in string, -1 if no match
string last "string" "substr"	    
string wordend "string" index	    ;# return the index of the char just follwoing the word that contains the index'th char in string; a word is any continuous set of letters, numbers or underscore
string wordstart "string" index	    ;# return the index of the first char in the word that contains the index'th char in string
string match pattern "string"	    ;# return 1 if the pattern matches string
string tolower "string"
string toupper "string"
string trim "string" ["trimChars"]  ;# remove all occurrence of each char in trimChars from both ends; default as whitespace
string trimleft "string" ["trimChars"]
string trimright "string" ["trimChars"]
format "formatString" [arg1 arg2 ... argN]  ;# formatted string as the ANSI sprintf 
format "%-20s %+10d" "Item" "30"

# regexp: tcl use perl regexp (I guess) it allows char class like \y \w
regexp [switches] pattern "string" [matchVar] [subMatch1 ... subMatchN]	    ;# this return the number of matches
regsub [switches] pattern "string" "substitution" varName
## switches
## -inline -all

set sample "Where there is a will, There is a way"
set result [regexp {([A-Za-z]+) +([a-z]+)} $sample match sub1 sub2]
puts "Result: $result match: $match 1: $sub1 2: $sub2"
set result [regexp -all {([A-Za-z]+) +([a-z]+)} $sample match sub1 sub2]    ;# use all switch to count all matches, and the variable will store the last match result
puts "Result: $result match: $match 1: $sub1 2: $sub2"

regsub "way" $sample "law suit" sample2
puts "New: $sample2"

set parens [regexp -inline -all {[()]} $string]
set balance 0
set change("(") 1   ;# associative array
set change(")") -1
foreach p $parens {
    incr balance $change($p)

    if {$balance < 0} {
	puts "Parentheses unbalanced!"
    }
}
if {$balance != 0} {
    puts "Parentheses unbalanced!"
}

# math: expr
## enclosing the arguments to expr in curly braces will result in faster code
expr {$a + $b}


# list
## NOTE!!! the list methods may use the list reference or list value as an argument
set lst {item1 {item 2} "item 3"}
set lst [split "item1.item2.item3" "."]
set lst [list "item1" "item2" "item3"]
concat arg1 arg2 ... argn   ;# it will eliminate leading and trailing spaces in args; if an arg is already a list, its elements will be concat with other args
lindex lst 0	;# take out the indexed element
llength lst	;# length of a list
lappend $lst arg1 arg2 .. argn	;# each arg is treated as a list element
linsert $lst index arg1 [arg2 ... argN]	;# return a new list; insert before the index'th element; each arg as an element; if index <= 0: insert at the beginning; if index==end || index >= #lst, then the new elements are appended
lreplace $lst first last arg1 ... argn	;# return a new list; the index are treated as that in linsert; if there are fewer args than the number of position between first and last, then the position for which there are no args are deleted
lset lst index newValue	;# set the index'th element to new value directly 
lsearch $lst pattern	;# return index of the first match (-1 if no match); by default, it uses glob pattern
lsort $lst  ;# return a new sorted (in alphabetic order) list
lrange $lst first last	;# indexes are treated as that in linsert; if first is greater that last then an empty list is returned
### glob
# 1. *	matches any quantity of any char
# 2. *	matches one occurrence of any char
# 3. \X	escape a special char
# 4. [...]  matches one occurrence of any char within the brackets; range is available
#   > [!...]	matches any char not in the range
#   > [][!]	the string enclosed by the brackets can't be empty, so this match the three chars: ] [ !
set bins [glob /usr/bin/*]

## iterate through a list
foreach varname $lst { ... }
foreach {a b} $listofpairs { ... }
foreach a $lista b $listb { ... }

# associative array -- hash table
set name(first) Mary
set name(last) Poppins
set pos first
puts "$name($pos)"  ;# Mary

set a(1) 10
set a(2) 20
set a(3) 30
set b 2
puts "$a($b)"	;# 20

set name(ID) 0
set id $name(ID)
set name($id,first) $first  ;# the index is simply a string! so we can use both fixed and varying parts; the comma here is not a special piece of syntax, but instead just part of the string key; this is how to create multi-dim array with tcl

array exists arrayVar	;# return 1 if arrayVar is an array; otherwise return 0 (non-array or doen't exist)
array names arrayVar [pattern]	;# return a list of the indices for the associative array; if pattern is supplied, return only the matched (glob matching) indices
array size arrayVar	;# number of elements
array get arrayVar	;# return a list whose odd member (1, 3, 5...) is an index of the array, and the even member is an value of the array
array set arrayVar dataList	;# converts a list into an associative array; opposite to array get
array unset arrayVar [pattern]	;# unset all elements (matched elements if pattern supplied) in the array

## Iterate through associative array
## Note that the order of an associative array is not guarantee, which depends on the underlying hash table
foreach name [lsort [array names arrayVar]] {
    puts "$name: $arrayVar($name)"
}

foreach {name value} [array get arrayVar] {
    puts "$name: $value"
}

## use array as function arguments
proc print12 {arr} {
    upvar $arr a
    puts "$a(1), $a(2)"
}
print12 arrVar

### the following code will not work properly
proc print12 {a} {  ;# this will not work because what is passed is just a collection of variables
    puts "$a(1), $a(2)"
}
print12 $arrVar

# dictionary
## tcl introduce dictionary to solve the disadvantages of array: dict can be passed to procedures direclty, just like a list
## unlike array, you can net dictionaries, so that the value for a particular key onsists of another dict

## The dict set command accepts a list of key names which act as a path through the dictionary. The last argument to the command is the value that we want to set.
dict set clients 1 forenames	Joe
dict set clients 1 surname	Schmoe 
dict set clients 2 forenames	Anne
dict set clients 2 surname	Other 
# so here we create a nested dict, with dict 'clients' has 2 keys: 1 and 2; and the value of each key is also a dict with keys: forenames and surname
dict keys $dict	;# return a list of dict keys
dict get $dict $key ;# get the value corresponding to key in a dict
dict update myDict $key	;# specify exactly which keys you want to convert into variables.

dict for {id info} $clients {	;# this equals to: foreach {id info} $clients {...}
    # unlike array, the order in which elements of a dict are returned during a 'dict for' loop is defined to be the chronological order in which keys were added to the dictionary. 
    puts "Client $id:"
    dict with info {	;# the 'dict with' command takes a dict and unpacks it into a set of local variables in the current scope.  !!! Be aware that any changes you make to these variables will be copied back into the dictionary when the dict with command finishes
	puts " Name: $forenames $surname"   ;# This takes advantage of the fact that: in Tcl, every dictionary is also a valid Tcl list, consisting of a sequence of name and value pairs representing the contents of the dictionary.
    }
}


# control flow
## if..elseif..else
if { expression } {
    ...
} elseif {
    ...
} else {
    ...
}

if yes && true && Yes && True && -1 && 1 && 1.2 && 1e3 {puts true}  ;# any non-0 numeric value is true
if no || false || 0 {} else {puts false}

## while
while { test-expression } {
    ...
}

set i 0
set sum 0
while { 1 } {
    incr i		    ;# increment i; set i [expr {$i + 1}]
    if {$i == 5} {continue} ;# skip i==5
    if {$i > 10} {break}    ;# end loop
    set sum [expr $sum + $i]
}
puts "Sum = $sum"

## for
for {initialization} {test} {next} {
    ...
}

for { set i 0 } { $i <= $number } {incr i } {
    ...
}

## foreach
set sum 0
foreach i {1 2 3 4 5 6 7 8 9 10} {
    set sum [expr $sum + $i]
}
puts "Sum = $sum"


## switch
set prompt "Enter command (\"quit\" to exit): "
puts -nonnewline "$prompt"; flush stdout
while { [gets stdin cmd] != -1} {
    switch -exact -- $cmd {	;# NOTE!!! no substitution inside brace
	quit	{puts "Bye!"; exit}
	start	{puts "Start"}
	stop	{puts "Stop"}
	draw	{puts "Drawing"}
	default	{puts "Unknown command: $cmd"}
    }
    puts -nonnewline "$prompt"; flush stdout
}

switch string pattern1 body1 [pattern2 body2] ... [default body]


# Regex
puts -nonnewline "$prompt"; flush stdout
while { [gets stdin cmd] != -1} {
    switch -regexp -- $cmd {
	^q.*	{puts "Bye!"; exit}
	^x.*	{puts "Something ..."}
	^y.*	{puts "Something ..."}
	default	{puts "Unknown command: $cmd"}
    }
    puts -nonnewline "$prompt"; flush stdout
}


# procedure (function)
proc total items {
    set sum 0
    foreach i $items {
	set sum [expr $sum + $i]
    }
    return $sum
}

proc sum {arg1 arg2} {
    expr {$arg1 + $arg2}    ;# if no return value, the return value of the last command becomes the return value
}

proc justdoit {a {b 1} {c -1}} {    ;# default value
    puts "The default value of b is $b, and the default value of c is $c"
}
set counts "5 4 3"
puts "Total = [total $counts]"

## variable args
proc total args {
    set sum 0
    foreach i $args {
	set sum [expr $sum + $i]
    }
    return $sum
}

proc example {first {second "default value"} args} {
    if {$second eq "default value"} {
	puts "There is only one argument: $first"
    } else {
	if {$args eq ""} {
	    puts "There are two arguments: $first and $second"
	} else {
	    puts "There are many arguments: $first and $second and $args"
	}
    }
}

## command line arguments
foreach f $argv {
    puts -nonewline stdout [read stdin]
    puts stderr $argc
    puts $argv
}
## Scope: global, upvar
## If you are using upvar with anything except #0 or 1, you are most likely asking for trouble, unless you really know what you're doing.
proc func arg1 {
    global theCanvas	;# cause a variable in a local scope to refer to the global variable of that name
    upvar [level] otherVar1 myVar1 [otherVar2 myVar2] ... [otherVarN myVarN]	;# ties the name of a variable in the current scope to a variable in a different scope
    # the level refer that how many levels up the stack from the current level; if it is preceded by a # symbol, then it references that how many levels down from the global scope: $0 is the gloabl level
}

proc setPositive {variable value} {
    upvar $variable myvar   ;# upvar 1 level
    if {$value < 0} {
	set myvar[expr {-$value}]
    } else {
	set myvar $value
    }
    return $myvar
}

setPositive x 5	    ;# x == 5

# file io
open fileName [access] [permission] ;# return a token to be used via gets, puts, close etc
## access mode
## r	read only, file must exist
## r+	read and write, file must exist
## w	write, create file if it doesn't exist
## w+	read and write, create file if it doesn't exist
## a	append, file must exist
## a+	append, create file if it doesn't exist

## permission: default as (0666)
close $fileID	;# close an opened file, and flushes any remaining output
gets $fileID [var]   ;# read a line of input from fileID, discards the terminating newline char; if there is a var argument, gets returns the number of chars read (or -1 if an EOF occurs); otherwise gets return the line of input. an empty string will be returned if: 1) there is a blank line in the file; 2) EOF occurs
puts [-nonewline] $fileID "string"  ;# write to file
read [-nonewline] $fileID    ;# read all the remaining bytes from fileID and return the string. if -nonewline is set, then the last char will be discarded if it is a newline. ??? Any existing EOF condition is cleared before the 'read' command is executed ???
read $fileID numbytes	    ;# read up to #num bytes from fileID and then returns the input as a string. ??? Any existing EOF condition is cleared before the 'read' command is executed ??? 
seek $fileID offset [origin] ;# change the current position within the file. Note that if the file was opened with "a" access that the current position can not be set before the end of the file for writing, but can be set to the beginning of the file for reading.
## offset is the offset in bytes at which the current position is to be set
## origin can be: start, current or end
tell $fileID	;# returns the position of the access pointer in fileID as a decimal string
flush $fileID	;# flushes any output
eof $fileiD	;# returns 1 if EOF condition exists, otherwise returns 0
glob [switch] pattern [patternN]    ;# returns a list of file names that match pattern or patternN (in arbitraty order)
## switches may be:
## -nocomplain:	Allows glob to return an empty list without causing an error.
## -types typeList: Selects which type of files/directory the command should return. 'd' for dir.; 'f' for ordinary files; 'r' for dir/file that can be read by the user
## --:	mark the end of switches

# Deubg & Error
error "message" [info] [code]	;# generates an error condition and forces the Tcl call stack to unwind, with error information being added at each step.  If info or code are provided, the errorInfo and errorCode variables are initialized with these values.
catch script [var]  ;# returns 0 if no error in script; otherwise 1. If var is supplied, the value returned by script is placed in var if the script successfully executes. If not, the error is placed in var.
return [-code code] [-errorinfo info] [-errorcode errorcode] [value]	;# generate a return exception conditno
# -code code: code can be one of:
## * ok	------- normal status return
## * error ---- proc returns error status
## * return --- normal return
## * break ---- proc returns break status
## * continue - proc returns continue status
# -errorinfo and -errorcode will set the corresponding global var.

# trace: inspect the state of a variable
trace add type ops [args]
trace info type name
trace remove type name opList command
# where type can be:
# variable  -- traces added to variables are called when some event occurs to the variables, such as being read or written to
# command   -- traces added to commands are executed when the named command is renamed or deleted
# execution -- execute added traces when the named command is run

# the following example set a trace on a variable so that when it's written to; the value doesn't change
proc vartrace {oldval varname element op} {
    upvar $varname localvar
    set localvar $oldval
}

set tracedvar 1
trace add variable tracedvar write [list vartrace $tracedvar]

set tracedvar 2
puts "tracedvar is $tracedvar"
