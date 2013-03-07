## Vectored operation
x <- 1:4; y <- 6:9
x+y
#-#: [1]  7  9 11 13
x > 2
#-#: [1] FALSE FALSE  TRUE  TRUE


## Vectored matrix operation
x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x * y  # element-wise multiplication
#-#:       [,1] [,2]
#-#: [1,]   10   30
#-#: [2,]   20   40

x %*% y  # true matrix multiplication
#-#:       [,1] [,2]
#_#: [1,]   40   40
#-#: [2,]   60   60

# if size not the same, the short one will be extended
x <- 1:4
y <- 2:3
x+y
#-#: [1] 3 5 5 7

# set value less than 6 to 0
x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0
x
#-#: [1]  0  0  0 10 12  6