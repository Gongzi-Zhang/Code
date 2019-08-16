#!/usr/bin/tclsh

puts "Hello World!";	# comments
puts "Hello World!"	# (note the semicolon) this is wrong, can't start comment  within a command
# If you put comments at the end of a Tcl command, remember to precede the pound sign (#) with a semicolon (;).

set word "Hello World"
puts $word
puts [set word]		;# w/o a new value, set return the value of its argument; so this equals to puts $word

set cmd expr
set x 11
$cmd $x*$x

### command substitution
set a 44
set b [expr $a*4]
set c "$a + $b is [expr $a + $b]"   ;# 44 + 176 is 220
set d {$a + $b is [expr $a + $b]}   ;# no substitution: $a + $b is [expr $a + $b]
# control flow
## if..elseif..else
if { expression } {
    ...
} elseif {
    ...
} else {
    ...
}

## while
while { expression } {
    ...
}

set i 0
set sum 0
while { 1 } {
    incr i		    ;# increment i
    if {$i == 5} {continue} ;# skip i==5
    if {$i > 10} {break}    ;# end loop
    set sum [expr $sum + $i]
}
puts "Sum = $sum"

## for
for {expr1} {expr2} {expr3} {
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
    switch -exact -- $cmd {
	quit	{puts "Bye!"; exit}
	start	{puts "Start"}
	stop	{puts "Stop"}
	draw	{puts "Drawing"}
	default	{puts "Unknown command: $cmd"}
    }
    puts -nonnewline "$prompt"; flush stdout
}



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


# procedure
proc total items {
    set sum 0
    foreach i $items {
	set sum [expr $sum + $i]
    }
    return $sum
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

## command line arguments
foreach f $argv {
    puts -nonewline stdout [read stdin]
    puts stderr $argc
    puts $argv
}
## global command
proc func arg1 {
    global theCanvas	;# make a global variable visible inside the procedure
}


