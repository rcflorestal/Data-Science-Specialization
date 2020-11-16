# Lapply and Sapply
# Throughout this lesson, we'll use the Flags dataset from the UCI Machine 
# Learning Repository. This dataset contains details of various nations and
# their flags. More information may be found here: http://archive.ics.uci.edu/ml/datasets/Flags
#
# I've stored the dataset in a variable called flags. Type head(flags) to preview 
# the first six lines (i.e. the 'head') of the dataset.

flags <- read.table(
        file = "C:/Data-Science-Foundations-using-R-Specialization/R-Programming/flags_data/flag.data.txt",
        #header = TRUE,
        sep = ",")
names <- c("name", "landmass", "zone", "area", "population", "language",
           "religion", "bars", "stripes", "colours", "red", "green", "blue",
           "gold", "white", "black", "orange", "mainhue", "circles", "crosses",
           "saltires", "quarters", "sunstars", "crescent", "triangle", "icon",
           "animate", "text", "topleft", "botright")
names(flags) <- names
head(flags)

# Now, let's check out the dimensions of the dataset
dim(flags)

# As with any dataset, we'd like to know in what format the variables have been 
# stored. In other words, what is the 'class' of each variable?
class(flags)

# That just tells us that the entire dataset is stored as a 'data.frame', which
# doesn't answer our question. What we really need is to call the class() 
# function on each individual column.
#
# The lapply() function takes a list as input, applies a function to each element
# of the list, then returns a list of the same length as the original one. 
# Since a data frame is really just a list of vectors (you can see this with 
# as.list(flags)), we can use lapply() to apply the class() function to each 
# column of the flags dataset. Let's see it in action!
cls_list <- lapply(flags, class)
cls_list

# As expected, we got a list of length 30 -- one element for each variable/column. 
# The output would be considerably more compact if we could represent it as a 
# vector instead of a list.
#
# cls_list can be simplified to a character vector. To do this manually, type:
as.character(cls_list)

# | sapply() allows you to automate this process by calling lapply() behind the
# scenes, but then attempting to simplify (hence the 's' in 'sapply') the result
# for you. Use sapply() the same way you used lapply() to get the class of each
# column of the flags dataset and store the result in cls_vect. 
# If you need help, type ?sapply to bring up the documentation.
cls_vect <- sapply(flags, class)
cls_vect

# Columns 11 through 17 of our dataset are indicator variables, each representing 
# a different color. The value of the indicator variable is 1 if the color is 
# present in a country's flag and 0 otherwise.
#
# Therefore, if we want to know the total number of countries (in our dataset) 
# with, for example, the color orange on their flag, we can just add up 
# all of the 1s and 0s in the 'orange' column. Try sum(flags$orange) to see this.
sum(flags$orange)

# First, use flag_colors <- flags[, 11:17] to extract the columns containing the 
# color data and store them in a new data frame called flag_colors.
flag_colors <- flags[, 11:17]

# Use the head() function to look at the first 6 lines of flag_colors.
head(flag_colors)

# To get a list containing the sum of each column of flag_colors, call the 
# lapply() function with two arguments. The first argument is the object over 
# which we are looping (i.e. flag_colors) and the second argument is the name of 
# the function we wish to apply to each column (i.e. sum).
# Remember that the second argument is just the name of the function with no 
# parentheses, etc.
lapply(flag_colors, sum)

# The result is a list, since lapply() always returns a list. Each element of 
# this list is of length one, so the result can be simplified to a vector by 
# calling sapply() instead of lapply().
sapply(flag_colors, sum)

# Use sapply() to apply the mean() function to each column of flag_colors.
sapply(flag_colors, mean)

# To illustrate this, let's extract columns 19 through 23 from the flags dataset 
# and store the result in a new data frame called flag_shapes.
flag_shapes <- flags[, 19:23]

# Each of these columns (i.e. variables) represents the number of times a 
# particular shape or design appears on a country's flag. We are interested in 
# the minimum and maximum number of times each shape or design appears.
#
# The range() function returns the minimum and maximum of its first argument, 
# which should be a numeric vector. Use lapply() to apply the range function to
# each column of flag_shapes.
lapply(flag_shapes, range)


# Do the same operation, but using sapply() and store the result in a variable 
# called shape_mat.

shape_mat <- sapply(flag_shapes, range)
shape_mat

# Use the class() function to confirm that shape_mat is a matrix.
class(shape_mat)

# Let's look at an example where sapply() can't figure out how to simplify the
# result and thus returns a list, no different from lapply().
#
# When given a vector, the unique() function returns a vector with all duplicate
# elements removed. In other words, unique() returns a vector of only the 
# 'unique' elements.
unique(c(3, 4, 5, 5, 5, 6, 6))

# We want to know the unique values for each variable in the flags dataset. 
# To accomplish this, use lapply() to apply the unique() function to each column 
# in the flags dataset, storing the result in a variable called unique_vals.
unique_vals <- lapply(flags, unique)

# Since unique_vals is a list, you can use what you've learned to determine the 
# length of each element of unique_vals (i.e. the number of unique values for
# each variable). Simplify the result, if possible.
sapply(unique_vals, length)

# The fact that the elements of the unique_vals list are all vectors of 
# *different* length poses a problem for sapply(), since there's no obvious way 
# of simplifying the result.
#
# Use sapply() to apply the unique() function to each column of the flags dataset 
# to see that you get the same unsimplified list that you got from lapply().
sapply(flags, unique)

# Occasionally, you may need to apply a function that is not yet defined, thus 
# requiring you to write your own. Writing functions in R is beyond the scope of
# this lesson, but let's look at a quick example of how you might do so in the 
# context of loop functions.
#
# Pretend you are interested in only the second item from each element of the 
# unique_vals list that you just created. Since each element of the unique_vals 
# list is a vector and we're not aware of any built-in function in R that returns 
# the second element of a vector, we will construct our own function.
#
# lapply(unique_vals, function(elem) elem[2]) will return a list containing the
# second item from each element of the unique_vals list. Note that our function 
# takes one argument, elem, which is just a 'dummy variable' that takes on the 
# value of each element of unique_vals, in turn.
lapply(unique_vals, function(elem) elem[2])
