* A command in Tcl is a list of words terminated by a newline or semicolon 

* In Tcl, everything may be represented as a string, although internally it may be represented as a list, integer, double, or other type, in order to make the language fast

* Tcl passes data to subroutines either by name or by value. Commands that don't change the contents of a variable usually have their arguments passed by value ($var). Commands that do change the value of the data must have the data passed by name

* everything is a string in Tcl / everything is a command in Tcl
    -- incr just expects a var to be set to a string that looks like an integer
    everything goes through the same substitution phase; so brace is important to prevent substitution by the parser for many command (expr, while ...)

* substitution: 
    substitution is a one-pass process; one needs an explicit subst, eval or the like to do more than one round of substitution.
    variable substitution
    backslash substitution
    command substitution
  > double quotes: all types of substitution still take place.
  > square brackets: [ expression ] will be replaced with the return value of expression inside the square brackets.
  > curly brace: tcl doesn't perform any substitution when you group words with braces.

*  You should always use braces when evaluating expressions that may contain user input, to avoid possible security breaches. The expr command performs its own round of substitutions on variables and commands, so you should use braces to prevent the Tcl interpreter doing this as well (leading to double substitution). 
    As a general rule, always surround expressions with braces, whether using expr directly or some other command that takes an expression (such as if or while).

* file: 
    > There are a finite number of open file slots available. If you expect the program to run in a manner that will cause it to open several files, remember to close the files when you are done with them.
    > Opening a file with the w+ access will allow you to overwrite data, but will delete all existing data in the file.
      Opening a file with the r+ access will allow you to overwrite data, while saving the existing data in the file.

* channel: Tcl I/O is based on a the concept of channels. A channel is conceptually similar to a FILE * in C, or a stream in shell programming. The difference is that a channel may be a either a stream device like a file, or a connection oriented construct like a socket.



# pitfall
* list: the list methods usages are not consistent:
    * concat will extract an argument list's elements; while all other list methods treat an argument list as a single element
    * lappend return the original list (therefore it use list reference (without $ sign) as argument); while other list methods return a new list (they use list value (with $ sign) as argument)

* array
    * Array are collections of variables, rather than values. They cannot be passed directly to a procedure as a value. Instead you have to use the *array get* and *array set* commands to convert them to a value and back again, or else use the *upvar* command to create an alias of the array.
    * We have to represent high-dim array as one-dim array with long key string
    * Arrays cannot be included in other data structures, such as lists, or sent over a communications channel, without first packing and unpacking them into a string value.
