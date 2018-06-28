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

# range
echo {23..45}	# 23 24 25 26 27 ... 41 42 43 44 45


# Parameter Expansion
'$ or ${'

# Command Substitution
'${ or `'

# Arithmetic Expansion
'$((' 

