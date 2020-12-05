##-------------------------Programming Assignment 3---------------------------##
##                                                                            ##
## This script is part of the R-Programming Module of the Data Science        ##
## Specialization, offered by Johns Hopkins University through Coursera       ## 
## platform.                                                                  ##
##                                                                            ##
##----------------------------------------------------------------------------##

#' @description
# rankhospital function takes three arguments: the 2-character abbreviated name 
# of a state (state), an outcome (outcome), and the ranking of a hospital in 
# that state for that outcome (num).
#
#' @pars
#' state
#' outcome
#' ranking
#' @details 
#' Read outcome-of-care-measures.csv file
#' @return
#' A character vector with the name of the hospital that has the ranking 
#' specified by the num argument. 

## Load package
library(dplyr)
library(tidyr)
library(stringr)

## Set work directory
setwd("C:/Data-Science-Foundations-using-R-Specialization/R-Programming/Programming Assignment 3/")

## Set best function
rankhospital <- function(state, outcome, num = "best"){
        ## Read outcome data
        outcomeData <- read.csv(file = "./outcome-of-care-measures.csv",
                                header = TRUE,
                                sep = ",",
                                dec = ".",
                                colClasses = "character",
                                na.strings = "Not Available")
        
        ## Creates a new dataframe
        df <- data.frame(
                State = outcomeData[, c(7)],
                Hospital_Name = outcomeData[, c(2)],
                Heart_Attack = as.numeric(outcomeData[, c(11)]),
                Heart_Failure = as.numeric(outcomeData[, c(17)]),
                Pneumonia = as.numeric(outcomeData[, c(23)])
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
        
        ## Check if outcome is valid. Set a new data frame, Arrange State and 
        ## Hospital Name
        if(outcome == "heart attack"){
                df <- df %>% 
                        ## Filter all rows without NA values
                        drop_na() %>%
                        
                        ## Select variables
                        select(State, Hospital_Name, Heart_Attack) %>%
                        
                        ## Select State
                        filter(State == state) %>%
                
                        ## Arrange the value of variables
                        arrange(Heart_Attack, Hospital_Name )
                        
                        
                        
        }else if(outcome == "heart failure"){
                df <- df %>% 
                        ## Filter all rows without NA values
                        drop_na() %>%
                        
                        ## Select variables
                        select(State, Hospital_Name, Heart_Failure) %>%
                        
                        ## Select State
                        filter(State == state) %>%
                        
                        ## Arrange the value of variables
                        arrange(Heart_Failure, Hospital_Name) 
                        
                        
        }else{
                df <- df %>% 
                        ## Filter all rows without NA values
                        drop_na() %>%
                        
                        ## Select variables
                        select(State, Hospital_Name, Pneumonia) %>%
                        
                        ## Select State
                        filter(State == state) %>%
                
                        ## Arrange the value of variables
                        arrange(Pneumonia, Hospital_Name)
                        
                        
        }
        
        ## Check parameters
        if(num >= 1 & num <= nrow(df)){
                return(df[num, 2])
        }
        else if(num == "worst"){
                return(tail(df$Hospital_Name, 1))
        }else{
                return(NA)
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        return(df[num, 2])
}

## Call the function rankhospital
rankhospital("TX", "heart failure", 4)          ## "DETAR HOSPITAL NAVARRO"
rankhospital("MN", "heart attack", 5000)        ## NA
rankhospital("TX", "heart failure", 5)          ## "METHODIST HOSPITAL,THE"
rankhospital("NC", "heart attack", "worst")     ## "WAYNE MEMORIAL HOSPITAL"
rankhospital("WA", "heart attack", 7)           ## "YAKIMA VALLEY MEMORIAL HOSPITAL"
rankhospital("TX", "pneumonia", 10)             ## "SETON SMITHVILLE REGIONAL HOSPITAL"
rankhospital("NY", "heart attack", 7)           ## "BELLEVUE HOSPITAL CENTER"
