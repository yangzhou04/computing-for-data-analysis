## Everything in R is an object.
# R has five basic or 'atomic' classes of object:
# character
# numeric(real numbers)
# integer
# complex
# logical(True/False)




## The most basic object is a vector
# vector, contain objects of the same type
# list, conatin objects of different classes.
help(vector)
# the c() function can be used to create a vectors of objects
# c(..., recursive=FALSE): Combine Values into a Vector or List
help(c)
x <- c(.5, .6) # numeric
x <- c(TRUE, FALSE) #logical
x <- c(T, F) # logical
x <- c('a', 'b', 'c') # character
x <- 9:29  # integer, not numeric
x <- c(1+0i, 2+4i) # complex

x <- vector('numeric', length=10)
#-#: [1] 0 0 0 0 0 0 0 0 0 0

# mix different types in vector, coercion will occur.
y <- c(1.7, 'a') # character
#-#: [1] "1.7" "a"
y <- c(TRUE, 2) #numeric
#-#: [1] 1 2
y <- c('a', TRUE) # character
#-#: [1] "a" "TRUE"

# Explicit coercion
x <- 0:6
class(x)
#-#: [1] "integer"
as.numeric(x)
#-#: [1] 0 1 2 3 4 5 6
as.logical(x)
#-#: [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE]
as.character(x)
#-#: [1] "0" "1" "2" "3" "4" "5" "6"]
as.complex(x)
#-#: [1] 0+0i 1+0i 2+0i 3+0i 4+0i 5+0i 6+0i]

# useful vector operation
#~ in
v <- c('a','b','c','e')
'b' %in% v
## returns TRUE
match('b',v)
## returns the first location of 'b', in this case: 2

#~ any
w <- c(1,2,3)
any(w==1)
#-#: [1] TRUE
v <- c('a','b','c')
any(v=='b')
#-#: [1] TRUE
any(v=='f')
#-#: [1] FALSE



## Matrix
# 
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#-#:      [,1] [,2] [,3]
#-#: [1,]    1    3    5
#-#: [2,]    2    4    6
m
# index start from 1
m[1, 1]
#-#: 1
m[, 1]
#-#: [1] 1 2
m[1, ]
#-#: [1] 1 3 5

# bind two or more matrix by row or col
x <- 1:3
y <- 10:12
cbind(x, y)
#-#:      x  y
#-#: [1,] 1 10
#-#: [2,] 2 11
#-#: [3,] 3 12
rbind(x, y)
#-#:    [,1] [,2] [,3]
#-#: x    1    2    3
#-#: y   10   11   12

## list
x <- list(1, 'a', TRUE, 1+4i)
x
#-#: [[1]]    <-----> contain a vector
#-#: [1] 1    <-----> a vector of a 1
#-#: 
#-#: [[2]]
#-#: [1] "a"
#-#: 
#-#: [[3]]
#-#: [1] TRUE
#-#: 
#-#: [[4]]
#-#: [1] 1+4i


## factor
# One can think of a factor as an integer vector where each integer has an label
# Factors are treated specially by modelling functions like lm() and glm()

x <- factor(c('yes', 'yes', 'no'), levels=c('yes', 'no'))
x
#-#: [1] yes yes no 
#-#: Levels: no yes

table(x) #table uses the cross-classifying factors to build a contingency 
         #  table of the counts at each combination of factor levels.
#-#: x
#-#: no yes 
#-#: 1   2 
unclass(x)possesses
#-#: [1] 2 2 1
#-#: attr(,"levels")
#-#: [1] "no"  "yes"


## Numbers in R are treated as real numbers.
i <- 1 # real numbers
i <- 1L # integers.

# Special number
# Inf
1 / Inf
#-#: [1] 0
1 / 0
#-#: [1] Inf

# NaN
0 / 0
#-#: [1] NaN
is.nan(0/0)
#-#: TRUE
is.nan(NA)
#-#: FALSE
is.nan(Inf)
#-#: FALSE

# NA    <----> not available / Missing values
x <- c(1,2,NA,10,3)
is.na(x)
#-#: 1] FALSE FALSE  TRUE FALSE FALSE
x <- c(1,2,NA,NaN,3)
is.na(x)
#-#: [1] FALSE FALSE  TRUE  TRUE FALSE



## Data frames
# used to store tabular data
# Unlike matrices, data frames can store different classes of objects in each
#  column, they are represented as a special type of list where every element
#  of the list has to have the same length

# row.names

# creating by calling read.table() or read.csv()

# conert to a matrix by data.matrix()

# 
x <- data.frame(foo=1:4, bar=c(T,T,F,F))
x
#-#:   foo   bar
#-#: 1   1  TRUE
#-#: 2   2  TRUE
#-#: 3   3 FALSE
#-#: 4   4 FALSE
nrow(x)
#-#: [1] 4
ncol(x)
#-#: [1] 2


## R objects have attributes
#~ names, dimnames
#~ dimensions
#~ class
#~ length
help(attributes)
# R objects can have names
x <- 1:3
names(x)
#-#: Null
names(x) <- c('foo', 'bar', 'norf')
x
#-#:  foo  bar norf 
#-#:  1    2    3 
names(x)
#-#: [1] "foo"  "bar"  "norf"

class(x)
#-#: [1] "integer"
length(x)
#-#: [1] 3



## array
# An array in R can have one, two or more dimensions. It is simply 
# a vector which is stored with additional attributes giving the 
# dimensions (attribute "dim") and optionally names for those 
# dimensions (attribute "dimnames").

# A two-dimensional array is the same thing as a matrix.
array(1:3, c(2,4)) # recycle 1:3 "2 2/3 times"
#-#:     [,1] [,2] [,3] [,4]
#-#:[1,]    1    3    2    1
#-#:[2,]    2    1    3    2

