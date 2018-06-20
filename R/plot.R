# charts && graphs

## strip charts
help(stripchart)
stripchart(x, vertical, method)
stripchart(x, add = TRUE, at = 15.5)	# add stripchart to other plot
title("Add a title here", xlab = "number")
#> vertical: logical value
#> method = "stack", "jitter"

## Pie charts
pie(x, labels, radius, main, col, clockwise)
#> x: numeric vector
#> radius (-1, +1)
#> main: title of the chart
#> col: color palette
#> clockwise: logical value
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")
piepercent <- round(100*x/sum(x), 1)
png(file = "city.png")
pie(x, labels = piepercent, main = "City pie chart", col = rainbow(length(x)))
legend("topright", c("London", "New York", "Singapore", "Mumba"), cex = 0.8, 
    fill = rainbow(length(x)))
dev.off()   # save the file
## 3D Pie Chart
library(plotrix)
pie3D(x, labels, explode = 0.1, main = "Pie Chart of Countries")



## Bar Chart
barplot(H, xlab, ylab, main, names.arg, col)
#> H: numeric vector or matrix 
#> names.arg is a vector of names appearing under each bar.
H <- c(7, 21, 28, 3, 41)
M <- c("Mar", "Apr", "May", "Jun", "Jul")
barplot(H)
barplot(H, names.arg = M, xlab = "Month", ylab = "Revenue", col = "blue", 
	main = "Revenue chart", border = "red")

### Stacked Bar Chart
colors <- c("green", "orange", "brown")
months <- c("Mar", "Apr", "May", "Jun", "Jul")
regions <- c("East", "West", "North")
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),nrow = 3,ncol = 5,byrow = TRUE)
barplot(Values, main = "total revenue", names.arg = months, 
	xlab = "Month", ylab = "Revenue", col = colors)
legend("topleft", regions, cex = 1.3, fill = colors )

## box plot
help(boxplot)
boxplot(x, data, notch, varwidth, names, main)
#> x is a vector or a formula
#> data: data frame
#> notch: logic, set as TRUE to draw a notch
#> varwidth: logic, set as TRUE to draw width of the box proportinate to the sampel size
#> names are the group labels which will be printed under each boxplot
input <- mtcars[, c('mpg', 'cyl')]
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders", 
	ylab = "Miles Per Gallon", main = "Mileage Data")
## boxplot with Notch
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
	ylab = "Miles Per Gallon", main = "Mileage Data", notch = TRUE,
	varwidth = TRUE, col = c('green', 'yellow', 'purple'), 
	names = c('High', 'Medium', "Low"))


## Histograms
# The difference between histogram and barplot. Usually, barplot 
# count specific x-value, while histogram count a x-range.
help(hist)
hist(v, main, xlab, xlim, ylim, breaks, col, border)
#> xlim: to specify the range of values on the x-axis
#> breaks: set of break point, see documents for detail
v <- c(9,13,21,8,36,22,12,41,31,33,19)
hist(v, xlab = "Weight", col = "yellow", border = "blue")
hist(v, xlab = "Weight", col = "green", border = "red",
     xlim = c(0,40), ylim = c(0,5), breaks = 5)

y <- rnorm(200, mean = -2, sd = 4)
hist(y)
qqnorm(y)
qqline(y)

## Normal QQ plot
#> this plot is used to determine if your data is close to being normally
#> distributed.
help(qqnorm)
help(qqline)
help(qqplot)
qqnorm(x, main, xlab, ylab)



## Line Graphs
plot(v, type, main, col, xlab, ylab)
#> type: 'p' to draw only the points; 'l' to draw only the lines and 'o' to
#>> draw both points and lines

v <- c(7, 12, 28, 3, 41)
plot(v, type = 'o', col = 'red', xlab = "Month", ylab = 'Rain fall', main = "Rain fall chart")
### multiple lines
t <- c(14, 7, 6, 19, 3)
lines(t, type = 'o', col = "blue")


## Scatter plot
plot(x, y, main, xlab, ylab, xlim, ylim, axes)
#> axes indicates whether both axes should be drawn on the plot
lm_1 <- lm(y ~ x)
par(mfcow = c(2, 2))	# request 2*2 plot layout
plot(lm_1)  # Diagnostic plot of regression model

### plot both points and fitting function
plot(y, x, col = 'blue', main = 'title', abline(lm(x~y)), cex = 1.3
     pch = 16, xlab = "Weight", ylab = "Height")

### Scatterplot Matrices
##> When we have more than two variables and we want to find the correlation
##> between one variable versus the remaining ones we use scatterplot matrix.
pairs(formula, data)
pairs(data) # all permutations of a set of relationships on one graph
#> formula represents the series of variables used in pairs
pairs(~wt+mpg+disp+cyl, data = mtcars, main = "Scatterplot Matrix")


## Points: draw a sequence of points at specified coordinates.
#> can only be added to other plots.
points(x, y, type, ...)
points(x1, y1, col = 2, pch = 3)
#> pch: plotting character: symbol to use: circle, square ...


