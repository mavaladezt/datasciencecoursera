#setwd("~/Dropbox/School/Coursera Johns Hopkins Data Science R/datasciencecoursera/assignment_03/rprog-data-ProgAssignment3-data")

rankall <- function(outcome, num) {
#    source('rankhospital.R')
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    states <- unique(data$State)
    rankings <- data.frame(hospital=rep('',times=length(states)),
                     state=rep('',times=length(states)),
                     stringsAsFactors=FALSE)
#        rankings = data.frame(
    ifelse(outcome == 'heart attack',column <- 11,ifelse(outcome == 'heart failure',column <- 17,ifelse(outcome == 'pneumonia',column <-23,stop("invalid outcome"))))
            
    for (i in 1:length(states)){
        rankings[i,2] <- states[i]
        temp <- data[data$State == states[i],c(2,column)]
        temp <- temp[order(temp[1]),]
        temp <- temp[order(temp[2]),]
        temp <- na.omit(temp)
        total_rows <- nrow(temp)
        ifelse(num == 'best',ranking <- 1,ifelse(num == 'worst',ranking <- total_rows,ranking<-num))
        if (ranking > total_rows){
            rankings[i,1] <- NA
        }
        rankings[i,1] <- temp[ranking,1]
    }
    return(rankings)
}
#source('rankall.R')
#newdata<-rankall('heart failure',1)
