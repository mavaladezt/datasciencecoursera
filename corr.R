corr <- function(directory,threshold=0) {
  #directory: string with file folder location
  #setwd("/Users/mavt/Dropbox/R Training/")
  
  id=1:332
  setwd("/Users/mavt/Dropbox/R Training/")
  setwd(directory)
  total_rows <- 0
  #  total <- 0
  
  column=3
  
  report <- data.frame(matrix(0, nrow = length(id), ncol = 3))
  colnames(report)<-c("id","nobs","correlation")
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
    valid_indexes <- (!is.na(data[,2] + data[,3]))
    if(report[j,2]>0){
    report[j,3] <- cor(data$sulfate[valid_indexes],data$nitrate[valid_indexes])
    }
    j <- j + 1
  }
#  print(data$sulfate[valid_indexes])
  if(max(report$nobs)==0){
    c(0)
  }
  else{
    report$correlation[report$nobs>=threshold]
  }
}

#setwd("/Users/mavt/Dropbox/R Training/")
#pollutantmean("specdata","sulfate",1:1)
#empty<-data.frame(matrix(0, nrow = 2, ncol = 3))
cr<-corr("specdata", 150)
head(cr)