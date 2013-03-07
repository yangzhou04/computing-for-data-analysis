# lapply: loop over a list and evaluate a function on each element
# sapply: Same as lapply but try to simply the result
# apply: Apply a function over the margins of an array
# tapply: Apply a function over a subset of a vector
# mapply: Multivariable version of lapply

# split: a useful auxiliary function, particularly in conjunction with lapply


##lapply
x <- list(a=1:5, b=rnorm(10))
lapply(x, mean)
#-#:$a
#-#: [1] 3

#-#: $b 
#-#: [1] -0.04647274 # this value may diff next time.

x <- 1:4
lapply(x, runif)
#-#: [[1]]
#-#: [1] 0.05130692
#-#: 
#-#: [[2]]
#-#: [1] 0.2854340 0.6958773
#-#: 
#-#: [[3]]
#-#: [1] 0.1321698 0.4679616 0.7070613
#-#: 
#-#: [[4]]
#-#: [1] 0.2952784 0.6384016 0.7534857 0.5187663

args(runif)
#-#: args(runif)
#-#: function (n, min = 0, max = 1) 

x = list(matrix(1:4,2,2), matrix(1:6, 3,2))
lapply(x, function(elt) elt[,1])
#-#: [[1]]
#-#: [1] 1 2
#-#: 
#-#: [[2]]
#-#: [1] 1 2 3


## sapply
# if the result is a list where every element length is 1, then a vector is returned.
# if the result is a list where every element is a vector of the same length(>1), 
#     then a matrix is returned.
# otherwise, a list is returned.

x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x, mean) # a list returned
sapply(x, mean) # a vector returned
#-#:         a         b         c         d 
#-#: 2.5000000 0.3294319 1.0053545 4.9389803 



## apply
# it is usually used to apply a funtion to the rows or columns of a matrix
# it can be used with general arrays, e.g. taking the average of an array of matrices
str(apply)
#-#: function (X, MARGIN, FUN, ...)  
#  X is an array
#  MARGIN is an integer indicating which margins should be 'retained', 1 is rows, 2 is columns
#  FUN is a function to be applied
x <- matrix(rnorm(200), 20, 10)
colMeans = apply(x, 2, mean)
rowMeans = apply(x, 1, mean)

x <- matrix(1:6, 2, 3)
apply(x, 1, quantile, probs=c(0.25,0.75))
# the ... arguments is passing to quantile

a <- array(1:8, c(2,2,2))
apply(a, c(1,2), mean)
#-#:       [,1] [,2]
#-#: [1,]    3    5
#-#: [2,]    4    6

## tapply:  apply a function to the subsets of a vector
#    function (X, INDEX, FUN = NULL, ..., simplify = TRUE) 
#  X is a vector
#  INDEX is a factor or a list of factors
#  FUN is a function to be applied
#  simplfy, should we simply the result?
x <- c(1:10, 21:30, 51:60)
f <- gl(3, 10)  # generate levels
tapply(x, f, mean)
#-#:    1    2    3 
#-#:  5.5 25.5 55.5

tapply(x, f, mean, simplify=FALSE)
#-#: $`1`
#-#: [1] 5.5
#-#: 
#-#: $`2`
#-#: [1] 25.5
#-#: 
#-#: $`3`
#-#: [1] 55.5

tapply(x, f, range)
#-#: $`1`
#-#: [1]  1 10
#-#: 
#-#: $`2`
#-#: [1] 21 30
#-#: 
#-#: $`3`
#-#: [1] 51 60


## mapply
#  function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  
#  FUN is a function to apply
#  ... args to apply over
#  MoreArgs  args to FUN
#  SIMPLIFY indicates whether the result should be simplified
mapply(rep, 1:4, 4:1)
# this is equal to list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
#-#: [[1]]
#-#: [1] 1 1 1 1
#-#: 
#-#: [[2]]
#-#: [1] 2 2 2
#-#: 
#-#: [[3]]
#-#: [1] 3 3
#-#: 
#-#: [[4]]
#-#: [1] 4

