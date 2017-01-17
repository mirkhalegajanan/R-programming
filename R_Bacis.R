myString <- "Hello, World!" 
print ( myString)

#Logical
v <- TRUE 
print(class(v))


#Numeric
v <- 23.5
print(class(v))

#Integer
v <- 2L
print(class(v))


#Complex
v <- 2+5i
print(class(v))

#Character
v <- "TRUE"
print(class(v))

#Raw
v <- charToRaw("Hello")
print(class(v))

#vector
apple <- c('red','green',"yellow")
print(apple)
print(class(apple))


#vector
apple <- c(12.5,25.6,28.6,25.5,45.8)
print(apple)
print(class(apple))

#empty Vector
vec <- vector()
vec

vec <- c(vec, 1:10)
Vec

# Create a matrix.
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)

# Create an array.
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)

# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))
      
# Create the data frame.
BMI <- 	data.frame(gender = c("Male", "Male","Female"), 
        height = c(152, 171.5, 165), 
        weight = c(81,93, 78),Age = c(42,38,26))
print(BMI)