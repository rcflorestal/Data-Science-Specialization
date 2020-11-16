# Function that reads a directory full of files and reports the number of 
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is
# the number of complete cases.


complete <- function(directory, id = 1:332){
        ## Creates a list of all files in the directory
        lf <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
        ## Creates the nobs variable
        nobs <- numeric()
        ## Looping to read each file in the directory in the list
        for(i in id){
                ## Creates a data frame from all files in the list
                data <- read.csv(lf[i])
                ## Sum the number of observations without missing values
                nobs <- c(nobs, sum(complete.cases(data)))
        }
        ## returns a data frame with ID and number of observations without NA 
        data.frame(id, nobs)
}

# Call the function 
complete("specdata", 1)

complete("specdata", 3)
complete("specdata", 30:25)
complete("specdata", c(2, 4, 8, 10, 12))

# Question 5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

# Question 6
cc <- complete("specdata", 54)
print(cc$nobs)

# Question 7
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
