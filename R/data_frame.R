# create data frame
emp.data <- data.frame(
    emp_id = c(1:5),
    emp_name = c("Rick", "Dan", "Michelle", "Ryan", "Gary"),
    salary = c(623.3, 515.2, 611.0, 729.0, 845.25),
    start_data = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")),
    stringsAsFactor = FALSE
   )

city <- c("Tampa", "Seattle", "Hartford", "Denver")
state <- c("FL", "WA", "CT", "CO")
zipcode <- c(33602, 98104, 06161, 80294)
addresses <- cbind(city, state, zipcode)    # (column) bind to form a data frame
# see rbind below

## Get the structure of the Data Frame
str(emp.data)
summary(emp.data)


## extract data from data frame
result <- data.frame(emp.data$emp_name, emp.data$salary)	# extract columns
result <- emp.data[1:2,]  # extract rows
result <- emp.data[c(3,5), c(2,4)] # extract 3rd and 5th row with 2nd and 4th column


## Add data
emp.data$dept <- c("IT", "Operations", "IT", "HR", "Finance")	# add a new column
emp.newdata <- data.frame(
    emp_id = c (6:8), 
    emp_name = c("Rasmi","Pranab","Tusar"),
    salary = c(578.0,722.5,632.8), 
    start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
    dept = c("IT","Operations","Fianance"),
    stringsAsFactors = FALSE
    )
emp.finaldata <- rbind(emp.data, emp.newdata)	# (row) bind the two data frames
typeof(emp.finaldata)	# list


## merging data frames
library(MASS)
merged.Pima <- merge(x = Pima.te, y =  Pima.tr, 
	by.x = c("bp", "bmi"),
	by.y = c("bp", "bmi")
)

## data reshaping
# metl the data, coverting all columns other than "type" and "year" into
# multiple rows
molten.ships <- melt(ships, id = c("type", "year"))
# cast the molten data into a new form where the aggregate of each type of
# ship for each year is created.
recasted.ship <- cast(molten.ships, type+year~variable,sum)
