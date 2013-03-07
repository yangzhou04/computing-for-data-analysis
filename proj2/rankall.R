rankall <- function(outcome, num = "best") {
  ## Read outcome data
  measure <- read.csv("outcome-of-care-measures.csv", colClasses='character')
  outcomes <- c('heart attack', 'heart failure', 'pneumonia')
  
  ## Check that state and outcome are valid
  if (! outcome %in% outcomes) stop('invalid outcome')
  
  ## For each state, find the hospital of the given rank
  states <- measure$State
  state <- levels(factor(states))
  #for (s in )
  #  bst <- best(s, outcome)
  
  hospital <- sapply(state, outcome=outcome, num=num, rankhospital)
  ## Return a data frame with the hospital names and the (abbreviated) state name
  res <- data.frame(hospital, state)
  invisible(res)
}
