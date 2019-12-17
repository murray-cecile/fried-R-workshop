#===============================================================================#
# FRIED R WORKSHOP: LOADING DATA
#
# Cecile Murray
#===============================================================================#


#===============================================================================#
# BASE R
#===============================================================================#

# R can do basic arithmetic
1 + 1
1 * 5
(20 / 4) * 2
2 ^ 2 
2**2 # alternative way to do exponents

# this is how you save a value in a variable: we are saying x is 5
# think of this as associating a name with some object
x <- 5
x

# we can also change the value of x
x <- 7
x == 5

# what's that double equals sign thing? it is a comparison operator.
# now we can make logical statements (either true or false)
1 == 1
1 == 2
1 != 2
5 >= 4
-1 < 0

# side note on computers and decimal accuracy (this happens in Excel too)
1.000000000000001 == 1
1.0000000000000001 == 1

# we can combine these logical statements with logical operators 
# & is AND: means both are true
1 == 1 & 2 == 2 
1 == 1 & 1 == 2

# | is OR: means at least one is true
1 == 1 & 1 == 2
1 == 2 & 2 == 3

# ! is NOT: means the statement is *not* true 
!(1 == 1)
!(1 == 2)

# DATA TYPES  =============================#

5 # numeric
"a" # character/string
'a' # doesn't matter if you use single or double quotes, still a character

# one reason why we care about types: 
# we can't add numbers if one is stored as a string (this happens a lot)
1 + 1
'1' + 1 

# VECTORS & MATRICES  =============================#

# this is a vector: it's basically a list of values 
vec1 <- c(1, 2, 3)
vec1

# we can get the 2nd value out with
vec1[2]

# note that this is distinct from an actual list object: different output
l1 <- list(1, 2, 3)
l1 # this looks different
l1[2] # indexing this way will still work, but it gives a list of length 1
l1[[2]] # double brackets will actually return the value

# collection of vectors = a matrix
vec2 <- c(4, 5, 6)
m1 <- matrix(c(vec1, vec2)) # default is just to make a column
m1
m2 <- matrix(c(vec1, vec2), nrow = 2, ncol = 3) # specify another shape 
m2

# get values out of a matrix with indexing
m2[1, 2]
m2[, 2] # access second column
m2[1, ] # access first row

#===============================================================================#
# PACKAGES AND LOADING DATA
#===============================================================================#

# WORKING DIRECTORY  =============================#

# first we need to tell R where to look for files
getwd() # tells us where we are
setwd('<your working directory here>') # sets the working directory
# R projects organize this process nicely, but aren't strictly necessary

list.files() # another way to see what's in your working directory

# INSTALLING AND LOADING PACKAGES  =============================#

# if you have never used the package before, you need to install it
# install.packages("tidyverse")

# then we can load it
library(tidyverse)

# READING DATA  =============================#

crimes <- read_csv("data/Crimes_-_2018.csv")

# we can look at it this way as well as in the Viewer
glimpse(crimes)

# data frames are like matrices, but we can refer to columns by name
crimes$Date
