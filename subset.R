x <- matrix(rnorm(30, 1), ncol=5)
y <- c(1, seq(5))

#combining x and y into one matrix
x <- cbind(x, y)

#turning the matrix into a data frame
x.df <- data.frame(x)
print(x.df)
print(names(x.df))

#subsetting rows using the subset function
x.sub <- subset(x.df, y > 2)
print(x.sub)

#with multiple conditional statements
x.sub1 <- subset(x.df, y >2 & V1 > .6)
print(x.sub1)

#subsetting both rows and columns 
x.sub2 <- subset(x.df, y > 2 & V2 > .4, select=c(V1, V4))
print(x.sub2)

x.sub3 <- subset(x.df, y > 3, select= V2:V5)
print(x.sub3)

#subsetting rows using indices
x.sub4 <- x.df[x.df$y == 1, ]
print(x.sub4)

#subsetting row using indices
#selecting on more than one value
x.sub5 <- x.df[x.df$y %in% c(1,4), ]
print(x.sub5)

#subsetting columns using indices
x.sub6 <- x.df[ ,1:2]
print(x.sub6)

x.sub7 <- x.df[ , c(1, 3, 5)]
print(x.sub7)

#subsetting both rows and columns using indices
x.sub8 <- x.df[c(1, 3), 3:6]
print(x.sub8)