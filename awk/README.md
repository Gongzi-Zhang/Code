# Syntax
awk [OPTIONS] PROGRAM-TEXT file

# Debug
Dgawk	is an awk debugger, which only processes AWK program source 
	provided with the -f option.


# Options
-f program-file, --file=program-file
-F fs, --field-separator=fs
-v var=value, --assign var=value
    Assign value to the variable "var", before execution of the program
    begins. Such var values are available to the BEGIN block of an AWK
    program 
-e program-text, --source program-text
-R, --command file
    Dgawk only. 
    
    
# Precedence
First, all variable assignments specified via the -v option are 
performed. Next, gawk compiles the program into an internal from. 
Then, gawk executes the code in the BEGIN block(if any); and then 
proceeds to read each file named in the ARGV array (up to ARGV[AGRC]).
If there are no files named on the command line, gawk reads the stdin. 
For each input file, if a BEGINFILE rule exists, gawk executes the
associated code before processing the contents of the file. Similarly, 
gawk executes the code associated with ENDFILE after processing the 
file. Finally, after all the input is exhausted, gawk executes the 
code in the END block(if any).

# Variables
AWK var. are dynamic; they come into existence when they are first used
Their values are either floating-point numbers or strings, or both, 
depending upon how they are used. AWK also has one dimensional arrays;
arrays with multiple dimensions may be simulated.
 
## build-in variables
IGNORECASE
    When set to non-zero value, all regular expression are matched 
    case insensitively.

## Variable typing and conversion
Variables may be float point, or strings, or both. How the value of a 
variable is interpreted depends upon its context. If used in a numeric
expression, it will be treated as a number; if used as a string it will
be treated as a string.

To force a varible to be treated as a number, add 0 to it; to force it
to be treated as a string, concatenate it with the null string("").

When a string must be converted to a number, use strtod(3). A number is
converted to a string by using the value of CONVFMT as format string
for sprintf, with the numeric value of the variable as the argument.
However, even though all numbers in AWK are floating-point, integral
values are always converted as integers. Thus, given: 
    
    CONVFMT = "%2.2f"
    a = 12
    b = a ""
The value of b will be "12" rather than "12.00"

### comparison:
Two variables are compared numerically if both of them are numeric;
if one value is numeric while the other has a string value that is a
"numeric string", then they are also compared numerically. Otherwise, 
the numeric value is converted to a string and a string comparison is
performed. Two string are compared, of course, as strings.

Note that string constants, such as "57", are "not" numeric strings,
they are string constants. The idea of "numeric string" only applies to
fields, getline input, FILENAME, AGRV elements, ENVIRON elements and 
the elements of an array created by split() or patsplit() that are 
numeric strings.

Uninitialized vars have the numeric value 0 and the string value ""
(the null, or empty, string).

# Records
Records are separated by var RS(default is newline char), 
which can be a regular expression.
If RS is set to the null string, then records are separated by blank
lines and the newline char always acts as a field separator, in 
addition to whatever value FS may be.

# Fields
GAWK splits each record into fields, using the value of FS var as the
field separator. If FS is a the null string, then each inividual char 
becomes a separate field. FS can be a regular expression. 

If the FIELDWIDTHS var is set to a space separated list of numbers, 
each field is expected to have fixed width, and gawk splits up the 
record using the specified widths. The value of FS is ignored. 
Assigning a new value to FS or FPAT overrides the use of FIELDWIDTHS

Similarly, if the FPAT var is set a regular expression, each field is 
made up of text that matches that regular expression. In this case, the
regular expression describes the fields themselves, instead of the FS.
Assigning a new value to FS or FIELDWIDTHS overrides the use of FPAT

FS=" " is a special case, which means Space( any spaces or tab) rather
than one literal space. To use single sapce as FS, one can set FS="[ ]"
This is a regular expression.

## positioned field:
$1, $2 refer to the first and second and so on field. $0 is the whole
record.

    n = 5
    print $n
prints the fifth field in the input record.

The var NF is set to the total number of fields in the input record

References to non-existent fields ( i.e. fields after $NF) produce
the null-string. However, assigning to a non-existent field (e.g.,
$(NF+2) = 5) increases the value of NF, creates any intervening fields 
with the null string as their value, and causes the value of $0 to be
recomputed. Reference to negative numbered fields cause a fatal error.
Decrementing NF causes the value of $0 to be recomputed.

Assigning a value to an existing field causes the whole record to be
rebuilt when $0 is referenced. Similarly, assigning a value to $0
causes the record to be resplit, creating new values for the fields.

# Escape Sequences
\", \\, /\
# Patterns

# awk is a line-oriented language. Each rule's action has to begin on 
# the same line as the pattern. To have the pattern and action on 
# separate lines, you must use backslash continuation--there is no 
# other way.
BEGIN
END
BEGINFILE
ENDFILE
/regular expression/
relational expression
pattern && pattern
pattern || pattern
pattern ? pattern : pattern
(pattern)
! pattern
pattern1, pattern2


# GAWK
switch case is an experimental feature of gawk, which is not enabled 
for compilation in default, there for, you may get syntax error in 
using it when you gawk doesn't compile with --enable-switch option.

# Doubts
How to check whether a array or variable exist or not ???
