

# makeCacheMatrix and cacheSolve are a set of functions to creates a 
#   special "matrix" object that can calcualte and cache its inverse
#   or retrieve the pre-calculated inverse
#
# makeCacheMatrix: This function creates a special "matrix" object that can
#   cache its inverse. 
# It will accept as input a matrix and store it. It includes four accessor 
#   functions: set, get, setinverse, and getinverse. 
#
# For now is is assumed the matrix supplied is always invertible.
makeCacheMatrix<- function(x = matrix()){
    
    i <- NULL   # i is used to cache the inverse, initialize it to NULL
    #  x is the local variable where the cached matrix is stored
    
    
    # create the four accessor functions: set, get, setinverse, and getinverse
    
    set <- function(y) {
        
        x <<- y       # use the scoping operator to store the input matrix
                      #   in the makeCacheMatrix environment's x local variable        
        i <<- NULL    # set the cached inverse to NULL since matrix changed
    }
    
    get <- function() x  
    
    
    setinverse <- function(inverse){
        i <<- inverse   # use the scoping operator to store the input inverse
                        #   in the makeCacheMatrix envirment's i local variable
    }     
 
    getinverse <- function() i   # return the cached inverse
    
    # construct a named list of the functions within this environment.
    #   this list is what is returned
    list(set = set, get = get,  
         setinverse = setinverse,
         getinverse = getinverse)
}


# cacheSolve: This function computes the inverse of the special "matrix" 
#   returned by makeCacheMatrix above. If the inverse has already been 
#   calculated (and the matrix has not changed), then the cachesolve should 
#   retrieve the inverse from the cache. The inverse of a square matrix is 
#   calculated with the solve function.
cacheSolve<- function(x, ...){

    i <- x$getinverse()    # get the cached inverse
    
    # if the cached inverse exists return the cached inverse
    if(!is.null(i)) {    
        message("getting cached data")
        return(i)
    }
    
    # cached inverse does not exist, need to calculate it
    data <- x$get()        # get  matrix and store in temporary data variable
    i <- solve(data, ...)
    x$setinverse(i)        # cache the inverse now that its calculated
    i                      # return the inverse
}