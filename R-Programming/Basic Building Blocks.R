# Basic Building Blocks
#
# In this lesson, we will explore some basic building blocks of the R 
# programming language.
# If at any point you'd like more information on a particular topic related to R, 
# you can type help.start() at the prompt, which will open a menu of resources
# (either within RStudio or your default web browser, depending on your setup).
# Alternatively, a simple web search often yields the answer you're looking for.
#
# In its simplest form, R can be used as an interactive calculator. Type 5 + 7 
# and press Enter.
5 + 7

# R simply prints the result of 12 by default. However, R is a programming 
# language and often the reason we use a programming language as opposed to a 
# calculator is to automate some process or avoid unnecessary repetition.
# In this case, we may want to use our result from above in a second calculation. 
# Instead of retyping 5 + 7 every time we need it, we can just create a new 
# variable that stores the result.
#
# The way you assign a value to a variable in R is by using the assignment 
# operator, which is just a 'less than' symbol followed by a 'minus' sign. 
# It looks like this: <-
# To assign the result of 5 + 8 to a new variable called x, you type x <- 5 + 8. 
# This can be read as 'x gets 5 plus 7'.
x <- 5 + 8

# To view the contents of the variable x, just type x and press Enter.
x

# Now, store the result of x - 3 in a new variable called y.
y <- x - 3

# What is the value of y? Type y to find out.
y

# The easiest way to create a vector is with the c() function, which stands for 
# 'concatenate' or 'combine'. To create a vector containing the numbers 1.1, 9, 
# and 3.14, type c(1.1, 9, 3.14). Try it now and store the result in a variable
# called z.
z <- c(1.1, 9, 3.14)

#  Anytime you have questions about a particular function, you can access R's 
# built-in help files via the `?` command. For example, if you want more 
# information on the c() function, type ?c without the parentheses that normally 
# follow a function name. 
?c

# Type z to view its contents. Notice that there are no commas separating the
# values in the output.
z

# You can combine vectors to make a new vector. Create a new vector that 
# contains z, 555, then z again in that order. Don't assign this vector to a 
# new variable, so that we can just see the result immediately.
c(z, 555, z)

# Numeric vectors can be used in arithmetic expressions. Type the following to 
# see what happens: z * 2 + 100.
z * 2 + 100

# First, R multiplied each of the three elements in z by 2. Then it added 100 to 
# each element to get the result you see above.

# Other common arithmetic operators are `+`, `-`, `/`, and `^`
# (where x^2 means 'x squared'). To take the square root, use the sqrt() 
# function and to take the absolute value, use the abs() function.
#
# Take the square root of z - 1 and assign it to a new variable called my_sqrt.
sqrt(z - 1)

# Assign the result of sqrt(z - 1) to a variable called my_sqrt.
my_sqrt <- sqrt(z - 1)
my_sqrt         ## The my_sqrt variable contains a vector of length 3

# Now, create a new variable called my_div that gets the value of z divided by 
# my_sqrt.
my_div <- z / my_sqrt

# The first element of my_div is equal to the first element of z divided by the 
# first element of my_sqrt, and so on...



