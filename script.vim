#!/usr/bin/env vim -S

echo "this is a Vim script"
quit

" variables "
let var = value
unlet[!] var;	" with [!], no error message
" comparison ( return 1 if succeeds and 0 if failed)
var == var	" equality
var != var	" inequality
var < var	" less than
var <= var	" less than or equal to 
var > var	" greater than
var >= var	" greater than or equal to 
string =~ "pattern"	" match of regular expression
string !~ pattern	" not match
" string specific
string ==? string	" equal,ignore case
string ==# string	" equal, case must match
string !=? string	" not equal, ignore case
string !=# string	" not equal,case must match

"" optional variables
&ft	" filetype
&t_Co	" terminal color
""""""""""""""""""""""""""""""""""""""""""""



" control statement "
if condition
   "statement
   "statement
elseif condition
   "statement
   "statement
else
   "statement
   "statement
endif

while counter < 30
   let counter = counter + 1
	" Do something
endwhile

while counter < 30
   if skip_flag
	continue
   endif
   if exit_flag
	break
   endif
   "Do something
endwhile
""""""""""""""""""""""""""""""""""""""""""""



" function "
function[!] {name}({var1},{var2},...) [range] [abort]
   DO something                       
   return var
endfunction					
"-- function name must begin with a captial letter. 
"-- if "!" after function, then, it will silently override any previously 
"   defined function of same name.
"-- by putting the range keyword after the function definition, the 
"   function is considered a "range" function. And a:firstline and a:lastline
"   refer to the first and last line in the range. 
"-- if the word "abort" follows the function definition, the function 
"   aborts on the first error.
"-- the ellipsis "..." in function's argument defines a function that must
"   have n arguments(the number of arguments that are listed, which is 2 in 
"   the above e.g.), and have up to 20 additional arguments, which are 
"   referred to as a:1, a:2( the first, second optional argument) and a:0
"   refer to the number of optional arguments
""""""""""""""""""""""""""""""""""""""""""""



" debugging script "
debug call Myfunction()

