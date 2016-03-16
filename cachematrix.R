## Put comments here that give an overall description of what your functions do

## Write a short comment describing this function

## In this example we introduce the `<<-` operator which can be used to assign
## a value to an object in an environment that is different from the current
## environment. Below are two functions that are used to create a special
## object that stores a numeric vector and caches its mean.
##
## The first function, `makeVector` creates a special "vector", which is a
## list containing functions to
##  1.  set the value of the matrix
##  2.  get the value of the matrix
##  3.  set the value of the inverted matrix
##  4.  get the value of the inverted matrix

makeMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinvert <- function(inverted) m <<- inverted
  getinvert <- function() m
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinvert()
  if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinvert(m)
  m
}
