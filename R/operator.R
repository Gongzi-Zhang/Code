# operator in R
# arithmatic operators
v <- c(2, 5.5, 6)
t <- c(8, 3, 4)
print(v/t)	# 0.250000 1.833333 1.50000
print(v%%t)     # 2.0 2.5 2.0
print(v%/%t)	# 0 1 1

# & | !	: element-wise logical operator
# xor(a, b) : exclusive or, element wise
# && || : object wise logical operator-depend only on the first element

# Miscellaneous
# : range operator
v <- 2:8    # 2 3 4 5 6 7 8
# %in%	whether an element belongs to a vector
print(9 %in% 1:10)    # TRUE
print(19 in 1:10)    # FALSE
# %*% matrix multiply
M = matrix( c(2, 6, 5, 1, 10, 4), nrow = 2, ncol = 3, byrow = TRUE)
t = M%*%t(M)

a <- c(1, 2, 3, 4)
sqrt(a)	# 1.000000 1.414214 1.732051 2.000000
exp(a)	# 2.718282 7.389056 20.085537 54.598150
log(a)	# 0.0000000 0.6931472 1.0986123 1.3862944
exp(log(a)) # 1 2 3 4

a <- c(1 ,-2, 3, -4)
b <- c(-1, 2, -3, 4)
min(a, b)   # -4
pmin(a, b)  # -1, -2, -3, -4

mean(a)
median(a)
quantile(a)
min(a)
max(a)
sum(a)
var(a)
sd(a)

a <- c(2, 4, 6, 3, 1, 5)
b <- sort(a)	# 1 2 3 4 5 6
c <- sort(a, decreasing = TRUE)	# 6 5 4 3 2 1
