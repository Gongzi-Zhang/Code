#!/bin/bash

function help {
    echo 
    echo -ne "\e[1m Syntax: \e[21m"
    echo "$(basename $0 --option)"
}

if [ $# -gt 0 ]; then
    opts=`getopt -o hv --longoptions help,version -- "$@"`
    [ $? != 0 ] && echo "Fail to parse options." >&2 && help && exit $ERR_OPT
    while true; do
	case "$1" in
	    -v|--version)
		do_something;
		shift;;
	    -h|--help)
		help
		exit 0;;
	    --)
		shift
		break;;
	    *)
		break;;
	esac
    done
fi
