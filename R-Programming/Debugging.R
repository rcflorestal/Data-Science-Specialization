# -----------------------------------------------------------------------------# 
#                                Debugging                                     #
# -----------------------------------------------------------------------------#

# Here is a function that is designed to print a message to the console 
# depending on the nature of its input.
# This function is simple—it prints a message telling you whether x is greater 
# than zero or less than or equal to zero. It also returns its input invisibly, 
# which is a common practice with “print” functions.
# Returning an object invisibly means that the return value does not get 
# auto-printed when the function is called.

printMessage <- function(x){
        if(x > 0){
                print("x is greater then 0")
        }
        else{
                print("x is less than 0")
        invisible(x)
        }
}

printMessage(1)
printMessage(-1)
printMessage(NA)

# We can fix that problem by anticipating the possibility of NA values and 
# checking to see if the input is NA with the is.na() function.
printMessage2 <- function(x){
        if(is.na(x)){
                print("x is a missing value!")
        }
        else if(x > 0){
                print("x is greater then 0")
        }
        else{
                print("x is less than 0")
        invisible(x)
        }
}

printMessage2(1)
printMessage2(-1)
printMessage2(NA)

# Now what about the following situation.
x <- log(c(-1, 2))

printMessage2(x)

# The problem here is that I passed printmessage2() a vector x that was of 
# length 2 rather then length 1. Inside the body of printmessage2() the 
# expression is.na(x) returns a vector that is tested in the if statement.
# However, if cannot take vector arguments so you get a warning. The fundamental
# problem here is that printmessage2() is not vectorized.
# We can solve this problem two ways. One is by simply not allowing vector 
# arguments. The other way is to vectorize the printmessage2() function to allow 
# it to take vector arguments.
# For the first way, we simply need to check the length of the input.
printMessage3 <- function(x){
        if(length(x) > 1L){
                stop("'x' has length > 1")
        }
        if(is.na(x)){
                print("x is a missing value!")
        }
        else if(x > 0){
                print("x is greater then 0")
        }
        else{
                print("x is less then 0")
        invisible(x)
        }
}

printMessage3(1:2)

# Vectorizing the function can be accomplished easily:
printMessage4 <- Vectorize(printMessage3)
out <- printMessage4(c(-1, 2))
