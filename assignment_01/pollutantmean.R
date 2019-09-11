pollutantmean <- function(directory,pollutant,id=1:332) {
  #directory: string with file folder location
  #pollutant: either "sulfate" or "nitrate"
  #setwd("/Users/mavt/Dropbox/R Training/")

#  id <- 1:2
  
#  print(directory)
  setwd("/Users/mavt/Dropbox/R Training/")
  setwd(directory)
  total_rows <- 0
  total <- 0
  column <- 3
  if (pollutant == "sulfate"){
    column <- 2
  }

  for (i in id){
    if (i < 10){
      filename <- paste("00",i,sep="")
    }
    else if(i < 100 & i>=10){
      filename <- paste("0",i,sep="")
    }

    filename <- paste(filename,".csv",sep="")
#    print(filename)
    data <- read.csv(file=filename, header=TRUE, sep=",")
#    print(data)
    sub_data <- data[!is.na(data[,column]),column]
#    print(sub_data)
    total_rows <- total_rows + length(sub_data)
    total <- total + sum(sub_data)
#  print(total / total_rows)
  }
  print(total / total_rows)
  total / total_rows
}

#setwd("/Users/mavt/Dropbox/R Training/")
#pollutantmean("specdata","sulfate",1:1)
pollutantmean("specdata", "nitrate", 1:1)