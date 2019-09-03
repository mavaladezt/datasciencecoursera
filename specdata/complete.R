complete <- function(directory,id=1:332) {
  #directory: string with file folder location
  #setwd("/Users/mavt/Dropbox/R Training/")
  
  setwd("/Users/mavt/Dropbox/R Training/")
  setwd(directory)
  total_rows <- 0
#  total <- 0
  
  column=3
  
  report <- data.frame(matrix(0, nrow = length(id), ncol = 2))
  colnames(report)<-c("id","nobs")
  j <- 1  
  for (i in id){
    if (i < 10){
      filename <- paste("00",i,sep="")
    }
    else if(i < 100 & i>=10){
      filename <- paste("0",i,sep="")
    }
    else {
      filename <- i
    }
    filename <- paste(filename,".csv",sep="")
#    print(filename)
    #    print(filename)
    data <- read.csv(file=filename, header=TRUE, sep=",")
    #    print(data)
    report[j,2] <- sum(!is.na(data[,2] + data[,3]))
    report[j,1] <- i
    j <- j + 1
  }
  report
}

#setwd("/Users/mavt/Dropbox/R Training/")
#pollutantmean("specdata","sulfate",1:1)
#empty<-data.frame(matrix(0, nrow = 2, ncol = 3))
complete("specdata", 1:332)