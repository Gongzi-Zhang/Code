x <- rnorm(10, sd = 5, mean = 20)
y <- 2.5*x - 1.0 + rnorm(10, sd = 9, mean = 0)
cor(x, y)   # 0.7400576
# regression
# linear regression (model)
lm(formula, data)   # creates the relationship model between the predictor and the response variabel
#> formula is a symbol presenting the relation between x and y
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
relation <- lm(y~x)
summary(relation)
attributes(relation)
residuals(relation)
relation$coefficients[1]    # intercept
relation$coefficients[[1]]  # 
relation$coefficients[2]    # slope
relation$coefficients[[2]]  # use two square braces to get value  
relation$residuals

plot(y, x, col='blue', main="Height & Weight Regression",	# visulization 
     abline(lm(x~y)), cex = 1.3, pch = 16, xlab = "Weight in Kg", ylab = "Height in cm")

predict(object, newdata)
#> object is the formula created from lm()
a <- data.frame(x = 170)
result <- predict(relation, a)


# multiple regression
lm(y ~ x1+x2+x3..., data)
input <- mtcars[, c('mpg','disp', 'hp', 'wt')]
model <- lm(mpg~disp+hp+wt, data = input)
a <- coef(model)[1]
print(a)
Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]
print(Xdisp)
print(Xhp)
print(Xwt)

# logistic regression: y = 1/(1+e^-(a+b1x1+b2x2+b3x3))
glm(formula, data, family)
#> family is R object to specify the details of the model. It's value is
#>> binomial for logistic regression
input <- mtcars[, c('am', 'cyl', 'hp', 'wt')]
model <- glm(formula = am ~ cyl + hp + wt, data = input, family = binomial) 
summary(model)

# Posisson regression: log(y) = a + b1x1 + b2x2 + bnxn ...
glm(formula, data, family)
input <- warpbreaks
model <- glm(formula = breaks ~ wool + tension, data = warpbreaks, family = poisson)
summary(model)


# Nonlinear Least Square 
nls(formula, data, start)
#> start is a named list or named numeric vector of starting estimates
x <- c(1.6,2.1,2,2.23,3.71,3.25,3.4,3.86,1.19,2.21)
y <- c(5.19,7.43,6.94,8.11,18.75,14.88,16.06,19.12,3.21,7.58)
model <- nls(y ~ b1*x^2 + b2, start = list(b1 = 1, b2 = 3)) # y = b1*x^2 + b2
sum(resid(model)^2) # get the sum fo the squared residuals



# Analysis of Covariance
# analyze the effect of the value of categorical variable on the regression.
input <- mtcars
# with interaction between categorical variable (am) and predictor variable(mpg~hp)
result1 <- aov(mpg~hp*am, data = input)	
summary(result1)
# without interaction between categorical variable and predictor variable
result2 <- aov(mpg~hp+am, data = input)
summary(result2)

anova(result1, result2)	# compare the two models



# Time Series Analysis
## Time series is a series of data points in whihc each data point is
## associated with a timestamp
timeseries.object <- ts(data, start, end, frequency)
#> data: a vector or matrix 
#> frequency: the number of observations per unit time
#>> frequency = 12: every month of a year
#>> frequency = 4:  every quarter of a year
#>> frequency = 6:  every 10 minutes of an hour
#>> frequency = 24*6 every 10 minutes of a day
rainfall <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
rainfall.timeseries <- ts(rainfall, start = c(2012,1), frequency = 12)
rainfall1 <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
rainfall2 <- c(655,1306.9,1323.4,1172.2,562.2,824,822.4,1265.5,799.6,1105.6,1106.7,1337.8)
combined.rainfall <- matrix(c(rainfall1, rainfall2), nrow = 12)
rainfall.timeseries <- ts(combined.rainfall, start = c(2012, 1), frequency = 12)    # multiple TS


# Decision Tree
install.packages("party")
library(party)
ctree(formula, data)
## create the tree
input <- readingSkills[c(1:105),]
decision.tree <- ctree(nativeSpeaker ~ age + shoeSize + score, data = input)
plot(decision.tree)


# random forest
install.packages("randomForest")
library(randomForest)
library(party)
randomForest(formula, data)
model <- randomForest(nativeSpeaker ~ age + shoeSize + score, data = readingSkills)
importance(fit, type = 2)


# Survival Analysis
install.packages("survival")
library("survival")
Surv(time, event)
survfit(formula)
#> time is the follow up time until the event occurs
#> event indicates the status of occurrence of the expected event
survfit(Surv(pbc$time, pbc$status == 2)~1)
plot(survfit(Surv(pbc$time, pbc$status == 2)~1))


# Chi square test: to determine if two categorical variables have significant
#> correlation between them.
chisq.test(data)
#> data is the data in form of a table containing the count value of the
#>> variables in the observation
library("MASS")
print(str(Cars93))
car.data <- table(Cars93$AirBags, Cars93$Type)
chisq.test(car.data)
