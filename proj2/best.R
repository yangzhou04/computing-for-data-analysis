best <- function(state, outcome) {
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
  
  ## Return hospital name in that state with lowest 30-day death rate
  suppressWarnings(measure[,outcome] <- as.numeric(measure[,outcome]))
  # subset operation, could opt?
  measure.state <- measure[measure$State==state,]
  idx <- which.min(measure.state[,outcome])
  res <- measure.state[idx, 2]
  if (length(res) > 1) {
    res <- sort(res)[1]
  }
  
  #print (res)
  invisible(res)
}
