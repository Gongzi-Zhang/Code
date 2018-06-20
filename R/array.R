v1 <- c(5, 9, 3)
v2 <- c(10, 11, 12, 13, 14, 15)
a <- array(c(v1, v2), dim = c(3, 3, 2))
# create 2 3*3 matrixes of same value
# , , 1
#	[,1] [,2] [,3]
#[1,]      5   10   13
#[2,]      9   11   14
#[3,]      3   12   15

# , , 2
#	[,1] [,2] [,3]
#[1,]      5   10   13
#[2,]      9   11   14
#[3,]      3   12   15

# naming an array
row.names <- c("row1", "row2", "row3")
col.names <- c("col1", "col2", "col3")
matrix.names <- c("matrix1", "matrix2")
a <- array(c(v1, v2), dim=c(3,3,2), dimnames=list(row.names, col.names, matrix.names))
a[3,,2]	# the third row of the second matrix of the array
a[1,3,1]# the element in the 1st row and 3rd column of the 1st matrix
a[,,2]	# the 2nd matrix

# do calculations across the elements in an array
apply(x, margin, fun)
#> x is an array
#> margin is the name of the data set used, 1 means by row, 2 by column
#> fun is the function to be applied across the elements of the array
result <- apply(a, c(1), sum)
print(result)	# 56 68 60
