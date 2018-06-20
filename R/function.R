# built-in functions
seq(22, 34) # 22 23 24 ... 32 33 34
seq(-20, 20, by = .2)

is.vector(v)
is.matrix(m)
is.list(l)
is.array(a)
is.factor(f)
is.data.frame(d)
is.table(t)


paste(..., sep=" ", collapse=NULL)  # paste strings into one.
#> collapse is used to eliminate the space in between two strings.
format(x, digits, nsmall, scientific, width, justify=c("left", "right", "centre", "none"))
## Format treats everything as a string.
#> x is the vector input
#> digits is the total number of digits displayed(not include point).
#> nsmall is the minimum number of digits to the right of the decimal point
#> scientific: scientific notation
#> width: the minimum width to be displayed by padding blanks in the beginning
nchar(x)    # counting the number of chars including spaces in a string
toupper(x)
tolower(x)
substring(x, first, last)   # extract substring 

sort(x, decreasing = FALSE)


# apply function
## tapply
val <- data.frame(a=c(1,2,10,20,5,50),
		  b=as.factor(c('a', 'a', 'b', 'b', 'a', 'b')))
result <- tapply(val$a, val$b, mean)
typeof(result)	# double

result <- tapply(val$a, val$b, summary)
typeof(result)	# list


# printing
cat("Hello World\n")
print(R-object)
