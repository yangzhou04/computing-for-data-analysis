corr <- function(directory, threshold=0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  #filenames <- sprintf('%s/%03d', directory, list.files(directory, '*csv'))
  
  filenames <- paste( directory, list.files(directory, pattern="*.csv"), sep='')
  data <- lapply(filenames, read.csv)
  comp <- complete(directory)
  thres <- comp[comp$nobs>threshold,]

  res <- sapply(data[thres$id], function(x) 
       cor(x$nitrate, x$sulfate, use='complete.obs'))
  return (res)
}

