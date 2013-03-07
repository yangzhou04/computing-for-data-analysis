rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  #measure <- read.csv("outcome-of-care-measures.csv", colClasses='character')
  outcomes <- c('heart attack', 'heart failure', 'pneumonia')
  
  ## Check that state and outcome are valid
  if (! state %in% measure$State) stop('invalid state')
  if (! outcome %in% outcomes) stop('invalid outcome')
  
  # format outcome
  if (outcome == outcomes[1]) {
    # heart attack
    outcome = 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
  } else if (outcome == outcomes[2]) {
    # heart failure
    outcome = 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'
  } else if (outcome == outcomes[3]) {
    # pneumonia
    outcome = 'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'
  } else {
    stop("Fatal error")
  }
  
  ## Return hospital name in that state with the given rank 30-day death rate
  suppressWarnings(measure[,outcome] <- as.numeric(measure[,outcome]))
  measure.state <- measure[measure$State==state,]
  sorted <- measure.state[order(measure.state[,outcome], measure.state[,2], na.last=NA),]
  
  if (num == 'best') {
    #print (sorted[1, 2])
    invisible(sorted[1, 2])
  } else if (num == 'worst') {
    # print (sorted[length(sorted), 2]) length(data.frame) caculates the variables number
    #print (sorted[nrow(sorted),2])
    invisible(sorted[nrow(sorted),2])
  } else {
    #print (sorted[as.integer(num),2])
    invisible(sorted[as.integer(num),2])
  }
}

