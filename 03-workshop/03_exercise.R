#===============================================================================#
# FRIED WORKSHOP #3: DATA VISUALIZATION EXERCISE
#
# Cecile Murray
#===============================================================================#
# set your working directory

# load any packages you plan to use
# usually a good start:
library(tidyverse)
library(magrittr) # pipes
library(janitor) # data cleaning
library(lubridate) # work with dates

# load in your data
crimes <- read_csv("01-workshop/Crimes_-_2018.csv") 

# some data cleaning
crimes %<>% 
  janitor::clean_names() %>% # standardize names
  mutate(date = mdy_hms(date), # convert string date to Date type
         hour = hour(date),  # extract the hour of the day
         day = day(date), # extract the day of week
         month = month(date))  # extract the month 

#===============================================================================#
# SUMMARY DATA FRAMES TO PRACTICE WITH
#===============================================================================#

# top 5 crimes by total number
crimes_ct <- crimes %>% 
  group_by(primary_type) %>% 
  summarize(count = n()) %>% 
  mutate(rank = rank(desc(count))) %>% 
  filter(rank < 6)

# # of crimes by hour of the day
crimes_by_hr <- crimes %>% 
  group_by(hour) %>% 
  summarize(count = n())

# create summary df: crimes by day of week 


# create summary df: crimes by month of year


# # of crimes by type and hour 
top_crimes_by_hr <- crimes %>% 
  filter(primary_type %in% crimes_ct$primary_type) %>%  # filter to 5 types 
  group_by(primary_type, hour) %>% # group by both type and hour of day
  summarize(count = n()) # count up # crimes in each type-hour group


#===============================================================================#
# PRACTICE VISUALIZING
#===============================================================================#

# resource to see what kinds of geoms/charts you can make
# https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# EASIER  =============================#

# How do crime trends vary by day of the week?


# What about by month?



# MORE COMPLEX  =============================#

# When do different crime types occur? For example, do homicides change
# over the months in a different way than theft?

