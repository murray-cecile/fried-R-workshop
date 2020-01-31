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
   <td style="text-align:right;"> 151 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:left;"> F </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 178 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:left;"> M </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 109 </td>
   <td style="text-align:right;"> 79 </td>
   <td style="text-align:left;"> M </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 171 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:left;"> F </td>
  </tr>
</tbody>
</table>

tidyverse and dplyr verbs
========================================================

- `dplyr` is a package in the `tidyverse` family of packages
- Common "grammar" for working with data, objects, functions, etc

Data cleaning: common tasks
========================================================

- converting variable types: string to numeric and vice versa, dates, etc
- look for missing values
- "recode" variables into useful categories
- reshape the data: convert columns and rows
- look up values in another dataset

Descriptive stats example
========================================================



```
processing file: 02_descriptive_stats.Rpres
here() starts at /Users/cecilemurray/Documents/coding/fried-R-workshop
── Attaching packages ─────────────────────────────────────────────────── tidyverse 1.3.0 ──
✓ ggplot2 3.2.1     ✓ purrr   0.3.3
✓ tibble  2.1.3     ✓ dplyr   0.8.3
✓ tidyr   1.0.0     ✓ stringr 1.4.0
✓ readr   1.3.1     ✓ forcats 0.4.0
── Conflicts ────────────────────────────────────────────────────── tidyverse_conflicts() ──
x dplyr::filter() masks stats::filter()
x dplyr::lag()    masks stats::lag()

Attaching package: 'magrittr'

The following object is masked from 'package:purrr':

    set_names

The following object is masked from 'package:tidyr':

    extract


Attaching package: 'kableExtra'

The following object is masked from 'package:dplyr':

    group_rows


Attaching package: 'janitor'

The following objects are masked from 'package:stats':

    chisq.test, fisher.test

Quitting from lines 60-65 (02_descriptive_stats.Rpres) 
Error: '01-workshop/Crimes_-_2018.csv' does not exist in current working directory ('/Users/cecilemurray/Documents/coding/fried-R-workshop/02-workshop').
Execution halted
```
