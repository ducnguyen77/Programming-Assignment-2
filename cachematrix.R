# See README.md for instructions on running the code and output from it

# makeCacheMatrix is a function that returns a list of functions
# Puspose of the function is to store a matrix and a cached value of the inverse of the matrix. 
# Contains the following functions:
# * set          set the value of a matrix
# * get          get the value of a matrix
# * setInv       set the cahced value (inverse of the matrix)
# * getInv       get the cahced value (inverse of the matrix)


## makeCacheMatrix function

makeCacheMatrix <- function(x = matrix()) {
  
  # hold the cached value or NULL if nothing is cached. Inititially nothing is cached, set it to NULL.
inv <- NULL
# store a matrix
set <- function(newMatrix) {
  x <<- newMatrix
  # when the new matrix is assigned, we flush the cache value.
  inv <<- NULL
}

# returns the stored matrix
get <- function() x

# cache the give matrix
setInv <- function(newMatrix) inv <<- newMatrix

# get the cached value
getInv <- function() inv

# return a list. Each named element of the list is a function
list(set =set, get = get, setInv=setInv, getInv=getInv)
}

#--------------------------------------------------------------------------------

## cacheSolve function to calculate the inverse of the "special" matrix created with makeCacheMatrix.

cacheSolve <- function(x, ...) {
  # get the cached value
  inv <- x$getInv()
  # return the cached value if it exists
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  # Otherwise get the new matrix, calculate the inverse and store it in inv.
  newMatrix <- x$get()
  inv <-solve(newMatrix,...)
  x$setInv(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}

# call
source("C:/Users/Duc Nguyen/Documents/GitHub/ProgrammingAssignment2/cachematrix.R")
my_matrix <- makeCacheMatrix(matrix(c(7,3,5,11), 2,2))
my_matrix$get()
my_matrix$getInv()

cacheSolve(my_matrix)
cacheSolve(my_matrix)
my_matrix$getInv()

my_matrix$set(matrix(c(2,2,1,4,2,3,6,4,8), 3,3))
my_matrix$getInv()
cacheSolve(my_matrix)
cacheSolve(my_matrix)
my_matrix$getInv()
