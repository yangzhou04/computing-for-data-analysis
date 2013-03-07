# +([a-zA-Z]+) +\1 +
# match:
  # time for bed bed .
  
## regular expression in R
# grep, grepl  tells you which strings in a character vector contain a certain 
#   pattern
homicides <- readLines("homicides.txt")
grep("iconHomicideShooting", homicides)
grep("iconHomicideShooting|icon_homiccide_shooting", homicides)
#...
i <- grep("[Cc]ause: [Ss]hooting", homicides)
j <- grep("[Ss]hooting", homicides)
setdiff(i, j)
#-#: integer(0)
setdiff(j, i)
#-#: 318 859

grep("^New", state.name)
#-#: [1] 29 30 31 32

grep("^New", state.name, value=T)
#-#: [1] "New Hampshire" "New Jersey"    "New Mexico"    "New York"


grepl("^New", state.name)
#_#: [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#_#: [15] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#_#: [29]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#_#: [43] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE

# regexpr, gregexpr(g -> global)
#   The regexpr function gives you the index into each string where the match begins
#      and the length of that matched string
r <- regexpr("<dd>[Ff]ound(.*?)</dd>", homicides[1:10])
#_#: [1] 177 178 188 189 178 182 178 187 182 183
#_#: attr(,"match.length")
#_#: [1] 33 33 33 33 33 33 33 33 33 33
#_#: attr(,"useBytes")
#_#: [1] TRUE
substr(homicides[1], 177, 177+93-1) # instead, we use
x <- regmatches(homicides[1:10], r)

# sub, gsub
sub("<dd>[Ff]ound on |</dd>", "", x)
#-#: [1] "January 1, 2007</dd>" "January 2, 2007</dd>" "January 2, 2007</dd>"
#-#: [4] "January 3, 2007</dd>" "January 5, 2007</dd>" "January 5, 2007</dd>"
#-#: [7] "January 5, 2007</dd>" "January 7, 2007</dd>" "January 8, 2007</dd>"
#-#: [10] "January 8, 2007</dd>"

d <- gsub("<dd>[Ff]ound on |</dd>", "", x)
#-#: [1] "January 1, 2007" "January 2, 2007" "January 2, 2007" "January 3, 2007"
#-#: [5] "January 5, 2007" "January 5, 2007" "January 5, 2007" "January 7, 2007"
#-#: [9] "January 8, 2007" "January 8, 2007"
as.Date(d, "%B %d, %Y")
## another way to do this is:
# regexec   gives you the indecies for parenthesized sub-expression
r <- regexec("<dd>[Ff]ound on (.*?)</dd>", homicides)

m <- regmatches(homicides, r)
d <- sapply(m, function(x) x[2])
d <- as.Date(d, "%B %d, %Y")
hist(d, "month", freq=T)