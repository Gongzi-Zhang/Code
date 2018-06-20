matrix(data, nrow, ncol, byrow, dimnames)
#> data: input vector which becomes the data elements of the matrix
#> dimnames: is the names assigned to the rows and columns

rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")
M = matrix(c(3:14), nrow=4, byrow=TRUE, dimnames = list(rownames, colnames))
M[row, column]	# access element in [row, column]
M[2,]	# 2nd row 
M[,3]   # 3rd column
colnames(M) <- c('A', 'B', 'C')	# reset column names
rownames(M) <- c('rA', 'rB', 'rC', 'rD')

# matrix operation. element-wise
