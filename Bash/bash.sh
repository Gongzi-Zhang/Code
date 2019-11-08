#!/bin/bash

############################################
# explain how bash work: expansion and substition order
############################################

# expansion: 
## Only brace expansion, word splitting, and filename expansion can increase the number of words of the expansion; other expansions expand a single word to a single word. The only exceptions to this are the expansions of "$@" and $* (see Special Parameters), and "${name[@]}" and ${name[*]} 
## 1. brace expansion
## 2. tilde expansion
## 3. parameter and variable expansion
## 4. arithemetic expansion
## 5. command substition (left-to-right)
## 6. word splitting
## 7. filename expansion

## 3. parameter and variable expansion
### undefined parameters
[ -z $var ] && echo true  ==>  [ -z ] && echo true
[ -n $var ] && echo true  ==>  [ -n ] && echo true
[ -z "$var" ] && echo true  ==> [ -z "" ] && echo true
[ -n "$var" ] && echo true  ==> [ -n "" ] && echo true

## 6. word splitting
### IFS: internal field separator, it determine how to do word splitting
string="foo:bar baz rab"
for word in $string; do echo "$word"; done
# food:bar
# baz
# rab
IFS=:
for word in $string; do echo "$word"; done
# foo
# bar baz rab

### the first char. of IFS is special: which is used to delimit words in the output when using the special $* variable
set w x y z
IFS=":-;"; echo "$*"	# w:x:y:z
IFS="-:;"; echo "$*"	# w-x-y-z
#### whitespace in IFS: when IFS includes whitespace char. the leading and trailing whitespace is stripped from the string to be split before processing it and a sequence of consecutive whitespace char. delimits as well
