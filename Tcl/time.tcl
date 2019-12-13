clock seconds	;# seconds since the epoch
clock format clockValue [-gmt boolean] [-format string]	;# gmt: Greenwish Mean Time
clock scan dateString -option value ...	;# converts a buman readable string to a system clock value

# example
set systemTime [clock seconds]

puts "The time is: [clock format $systemTime -format %H:%M:%S]"
puts "The date is: [clock format $systemTime -format %D]"
puts [clock format $systemTime -format {Today is: %A, the %d of %B, %Y}]
puts "\n the default format for the time is: [clock format $systemTime]\n"

set halBirthBook "Jan 12, 1997"
set halBirthMovie "Jan 12, 1992"
set bookSeconds [clock scan $halBirthBook -format {%b %d, %Y}]
set movieSeconds [set movieSeconds [clock scan $halBirthMovie -format {%b %d, %Y}]]
