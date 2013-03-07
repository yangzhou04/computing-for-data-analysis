x <- rnorm(100)
hist(x)

y <- rnorm(100)
plot(x, y)

# set margin
par(mar=c(2,2,2,2))
plot(x, y)

# change plotting symbol
plot(x, y, pch=20)

example(points)

# plotting symbol
pchShow(c("o","O","0"), cex = 2.5)

# add a title
title('example')
# add some text
text(-2, -2, 'label')

# add a legend
legend('topleft', legend='data', pch=1)
fit <- lm(y ~ x) # lm is used to fit linear models
# add a line, line width=3, color='blue'
abline(fit, lwd=3, col='blue')

plot(x, y, xlab='Weight', ylab='Height', main='ScatterExample', pch=20)

# multiple plots
z <- rpois(100, 2)
# two row, one col
par(mfrow=c(2,1))
plot(x, y, pch=20)
plot(x, z, pch=20)
# two cow, one row
par(mfrow=c(1,2))
plot(x, y, pch=20)
plot(x, z, pch=20)

#  plot sequance is diff.
par(mfrow=c(2,2))
par(mfcol=c(2,2))


# 
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50, labels=c('Male', 'Female'))
plot(x, y)  # cannot tell, instead:
plot(x, y, type='n')
points(x[g=='Male'], y[g=='Male'], col='green')
points(x[g=='Female'], y[g=='Female'], col='blue', pch=19)



