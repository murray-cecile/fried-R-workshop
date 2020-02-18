#===============================================================================#
# FRIED WORKSHOP #3: DATA VISUALIZATION
#
# Cecile Murray
#===============================================================================#

# load required libraries
libs <- c("tidyverse",
          "magrittr")
lapply(libs, library, character.only = TRUE)

# as always, if you get an error about a package not being found
# install.packages("package_name")

# check working directory and set if needed
getwd()
# setwd()

# read in data and standardize names as before
crimes <- read_csv("01-workshop/Crimes_-_2018.csv") %>% 
  janitor::clean_names()

#===============================================================================#
# BAR CHART - GEOM_BAR()
#===============================================================================#

# use descriptive stats from last time, soring in descending
# order to get the top 5 crimes
crimes_ct <- crimes %>% 
  group_by(primary_type) %>% # group by crime type
  summarize(count = n()) %>% # count up # of crimes of each tpe
  mutate(rank = rank(desc(count))) %>% # rank # of crimes in descending order
  filter(rank < 6) # take the top five

# simple bar chart
ggplot(data = crimes_ct,
       aes(x = primary_type,
           y = count)) +
  geom_col()

# reorder data
ggplot(data = crimes_ct,
       aes(x = reorder(primary_type, count),
           y = count)) +
  geom_col() 

# reorder data the other way
ggplot(data = crimes_ct,
       aes(x = reorder(primary_type, -count),
           y = count)) +
  geom_col() 

# change color of bars and add a title
ggplot(data = crimes_ct,
       aes(x = reorder(primary_type, -count),
           y = count)) +
  geom_col(fill = "blue") +
  labs(title = "Theft was the most common reported crime in Chicago in 2018",
       subtitle = "Reported crimes by type, 2018",
       x = "Crime Type",
       y = "Number of crimes",
       caption = "Source: City of Chicago data portal")

#===============================================================================#
# SCATTER PLOTS - GEOM_POINT()
#===============================================================================#

# SCATTER PLOT EXAMPLE #1  =============================#

# make the same chart with points instead of bars
ggplot(data = crimes_ct,
       aes(x = reorder(primary_type, -count),
           y = count)) +
  geom_point(color = "blue") + # the only change we needed to make was here
  labs(title = "Theft was the most common reported crime in Chicago in 2018",
       subtitle = "Reported crimes by type, 2018",
       x = "Crime Type",
       y = "Number of crimes",
       caption = "Source: City of Chicago data portal")

# SCATTER PLOT EXAMPLE #2  =============================#

# compute # of crimes by hour of the day
crimes_by_hr <- crimes %>% 
  mutate(hour = lubridate::hour(lubridate::mdy_hms(date))) %>% 
  group_by(hour) %>% 
  summarize(count = n())

# basic scatter plot
crimes_by_hr %>%
  ggplot(aes(x = hour,
             y = count)) +
  geom_point()

# customize the exact same way
crimes_by_hr %>%
  ggplot(aes(x = hour,
             y = count)) +
  geom_point(color = "blue") + # notice we're using color, not fill
  labs(title = "Crime peaks in the evening hours",
       subtitle = "Reported crimes by hour of day, 2018",
       x = "Hour of day",
       y = "Number of crimes",
       caption = "Source: City of Chicago data portal")

#===============================================================================#
# GROUPING IN A SCATTER PLOT
#===============================================================================#

# get the top five crimes by hour of day
top_crimes_by_hr <- crimes %>% 
  mutate(hour = lubridate::hour(lubridate::mdy_hms(date))) %>% 
  filter(primary_type %in% crimes_ct$primary_type) %>%  # filter to 5 types 
  group_by(primary_type, hour) %>% # group by both type and hour of day
  summarize(count = n()) # count up # crimes in each type-hour group

# simple plot
ggplot(top_crimes_by_hr,
       aes(x = hour,
           y = count,
           color = primary_type)) +
  geom_point()

# connect the dots
ggplot(top_crimes_by_hr,
       aes(x = hour,
           y = count,
           color = primary_type)) +
  geom_point() +
  geom_line()

# add annotations
ggplot(top_crimes_by_hr,
       aes(x = hour,
           y = count,
           color = primary_type)) +
  geom_point() +
  geom_line() +
  labs(title = "Daily crime patterns vary by crime type",
       subtitle = "Number of crimes by hour for most common crime types, 2018",
       x = "Hour of day",
       y = "Number of crimes",
       caption = "Source: City of Chicago data portal",
       color = "Type of crime")
