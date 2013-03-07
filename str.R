## str: Compactly Display the Structure of an Arbitrary R Object
# A diagnostic function and an alternative to 'summary'
# prety print of list
#! str is used to check what the object's content looks like


str(str)
#-#: function (object, ...) 
x <- rnorm(100, 2, 4)
summary(x)
#-#:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#-#: -9.114  -1.611   1.260   1.404   4.477  11.350 
str(x)
#-#:  num [1:100] 2.81 -2.54 -2.72 -2.8 5.91 ...

f <- gl(40, 10)
str(f)
#-#:  Factor w/ 40 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...

library(datasets)
head(airquality)
#-#: Ozone Solar.R Wind Temp Month Day
#-#: 1    41     190  7.4   67     5   1
#-#: 2    36     118  8.0   72     5   2
#-#: 3    12     149 12.6   74     5   3
#-#: 4    18     313 11.5   62     5   4
#-#: 5    NA      NA 14.3   56     5   5
#-#: 6    28      NA 14.9   66     5   6

str(airquality)
#-#: 'data.frame':  153 obs. of  6 variables:
#-#: $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
#-#: $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
#-#: $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
#-#: $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
#-#: $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
#-#: $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...

m <- matrix(rnorm(100), 10, 10)
str(m)
#-#: num [1:10, 1:10] 0.5779 -0.0259 -0.26 0.9612 0.6178 ...

s <- split(airquality, airquality$Month)
str(s)