## Error bars
arrows(xHigh, yHigh, xLow, yLow, col, angle, length, code)
#> code: specify where the bars are drawn:
#>> 1: bars are drawn at pairs in the first argument
#>> 2: abrs are drawn at pairs in the second argument
#>> 3: both
#> x, y: coordinate vector of points to plot


## Noise (jitter): add noise (artificial offset) to data
numberWhite <- rhyper(400, 4, 5, 3)
numberChipped <- rhyper(400, 2, 7, 3)
par(mfrow = c(1, 2))
plot(numberWhite, numberChipped, xlab = "Number White Marbles Drawn",
     ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles")
plot(jitter(numberWhite), jitter(numberChipped), xlab = "Number White Marbles Drawn",
     ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles")

## Multiple Graphs on one Image
par(mfrow = c(2, 3))
boxplot(numberWhite, main = "first plot")
boxplot(numberChipped, main = "second plot")
plot(jitter(numberWhite), jitter(numberChipped), xlab = "Number White Marbles Drawn",
     ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles")
hist(numberWhite, main = "fourth plot")
hist(numberChipped, main = "fifth plot")
mosaicplot(table(numberWhite, numberChipped), main = "sixth plot")

## Density plots
smoothScatter(x, y, ...)
smoothScatter(numberWhite, numberChipped, xlab = "White Marbles", ylab = "Chipped Marbles", 
	      main = "Drawing Marbles")
grid(4, 3)  # add a grid


## Shaded Regions
polygon(x, y)	# draw a shaded region enclosed by coordinate pairs: x, y
x = c(-1, 1, 1, -1, -1)
y = c(-1, -1, 1, 1, -1)
plot(x, y)
polygon(x, y, ...)

#> a more complicated example
stdDev <- 0.75
x <- seq(-5, 5, by = 0.01)
y <- dnorm(x, sd = stdDev)
right <- qnorm(0.95, sd = stdDev)
plot(x, y, type = "l", xaxt = "n", ylab = "p",
     xlab = expression(paste('Assumed Distribution of ', bar(x)))
     axes = FALSE, ylim = c(0, max(y)*1.05), xlim = c(min(x), max(x)),
     frame.plot = FALSE)
axis(1, at = c(-5, right, 0, 5),
     poc = c(0, 0),
     labels = c(expression(' '), expression(bar(x)[cr]), expression(mu[0]), expression(' ')))
axis(2)
xReject <- seq(right,5,by=0.01)
yReject <- dnorm(xReject,sd=stdDev)
polygon(c(xReject,xReject[length(xReject)],xReject[1]),
        c(yReject,0, 0), col='red')

## Surface plot
x <- seq(0, 2*pi, by = pi/100)
y <- x
xg <- (x*0+1) %*% t(y)
yg <- (x) %*% t(y*0+1)
f <- sin(xg+yg)
persp(x, y, f, theta=-10, phi=40)


## barplot: returns the horizontal locations of the bars.
barplot(x,...)

numberWhite <- rhyper(30, 4, 5, 3)
numberWhite <- as.factor(numberWhite)
plot(numberWhite)

numberWhite <- rhyper(30, 4, 5, 3)
t <- table(numberWhite)
barplot(t, main = "Number Draws", ylab = "Frequency", xlab = "Draws")

xLoc <- barplot(sort(t, decreasing = TRUE), main="Number Draws",
		ylab = "Frequency", xlab = "Draws", ylim = c(0, sum(t)+2))
points(xLoc, cumsum(sort(t, decreasing=TRUE)), type='p', col=2)
points(xLoc, cumsum(sort(t, decreasing=TRUE)), type='l')


## Mosaic plot
santa <- data.frame(belief = c('no belief', 'no belief', 'belief', 'belef'),
		    sibling = c('older brother', 'no older brother', 'older brother', 
				'no older brother'))
plot(santa$belief)  # barplot
plot(santa$belief, santa$sibling)   # mosaicplot
t <- table(santa$belief, santa$sibling)
masaicplot(t)


## Miscellaneous
### multiple representations on one plot
x = rexp(20, rate = 4)
hist(x, ylim=c(0, 18), main = "This Are An Histogram", xlab = "X")
boxplot(x, at = 16, horizontal = TRUE, add = TRUE)
rug(x, side = 1)
d = density(x)
points(d, type='l', col=3)


### box around the plot
### bty option, which controls the shape of box around the plotting area
### its value can be: 'o', 'l', '7', 'c', 'u', ']', 'n'
### the lines drawn roughly look like the letter given except for 'n' which
### draw no lines. The box can be drawn later using the 'box' command
x <- rnorm(10, mean=0, sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x, y, bty='7')
plot(x, y, bty='n')
box(lty=3)

### par to set the default values for various parameters
par(bty='l')
par(bg='gray')	# set background color to gray
par(mex=2)  # set margins for the axes to be twice the normal size

### text: add text to plots
text(x, y, "text", xpd=TRUE)
#> xpd: logical value, cut off chars outside of the plot area or not.
