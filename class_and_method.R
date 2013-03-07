## Two styles of class and methods S3 S4
#     cant mix
# S4 are recommended

## methods package
# setClass(): define class
# new():  create class

# A generic function is a R function that dispatch methods. It does not do the 
#  actual computation(e.g. plot, mean, print...)
mean
#-#: function (x, ...)   # dispatch by class(x)
#-#: UseMethod("mean")   # use method mean(), diff. class(x) has diff. way of calculating mean
#-#: <bytecode: 0x7f96dba30698>
#-#: <environment: namespace:base>
methods(mean)  # how many methods the generic function has
#-#: [1] mean.Date       mean.POSIXct    mean.POSIXlt    mean.data.frame mean.default   
#_#: [6] mean.difftime  


?Classes
?Methods
?setClass
?setMethod
?setGeneric

## All objects in R has a class which can be determined by class()
#  atomic class
class(1)
#-#: [1] "numeric"
class(NA)
#-#: [1] "logical"


x <- rnorm(100)
y <- x + rnorm(100)
fit <- lm(y~x)
class(fit)
#-#: [1] "lm"  # lm are both a function and the name of a class


## The S4 equivalent of print is show
?show


## Examining the code
# S3 getS3Method()
# S4 getMethod()
head(getS3Method("mean", "default"))

head(getMethod("mean", "numeric"))



### Creating a new class
# by setClass()
#     slot()
#     setMethod()
#     showClass()

# create a class
setClass("polygon", # name of the class
         representation(x="numeric",  y="numeric"))
# The slots for this class is x and y
#   S4 slots can be accessed with a @ operator
# create a method
setMethod("plot", "polygon",
          function(x, y, ...){
            plot(x@x, x@y, type="n", ...)
            xp <- c(x@x, x@x[1])
            yp <- c(x@y, x@y[1])
            lines(xp, yp)
          })
showMethods('plot')
#-#: Function: plot (package graphics)
#-#: x="ANY"
#-#: x="polygon"

p <- new("polygon", x=c(1,1,3,4), y=c(1,2,3,1))
plot(p)


## http://www.bioconductor.org    to see example

## packages:  SparseM, gpclib, flexmix, its, lme4, orientlib, pixmap

## stats4 packages
