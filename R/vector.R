# vector is the most basic object in R, even when you write just one value in R, it becomes a vector of length 1
apple <- c(1)	# c: combine

# mixed type in a vector
# usually, vector is a set of same type elements. If they are created with different type, type will be converted automatically.
v <- c(5, TRUE)	# Logical changed to Numeric
print(v)    #[1] 5 1

v <- c('apple', 'red', 5, TRUE)	# the Logical and Numeric converted to char
print(v)    #[1]"apple" "red" "5" "TRUE"
rm(v)	# rm a vector

## Accessing vector elements

t <- c("Sun", "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat")
#1: position index, begin from 1
u <- t[c(2,3,6)]    #[1] "Mon" "Tue" "Fri"
#2: using logical indexing
v <- t[ c(TRUE, FALSE, FALSE,FALSE,FALSE,TRUE,FALSE) ]	# [1] "Sun" "Fri"
#3: negative indexing
x <- t[c(-2,-5)] #  [1] "Sun" "Tue" "Wed" "Thurs" "Fri" "Sat"	: remove 2,5 element
#4: using 0/1 indexing
y <- t[ c(0,0,0,0,0,0,1) ] # "Sun" 
y <- t[ c(0,0,0,0,0,0,1,1,1) ] # "Sun" "Sun" "Sun" 
y <- t[ c(0,0,0,0,0,0,1,2) ] # "Sun" "Mon" 

a <- c(6, 2, 5, 3, 8, 2)
b <- a[a<6] # 2 5 3 2

d <- data.frame(one = as.factor(c('a', 'a', 'b', 'b', 'c', 'c')),
	       two = c(1, 2, 3, 4, 5, 6))
both <-	d$two[(d$one == 'a') | (d$one == 'b')]	# 1 2 3 4

## Arithmetic
#+ vector element recycling:
#+ If we apply arithmetic operations to two vectors of unequal length, then the elements of the shorter vector are recycled to complete the operations.
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)
add <- v1+v2	# V2 becomes c(4,11,4,11,4,11)
print(add)  # [1] 7 19 8 16 4 22

## sorting
sort(v)
sort(v, decreasing = TRUE)  # reverse order

