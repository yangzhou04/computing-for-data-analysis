plot(0, 0, main=expression(theta==0),
     ylab=expression(hat(gamma) == 0),
     xlab=expression(sum(x[i] * y[i], i==1, n)))
x <- rnorm(100)
# string concat
hist(x, xlab=expression("The mean (" * bar(x) * ") is " * sum(x[i]/n,i==1,n)))

## use a computed value in the annotation
x <- rnorm(100)
y <- x + rnorm(100)
plot(x, y, xlab=substitute(bar(x)==k, list(k=mean(x))),
     ylab=substitute(bar(y)==k, list(k=mean(y))))

# or in a loop plots
par(mfrow=c(2,2))
for (i in 1:4) {
  x <- rnorm(100)
  hist(x, main=substitute(theta==sum, list(num=i)))
}

# final 
?par
?plot
?xyplot
?plotmath
?axis

