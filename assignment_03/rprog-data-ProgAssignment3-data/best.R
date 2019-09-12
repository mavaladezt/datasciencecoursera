#setwd("~/Dropbox/School/Coursera Johns Hopkins Data Science R/datasciencecoursera/assignment_03/rprog-data-ProgAssignment3-data")
#outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#outcome[, 11] <- as.numeric(outcome[, 11])
#hist(outcome[, 11])

#source('best.R')
#newdata<-best('AL','heart failure')

best <- function(state, outcome) {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    #11: Heart Attack   17: Heart Failure   23: Pneumonia
    #check if outcome is valid
    ifelse(outcome=='heart attack',column<-11,ifelse(outcome=='heart failure',column<-17,ifelse(outcome=='pneumonia',column<-23,stop("invalid outcome"))))
    #check if state is valid
    valid_states <- unique(data$State)
    ifelse(state %in% valid_states,data[,column]<-as.numeric(data[, column]),stop("invalid state"))
    #filter info I need
    data<-data[data$State==state,c(2,column)]
    #order info
    data<-data[order(data[1]),]
    data<-data[order(data[2]),]
        
    return(data[1,1])

}



#best("TX", "heart attack")   #"CYPRESS FAIRBANKS MEDICAL CENTER"
#best("TX", "heart failure")   #"FORT DUNCAN MEDICAL CENTER"
#best("MD", "heart attack")   #"JOHNS HOPKINS HOSPITAL, THE"
#best("MD", "pneumonia")   #"GREATER BALTIMORE MEDICAL CENTER"
#best("BB", "heart attack") #: invalid state
#best("NY", "hert attack") #: invalid outcome