## Week 3 Quiz - R programming

library(datasets)

# Question 1
# Take a look at the 'iris' dataset that comes with R
head(iris)

# A description of the dataset can be found by running
?iris

# In this dataset, what is the mean of 'Sepal.Length' for the species virginica? 
virginica <- iris[which(iris$Species=="virginica"), ]
virginica
mean(virginica$Sepal.Length)

# Question 2
# Continuing with the 'iris' dataset from the previous Question, what R code 
# returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 
# 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4], 2, mean)

# Question 3
# Load the 'mtcars' dataset in R with the following code
head(mtcars)

# How can one calculate the average miles per gallon (mpg) by number of 
# cylinders in the car (cyl)? Select all that apply.
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# Question 4
# Continuing with the 'mtcars' dataset from the previous Question, what is the 
# absolute difference between the average horsepower of 4-cylinder cars and the
# average horsepower of 8-cylinder cars?
sapply(split(mtcars$hp, mtcars$cyl), mean)

# Question 5
# If you run 
debug(ls)
ls
