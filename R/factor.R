# factors are the r-objects which are created using a vector. Factors in R are
# stored as a vector of integer values with a corresponding set of character
# values(labels) to use when the factor is displayed.

# Both numeric and char variables can be made into factors, but a factor's
# levels will always be char values. Use 'levles' command to check for the
# levels of a factor

data <- c(1, 2, 2, 3, 1, 2, 3, 3, 1, 2, 3, 3, 1)
fdata <- factor(data)
fdata
# [1] 1 2 2 3 1 2 3 3 1 2 3 3 1 
# Levels: 1 2 3
rdata <- factor(data, labels=c("I", "II", "III"))
rdata
# [1] I II II III I II III III I II III III I
# Levels: I II III
levels(fdata) <- c('I', "II", "III")
fdata
# [1] I II II III I II III III I II III III I
# Levels: I II III

fert <- c(10, 20, 20, 50, 10, 20, 10, 50, 20)
fert <- factor(fert, levels=c(10, 20, 50), ordered=TRUE)
fert
# [1] 10 20 20 50 10 20 10 50 20
# Levels: 10 < 20 < 50
mean(fert)  # NA
mean(as.numeric(levels(fert)[fert]))
#> indexing the return value from the levels function is the most reliable way
#> to convert numeric factors to their original numeric values.

# When a factor is first created, all of its levels are stored along with the
# factor, and if subsets of the factor are extracted, they will retain all of
# the original levels.
lets = sample(letters,size=100,replace=TRUE)
lets = factor(lets)
table(lets[1:5])

# a b c d e f g h i j k l m n o p q r s t u v w x y z
# 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 1

# Care must be taken when combining variables which are factors, because the c
# function will interpret the factors as integers. To combine factors, they
# should first be converted back to their original values (through the levels
# function), then catenated and converted to a new factor

# 'cut' function can be used to convert a numeric variable into a factor.
wfact <- cut(women$weight, breaks=3)	# 3 intervals


# generating factor levels
gl(n, k, labels)
#> n: gives the number of levels
#> k: gives the number of replications
#> labels: a vector of labels for the resulting factor levels
v <- gl(3, 4, labels = c("Tampa", "Seattle", "Boston"))
print(v)    # Tampa Tampa Tampa Tampa Seattle Seattle Seattle Seattle Boston Boston Boston Boston


# factors in data frame
## on creating any data frame with a column of text data, R treats the text
## column as categorical data and creates factors on it.
height <- c(132, 151, 162, 139, 166, 147, 122)
weight <- c(48, 49, 66, 53, 67, 52, 40)
gender <- c("M", "M", "F", "F", "M", "F", "M")
data <- data.frame(height, weight, gender)
print(is.factor(data$gender))	# TRUE
data$weight <- factor(data$weight)  # convert numeric column into factor
print(data$gender)
# M M F F M F M
# Levels: F M


# changing the order of levels
data <- c("East", "West", "East", "North", "North", "East", "West", "West", "West", "East", "North")
factor_data <- factor(data)
print(factor_data)  # Levels: East North West
new_order_data <- factor(factor_data, levels = c("East", "West", "North"))
print(new_order_data)	# Levels: East West North
