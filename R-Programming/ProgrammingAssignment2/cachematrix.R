##----------------------Programming Assignment 2------------------------------##
## creates two functions, one stores the elements of a cached array and the   ##
## other returns the inverse of the array.                                    ## 
##----------------------Programming Assignment 2------------------------------##

## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()){
                ## Placeholder Inverse
                i <- NULL
                ## Set the value of the matrix
                set <- function(y){
                        x <<- y
                        i <<- NULL
                }
                ## Get the value of the vector
                get <- function() x  
                ## Set inverse function 
                set_i <- function(solve) i <<- solve
                ## Get the value of inverse
                get_i <- function() i
                list(get = get , set_i= set_i, get_i = get_i)
}

## Call the makeCacheMatrix() function 
makeCacheMatrix(matrix(c(1, 0, 0, 2, 1, 0, 3, 4, 1), nrow = 3, ncol = 3))

# This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve the 
# inverse from the cache.

cacheSolve <- function(x, ...){
        i <- x$get_i()     ## Retrieve Inverse if it is already cached
        if(!is.null(i)) {  ## If the cache is not NULL, return the cache
                message("getting cached data")
                return(i)
        }else{ ## If the cache is NULL, calculate the Inverse and store it
                data <- x$get()
                i <- solve(data, ...)
                x$set_i(i)
                return(i)
        }
}

## Cal the cacheSolve() fucntion
cacheSolve(cacheMatrix)
