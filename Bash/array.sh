############################################
# indexed array
array=( hello world )
echo ${array[0]}    # 0-based: hello

# associative array
declare -A array=( [a]=hello [b]=world )
echo ${array[a]}
array[new]=new_value

array=( [0]=Bob [10]=Peter [20]="$USER" [21]="Big John" )   # with user-customized index
array[30]="Rom"
echo ${array[30]}
unset 'array[20]'   # quote the square braket, otherwise it may be regarded as a filename glob: array20

######################
## index
echo ${!array[@]}   # expand into a list of the indices of the array, if the indices are used customized, then they will be shown as they are; otherwise will be sequential numbers: 0 1 2 ...
array=${array[@]}   # recreate the indices

### iterate over an associate array
for i in "${!array[@]}"; do	# note the use of quotes around the variable, this is necessary in case any keys include spaces
    echo "$i: ${array[$i]}"
done

#################################
# nested array
declare -A a2=( [x]=a [y]=b )
echo ${array[${a2[x]}]}	    # hello
var=x
echo ${array[${a2[$var]}]}  # hello
# to as many layer as you wanted

#################################
# IFS: field seperator; bash use it to split the array strings
grades_string='A;B;C;D;E;F'
IFS=';'
grades=($grades_string)
echo ${grades[1]}   # B


############################################
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

############################################
# example
## array of files
files=(*)   # glob pattern
files={~/*.jpg}	# tilde expansion
files=$(ls) # bad, this just create a string, not an array
files=($(ls))	# still bad; this does create an array, but the result of ls is substituted to word splitting (space delimited)

# multi-dim array
## bash doesn't support multi-dim array in nature, so if you need multi-dim array, it means you need some high level language
## one possible walk around is:
declare -A arr	# must be
arr[0,0]=0
arr[0,1]=1
arr[1,0]=2
arr[1,1]=3
echo ${arr[0,0]} ${arry[0,1]}	# 0 1
# if arr is not declared as associative array, then the index expression will be evaluated (comma expression), result in 2 and 3
# assume no declaration
arr[0,0]=0  ==> arr[0]=0
arr[0,1]=1  ==> arr[1]=1
arr[1,0]=2  ==> arr[0]=2    # overwrite previous assignment
arr[1,1]=3  ==> arr[1]=3
echo ${arr[0,0]}    ==> ${arr[0]}   # 2

