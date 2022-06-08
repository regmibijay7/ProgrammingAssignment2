setwd('C:/Users/rubind1/Documents/Coursera-R')
##
## I  set the input y as a matrix
## and then set the solved value "n" as a null
## then I changed every reference to "mean" to "solve"
makeCacheMatrix <- function(y = matrix(sample(100:200,9),3,3)) {
  n <- NULL
  set <- function(a) {
    y <<- a
    n <<- NULL
  }
  get <- function() y
  setsolve <- function(solve) n <<- solve
  getsolve <- function() n
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same here, changed "mean" to "solve" and "m" to "n"
cacheSolve <- function(y, ...) {
  n <- y$getsolve()
  if(!is.null(n)) {
    message("getting inversed matrix")
    return(n)
  }
  data <- y$get()
  n <- solve(data, ...)
  y$setsolve(n)
  n
}