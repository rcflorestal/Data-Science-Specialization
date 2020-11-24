# Base Graphics
# Load the included data frame cars
data(cars)

# Pull up the help page for cars
?cars

# As you can see in the help page, the cars data set has only two variables: 
# speed and stopping distance. Note that the data is from the 1920s.
#
# Run head() on the cars data
head(cars)

# Before plotting, it is always a good idea to get a sense of the data. Key R 
# commands for doing so include, dim(), names(), head(), tail() and summary().
#
# Run the plot() command on the cars data frame
plot(cars)

# Look up the help page for plot()
?plot

# The help page for plot() highlights the different arguments that the function
# can take. The two most important are x and y, the variables that will be 
# plotted. For the next set of questions, include the argument names in your
# answers. That is, do not type plot(cars$speed, cars$dist), although that will
# work. Instead, use plot(x = cars$speed, y = cars$dist).
plot(x = cars$speed, y = cars$dist)

# Use plot() command to show dist on the x-axis and speed on the y-axis from the
# cars data frame. This is the opposite of what we did above.
plot(x = cars$dist, y= cars$speed)

# It probably makes more sense for speed to go on the x-axis since stopping 
# distance is a function of speed more than the other way around.
#
# Recreate the plot with the label of the x-axis set to "Speed".
plot(x = cars$speed, 
     y = cars$dist, 
     xlab = "Speed")

# Recreate the plot with "Speed" and "Stopping Distance" as axis labels.
plot(x = cars$speed, 
     y = cars$dist, 
     xlab = "Speed", 
     ylab = "Stopping Distance")

# Plot cars with a main title of "My Plot".
plot(cars, main = "My Plot")

# Plot cars with a sub title of "My Plot Subtitle".
plot(cars, sub = "My Plot Subtitle")

# Plot cars so that the plotted points are colored red.
# (Use col = 2 to achieve this effect.)
plot(cars, col = 2)

# Plot cars while limiting the x-axis to 10 through 15. 
# (Use xlim = c(10, 15) to achieve this effect.
plot(cars, xlim = c(10, 15))

# Plot cars using triangles.
plot(cars, pch = 2)

# Let's now look at some other functions in base graphics that may be useful, 
# starting with boxplots.
data(mtcars)

# Anytime that you load up a new data frame, you should explore it before using 
# it.
dim(mtcars)
head(mtcars)

# Look up the help page for boxplot()
?boxplot

# Instead of adding data columns directly as input arguments, as we did with 
# plot(), it is often handy to pass in the entire data frame. This is what the
# "data" argument in boxplot() allows.
#
# boxplot(), like many R functions, also takes a "formula" argument, generally
# an expression with a tilde ("~") which indicates the relationship between the
# input variables. This allows you to enter something like mpg ~ cyl to plot the
# relationship between cyl (number of cylinders) on the x-axis and mpg 
# (miles per gallon) on the y-axis.
#
# Use boxplot() with formula = mpg ~ cyl and data = mtcars to create a box plot.
boxplot(mpg ~ cyl, data = mtcars)

# The plot shows that mpg is much lower for cars with more cylinders. Note that 
# we can use the same set of arguments that we explored with plot() above to add 
# axis labels, titles and so on.

# When looking at a single variable, histograms are a useful tool. hist() is the
# associated R function. Like plot(), hist() is best used by just passing in a 
# single vector.
# Use hist() with the vector mtcars$mpg to create a histogram.
hist(mtcars$mpg,
     xlab = "miles per galon",
     ylab = "Frequency")

# If you want to explore other elements of base graphics, then this web page 
# (http://www.ling.upenn.edu/~joseff/rstudy/week4.html) provides a useful overview.
