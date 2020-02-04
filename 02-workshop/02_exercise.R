#===============================================================================#
# FRIED R WORKSHOP #2: EXERCISE 
#
# Cecile Murray
#===============================================================================#

# set your working directory

# load any packages you plan to use
# usually a good start:
library(tidyverse)
library(magrittr) # so you can use pipes


# load in your data

# recommended data cleaning: standardize the names of your variables

#===============================================================================#
# SUMMARY STATISTICS
#===============================================================================#

# SIMPLE  =======================#

# What were the most common types of crime?

# Which crimes have the lowest arrest rates?



# MODERATELY COMPLEX  =============================#

# To answer these, you'll need to do some data manipulation. Some tools:
# - the lubridate package is great for dates: try using as_date() and month()
# - another option is to extract a smaller chunk of a string, e.g. with stringr::str_extract() 

# Which month had the highest total number of crimes?


# Which month had the highest average daily number of crimes?


# What is the most common type of crime to occur in each of the location types (location description)?



# MORE COMPLEX  =============================#

# To answer these, you'll need to combine data from multiple tables



# Which neighborhoods have the most homicides? What about theft? 
# (you can get the neighborhood crosswalk file here: https://bit.ly/3baoctp)



# What is the percentage change in each type of crime from 2018 to 2019?
#   Go to data.cityofchicago.org, find the crime dataset, and download the 2019 data.
#   Next, you'll need to read it in, do any cleaning and manipulation, and perform a join. 
#   Think about what the table you want to produce looks like (columns and rows), and
#     how you'll need to transform the datasets 
#   percentage change formula: (# crimes in 2019 - # crimes in 2018) / # crimes in 2018

