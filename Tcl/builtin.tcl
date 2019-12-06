puts		;# emits a newline by default
set
catch		;# catch possible error
error

source
expr
exec
eval
subst
unset
upvar
uplevel

open
file
fileevent
glob
gets		;# read a line
read            ;# read the whole file or specified block size
eof
close

string
regexp
regsub
split 
join
lindex
lrange
lappend
append
lsort

incr x
incr x -1

array

regsub

proc
label
return

time script [count] ;# Returns the number of milliseconds it took to execute script. If count is specified, it will run the script count times, and average the result. The time is elapsed time, not CPU time
clock format [file mtime $file] -format %x

# global variables: info globals
argc		;# command line input arguments
argv
env		;# an associative array contains the ENV variables
errorInfo	;# 
errorCode
