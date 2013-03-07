## search order:
# search the global environment for a symbol name
# search the namespaces of each of packages on the search list
search()
#-#: [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"     "package:graphics" 
#-#: [5] "package:grDevices" "package:utils"     "package:datasets"  "package:methods"  
#-#: [9] "Autoloads"         "package:base" 
# .GlobalEnv is the users workspace

library(survival)
search()
#-#:  [1] ".GlobalEnv"        "package:survival"  "package:splines"   "tools:rstudio"    
#-#: [5] "package:stats"     "package:graphics"  "package:grDevices" "package:utils"    
#-#: [9] "package:datasets"  "package:methods"   "Autoloads"         "package:base"  
# The survival inserted into the second right after '.GlobalEnv'
library(lattice)
search()
#-#:  [1] ".GlobalEnv"        "package:lattice"   "package:survival"  "package:splines"  
#-#:  [5] "tools:rstudio"     "package:stats"     "package:graphics"  "package:grDevices"
#-#:  [9] "package:utils"     "package:datasets"  "package:methods"   "Autoloads"        
#-#:  [13] "package:base"  
# another insert and everything go shiftdown.

## R has seperate namespaces for functions and non-functions. So It's possible to
#  have an object and a function both named 'c'





## Scoping rules
# R uses lexical scoping or static scoping
# the value of free variable are searched for in the environments(a collection of 
# (symbol, value)paris) in which the variable is defined;
# an environment has a parent environment.
#!!! a function + an environment = a closure or function closure !!!

f <- function(x, y) {
  x^2 + y/z
}
# z is called Free variable
#  search order: 
#      1. search environment and it's parent environment until hit empty environment
#      2. search in the search list.
#      3. throw error
ef = environment(f)
ls(ef)  # list environments
parent.env(ef)

# lexical scoping can make us return a function in another function
make.power <- function(n){
  pow <- function(x) {
    x^n
  }
  pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

# another example
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x*y
}

f(3)
#-#: [1] 34

# other languages that support lexical scoping:
# Scheme
# Perl
# Python
# Common Lisp


## Consequences of lexical scoping
# In R, all objects must be stored in memory
