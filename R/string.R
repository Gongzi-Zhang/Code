# string Manipulation

## combine strings
paste(..., sep=" ", collapse = NULL)
#   ...:       augrments to be combined
#   sep:       separator
#   collapse:  eliminate the space between two strings, but not the space within two words of one string.

## Format
format(x, digits, scientific, width, justify = c("left", "right", "centre", "none"))
#   x: input
#   digits: total digits, only effective to those with digits more than set.
#   nsmall: the minimum number of digits to the right of the decimal point
#   scientific: scientific notation
#   width:  paading blanks in the beginning
#   justify:

nchar(x)
# counting number of chars in a string.

toupper(x)
tolower(x)

## extracting 
substring(x, first, last)
#   first:  first position
#   last :  last position
strsplit(x,split = "e")	# split x into substrings at the position of letter 'e'

