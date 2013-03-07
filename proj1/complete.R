complete <- function(directory, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # filenames <- sprintf('%s/%03d.csv', directory, id) 
  filenames <- paste( directory, list.files(directory, pattern="*.csv"), sep='') # is.vector(filenames) == T

  data <- lapply(filenames, read.csv) # is.list(data) == T
  comp <- lapply(data, complete.cases) # is.list(comp) == T
  nobs <- sapply(comp, sum)  # is.vector(nobs) == T
  res <- data.frame(id, nobs) # is.data.frame(res) == T
  
  return (res)
}

