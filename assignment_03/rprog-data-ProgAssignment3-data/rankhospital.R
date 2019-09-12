#setwd("~/Dropbox/School/Coursera Johns Hopkins Data Science R/datasciencecoursera/assignment_03/rprog-data-ProgAssignment3-data")
#outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#outcome[, 11] <- as.numeric(outcome[, 11])
#hist(outcome[, 11])

#source('rankhospital.R')
#newdata<-rankhospital('TX','heart failure',1)

rankhospital <- function(state, outcome, num) {
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
    data <- na.omit(data)
    total_rows <- nrow(data)
    ifelse(num=='best',ranking<-1,ifelse(num=='worst',ranking<-total_rows,ranking<-num))
    if (ranking > total_rows){
        return (NA)
    }
    return(data[ranking,1])
}
#source('rankhospital.R')
#newdata<-rankhospital('TX','heart failure',2)
