# read from keyboard
help(scan)
a <- scan(what=double(0))   # read until a blank line is entered
# 1: 3.5
# 2:
# Read 1 item
typeof(a)   # double

a <- scan(what=double(0))
# 1: yo~
# 1:
# Error in scan(...):
# scan() expected 'a real', got 'yo!'


# CSV file
read.csv(file, head = TRUE, sep)
#> head, logical value, to read head(first line) or not.
data <- read.csv("input.csv")
is.data.frame(data) # TRUE
summary(data)
attributes(data)
names(data) # read columns names
ncol(data)
nrow(data)
sal <- max(data$salary)	# get the maximum salary
retval <- subset(data, salary == max(salary))	# get the person detail having max salary
retval <- subset(data, dept == "IT")	# get all people working in IT dept.
retval <- subset(data, salary > 600 & dept == "IT")
# get the people who joined on or after 2014
retval <- subset(data, as.Date(start_data) > as.Date("2014-01-01")) 

write.csv(retval, "output.csv")
write.csv(retval, "output.csv", row.names = FALSE)  # drop the row count

# fixed width file
read.fwf('file name', widths=c(-17, 5, 12), col.names = c('temp', 'offices'))
#> widths: negative number means to skip it.
# xls or xlsx file
install.packages("xlsx")
library("xlsx")
data <- read.xlsx("input.xlsx", sheetIndex = 1)	# read the first worksheet in the file


# Binary file
readBin(con, what, n)
writeBin(object, con)
#> con is the connection object to read or write the binary file
#> object is the R-objects to be wirtten
#> what is the mode like character, integer etc. representing the bytes to be read.
#> n is the number of bytes to read from the binary file.
write.filename <- file("bin.dat", "wb")	# open a file in write binary mode
writeBin(colnames(data), write.filename)    # write colnames
writeBin(c(data$id, data$name, data$salary), write.filename)	# write record to file
close(write.filename)

read.filename <- file("bin.dat", "rb")
column.names <- readBin(read.filename, character(), n = 3)  # the return value is a vector
bindata <- readBin(read.filename, integer(), n = 15)	# read the record after column names
cyldata = bindata[4:8]	# read the values from 4th byte to 8th byte
close(read.filename)


# XML
install.packages("XML")
library("XML")
library("methods")  # other required package
data <- xmlParse(file = "input.xml")
rootnode <- xmlRoot(data)   # extract the root node forming the xml file
rootsize <- xmlSize(rootnote)	# find number of nodes in the root.
rootnode[[1]][[5]]  # get the fifth element of the first node

## convert XML to data frame
xmldataframe <- xmlToDataFrame("input.xml")


# JSON 
install.packages("rjson")
library("rjson")
data <- fromJSON(file = "input.json")
json_data_frame <- as.data.frame(data)	# convert to data frame


# Web data
install.packages("RCurl")
install.packages("XML")
install.packages(c("stringr", "plyr")) 
library(c("RCurl", "XML", "stringr", "plyr"))
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"
links <- getHTMLLinks(url)  # gather links for files
filenames <- links[str_detect(links, "JCMB_2015")]  # identify only the links pointing to the JCMB 2015 files
filenames_list <- as.list(filenames)
downloadcsv <- function (mainurl, filename) {
    filedetails <- str_c(mainurl, filename)
    download.file(filedetails, filename)    # download files
}
# now apply the l_ply func and save the files into the current R workind dir.
l_ply(filenames, downloadcsv, mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")


# Databases
install.packages("RMySQL")
library("RMySQL")
# read from MySQL
# connect to database
mysqlconnection = dbConnect(MySQL(), user = 'root', password = '', dbname = 'sakila', 
			    host = 'localhost' )
dbListTables(mysqlconnection)	# list available tables in this database.
result <- dbSendQuary(mysqlconnection, "select * from actor")	# Query the table 
data = fetch(result, n = 5)
## another query example
result <- dbSendQuary(mysqlconnection, "select * from actor where last_name = 'TORN'")
data = fetch(result, n = -1)	# fetch all records

dbSendQuary(mysqlconnection, "update mtcars set disp = 168.5 where hp = 110")	# update a record
dbSendQuary(mysqlconnection, 
    "insert into mtcars(row_names, mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
    values('New Mazda RX4 Wag', 21, 6, 168.5, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4)"
    )	# insert a record
dbSendQuary(mysqlconnection, 'drop table if exists mtcars') # drop table

# creating a table in MySQL
dbWriteTable(mysqlconnection, "mtcars", mtcars[, ], overwrite = TRUE)
