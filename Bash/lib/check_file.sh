#!/bin/bash

# check input files exist or not, if exist, then ask if he/she would like to remove the existing one.
# if yes, remove it and continue; if not, abort the program.

function check_file(){
    while [ $# -gt 0 ]; do
	file="$1"
	if [ -f "$file" ]; then
	    response="n"
	    read -t 10 -p "Error, file $file already exist, would you like to remove it? [y/n].  " response
	    if [ $? -ne 0 ]; then
		echo "read time out. File $file will be kept."
		return 1
	    fi
	    case "$response" in
		y|Y*)	
		    echo "You choose to remove the existing $file . Remove it now." && rm "$file"
		    ;;
		*)			
		    echo "You don't want to remove the existing one."
		    return 1
		    ;;
	    esac
	fi
	shift
    done
    return 0
}
