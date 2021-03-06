## This is the Programming Assignment 2 of the Coursera "R Programming" data science course

## Caching the Inverse of a Matrix:
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.
## This exercise demonstrates the usage of the "<<-" operator that can help
## store an object's state that is "persistent". This is achieved with the use
## of the R scoping rules.


## This function creates a special "matrix" object that can cache its inverse.
## Parameter: x - matrix object.
## Returns: a list with functions corresponding to get/set operations of the
## matrix and its inverse.


makeCacheMatrix <- function(x = matrix()) {
  m_inverse <- NULL
  set <- function(y) {
    x <<- y
    m_inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m_inverse <<- inverse
  getInverse <- function() m_inverse
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache.
## Otherwise the result is computed using function "solve".

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       
          m_inverse <- x$getInverse()
          if (!is.null(m_inverse)) {
            message("Getting cached data")
            return(m_inverse)
          }
          m <- x$get()
          m_inverse <- solve(m, ...)
          x$setInverse(m_inverse)
          m_inverse
}
