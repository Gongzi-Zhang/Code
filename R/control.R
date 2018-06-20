help(Control)
# repeat
repeat {
    commands
    if(condition) {
	break
    }
}

# for statement
for (value in vector) {
    statements
}

# next
v <- LETTERS[1:6]
for ( i in v) {
    if (i == "D") {
	next
    }
    print(i)
}


# switch: if the result of the expression is a number, then it returns the
# item in the list with the same index
x <- as.integer(2)
z <- switch(x, 1, 2, 3, 4, 5)	# 2
x <- 3.5
z <- switch(x, 1, 2, 3, 4, 5)	# 3
## if the result of the expression is a string, then switch should be in the
## form "valueN" = resultN
y <- rnorm(5)
x <- "sd"
z <- switch(x, "mean"=mean(y), "median"=median(y), "variance"=var(y), "sd"=sd(y))
