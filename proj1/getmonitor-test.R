local({
  checkSanity <- function() {
    if(!file.exists("specdata"))
      stop("directory 'specdata' not found; please change your working directory")
    if(!file.exists("getmonitor.R"))
      stop("file 'getmonitor.R' not found; please change your working directory or name your code file accordingly")
    source("getmonitor.R", local = TRUE)
    if(!exists("getmonitor"))
      stop("function 'getmonitor' cannot be found")
  }       
  getmonitor.testscript <- function() {
    checkSanity()
    outputfiles <- sprintf("getmonitor-testoutput%d.txt", 1:2)
    op <- options(); options(scipen = 4); on.exit(options(op))
    
    ## cat("sourcing 'getmonitor.R'\n")
    source("getmonitor.R", local = TRUE)
    
    data <- getmonitor(1, "specdata")
    s1 <- as.character(as.numeric(summary(data$nitrate)))
    
    capture.output(data <- getmonitor(101, "specdata", TRUE))
    s2 <- as.character(as.numeric(summary(data$sulfate)))
    writeLines(c(s1, s2), outputfiles[1])
    
    data <- getmonitor("200", "specdata")
    qq <- quantile(data$nitrate, c(0.25, 0.75), na.rm = TRUE)
    
    data <- getmonitor(25, "specdata")
    set.seed(2)
    h <- head(data[sample(nrow(data)), ])
    s <- as.character(h[1, 2:3])
    writeLines(c(qq, s), outputfiles[2])
    
    cat("please upload the files\n\t", paste(outputfiles, collapse = "\n\t"), "\nto the Coursera web site\n", sep = "")
    return(invisible())
  }
  assign("getmonitor.testscript", getmonitor.testscript, globalenv())
})