#!/bin/bash

############################################
# brackets in bash: (), [], {}
############################################


############################################
# (single parenthese)
## subshell
a=outside
( a=inside; echo $a )	# run command inside a subshell
echo $a	# outside; the assignment within a subshell in clean-up


## declaring arrays
fruits=(apple banana pear)
echo ${fruits[2]}   # 0-based pear


#################################
# <(angle parenthese)
## process substitution: used it anywhere a file argument is expected
#??? does it run inside a subshell???
sort -nr -k 5 <( ls -l /bin ) <( ls -l /usr/bin ) <(ls -l /sbin )
comm -12 <( sort file1 ) <( sort file2 )

#################################
# $(dollar single parenthese)
## string substitution: run inside a subshell
a=5
b=$( a=1000; echo $a )
echo $b	    # 1000
echo $a	    # 5

#################################
# $(dollar single parenthese dollar Q)$?
## instead of interpolating the result, this expression give out the exit code
### chicken ribs: just another expr. of $?


############################################
# ((double parenthese))
## integer arithmetic: assignment, logical and methemtical operations
i=4
(( i += 3 ))
echo $i	    # 7
(( 4 + 8 )) # no output
echo $?	    # 0
(( 5 - 5 ))
echo $?	    # 1
(( i += strings ))  # strings inside regarded as 0
echo $i	    # 7

# can't use it in an expr.
a=(( 4 + 1 ))	# syntex error

#################################
# $((dollar double parenthese))
## arithmetic interpolation: so we can get soem result
a=$(( 16 + 2 ))
a=(( 16 + 2 ))	# syntax error: compared to this one
b=$(( a *= 2 ))	# the output is the last calculated value


############################################
# [single square brackets]
# [[double square brackets]]
## they do almost the same, one difference is that [[]] doesn't do word splitting or filename expansion
[[ -f *.txt ]]	# *.txt will not expand to real txt filename
[ -f *.txt ]	# filename expansion will be done here

## [[]] support extended regex
pie=good
[[ $pie =~ d ]]; echo $?


############################################
# {single curly braces}
## brace expansion
echo h{a,e,i,o,u}p  # hap hep hip hop hup
echo h{a, e, i, o, u}p	# h{a, e, i, o, u}p: absolutely no space inside the {}
echo {01..10}
echo {01..10..3}

## grouping commands
[[ "$1" == secret ]] && {echo a; echo b}


############################################
# ${dollar single curly braces}
## variable manipulation
name=$1
echo ${name:-$( whoami )}   # default value
echo ${name^^a}	# uppercase matching letters
echo ${name:2:5}    # slice of a string: ${var:start:length}
echo ${name/http/ftp}	# replace pattern (only once)
echo ${name//[aeiou]/X}	# global replacement
x=name
echo ${!x}  # indirect reference


############################################
# <<double angle heredocs
## use a dash after the arrows to suppresses any leading tabs (not spaces)
cat <<-END
	two leading tabs
    one leading tabs
  two spaces
END
echo $cat
#two leading tabs
#one leading tabs
#  two spaces
