library(swirl)
#============================================================

#load csv
MyData <- read.csv(file="hw1_data.csv", header=TRUE, sep=",")

#slice first 2 rows
MyData[1:2,]

#missing values
a<-MyData[,1]
sum(is.na(a))

#filter non na values
a<-MyData[,1]
b<-is.na(a)
mean(a[!b])

#subsetting
a <- subset(MyData, Ozone > 31)
b <- subset(a, Temp > 90)
mean(b$Solar.R)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#SWIRL
install.packages('swirl')
packageVersion('swirl')
library('swirl')
install_from_swirl('R Programming')

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#VECTORS
c(1.1,9,3.14)
#==============================================================
#FILES
getwd()
ls()
list.files()
dir()
args(list.files) #see which arguments the function can take
old.dir<-getwd()
dir.create('testdir') #crate directory
setwd('testdir') #open folder
file.create('mytest.R')   #create file
file.exists('mytest.R') #check if file exists
file.info('mytest.R')
file.rename('mytest.R','mytest2.R') #renameing file
file.copy('mytest2.R','mytest3.R')
file.path("folder1", "folder2") #"folder1/folder2"
dir.create(file.path('testdir2','testdir3'), recursive=TRUE) #nested folders
#======================================================
#SEQUENCES OF NUMBERS
seq(0,20,by=0.5)
seq(5, 10, length=30)
1:length(my_seq)
seq(along.with = my_seq)
seq_along(my_seq)
rep(0,times=40)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each =10)
#=====================================================
#VECTORS AND LISTA
A | B #at least one is TRUE
A & B #both true or both false
my_char<-c("My","name","is")
paste(my_char, collapse = " "). #"My name is"
paste("Hello", "world!", sep = " ")
paste(LETTERS, 1:4, sep = "-")
#======================================================
#MISSING VALUES
y <- rnorm(1000)
z <- rep(NA, 1000)
my_data <- sample(c(y, z), 100) #gets sample form lists or vectors
is.na(my_data) #finds values that are na
#=====================================================
#SUBSETTING
y[y>0]
y<-x[!is.na(x)]
x[!is.na(x) & x > 0]. #brings non na's and positive
x[c(3, 5, 7)]. #bring elements 3,5,7
x[c(-2, -10)]. #elements except indices 2 and 10
-x[c(2, 10)]
vect<- c(foo = 11, bar = 2, norf = NA)
names(vect)
names(vect2)<-c("foo", "bar", "norf") #names after the fact
identical(vect,vect2) #check if they are the same
vect['bar']
vect[c("foo", "bar")]
#MATRICES AND DATAFRAMES
my_vector<-1:20
dim(my_vector) #dimensions
length(my_vector)
dim(my_vector)<-c(4,5)
attributes(my_vector)
class(my_vector).  #matrix
my_matrix2<-matrix(1:20,4,5)
patients<-c("Bill","Gina","Kelly","Sean")
cbind(patients,my_matrix). #can't do it with vector but can with matrix
my_data<-data.frame(patients,my_matrix)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data)<-cnames
#============================================================
#LOGICAL
TRUE & c(TRUE, FALSE, FALSE) #AND evaluates each one in vector
TRUE && c(TRUE, FALSE, FALSE) #AND evaluates first 
TRUE | c(TRUE, FALSE, FALSE) #OR
TRUE || c(TRUE, FALSE, FALSE) #OR in first
isTRUE(6>4)
identical('twins','twins')
xor(5 == 6, !FALSE)  #exclusive or.. one true and one false = TRUE
which(c(TRUE, FALSE, TRUE)) #returns c(1, 3)
ints <- sample(10)
which(ints>7).  #3  6 10
any(ints<0).  #false.   retuns true if any element is true
al(ints<0).   #TRUE
#===========================================================
#FUNCTIONS
Sys.Date()
args(remainder). #name arguments of function
evaluate(function(x){x+1}, 6) #pass function
paste(). #concatenate strings
paste("Programming", "is", "fun!")
telegram <- function(...){
	paste("START",...,"STOP")  
}
#---------------------
mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
#--------------------------
"%p%" <- function(left,right){ # Remember to add arguments!
  paste(left,right)
}
