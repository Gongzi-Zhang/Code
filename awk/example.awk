#!/bin/awk -f
# what's the -f mean ??

BEGIN { print "Hello World !"}




# one line command
awk 'NR % 2' data   # print even lines
awk 'NR % 2 == 1' data	# print odd lines

# When FS=" ", awk will first strip leading and trailing whitespace.
echo '    a b c d ' | awk '{ print; $2 = $2; print }'
echo ' a b c d ' | awk '{print $2}'	# b
echo ' a b c d ' | awk 'BEGIN{ FS = "[ \t]+" }
			     { print $2 } '    # a

# using fix width ( assigning a string containing space-separated 
# numbers to the built-in variable FIELDWIDTHS )
w | awk ' BEGIN { FIELDWIDTHS = " 9 6 10 6 7 7 35" }
	  NR > 2{
	      idle = $4
	      sub(/^ */, "", idle)  # strip leading spaces
	      if(idle == "")
		  idle = 0
	      if(idle ~ /:/){
		  split(idle, t, ":")
		  idle = t[1] * 60 + t[2]
	      }
	      if (idle ~ /days/)
		  idle *= 24*60*60
	      print $1, $2, idle
	  }


# regular expression constants
# a regular constant is a regular description enclosed in slashes.
/foo/ ~ $1 actually means ($0 ~ /foo/ ) ~ $1
# first match the input record against the regexp /foo/. The result
# will be either zero or one. Then match the result against the first
# field in the record.
matches = /foo/	# matches will be assigned either 0 or 1
