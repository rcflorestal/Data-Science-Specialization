##---------------------------Control Structures-------------------------------##
## This script is part of the R-Programming Module of the Data Science        ##
## Specialization, offered by Johns Hopkins University through Coursera       ## 
## platform                                                                   ##
##----------------------------------------------------------------------------##
#
#
## for Loops
#
# In R, for loops take an interator variable and assign it successive values 
# from a sequence or vector. For loops are most commonly used for iterating over 
# the elements of an object (list, vector, etc.)
for(i in 1:10){
        print(i)
}
#
# This loop takes the i variable and in each iteration of the loop gives it 
# values 1, 2, 3, …, 10, executes the code within the curly braces, and then the 
# loop exits.
x <- c("a", "b", "c", "d")
for(i in 1:4){
        print(x[i])
}

# The seq_along() function is commonly used in conjunction with for loops in 
# order to generate an integer sequence based on the length of an object 
# (in this case, the object x).
for(i in seq_along(x)){
        print(x[i])
}

# It is not necessary to use an index-type variable.
for(letter in x){
        print(letter)
}

# For one line loops, the curly braces are not strictly necessary.
for(i in 1:4) print(x[i])

# for loops can be nested inside of each other.
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))){
        for(j in seq_len(ncol(x))){
                print(x[i, j])
        }
}

## while Loops
#
# While loops begin by testing a condition. If it is true, then they execute the 
# loop body. Once the loop body is executed, the condition is tested again, and 
# so forth, until the condition is false, after which the loop exits.
count <- 0
while (count < 10) {
        print(count)
        count <- count + 1
}
# While loops can potentially result in infinite loops if not written properly. 
# Use with care!
# Sometimes there will be more than one condition in the test.
z <- 5
set.seed(1)

while (z >= 3 && z <= 10) {
        coin <- rbinom(1, 1, 0.5)
        
        if(coin == 1) {  ## random walk
                z <- z + 1
        } else {
             z <- z - 1   
        }
}
print(z)

## repeat Loops
#
# repeat initiates an infinite loop right from the start. These are not commonly 
# used in statistical or data analysis applications but they do have their uses. 
# The only way to exit a repeat loop is to call break.
# One possible paradigm might be in an iterative algorith where you may be 
# searching for a solution and you don’t want to stop until you’re close enough 
# to the solution. In this kind of situation, you often don’t know in advance 
# how many iterations it’s going to take to get “close enough” to the solution.
x0 <- 1
to1 <- 1e-8

repeat{
        x1 <- computeEstimete()  ## NOTE: computeEstimete() is not a real function
        
        if(abs(x1 - x0) < t01){  ## close enough?
                break
        }else{
                x0 <- x1
        }
}

## next, break
#
# next is used to skip an iteration of a loop.
for (i in 1:50) {
        if(i <= 20) {
                ## Skip the first 20 iterations
                next
        }
        ## prints the other values of the vector
        print(i)
}

# break is used to exit a loop immediately, regardless of what iteration the 
# loop may be on.
for (i in 1:50) {
        print(i)
        
        if(i > 20){
                ## Stop loop after 20 iterations
                break
        }
}



