#makeCacheMatrix function
makeCacheMatrix <- function(x = matrix()) {
    #
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
    # Solves the equations
    m <- x$getinverse()
    if(!is.null(m)) {
        return(m)
    }
    temp <- x$get()
    m <- solve(temp)
    x$setinverse(m)
    return(m)
}

