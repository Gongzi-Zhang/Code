# list is a vector of vector
l <- list("Red", "Green", c(22,32,11), TRUE, 51.23, 119.1) 
print(l)
#   [[1]]
#   [1] "Red"
#   
#   [[2]]
#   [1] "Green"
#   
#   [[3]]
#   [1] 21 32 11
#   
#   [[4]]
#   [1] TRUE
#   
#   [[5]]
#   [1] 51.23
#   
#   [[6]]
#   [1] 119.1

# naming a list, and then the list can be accessed using these names
names(l) <- c("char1", "char2", "vector", "logical", "numeric1", "numeric2")

print(l[1]) # accessing list with indexing
print(l$char1)	# access the list element using the name of the element

# Manipulation
# we can add, delete and update list elements 'only' at the end of a list.???
#> But we can update any element.
list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2), list("green",12.3))
names(list_data) <- c("1st Quarter", "A_Matrix", "A Inner list")

# add element
list_data[4] <- "New element"
# remove element
list_data[4] <- NULL
# update
list_data[3] <- "updated element"

## merging list
list1 <- list(1,2,3)
list2 <- list("Sun", "Mon", "Tue")
merged.list <- c(list1, list2)	# list(1,2,3,"Sun","Mon","Tue")

## convert list to vector.  What if list is composed of different data type ???
v1 <- unlist(list1)

x <- list(a=rnorm(200, mean=1, sd=10),
	  b=rexp(300, 10.0),
	  c=as.factor(c('a', 'b', 'b', 'b', 'c', 'c')))
lapply(x, summary)  # list apply function, return a list

x <- list(a=rnorm(8, mean=1, sd=10), b=rexp(10,10.0))
val <- lapply(x, mean)
typeof(val) # list
other <- sapply(x, mean)    # same as laaply, but return a vector
typeof(other)	# double
