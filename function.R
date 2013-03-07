
## defining a functions
f <- function() {
  x  <- 1 # return value is x
}


## functions can be nested






## arguments partialy match
#  check for exact match for a named argument
#  check for a partial match
#  check for a positional match


## Arguments to functions are evaluated lazily 
f <- function(a, b) {
  a^2
}
f(2) # will get 4, because the b is never used, the b is not used then not evaluated
f <- function(a, b) {
  print(a)
  print(b)
}
f(2, 2) # will get an error

## the ... arguments
myplot <- function(x, y type='l', ...) {
  plot(x, y, type=type, ...)
}
args(paste)
#-#: function (..., sep = " ", collapse = NULL) 
# The name of argumets on the right side of ... must be explicitly given
paste('a', 'b', sep=':')
#-#: [1] "a:b"
paste('a', 'b', se=':') # can't be partially matched
#-#: [1] "a b :"
