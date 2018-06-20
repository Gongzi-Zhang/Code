# distributions
help(Normal)
help(TDist)
help(Binomial)
help(Chisquare)
help(Uniform)
help(Hypergeometric)
help(Exponential)

# Normal distribution
dnorm(x, mean, sd)  # distribution value
pnorm(x, mean, sd)  # cumulative distribution function
qnorm(p, mean, sd)  # reverse cumulative distribution function
rnorm(n, mean, sd)  # sampling
#> p is a vector of probabilities
#> n: sample size
pnorm(0, lower.tail = FALSE)	# 1 - pnorm(0)


# t distribution
dt(x, df, ncp)
pt(p, df, ncp)
qt(q, df, ncp)
rt(n, df, ncp)
t.test(x)
#> df: degree of freedom( > 0)
#> ncp: non-centrality parameter delta


# Binomial distribution
dbinom(x, size, prob)
pbinom(x, size, prob)
qbinom(p, size, prob)
rbinom(n, size, prob)
#> size is the number of trials
#> prob is the probability of success of each trial


# Chi Square
dchisq(x, df)
pchisq(q, df)
qchisq(p, df)
rchisq(n, df)
#> df: degree of freedom( > 0)
#> ncp: non-centrality parameter (non-negative)


# Uniform distribution
dunif(x, min = 0, max = 1)
punif(q, min = 0, max = 1)
qunif(p, min = 0, max = 1)
runif(n, min = 0, max = 1)

# Hypergeometric
dhyper(x, m, n, k)


# Exponential
dexp(x, rate = 1)
