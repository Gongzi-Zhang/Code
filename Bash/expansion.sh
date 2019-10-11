#!/bin/bash

#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
#
# filename expansion
#
#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
ls abc[234] # abc2 | abc3 | abc4
ls file[a-z] # filea | fileb ... | filey | filez
# note that only the 'leading' tilde ~ will be expanded

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# brace expansion
echo {23..45}	# 23 24 25 26 27 ... 41 42 43 44 45
echo {a..z}
echo hell{i,o}world   # helliworld helloworld
mkdir /home/user/{old,new,dist,bugs}
chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}} # nested brace
echo {0..2}{0..2}{0..2}	# 000 001 002 010 ... 220 221 222


# Parameter Expansion
'$ or ${}'
## indirect parameter expansion
a=hello
b=a
echo ${b}	# a
${!b}           # hello
${!a}		# nonthing -- $hello is not defined
## this also works for associative array

# Command Substitution
'${} or ``'
fun=echo
$fun hello
local a, b=a
$b=c	    # error, command a=c not found
eval $b=c   # a=c

# Arithmetic Expansion
'$(())' 

# Variable Expansion

## escape happen before variable expansion
a='"'
a="ab$a"
echo $a	    # ab"


