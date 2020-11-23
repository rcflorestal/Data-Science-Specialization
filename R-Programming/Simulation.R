##----------------------------- Simulation -----------------------------------##
##                      Generating Random Numbers                             ##
##                                                                            ##
## This script is part of the R-Programming Module of the Data Science        ##
## Specialization, offered by Johns Hopkins University through Coursera       ## 
## platform.                                                                  ##
##----------------------------------------------------------------------------##

# R comes with a set of pseuodo-random number generators that allow you to 
# simulate from wellknown probability distributions like the Normal, Poisson, 
# and binomial. Some example functions for probability distributions in R:
        # rnorm: generate random Normal variates with a given mean and standard 
        # deviation
        # dnorm: evaluate the Normal probability density (with a given mean/SD)
        # at a point (or vector of points)
        # pnorm: evaluate the cumulative distribution function for a Normal 
        # distribution
        # rpois: generate random Poisson variates with a given rate

# For each probability distribution there are typically four functions available 
# that start with a “r”, “d”, “p”, and “q”. The “r” function is the one that 
# actually simulates randon numbers from that distribution. The other functions 
# are prefixed with a:
        # d for density
        # r for random number generation
        # p for cumulative distribution
        # q for quantile function (inverse cumulative distribution)

# Probably the most common probability distribution to work with the is the 
# Normal distribution (also known as the Gaussian). Working with the Normal 
# distributions requires using these four functions:
        # dnorm(x, mean = 0, sd = 1, log = FALSE)
        # pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
        # qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
        # rnorm(n, mean = 0, sd = 1)
# Here we simulate standard Normal random numbers with mean 0 and standard 
# deviation 1.

## Simulate standard Normal random numbers
rnorm(10)

# We can modify the default parameters to simulate numbers with mean 20 and 
# standard deviation 2.
x <- rnorm(10, 20, 2)
x
summary(x)

# If you wanted to know what was the probability of a random Normal variable of 
# being less than, say, 2, you could use the pnorm() function to do that
# calculation.
pnorm(2)

### Setting the random number seed ###
# When simulating any random numbers it is essential to set the random number 
# seed. Setting the random number seed with set.seed() ensures reproducibility 
# of the sequence of random numbers.
# For example, I can generate 5 Normal random numbers with rnorm().
set.seed(1)
rnorm(5)

# Note that if I call rnorm() again I will of course get a different set of 5 
# random numbers.
rnorm(5)

# If I want to reproduce the original set of random numbers, I can just reset 
# the seed with set.seed().
set.seed(1)
rnorm(5)

# In general, you should always set the random number seed when conducting a
# simulation!
# Otherwise, you will not be able to reconstruct the exact numbers that you 
# produced in an analysis.
#
# It is possible to generate random numbers from other probability distributions
# like the Poisson. The Poisson distribution is commonly used to model data that 
# come in the form of counts.
rpois(10, 1)    ## Counts with a mean of 1

rpois(10, 2)   ## Counts with a mean of 2

# what if we want to simulate 100 *groups* of random numbers, each containing 5
# values generated from a Poisson distribution with mean 10?
rpois(5, 10)

# Now use replicate(100, rpois(5, 10)) to perform this operation 100 times. 
# Store the result in a new variable called my_pois.
my_pois <- replicate(100, rpois(5, 10))

# Take a look at the contents of my_pois.
my_pois

# replicate() created a matrix, each column of which contains 5 random numbers 
# generated from a Poisson distribution with mean 10. Now we can find the mean
# of each column in my_pois using the colMeans() function. Store the result in a 
# variable called cm.
cm <- colMeans(my_pois)
        
# And let's take a look at the distribution of our column means by plotting a 
# histogram with hist(cm).
hist(cm)

# Looks like our column means are almost normally distributed, right? That's the
# Central Limit Theorem at work

### Simulating a Linear Model ###
# Suppose we want to simulate from the following linear model:
                # y = b0 + b1x + e
                # Where e ~ N(0, 2^2). Assume x ~ N(0, 1^2), b0 = 0.5 and b1 = 2

