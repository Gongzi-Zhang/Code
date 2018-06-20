# statistic functions
mean(x, trim = 0, na.rm = FALSE, ...)
#> trim is used to drop some observations from both end of the 'sorted' vector,
#>> when trim = 0.3, 3 values from each end will be dropped.
#> na.rm is used to remove the missing values from the input vector.
x <- c(12, 7, 3, 4.2, 18, 2, 54, -21, 8, -5)
mean(x) # 8.22
mean(x, trim = 0.3) # 5.55
x <- c(12, 7, 3, 4.2, 18, 2, 54, -21, 8, -5, NA)
mean(x)	# NA
mean(x, na.rm = TRUE)	# 8.22

median(x, na.rm  = FALSE)
# Mode: the value that has highest number of occurences in a set of data,
## unlike mean and median, mode can have both numeric and char data
getmode <- function(v) {
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
}
sum(41:68)  # 1526
sd(x, na.rm = TRUE) # standard deviation

a <- pi
a <- log(4) # 1.386294
a <- exp(2) # 7.389056

