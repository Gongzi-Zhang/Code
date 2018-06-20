#!/bin/bash

##################################################
#
# Bash scripting 
#
##################################################

########## Variables ##########
var=value
unset var


########## Flow ##########

# case
case $DEV in
    /dev/nbd*|/dev/nd[a-z]*)
	echo "$DEV"
	;;
esac

# for
for i in {23..45}; do
    echo $i
done
unset i	# !!!
