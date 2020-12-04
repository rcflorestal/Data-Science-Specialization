
## Set work directory
setwd("C:/Data-Science-Foundations-using-R-Specialization/R-Programming/Programming Assignment 3/")

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outcomeData <- read.csv(file = "./outcome-of-care-measures.csv",
                                header = TRUE,
                                sep = ",",
                                dec = ".",
                                colClasses = "character",
                                na.strings = "Not Available")
        
        ## Check that state and outcome are valid
        if(!state %in% df$State){
                stop("invalid state")
        }
        ## Check if outcome is valid
        varList <- c("heart attack", "heart failure", "pneumonia")
        
        if(!outcome %in% varList){
                stop("invalid outcome")
        }
        
        ## For each state, find the hospital of the given rank
        
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
}