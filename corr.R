##      FUNCTION CORR
## Given a number of csv files with pollutant data, this function takes
## those monitors whose data is completed acording to the threshold value
## and makes a correlation between nitrate and sulfate for each monitors.
##
##      Arguments:
##              - directory: string indicating the path from the working
##                      directory to the one where the files are in.
##              - threshold: integer that fix the limit above which the
##                      number of complete observations are enought to 
##                      calculate.

corr<-function(directory, threshold = 0) {
        
## Track all the complete file names and its path.
        
files <- list.files(directory,full.names=TRUE)
cr <- vector("numeric")
        
## For each file in the directory:

for (i in seq_along(files)) {
        
        ## Read data and identify those complete observations
        
        dataset <- read.csv(files[i])
        good <- complete.cases(dataset)
        
        ## Check if the number of complete observations is above the 
        ## threshold. If it's true, make a correlation between nitrate
        ## sulfate values and save this value in a vector.
        
        if (sum(good)>threshold){
                dataset<- dataset[good,]
                cr <- c(cr,cor(dataset$nitrate,dataset$sulfate))
        }
}
## If there is nothing in the results vector, return a length 0 vector 
if (is.null(cr)){
        cr<-0
} 
return(cr)
}
                        
                        
        
        