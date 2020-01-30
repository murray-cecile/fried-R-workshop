Summarizing data with dplyr and the tidyverse
========================================================
author: Cecile Murray
date: February 7, 2020
autosize: true



Goals for today
========================================================

- Go over some key terms and syntax
- Introduce some typical data cleaning concepts and tools
- Introduce basic commands to compute descriptive statistics and how to join two datasets
- Use these on real data

Key terms
========================================================

- Variable: refers to the columns of a dataframe (usually).
- Observation: refers to one unit, often one row, of a dataframe

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> person_id </th>
   <th style="text-align:right;"> age </th>
   <th style="text-align:left;"> sex </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 193 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> F </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 153 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> F </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:right;"> 84 </td>
   <td style="text-align:left;"> F </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:left;"> M </td>
  </tr>
</tbody>
</table>

Pipes
========================================================

- `%>%` is an operator, just like `+`, `-`, `&`, etc
- it lets us **chain functions together**, passing data from one to the next


```r
# read in the crimes dataset from last time and assign it the name crimes
crimes <- read_csv("../01-workshop/Crimes_-_2018.csv")

# these are equivalent!
glimpse(crimes)
crimes %>% glimpse() # here we are using a pipe

# here's a reflexive pipe, which basically modifies the original dataframe in place
#   we are piping crimes into the clean_names() function 
#   then assigning the name crimes to the result 
crimes %<>% janitor::clean_names()
```

Data cleaning: common tasks
========================================================

- converting variable types: string to numeric and vice versa, dates, etc
- look for missing values
- "recode" variables into useful categories
- reshape the data: convert columns and rows
- look up another dataset

tidyverse and dplyr verbs
========================================================

- `dplyr` is a package in the `tidyverse` family of packages
- Common "grammar" for working with data, objects, functions, etc

