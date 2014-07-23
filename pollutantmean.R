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

pollutantmean <- function(directory, pollutant, start, end) {
  # check end value
  if (is.na(end)) end <- start

  files <- sprintf("%s/%03i.csv", directory, start:end)
  dat <- data.frame()

  # load data
  for (i in seq_along(files)) {
    dat <- rbind(dat, read.csv(files[i]))
  }

  poll_mean <- mean(dat[[pollutant]], na.rm=TRUE)
  return (poll_mean)
}

# read args from command line
args <- commandArgs(TRUE)
directory <- args[1]
pollutant <- args[2]
start <- args[3]
end <- args[4]

poll_mean <- pollutantmean(directory, pollutant, start, end)
print(sprintf("The mean of all %s values is: %.3f", args[2], poll_mean))
