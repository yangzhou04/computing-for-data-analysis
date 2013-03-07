####  util func: split.
# function (x, f, drop = FALSE, ...)  
# x is a vector, list or dataframe
# f is a factor or list of factors
# dropb indicates whether empty factors levels should be dropped

x <- c(1:10, 21:30, 51:60)
f <- gl(3, 10)  # generate levels
split(x, f)
#-#: $`1`
#-#: [1]  1  2  3  4  5  6  7  8  9 10
#-#: 
#-#: $`2`
#-#: [1] 21 22 23 24 25 26 27 28 29 30
#-#: 
#-#: $`3`
#-#: [1] 51 52 53 54 55 56 57 58 59 60

lapply(split(x,f), mean)
#-#: $`1`
#-#: [1] 5.5
#-#: 
#-#: $`2`
#-#: [1] 25.5
#-#: 
#-#: $`3`
#-#: [1] 55.5


## splitting a data frame
library(datasets)
# head(airquality)

# split according to Month
class(airquality)
#-#: [1]"data.frame"
s <- split(airquality, airquality$Month)

# x is a dataframe here
lapply(s, function(x) colMeans((x[,c('Ozone', 'Solar.R', 'Wind')])))
lapply(s, function(x) colMeans((x[,c('Ozone', 'Solar.R', 'Wind')]), na.rm=T))


# 
library(datasets)
data(mtcars)
?mtcars
# How can one calculate the average miles per gallon (mpg) by number 
# of cylinders in the car (cyl)?
sapply(split(mtcars$mpg, mtcars$cyl), mean)
#-#:        4        6        8 
#-#: 26.66364 19.74286 15.10000 


