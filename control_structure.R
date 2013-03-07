# if else
x <- 100
if (x > 3) {
  
} else if ( x < 0 ){
  
} else {
  
}


## this will generate a warning:
# Warning message:
# In if (x > 5) { :
#     the condition has length > 1 and only the first element will be used
x <- 1:10
# 'x' is a vector of length 10 and 'if' can only test a single logical statement.
if(x > 5) { 
  x <- 0
}




# just make sure to understand this writing.
y <- if (x > 3) {
  10
} else {
  0
}

# for 

for (i in 1:10) {
  print (i)
}

x <- c("a", "b", "c", "d")
for (i in 1:4) {
  print(x[i])
}
for (i in seq_along(x)) {
  print(x[i])
}
for (letter in x) {
  print(letter)
}

x <- matrix(1:6, 2, 3)
# seq-along(x) will print 1 2 3 4 5 6
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}


# while
count <- 0
while (count < 10) {
  print(count)
  count <- count+1
}
  


# repeat 

x0 <- 1
tol <- 1e-8
repeat {
  # x1 <- computeEstimate()
  x1 <- 10
  if (abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

# break 
# next -- just as continue

# return 
# the last expression value will be return by a function