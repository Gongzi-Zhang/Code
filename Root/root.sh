#!/bin/bash
############################################
# extract class dependency relationship based on the 
# header files of root system. 
# It doesn't solve cyclic dependency
#   -- 2019.08.13
############################################

INCLUDE='/usr/local/root/root-6.16.00-install/include/'
TEMPDIR=".tmp/"
if [ -d "$TEMPDIR" ]; then
    echo "tmp dir $TEMPDIR exist"
    exit 1
fi

declare -a classes
declare -a dirs
function extract {
    [[ $# -eq 0 ]] && return 1

    local input=$1
    input=${input#\"}
    input=${input%\"}
    input=${input##*/}	# remove prefix dir.
    local header=$(find "$INCLUDE" -name "$input" -printf '%P')
    [ -z "$header" ] && header=$(find "$INCLUDE" -name "$input.h" -printf '%P')  # try .h suffix
    [ -z "$header" ] && header=$(find "$INCLUDE" -name "$input.hxx" -printf '%P')  # try .hxx suffix
    [ -z "$header" ] && return 2    # header file not found
    local class=${header%.h*}	# if I don't use local here, I may trap into infinite loop in line: 40-42
    if [ ! -f "$class" ]; then
        local dir
        if [[ "$class" == */* ]]; then
            dir=${class%/*}
            if [ ! -d "$dir" ]; then
	       	mkdir -p "$dir"	
		dirs+=("$dir")
	    fi
        fi
        touch "$class"
	classes+=( "$class" )
	echo "$class" >> "$class"

	local dependence=$(grep '#include' "$INCLUDE/$header" | grep '".*"' | cut -d' ' -f2)
	if [ -n "$dependence" ]; then
	    local i
	    for i in $dependence; do
		extract $i
		local child_class=${i%.h*}
		child_class=${child_class#\"}
		# echo -e "$child_class\n"
		IFS=$'\n'
		while read line; do 
		    echo "  |-$line" >> "$class"
		done < "$child_class"
	    done
	fi
    fi
}

mkdir "$TEMPDIR"
pushd "$TEMPDIR" > /dev/null
extract $1
if [ $? -eq 2 ]; then
    echo "Class $1 no found"
    exit 1
fi
cat ${classes[0]}
nclass=${#classes[@]}
for (( i=0; i<nclass; i++ )); do
    rm "${classes[i]}"
done
ndir=${#dirs[@]}
for (( i=0; i<ndir; i++ )); do
    rmdir "${dirs[i]}"
done
unset classes
unset dirs
popd > /dev/null
rmdir "$TEMPDIR"
