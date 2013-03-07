# Functions for probability distributions in R
# rnorm : random norm variates with a given mean and standard deviation
# dnorm : evaluate the normal probability density at a point
# pnorm : evaluate the cumulative distribution
# rpois : generate possion variates with a given rate
# ...

# functions naming convention.
# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

x <- rnorm(10)
x
x <- rnorm(10, 20, 2)
summary(x)


## if reproducibility is important. then set seed.
set.seed(1) 
rnorm(5) # label{same point}
#-#: [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

rnorm(5)
#-#: [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
set.seed(1)
rnorm(5) # exactly the same with  \ref{same point} !! allow you you to reproduce it.
#-#: [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

## Generating Possion data
rpois(10, 1)
#-#: [1] 3 0 1 0 0 1 0 1 2 0

ppois(2, 2)
#-#: [1] 0.6766764


## Simulate for a linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
#-#:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#-#: -6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050
summary(y)
plot(x, y)

## if x is binary
set.seed(20)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
##...

#### simulate
## Y \sim Poission (\mu)
## log\mu = \beta_0 + \beta_1 x
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

## sample function
set.seed(1)
sample(1:10, 4)
#-#: [1] 7 1 4 8
sample(letters, 5)
#-#: [1] "j" "y" "e" "s" "b"
sample(1:10) # permutation
#-#: [1]  5  2  9  6 10  8  7  1  3  4
sample(1:10, replace=T)  # sample replacement
#-#: [1]  7  7  4  5 10  9 10  9  8  3

