# makeCacheMatrix and cacheSolve are a set of functions to creates a 
# special "matrix" object that can calcualte and cache its inverse
# or retrieve the pre-calculated inverse
#
# makeCacheMatrix: 
# This function creates a special "matrix" object that can
# cache its inverse. 
makeCacheMatrix <- function(x = matrix()) {

}


# cacheSolve: This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above. If the inverse has already been 
# calculated (and the matrix has not changed), then the cachesolve should 
# retrieve the inverse from the cache. Computing the inverse of a square matrix 
# is done with the solve function.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
