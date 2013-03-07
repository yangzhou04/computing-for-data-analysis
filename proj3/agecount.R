agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  if (is.null(age)) stop('age can\'t be null')
  ## Read "homicides.txt" data file
  homicides <- readLines('homicides.txt')
  
  ## Extract ages of victims; ignore records where no age is given
  r <- regexec("([0-9]+) years old", homicides)
  m <- regmatches(homicides, r)
  res <- sapply(m, function(x) if(!is.na(x[2]))x[2])
  res <- tolower(res)
  
  ## Return integer containing count of homicides for that age
  length(res[res == age])
}

