## Here I will create two functions; the first one creates a matrix and may invert it and store the inverted matrix,
## the second one gets a matrix and inverse it only if its inverse wasn't stored earlier

## This function creates a matrix and can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function() {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function gets a matrix and inverse it only if its inverse wasn't stored earlier

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if (!is.null(m)) {
                message("Getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
