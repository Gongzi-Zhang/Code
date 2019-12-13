#!/usr/bin/tclsh


# system related commands
pid	;# return pid of current script
cd [dir.]   ;# change to dir., if no dir is given, go to $HOME
pwd

# interpreter
info commands [pattern]	;#  returns a list of commands, both internal commands and procedures that match pattern
info exists var		;# returns 1 if var exist, otherwise 0
info functions [pattern];# returns a list of the math funcitons available via the expr command that match pattern
info globals [pattern]	;# returns a list of global var that match pattern
info locals [pattern]	
info procs [pattern]	
info vars [pattern]	;# returns a list of the local and global var that match pattern

info nameofexecutable	;# path to tclsh
info tclversion
info patchlevel
info cmdcount		;# number of commands that have been executed by this interpreter
info level [number]	;# returns the stack level at which the compiler is currently evaluating code. 0 is the top level, 1 is a proc called from top, 2 is a proc called from a proc...
    # if number is positive, then this command returns the name and arguments of the proc at that level on the stack.
    # if number is negative, then it refers to the current level plus number and then returns the name and arguments of the proc at that level
info script		;# returns the name of the file currently being evaluated; if no file, returns empty string

## info of process
info args procName	;# returns a list of the names of the arguments to the proc
info body procName	
info default procName arg varName   ;# returns 1 if the argument arg in proceduce procName has a default value, and sets varname to the default; otherwise returns 0
info complete "string"	;# returns 1 if string has no unmatched brackets, braces or parentheses; otherwise returns 0


# execute other program
open	    ;# run a new program with I/O connected to a fd
exec	    ;# run a new program as a subprocess

##  The open call is the same call that is used to open a file. If the first character in the file name argument is a "pipe" symbol (|), then open will treat the rest of the argument as a program name, and will run that program with the standard input or output connected to a file descriptor. This "pipe" connection can be used to read the output from that other program or to write fresh input data to it or both
##  If the "pipe" is opened for both reading and writing you must be aware that the pipes are buffered. The output from a puts command will be saved in an I/O buffer until the buffer is full, or until you execute a flush command to force it to be transmitted to the other program. The output of this other program will not be available to a read or gets until its output buffer is filled up or flushed explicitly.

open |programName [access]  ;# returns a fd for the pipe, if programName is enclosed in quotes or braces, it can include arguments
exec [switches] arg1 [arg2] ... [argN]


# example
set TMPDIR "/tmp"
if { [info exists ::env(TMP)] } {
    set TMPDIR $::env(TMP)
}
set tempFileName "$TMPDIR/invert_[pid].tcl"

# Open the output file, and write the program to it
set outfl [open $tempFileName w]

puts $outfl {
    set len [gets stdin line]
    if {$len < 5} {exit -1}

    for {set i [expr {$len-1}]} {$i >= 0} {incr i -1} {
        append l2 [string range $line $i $i]
    }
    puts $l2
    exit 0
}

# Flush and close the file
flush $outfl
close $outfl

#
# Run the new Tcl script:
#
# Open a pipe to the program (for both reading and writing: r+)
#
set io [open "|[info nameofexecutable] $tempFileName" r+]

#
# send a string to the new program
#     *MUST FLUSH*
puts $io "This will come back backwards."
flush $io

# Get the reply, and display it.
set len [gets $io line]

puts  "To reverse: 'This will come back backwards.'"
puts "Reversed is: $line"
puts "The line is $len characters long"

# Run the program with input defined in an exec call

set invert [exec [info nameofexecutable] $tempFileName << \
       "ABLE WAS I ERE I SAW ELBA"]

# display the results
puts "The inversion of 'ABLE WAS I ERE I SAW ELBA' is \n $invert"

# Clean up
file delete $tempFileName
