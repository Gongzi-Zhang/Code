#!/usr/bin/tclsh

append	    ;# appends an argument to a variable's vlaue
array	    ;# operate array variable
break	    ;# exit a loop
catch	    ;# executes a script and traps error
cd	    ;# change working dir.
close	    ;# close an open file
concat	    ;# concatenate two or more list
continue    ;# immediately begins the next iteration of a loop
eof	    ;# end of file for an open file
error	    ;# generates an error
exec	    ;# start one or more processes that execute the command's arguments
exit	    ;# terminates the tcl script
expr	    ;# evaluate an expression
file	    ;# check filenames and attributes
flush	    ;# flushes buffered output to a file
for	    ;# for loop
foreach	    ;# iterates over a list
format	    ;# formats output and stores it in a string
gets	    ;# reads a line from an opened file
glob	    ;# returns the names of files that match a pattern
global	    ;# accesses global variables
history	    ;# accesses the history list
if	    ;# if expression
incr	    ;# increments the value of a variable
info	    ;# returns internal info about the tcl interpreter
join	    ;# creates a string by joining all items in a list
lappend	    ;# append elements to a list
lindex	    ;# returns an element at a specified index (0-based)
linsert	    ;# Inserts elements into a list before a specified index
list	    ;# Creates a list composed of the specified arguments
llength	    ;# Returns the number of elements in a list
lrange	    ;# Returns a specified range of adjacent elements from a list
lreplace    ;# Replaces elements in a list with new elements
lsearch	    ;# Searches a list for a particular element
lsort	    ;# Sorts a list in a specified order
open	    ;# Opens a file and returns a file identifier
pid	    ;# Returns the process identifier (ID)
proc	    ;# Defines a Tcl procedure
puts	    ;# Sends characters to a file
pwd	    ;# Returns the current working directory
read	    ;# Reads a specified number of bytes from a file. (You can read the entire file in a single read.)
regexp	    ;# Matches a regular expression with a string
regsub	    ;# Substitutes one regular expression pattern for another
rename	    ;# Renames or deletes a command
return	    ;# Returns a value from a Tcl procedure
scan	    ;# Parses a string, using format specifiers patterned after C's scanf function
seek	    ;# Changes the access position (where the next input or output operation occurs) in an open file
set	    ;# Sets a variable's value or returns its current value
source	    ;# Reads a file and processes it as a Tcl script
split	    ;# Breaks a string into a Tcl list
string	    ;# Performs various operations on strings
switch	    ;# Processes one of several blocks of commands, depending on which pattern matches a specified string
tell	    ;# Returns the current access position for an open file
time	    ;# Returns the total time needed to execute a script
trace	    ;# Executes a specified set of Tcl commands whenever a variable is accessed
unknown	    ;# Handles any unknown command. (The Tcl interpreter calls this command whenever it encounters any unknown command.)
unset	    ;# Removes the definition of one or more variables
uplevel	    ;# Executes a script in a different context
upvar	    ;# References a variable outside a procedure. (This is used to implement the pass-by-reference style of procedure call, in which changing a procedure argument changes the original copy of the argument.)
while	    ;# Implements a while loop that executes a set of Tcl commands repeatedly, as long as an expression evaluates to a nonzero value (true)
