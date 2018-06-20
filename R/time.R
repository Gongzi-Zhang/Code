help(DateTimeClasses)
t <- Sys.time()	# current time
typeof(t)   # double
cat(t, '\n')
a <- rexp(1, 0.1)
cat("At about", format(t, "%H:%M"), "the time between occurance was around", format(a, digits=3), "seconds\n")

c <- as.POSIXct(t)
typeof(c)   # double
cat(c, '\n')

l <- as.POSIXlt(t)
typeof(l)   # list
cat(l, '\n')
names(l)


# convertion between time and strings
help(strftime)
timeStamp <- strftime(t, "%Y-%m-%d %H:%M:%S")
typeof(timeStamp)   # character

time <- strptime("2017-06-04 21:32:45", "%Y-%m-%d %H:%M:%S")
typeof(time)	# "list"


# Date 
theDates <- c("1 jan 2012", "1 jan 2013", "1 jan 2014")
dateFields <- as.Date(theDates, "%d %b %Y")
typeof(dateFields)  # double
N <- length(dateFields)
diff <- dateFields[1:(N-1)] - dateFields[2:N]

infamy <- as.Date(-179, origin="1942-06-04")
infamy	# 1941-12-07

today <- Sys.Date()
today - infamy
seq(from=as.Date('2005-1-1'), to=as.Date('2005-12-31'), by='day')


# difftime
help(difftime)
earlier <- strptime("2000-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 01:00:00", "%Y-%m-%d %H:%M:%S")
difftime(later, earlier)
difftime(later, earlier, units="secs")

diff <- as.difftime("00:30:00", "%H:%M:%S", units="hour")
now <- Sys.tiem()
later <- now + diff
if (now < later){
    cat("there you go\n")
}
