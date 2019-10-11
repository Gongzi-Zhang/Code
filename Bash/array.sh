# indexed array
array=( hello world )
echo ${array[0]}    # 0-based: hello

array=( [0]=Bob [10]=Peter [20]="$USER" [21]="Big John" )   # with user-customized index
array[30]="Rom"
echo ${array[30]}
unset 'array[20]'   # quote the square braket, otherwise it may be regarded as a filename glob: array20

# $* and $@
### $* creates one argument, while $@ will expand into separate arguments
list=(1 2 "3 4")
j=0
for i in ${list[@]}; do	
# for i in '1' '2' '3 4'; do
    echo "$j: $i"
    let j++
done
# 0: 1
# 1: 2
# 2: 3 4

j=0
for i in "${list[@]}"; do	
# for i in "1" "2" "3 4"; do
    echo "$j: $i"
    let j++
done
# 0: 1
# 1: 2
# 2: 3 4

j=0
for i in ${list[*]}; do  # * will expand an array into a single string with all elements joint together (delimited by space), and then the string is substituted to word splitting
# for i in 1 2 3 4; do
    echo "$j: $i"
    let j++
done
# 0: 1
# 1: 2
# 2: 3
# 3: 4

j=0
for i in "${list[*]}"; do
# for i in "1 2 3 4"; do
    echo "$j: $i"
    let j++
done
# 0: 1 2 3 4


i=0
array[i++]=$i
echo ${array[${#array[@]-1}]}

## index
echo ${!array[@]}   # expand into a list of the indices of the array, if the indices are used customized, then they will be shown as they are; otherwise will be sequential numbers: 0 1 2 ...
array=${array[@]}   # recreate the indices

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

# example
## array of files
files=(*)   # glob pattern
files={~/*.jpg}	# tilde expansion
files=$(ls) # bad, this just create a string, not an array
files=($(ls))	# still bad; this does create an array, but the result of ls is substituted to word splitting (space delimited)
