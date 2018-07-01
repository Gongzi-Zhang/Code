#!/bin/awk

# functions in awk


# Numeric functions
## absolute value
### there is no abs func in awk, so we can create a personal one:
func abs(x) { return (x<0) ? -x : x }



# trap
getline
print "when using getline, always remember to check its return value."
print "when use getline in a while loop, if getline encounter the 
       last line of the file, it will return 0 and don't change 
       current $0 value, if you check upon the $0 only, you will 
       fall into infinity loop."

# wrong example
{
    getline
    while(NF > 0){
#	do something here
	getline	# here, if you get end of file, you will fall into 
		# infinite loop.
    }
}
