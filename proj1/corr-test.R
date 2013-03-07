local({
  checkSanity <- function() {
    if(!file.exists("specdata"))
      stop("directory 'specdata' not found; please change your working directory")
    if(!file.exists("getmonitor.R"))
      stop("file 'getmonitor.R' not found; please change your working directory or name your code file accordingly")
    if(!file.exists("complete.R"))
      stop("file 'complete.R' not found; please change your working directory or name your code file accordingly")
    if(!file.exists("corr.R"))
      stop("file 'corr.R' not found; please change your working directory or name your code file accordingly")
    source("getmonitor.R", local = TRUE)
    if(!exists("getmonitor"))
      stop("function 'getmonitor' cannot be found")
    source("complete.R", local = TRUE)
    if(!exists("complete"))
      stop("function 'complete' cannot be found")
    source("corr.R", local = TRUE)
    if(!exists("corr"))
      stop("function 'corr' cannot be found")
  }
  corr.testscript <- function() {
    checkSanity()
    outputfiles <- sprintf("corr-testoutput%d.txt", 1:3)
    op <- options(); options(scipen = 4); on.exit(options(op))
    
    source("getmonitor.R", local = TRUE)
    source("complete.R", local = TRUE)
    source("corr.R", local = TRUE)
    
    ## Run all
    cr <- corr("specdata")
    cr <- sort(cr)
    set.seed(868)
    out <- round(cr[sample(length(cr), 5)], 4)
    writeLines(as.character(out), outputfiles[1])
    
    ## Threshold
    cr <- corr("specdata", 129)
    cr <- sort(cr)
    n <- length(cr)
    set.seed(197)
    out <- c(n, round(cr[sample(n, 5)], 4))
    writeLines(as.character(out), outputfiles[2])
    
    ## High Threshold
    cr <- corr("specdata", 2000)
    n <- length(cr)
    cr <- corr("specdata", 1000)
    cr <- sort(cr)
    writeLines(as.character(c(n, round(cr, 4))), outputfiles[3])
    
    cat("please upload the files\n\t", paste(outputfiles, collapse = "\n\t"), "\nto the Coursera web site\n", sep = "")
    return(invisible())
  }
  assign("corr.testscript", corr.testscript, globalenv())
})