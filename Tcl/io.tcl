#!/usr/bin/tclsh

puts -nonewline "Enter version number: "    ;# by default, puts will append a trailing newline (\n) to its output
set version [gets stdin]	;# read stdin
fconfigure $channel [param1] [value1] [param2] [value2]	;# configure the behavior of a channel


# file io


# socket
socket -server command [options] port	;# The socket command with the -server flag starts a server socket listing on port port. When a connection occurs on port, the proc command is called with the arguments:
# *: channel - The channel for the new client
# *: address - The IP Address of this client
# *: port    - The port that is assigned to this client
socket [options] host port  ;#  opens a client connection to the system with IP Address host and port address port
fileevent $channelID readable [script]
fileevent $channelID writeable [script]	;# The fileevent command defines a handler to be invoked when a condition occurs. The conditions are readable, which invokes script when data is ready to be read on channelID, and writeable, when channelID is ready to receive data. Note that end-of-file must be checked for by the script.
vwait varName	;# The vwait command pauses the execution of a script until some background action sets the value of varName. A background action can be a proc invoked by a fileevent, or a socket connection, or an event from a tk widget.

# example
proc serverOpen {channel addr port} {
    global connected
    set connected 1
    fileevent $channel readable "readLine Server $channel"
    puts "OPENED"
}

proc readLine {who channel} {
    global didRead
    if { [gets $channel line] < 0} {
	fileevent $channel readable {}
	after idle "close $channel;set out 1"
    } else {
	puts "READ LINE: $line"
	puts $channel "This is a return"
	flush $channel;
	set didRead 1
    }
}

set connected 0
# catch {socket -server serverOpen 33000} server
set server [socket -server serverOpen 33000]

after 100 update

set sock [socket -async 127.0.0.1 33000]
vwait connected

puts $sock "A Test Line"
flush $sock
vwait didRead
set len [gets $sock line]
puts "Return line: $len -- $line"

catch {close $sock}
vwait out
close $server
