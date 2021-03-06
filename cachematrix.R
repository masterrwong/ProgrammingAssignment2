## Class: Coursera R Programming (June 2015)
## Author: Royce Wong
## Assignment 2: Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse 
## of a matrix rather than computing it repeatedly. This assignment is to write a pair of functions: makeCacheMatrix and cacheSolve,
## that cache the inverse of a matrix. For this assignment, assume that the matrix supplied is always invertible.

## Function makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(mean) m <<- mean
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Function cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
