* everything is a string in Tcl / everything is a command in Tcl
    -- incr just expects a var to be set to a string that looks loke an integer
* substitution: 
    substitution is a one-step process; one needs an explicit subst, eval or the like to do more than one round of substitution.
    variable substitution
    backslash substitution
    command substitution
  > double quotes: all types of substitution still take place.
  > square brackets: [ expression ] will be replaced with the return value of expression inside the square brackets.
  > curly brace: tcl doesn't perform any substitution when you group words with braces.
