#               POLLUTANTMEAN FUNCTION
#
# It is designed to read data of a pollutant across a  
# number of monitors and calculate its mean. The data are saved 
# in separated .csv files and stored in the specified directory.
#
# ARGUMENTS:
#       - "directory": character vector of length 1 indicating
#               the directory where the .csv files are.
#       - "pollutant": character vector of length 1 indicating the
#               name of the pollutant for which we will calculate 
#               the mean.
#       - "id": integer vector indicating the monitor numbers to 
#               be used.

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        