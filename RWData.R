# There are a few pricipal functions reading data into R:
# ~ read.table, read.csv for reading tabular data
# ~ readLines, for reading lines of a text file
# ~ source, for reading in R code files(inverse of dump)
# ~ dget, for reading in R code files(inverse of dput)
# ~ load, for reading saved workspaces
# ~ unserialize, for reading single R object in binary form



# There are a few pricipal functions writing data to files:
# ~ write.table
# ~ writeLines
# ~ dump
# ~ dput
# ~ save
# ~ serialize



help(read.table)
# read.csv is identical to read.table except that the default seperator is a comma

# tips: if datasets are large, say, 10^15 rows.
#  0. Calculate the size of the datasets roughly, if the system's physical memory 
#      is not enough, you can stop.
#  1. Set comment.char='' if there are no commented line in your file
#  2. Use the colClasses argument to let reader run faster. Tell the reader what 
#      the type of column instead of letting the reader to figure it out.
# a quick an dirty way to figure out the classes of each column:
inital <- read.table('datatable.txt', nrows=100)
classes <- sapply(initial, class)
tabAll <- read.table('datatable.txt', colClasses=classes)
#  3. Set nrows.

# produce other textual format.
# dput & dget
y <- data.frame(a=1, b='a')
dput(y)
#structure(list(a = 1, b = structure(1L, .Label = "a", class = "factor")), 
#      .Names = c("a", "b"), row.names = c(NA, -1L), class = "data.frame")
dput(y, file='dpgut.R')
new.y <- dget('dpgut.R')
new.y
#-#:   a b
#-#: 1 1 a

# dump
x <- 'foo'
y <- data.frame(a=1, b='a')
dump(c('x', 'y'), file='dump.R')
rm(x, y)
source('dump.R')
y
#-#:   a b
#-#: 1 1 a
x
#-#: [1] "foo"


## file operation
# ~ file
# ~ gzfile
# ~ bzfile
# ~ url

# connections
data <- read.csv('foo.txt')
# is the same as
con <- file('foo.txt', r)
data <- read.csv(con)
close(con)

# read first 10 line to x
con <- gzfile('word.gz')
x <- readLines(con, 10)

# read from url
con <- url('http://www.google.com', 'r')
x <- readLines(con)
head(x)

