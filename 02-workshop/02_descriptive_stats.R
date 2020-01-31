#===============================================================================#
# FRIED R WORKSHOP: DATA CLEANING AND DESCRIPTIVE STATISTICS
#
# Cecile Murray
#===============================================================================#

# SETUP #

# load libraries we'll use 
# if you get a message saying these aren't installed, run the command
# install.packages() with the package name in quotes inside the parentheses
libs <- c("here",
          "tidyverse",
          "magrittr")
lapply(libs, library, character.only = TRUE)

# check working directory and adjust if needed
getwd()

# read in data
crimes <- read_csv("01-workshop/Crimes_-_2018.csv")
glimpse(crimes)

#===============================================================================#
# TIDYVERSE SYNTAX: PIPES
#===============================================================================#

# pipes let us chain functions together, passing data from one to the next

# these are equivalent!
glimpse(crimes)
crimes %>% glimpse() # here we are using a pipe

# here's a reflexive pipe, which basically modifies the original dataframe in place
#   we are piping crimes into the clean_names() function 
#   then assigning the name crimes to the result 
crimes %<>% janitor::clean_names()

#===============================================================================#
# DPLYR VERBS: MUTATE, SELECT, FILTER
#===============================================================================#

# USE MUTATE TO CREATE NEW VARIABLES  =============================#

# in base R, we can create a new variable as follows
crimes$district_num <- as.numeric(crimes$district)

# using the tidyverse
crimes %<>% mutate(district_num = as.numeric(district))

# note that we could also do this to transform the district column itself
# crimes %<>% mutate(district = as.numeric(district))

# USE FILTER TO SELECT A SUBSET OF ROWS  =============================#

# tidyverse way to filter to only the arsons
arson <- crimes %>% 
  filter(primary_type == "ARSON")

# in base R - not a lot of typing but much less clear
arson <- crimes[crimes$primary_type == "ARSON", ]

# tidyverse way to filter to arsons in ward 1
arson_ward1 <- crimes %>% 
  filter(primary_type == "ARSON",
         ward == 1)

# base R equivalent... you can see this gets ugly fast
arson_ward1 <- crimes[crimes$primary_type == "ARSON" & crimes$ward == 1, ]

# USE SELECT TO CHOOSE A SUBSET OF COLUMNS  =============================#

# dplyr style: drop x and y coordinate fields
crimes2 <- crimes %>% 
  select(-x_coordinate, -y_coordinate)

# base R approach 
names_to_keep <- setdiff(names(crimes),
                         c("x_coordinate", "y_coordinate"))
crimes2 <- crimes[, names_to_keep]

# example of the contains() helper function - can't easily do this in base R
# there are many helper functions - run ?select to check them all out
crime_descr <- crimes %>%
  select(contains("description"))

#===============================================================================#
# SUMMARY STATISTICS WITH GROUP_BY() %>% SUMMARIZE()
#===============================================================================#

# we use the n() function inside summarize() to count rows
crimes_ct <- crimes %>% 
  group_by(primary_type) %>% 
  summarize(count = n())

# we can also group by multiple categories
crimes_ct2 <- crimes %>% 
  group_by(primary_type, arrest) %>% 
  summarize(count = n())

# bonus: sort by number of crimes 
crimes_ct %<>% arrange(count) # in ascending order
crimes_ct %<>% arrange(-count) # in descending order

# count of arrests by type
crimes_arrest_ct <- crimes %>% 
  group_by(primary_type) %>% 
  summarize(arrests = sum(arrest, na.rm = TRUE))

# mean ward by crime type (nonsensical example)
crimes_ward <- crimes %>% 
  group_by(primary_type) %>% 
  summarize(mean_ward = mean(ward, na.rm = TRUE))

# example with multiple columns
crimes_ward <- crimes %>% 
  group_by(primary_type) %>% 
  summarize(mean_ward = mean(ward, na.rm = TRUE),
            sum_ward = sum(ward, na.rm = TRUE))

#===============================================================================#
# MERGING DATASETS
#===============================================================================#

crimes_nhood <- crimes %>% 
  group_by(community_area) %>% 
  summarize(count = n())

# let's look at the result
head(crimes_nhood)

# first read in the file
chicago_nhoods <- read_csv("../data/CommAreas.csv")
glimpse(chicago_nhoods)

# drop extraneous fields
chicago_nhoods %<>% select(COMMUNITY, AREA_NUMBE) 

# now do a left join
crimes_nhood <- crimes %>% 
  group_by(community_area) %>% 
  summarize(count = n()) %>% 
  inner_join(chicago_nhoods, 
             by = c("community_area" = "AREA_NUMBE")) 
head(crimes_nhood) 

# some clean-up so the resulting table has only the needed info in it and
# is sorted alphabetically by community area name
crimes_nhood %<>% select(COMMUNITY, count) %>% 
  arrange(COMMUNITY)
head(crimes_nhood)

# alternatively, maybe it's more informative to sort by # crimes
crimes_nhood %<>% arrange(-count)
head(crimes_nhood)