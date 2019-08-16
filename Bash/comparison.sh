#!/bin/bash

if [ -f $file ]; then
    ...
fi

if test -n $file; then
    ...
fi

if [ -f "$file1" ] && [ -f "$file2"]; then
    ...
fi

if [[ "$1" == \~* || "$2" == *-* ]]; then
    ...
fi
 
if [ -z $a -a -z $b ]; then	# and
    ..
fi

if [[ $option =~ (\[((no|dont)-?)\]). ]]; then
    ...
fi

! [ $((--i)) -ge 0 ] && echo "Error"
! [[ "$first" == "$second" ]] || echo False
[[ ! "$file" =~ ^_.* ]] && echo true

