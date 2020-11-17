# ---------------------------Loop Functions------------------------------------# 
# The sapply() function behaves similarly to lapply(); the only real difference# 
# is in the return value. sapply() will try to simplify the result of lapply() #
# if possible into a vector.                                                   #
#                                                                              #
# The split() function takes a vector or other objects and splits it into      #
# groups determined by a factor or list of factors.                            #
# -----------------------------------------------------------------------------#

# Require package
library(datasets)

# Read the data frame airquality
head(airquality)

# Split the data frame per month
dm <- split(airquality, airquality$Month)
dm

# Gets the average of each variable per month
sapply(dm, function(x){
        colMeans(x[ ,c("Ozone", "Solar.R", "Temp")], na.rm = TRUE)
})
