## Quiz 2
## Machine Learning

library(caret)
library(Hmisc)
library(tidyverse)
library(AppliedPredictiveModeling)

## Question 1
## Load the Alzheimer's disease data
data(AlzheimerDisease)

## Which of the following commands will create non-overlapping training
## and test sets with about 50% of the observations assigned to each?
adData = data.frame(diagnosis, predictors)
testIndex = createDataPartition(diagnosis, p = 0.50, list = FALSE)
ad_training = adData[-testIndex, ]
ad_testing = adData[testIndex, ]

## Question 2
## Load the cement data using the commands:
data(concrete)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

## Make a plot of the outcome (CompressiveStrength) versus the index of
## the samples. Color by each of the variables in the data set 
## (you may find the cut2() function in the Hmisc package useful for turning 
## continuous covariates into factors). What do you notice in these plots?
#
### Color by Cement
ggplot(training %>%
               mutate(Cement = cut2(Cement, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = Cement)) +
        geom_point()

### Color by BlastFurnaceSlag
ggplot(training %>%
               mutate(BlastFurnaceSlag = cut2(BlastFurnaceSlag, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = BlastFurnaceSlag)) +
        geom_point()

### Color by FlyAsh
ggplot(training %>%
               mutate(FlyAsh = cut2(FlyAsh, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = FlyAsh)) +
        geom_point()

### Color by Water
ggplot(training %>%
               mutate(Water = cut2(Water, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = Water)) +
        geom_point()

### Color by Superplasticizer
ggplot(training %>%
               mutate(Superplasticizer = cut2(Superplasticizer, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = Superplasticizer)) +
        geom_point()

### Color by CoarseAggregate
ggplot(training %>%
               mutate(CoarseAggregate = cut2(CoarseAggregate, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = CoarseAggregate)) +
        geom_point()

### Color by FineAggregate
ggplot(training %>%
               mutate(FineAggregate = cut2(FineAggregate, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = FineAggregate)) +
        geom_point()


### Color by Age
ggplot(training %>%
               mutate(Age = cut2(Age, g = 8)), 
       aes(x = inTrain, y = CompressiveStrength, color = Age)) +
        geom_point()

## There is a non-random pattern in the plot of the outcome versus index that
## does not appear to be perfectly explained by any predictor suggesting a
## variable may be missing.


## Question 3 ###
## Load the cement data using the commands:
testing = mixtures[-inTrain, ]

## Make a histogram and confirm the SuperPlasticizer variable is skewed.
## Normally you might use the log transform to try to make the data more 
## symmetric. Why would that be a poor choice for this variable?
ggpubr::gghistogram(testing, x = "Superplasticizer")

## There are a large number of values that are the same and even if you took the
## log(SuperPlasticizer + 1) they would still all be identical so the distribution
## would not be symmetric. There are values of zero so when you take the 
## log() transform those values will be -Inf.

## Question 4 ##
## Load the Alzheimer's disease data using the commands:
testing = adData[-inTrain, ]

## Find all the predictor variables in the training set that begin with IL.
## Perform principal components on these variables with the preProcess() function 
## from the caret package. Calculate the number of principal components needed
## to capture 90% of the variance. How many are there?
prComp<-ad_training %>% 
        select(starts_with("IL")) %>%
        preProcess(method = "pca", thresh = 0.9)
prComp$numComp

## Question 5 ##
## Load the Alzheimer's disease data using the commands:
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis, predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
testing = adData[-inTrain, ]

## Create a training data set consisting of only the predictors with variable
## names beginning with IL and the diagnosis. 
## Build two predictive models, one using the predictors as they are and one
## using PCA with principal components explaining 80% of the variance in the predictors.
## Use method="glm" in the train function. 
#
training = adData[ inTrain,]
trainingIL <- training %>%
        select(diagnosis, starts_with("IL"))
testingIL <- testing %>%
        select(diagnosis, starts_with("IL"))

# Build model 1
model <- train(diagnosis ~ ., data = trainingIL, method = "glm")
predict_model <- predict(model, newdata = testingIL)
matrix_model <- confusionMatrix(predict_model, testingIL$diagnosis)
matrix_model$overall[1]

# Build model 2
modelPCA <- train(diagnosis ~., data = trainingIL, method = "glm",
                  preProcess = "pca", 
                  trControl = trainControl(preProcOptions = list(thresh = 0.8)))
matrix_modelPCA <- confusionMatrix(
        testingIL$diagnosis, predict(modelPCA, testingIL)
)
matrix_modelPCA$overall[1]

## What is the accuracy of each method in the test set? Which is more accurate?
