# called examples and the corresponding results
my_matrix <- makeCacheMatrix(matrix(c(7,3,5,11), 2,2))
my_matrix$get()

#      [,1] [,2]
#[1,]    7    5
#[2,]    3   11

my_matrix$getInv()
# NULL

cacheSolve(my_matrix)
#         [,1]        [,2]
#[1,]  0.1774194 -0.08064516
#[2,] -0.0483871  0.11290323

cacheSolve(my_matrix) # call again
# getting cached data
#         [,1]        [,2]
# [1,]  0.1774194 -0.08064516
# [2,] -0.0483871  0.11290323
# Note: because the cached values is available then the function cacded the cached data

my_matrix$getInv()
#       [,1]        [,2]
# [1,]  0.1774194 -0.08064516
# [2,] -0.0483871  0.11290323
# Note: it is identical with the above matrix

my_matrix$set(matrix(c(2,2,1,4,2,3,6,4,8), 3,3))
# assign a new matrix. It will remove the cached results
my_matrix$getInv()
# NULL
# It returns NULL because there is no cached value.
cacheSolve(my_matrix)
#      [,1]   [,2]  [,3]
#[1,] -0.25  0.875 -0.25
#[2,]  0.75 -0.625 -0.25
#[3,] -0.25  0.125  0.25
# Note: display and store a new inverse 

cacheSolve(my_matrix) 
#getting cached data
#     [,1]   [,2]  [,3]
#[1,] -0.25  0.875 -0.25
#[2,]  0.75 -0.625 -0.25
#[3,] -0.25  0.125  0.25

# Note: again it returns a cached data
my_matrix$getInv()
#     [,1]   [,2]  [,3]
#[1,] -0.25  0.875 -0.25
#[2,]  0.75 -0.625 -0.25
#[3,] -0.25  0.125  0.25
