##------------------------Getting and Cleaning Data---------------------------##
##                                                                            ##
## This script is part of the Getting and Cleaning Data Module of the Data    ##
## Science Specialization, offered by Johns Hopkins University through        ##
## Coursera platform.                                                         ##
##                                                                            ##
##----------------------------------------------------------------------------##

## Summarizing Data.

## Set work directory.
setwd("C:/Data-Science-Foundations-using-R-Specialization/Getting-and-Cleaning-Data/summarizing-data/")

## Download the data frame.
## Set link.
lk <- "https://data.baltimorecity.gov./api/views/k5ry-ef3g/rows.csv?accsessType=DOWNLOAD"

## Set file.
file_df <- "C:/Data-Science-Foundations-using-R-Specialization/Getting-and-Cleaning-Data/summarizing-data/restBalt.csv"

## Download.
if(!file.exists("restBalt.csv")){
        download.file(url = lk,
                      destfile = file_df,
                      method = "wininet")
}

## Read data
df <- read.csv(file = file_df,
               header = TRUE,
               sep = ",",
               dec = ".")

## Show the first three rows of the data frame. 
head(df, 3)

## Show the last three rows of the data frame. 
tail(df, 3)

## Basic statistic.
summary(df)

## Get more information about the data frame.
str(df)

## Quantiles of quantitative variables.
quantile(df$councilDistrict, na.rm = TRUE)

quantile(df$councilDistrict, probs = c(0.5, 0.75, 0.9))

## Makes table.
table(df$zipCode, useNA = "ifany")

table(df$councilDistrict, df$zipCode)

## Checks for missing values in the data frame.
sum(is.na(df$councilDistrict))

## Checks if there are any NA values in the councilDistrict column.
any(is.na(df$councilDistrict))

## Checks if there are any zipCode with negative value.
all(df$zipCode > 0)

## Sum NA values in each column.
colSums(is.na(df))

## Check if there are no NA value in all columns. 
all(colSums(is.na(df)) == 0)

## Values with specific characteristics.
## Checks how many restaurants there are in the zipcode 21212.
table(df$zipCode %in% c("21212")) 

## Checks how many restaurant there are in the zipcodes 21212 and 21213.
table(df$zipCode %in% c("21212", "21213"))

## Creates a new data frame from the statement above
df[df$zipCode %in% c("21212", "21213"), ]

## Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

## Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData), units = "Mb")
