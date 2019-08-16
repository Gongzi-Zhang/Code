# indexed array
array=( hello world )
echo ${array[0]}    # 0-based: hello

# $* and $@
### $* creates one argument, while $@ will expand into separate arguments
list=(1 2 3)
j=0
for i in ${list[@]}; do	
    echo "$j: $i"
    let j++
done
# 0: 1
# 1: 2
# 2: 3

j=0
for i in ${list[*]}; do  # no quote around list
    echo "$j: $i"
    let j++
done
# 0: 1
# 1: 2
# 2: 3

j=0
for i in "${list[@]}"; do	
    echo "$j: $i"
    let j++
done
# 0: 1
# 1: 2
# 2: 3

j=0
for i in "${list[*]}"; do	# quote around list
    echo "$j: $i"
    let j++
done
# 0: 1 2 3


i=0
array[i++]=$i
echo ${array[${#array[@]-1}]}

# associative array
declare -A array=( [a]=hello [b]=world )
echo ${array[a]}

### iterate over an associate array
for i in "${!array[@]}"; do	# note the use of quotes around the variable, this is necessary in case any keys include spaces
    echo "$i: ${array[$i]}"
done


# nested array
declare -A a2=( [x]=a [y]=b )
echo ${array[${a2[x]}]}	    # hello
var=x
echo ${array[${a2[$var]}]}  # hello
# to as many layer as you wanted
