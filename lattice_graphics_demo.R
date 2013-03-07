library(lattice)
library(help=lattice)
data(environmental)
?environmental
head(environmental)
# simple plot
xyplot(ozone ~ radiation, data = environmental)
xyplot(ozone ~ radiation, data = environmental, main='Ozone vs. Radiation')
xyplot(ozone ~ temperature, data = environmental, main='Ozone vs. Temperature')

# the ozone and radiation relation as the temperature changes
summary(environmental$temperature)
#-#:   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#-#:  57.00   71.00   79.00   77.79   84.50   97.00 

# create 4 diff. ranges
temp.cut <- equal.count(environmental$temperature, 4)
temp.cut
#-#: Data:
#-#:   [1] 67 72 74 62 65 59 61 69 66 68 58 64 66 57 68 62 59 73 61 61 67 81 79 76 82 90 87
#-#: [28] 82 77 72 65 73 76 84 85 81 83 83 88 92 92 89 73 81 80 81 82 84 87 85 74 86 85 82
#-#: [55] 86 88 86 83 81 81 81 82 89 90 90 86 82 80 77 79 76 78 78 77 72 79 81 86 97 94 96
#-#: [82] 94 91 92 93 93 87 84 80 78 75 73 81 76 77 71 71 78 67 76 68 82 64 71 81 69 63 70
#-#: [109] 75 76 68

#-#: Intervals:
#-#: min  max count
#-#: 1 56.5 76.5    46
#-#: 2 67.5 81.5    51
#-#: 3 75.5 86.5    51
#-#: 4 80.5 97.5    51

#-#: Overlap between adjacent intervals:
#-#: [1] 27 30 31

xyplot(ozone ~ radiation | temp.cut, environmental)
# change layout to 1 col, 4 row
xyplot(ozone ~ radiation | temp.cut, environmental, layout=c(1,4))

xyplot(ozone ~ radiation | temp.cut, environmental, as.table=T,
       panel = function(x, y, ...){
         panel.xyplot(x, y, ...) # do default
         # add regression line
         fit <- lm(y ~ x)
         panel.abline(fit, lmd=5)
         # local polynomial regression
         panel.loess(x, y)
       }, xlab='Solar Radiation', ylab='Ozone', main='Ozone vs. Radiation')

wind.cut <- equal.count(environmental$wind, 4)
# condition on two variables: temp.cut and wind.cut
xyplot(ozone ~ radiation | temp.cut * wind.cut, environmental, as.table=T,
       panel = function(x, y, ...){
         panel.xyplot(x, y, ...) # do default
         # local polynomial regression
         panel.loess(x, y)
       }, xlab='Solar Radiation', ylab='Ozone', main='Ozone vs. Radiation | Temper')

# Draw Conditional Scatter Plot Matrices and Parallel Coordinate Plots
splom(environmental)
# Draw histogram, a conditional way
histogram(~environmental$temperature | wind.cut)
