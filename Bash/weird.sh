#!/bin/bash

### If var is undefined, then the following two statement has the same result: true
[ -z $var ] && echo "true"
[ -n $var ] && echo "true"  ==>  [ -n ] && echo "true"
### the correct way to do it will be:
[ -z "$var" ] && echo "true"	# true
[ -n "$var" ] && echo "true"    # nothing
