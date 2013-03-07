## Optimization routines in R like optim, nlm and optimize require you to pass
#  a function whose argument is a vector of parameters.
make.NegLogLike <- function(data, fixed=c(FALSE, FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}

set.seed(1)
normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLike(normals)
nLL
#-#: function(p) {
#-#:   params[!fixed] <- p
#-#: mu <- params[1]
#-#: sigma <- params[2]
#-#: a <- -0.5*length(data)*log(2*pi*sigma^2)
#-#: b <- -0.5*sum((data-mu)^2) / (sigma^2)
#-#: -(a + b)
#-#: }
<environment: 0x7fed8cfa0f58> # a pointer to the environment
ls(environment(nLL))

optim(c(mu=0, sigma=1), nLL)$par
#-#:       mu    sigma 
#-#: 1.218239 1.787343 

# Fixing sigma = 2
nLL <- make.NegLogLike(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum
#-#: [1] 1.217775
# Fixing mu = 1
nLL <- make.NegLogLike(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum
#-#: [1] 1.800596

## plotting the likelihood
nLL <- make.NegLogLike(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type='l')

## Gentleman Lhaka(2000), Lexical scope and statistical computing
## has lots of example like this.