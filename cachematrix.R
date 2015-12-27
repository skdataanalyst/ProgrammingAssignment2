## Functions makecacheMatrix takes a matrix and save to a variable x

makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse variable to Null at the Start
  Inv <- NULL 
  
  # A set funciton ise defined to set a new value for the matrix
  # <<- operator is used to overide and se the value of x and Inv 
  # Inv must be reset to NULL since the underlying matrix and the cached
  # value is no longer the valid 
  set <- function(y) 
  {
    x <<- y
    Inv <<- NULL
  }
  
  # Define the Get function to get the value of Matix
  get <- function()
  {
    x
  }
  
  # set the Inverse of the Matrix x.  Called by cachematrix,
  # <<- operator used to modify the Inv defined in the environment
  setInverse <- function(solve) 
  {
    Inv <<- solve
  }
  
  # Define the function to returns the inverse
  getInverse <- function() 
  {
    Inv
  }
  
  # return value of the makeCacheMatrix function is a list
  # of functions (and variables if we wish) that we want to expose
  # as public.  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## CacheSolve function returns a matrix that is inverse of 'X'

cacheSolve <- function(x, ...) {
  
  # get the Inverse of the matrix defined inside x.
  Inv <- x$getInverse()
  
  if(!is.null(Inv)) 
  {
    message("getting cached data")
    # if the cached version exists then just just return the value
    return(Inv)
  }
  
  # call get() to get the matrix
  data <- x$get()
  
  # calculate the Inverse Matrix passing all the other arguments
  Inv <- solve(data, ...)
  
  # set the Inverse in x and cache it to avoid need for re-calculation
  x$setInverse(Inv)
  
  # return the caching matrix
  Inv
}