## Always set your seed!
set.seed(20)

## Simulate the predictor variable
x <- rnorm(100)

## Simulate the error term
e <- rnorm(100, 0, 2)

## Compute the outcome via the model
y <- 0.5 + 2 * x + e

## Summary statistics
summary(y)

## Plot the results of the model simulation
plot(x, y)

# What if we wanted to simulate a predictor variable x that is binary instead of 
# having a Normal distribution. We can use the rbinom() function to simulate 
# binary random variables.
set.seed(10)
x <- rbinom(100, 1, 0.5)
str(x)  ## 'x' is now 0s and 1s

# Then we can procede with the rest of the model as before.
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
plot(x, y)

# We can also simulate from generalized linear model where the errors are no 
# longer from a Normal distribution but come from some other distribution. For 
# examples, suppose we want to simulate from a Poisson log-linear model where:
                # y ~ Poisson(m)
                # log m = b0 + b1x
# and b0 = 0.5 and b1 = 0.3. We need to use the rpois() function for this.

set.seed(1)

## Simulate the predictor variable as before
x <- rnorm(100)

# Now we need to compute the log mean of the model and then exponentiate it to 
# get the mean to pass to rpois().
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

### Random Sampling ###
# The sample() function draws randomly from a specified set of (scalar) objects 
# allowing you to sample from arbitrary distributions of numbers.
set.seed(1)
sample(1:10, 4) ## takes four sample of the integer vector 1:4

# Doesn't have to be numbers
sample(letters, 5)

# Do a random permutation
sample(1:10)

# Sample with replacement
sample(1:10, replace = TRUE)

# suppose we want to simulate 100 flips of an unfair two-sided coin. 
# This particular coin has a 0.3 probability of landing 'tails' and a 0.7 
# probability of landing 'heads'.
#
# Let the value 0 represent tails and the value 1 represent heads. Use sample()
# to draw a sample of size 100 from the vector c(0,1), with replacement. Since 
# the coin is unfair, we must attach specific probabilities to the values 0 
# (tails) and 1 (heads) with a fourth argument, prob = c(0.3, 0.7). 
# Assign the result to a new variable called flips.
flips <- sample(c(0, 1), 100, replace = TRUE, prob = c(0.3, 0.7))

# View the contents of the flips variable.
flips

# Since we set the probability of landing heads on any given flip to be 0.7,
# we'd expect approximately 70 of our coin flips to have the value 1. Count the 
# actual number of 1s contained in flips using the sum() function.
sum(flips)

# A coin flip is a binary outcome (0 or 1) and we are performing 100 independent 
# trials (coin flips), so we can use rbinom() to simulate a binomial random 
# variable. Pull up the documentation for rbinom() using ?rbinom.
?rbinom

# A binomial random variable represents the number of 'successes' (heads) in a 
# given number of independent 'trials' (coin flips). Therefore, we can generate 
# a single random variable that represents the number of heads in 100 flips of
# our unfair coin using:
rbinom(1, size = 100, prob = 0.7)

# Note that you only specify the probability of 'success' (heads) and NOT the 
# probability of 'failure' (tails)
#
# Equivalently, if we want to see all of the 0s and 1s, we can request 100 
# observations, each of size 1, with success probability of 0.7. Give it a try,
# assigning the result to a new variable called flips2.
flips2 <- rbinom(n = 100, size = 1, prob = 0.7)
flips2

# Now use sum() to count the number of 1s (heads) in flips2. It should be close 
# to 70!
sum(flips2)

# To sample more complicated things, such as rows from a data frame or a list, 
# you can sample the indices into an object rather than the elements of the 
# object itself.
# Here’s how you can sample rows from a data frame:
library(datasets)
data(airquality)
head(airquality)

# Now we just need to create the index vector indexing the rows of the data 
# frame and sample directly from that index vector.
set.seed(20)

## create index vector
idx <- seq_len(nrow(airquality))

## Sample from the index vector
samp <- sample(idx, 6)
airquality[samp, ]
