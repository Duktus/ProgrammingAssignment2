## Put comments here that give an overall description of what your
## functions do
## 
## Write a short comment describing this function
## This function creates a special "matrix" object 
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    invtemp <- NULL
        set <- function(x_matrix) {
           x <<- x_matrix;
           invtemp <<- NULL;
    				    }
    get <- function() return(x);
    setinverse <- function(inverse) invtemp <<- inverse;
    getinverse <- function() return(invtemp);

    return(list(set = set, get = get,
           setinverse = setinverse, 
           getinverse = getinverse))

}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already
## been calculated (and the matrix has not changed), then 
## the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

 invtemp <- x$getinverse()
    if(!is.null(invtemp)) {
        message("Getting cached data...")
        return(invtemp)
    }
    data <- x$get()
    invtemp <- solve(data, ...)
    x$setinverse(invtemp)
    return(invtemp)
}
