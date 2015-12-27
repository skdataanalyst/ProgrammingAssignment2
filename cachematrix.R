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
  
  # set the mean of the Matrix x.  Called by cachematrix,
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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
