#!/bin/bash

DIR="${BASH_SOURCE%/*}"	# use $BASH_SOURCE rather than $0, in case of invoking script by source 
if [ ! -d "$DIR" ]; then
    DIR="$PWD"
fi
source "$DIR/TERM_Format.sh"
