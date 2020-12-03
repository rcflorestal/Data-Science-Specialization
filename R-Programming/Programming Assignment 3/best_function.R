##-------------------------Programming Assignment 3---------------------------##
##                                                                            ##
## This script is part of the R-Programming Module of the Data Science        ##
## Specialization, offered by Johns Hopkins University through Coursera       ## 
## platform.                                                                  ##
##                                                                            ##
##----------------------------------------------------------------------------##

#' @description
# best function that take two arguments: the 2-character abbreviated name of a 
# state and an outcome name. The function reads the outcome-of-care-measures.csv 
# file and returns a character vector with the name of the hospital that has the 
# best (i.e. lowest) 30-day mortality for the specified outcome in that state. 
# The hospital name is the name provided in the Hospital.Name variable. The 
# outcomes can be one of \heart attack", \heart failure", or \pneumonia". 
# Hospitals that do not have data on a particular outcome should be excluded 
# from the set of hospitals when deciding the rankings.
# Handling ties. If there is a tie for the best hospital for a given outcome, 
# then the hospital names should be sorted in alphabetical order and the first 
# hospital in that set should be chosen (i.e. if hospitals \b", \c", and \f" 
# are tied for best, then hospital \b" should be returned).
#
#' @pars: state, outcome
#' 
#' @details 
#' Read outcome data
#' Check that state and outcome are valid
#'
#' @Return
#' 
#' hospital name in that state with lowest 30-day death rate


## Load package
library(dplyr)
library(stringr)

## Set work directory
setwd("C:/Data-Science-Foundations-using-R-Specialization/R-Programming/Programming Assignment 3/")

## Set best function
best <- function(state, outcome){
        ## Read outcome data
        outcomeData <- read.csv(file = "./outcome-of-care-measures.csv",
                                header = TRUE,
                                sep = ",",
                                dec = ".",
                                colClasses = "character",
                                na.strings = "Not Available")
        
        ## Creates a new dataframe
        df <- data.frame(
                State = outcomeData[, 7],
                Hospital_Name = outcomeData[, 2],
                Heart_Attack = outcomeData[, 11],
                Heart_Failure = outcomeData[, 17],
                Pneumonia = outcomeData[, 23]
        )
        
        ## Check if State is valid
        if(!state %in% df$State){
                stop("invalid state")
        }
        ## Check if outcome is valid
        varList <- c("heart attack", "heart failure", "pneumonia")
        
        if(!outcome %in% varList){
                stop("invalid outcome")
        }
        
        ## Set a new data frame, Arrange State and Hospital Name
        outcome <- str_to_title(outcome)
        out <- str_replace(outcome, " +", "_")
        
        df <- df %>% 
                drop_na() %>%           ## Filter all rows without NA values
                filter(State == state)
        
        df_out <- df[which.min(df[, out]), "Hospital_Name"]
    
        ## Return hospital name in that state with lowest 30-day death rate
        return(as.character(df_out))
}

## Call the best function
best("TX", "heart attack")  ## "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure") ## "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")  ## "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")     ## "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")  ## Error in best("BB", "heart attack") : invalid state
best("SC", "heart attack")
best("NY", "pneumonia")
