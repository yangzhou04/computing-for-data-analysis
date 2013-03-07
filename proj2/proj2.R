### 3, Plot 30-day death rates by state
outcome <- outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
outcome[, 11] <- as.numeric(outcome[, 11])
table(outcome$State)

death <- outcome[,11]
state <- outcome$State
boxplot(death ~ state)

# Set the y-axis label to say "30-day Death Rate"
boxplot(death ~ state, ylab='30-day Death Rate')
# Set the title of the plot to be "Heart Attack 30-day Death Rate by State"
title('Heart Attack 30-day Death Rate by State')
# Set the x- and y-axis tick labels to be perpendicular to the axis so that 
#  the abbreviated names of all the states will appear on the plot. Use the 
#  par function to set this.
?par # las
par(las=3) # or
boxplot(death ~ state, ylab='30-day Death Rate', las=3)

# Challenge: Sort the states by their median 30-day death rate and plot 
#  the boxplots in order of their median rate. Note that the boxplot function 
#  also accepts a list as its first argument in addition to a formula.

### TODO

# Shrink the x-axis tick labels so that the abbreviated state names do not 
#  overlap each other

### TODO

# Challenge: Alter the x-axis tick labels so that they include the number 
#  of hospitals in that state in parentheses. For example, the label for 
#  the state of Connecticut would be CT (32). You will need the axis function 
#  and when you call the boxplot function you will want to set the option 
#  xaxt to be "n".


### TODO


### 4, Plot 30-day death rates and numbers of patients
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
hospital <- read.csv("hospital-data.csv", colClasses = "character")

# inner joint
outcome.hospital <- merge(outcome, hospital, by = "Provider.Number")
# create relevant variables
death <- as.numeric(outcome.hospital[, 11])  ## Heart attack outcome
npatient <- as.numeric(outcome.hospital[, 15])
owner <- factor(outcome.hospital$Hospital.Ownership)

library(lattice)
xyplot(death ~ npatient | owner, xlab='Number of Patients Seen', 
       ylab='30-day Death Rate', main='Heart Attack 30-day Death Rate by Ownership',
       panel=function(x, y, ...){
         panel.xyplot(x, y, ...)
         panel.lmline(x, y)
       })

### 5, Finding the best hospital in a state
source("best.R")
best('TX', 'heart attack')
best('TX', 'heart failure')
beat('MD', 'heart attack')
best('MD', 'pneumonia')
#...

### 6, Ranking hospitals by outcome in a state
source("rankhospital.R")
rankhospital('NY', 'heart attack', 'best')
rankhospital('MD', 'heart attack', 'worst')
rankhospital('MD', 'heart failure', 4)
rankhospital('MD', 'pneumonia', 10000) # NA

### 7, Ranking hospitals in all states