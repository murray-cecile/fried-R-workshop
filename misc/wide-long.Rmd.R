## Reshaping data

- "wide" data has one row per observation with many columns
- "long" data has multiple rows per observation with fewer columns
- **ggplot often works best with long data**
  
  ## Example of wide data
  
  ```{r wide, echo=FALSE}
key_term_df <- tibble(
  "person_id" = str_pad(as.character(seq(1, 4)), width = 2),
  "age" = round(runif(4, 25, 85)),
  "sex" = c("F", "F", "M", "M")
)

kable(key_term_df, align="l")
```

## Example of long data

```{r long, echo=FALSE}
key_term_df %>% 
  gather("key", "value", -person_id) %>% 
  kable(align = "l")

```

## How to reshape in R

- Go from wide to long: `gather()`  
- Go from long to wide: `spread()` 
- In tidyverse >= 1.0, `pivot_longer()` and `pivot_wider()` 