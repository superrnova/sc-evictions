EDA on Evictions
================
Jenny Nova
2020-01-29

  - [Section 1](#section-1)

``` r
# Libraries
library(tidyverse)

# Parameters

cities_path <- here::here("data/2016_sc_evictions.rds")

#===============================================================================

# Code
```

## Section 1

From here, we can see that Elgin, Powdersville, and Springdale appeared
in the data more than once. To get an accurate city count, I want to
group by city and sum to ensure that the maximum of the evictions are
truly represented. We can see that North Charleston has the most

``` r
cities <- read_rds(cities_path)

summary(cities)
```

    ##      geoid              year          name             evictions      
    ##  Min.   :4500100   Min.   :2016   Length:397         Min.   :   0.00  
    ##  1st Qu.:4523335   1st Qu.:2016   Class :character   1st Qu.:   1.85  
    ##  Median :4541965   Median :2016   Mode  :character   Median :  13.40  
    ##  Mean   :4541853   Mean   :2016                      Mean   :  87.69  
    ##  3rd Qu.:4561495   3rd Qu.:2016                      3rd Qu.:  51.55  
    ##  Max.   :4579630   Max.   :2016                      Max.   :3660.10  
    ##                                                      NA's   :114

``` r
cities %>% 
  count(name) %>% 
  count(n) 
```

    ## # A tibble: 2 x 2
    ##       n    nn
    ##   <int> <int>
    ## 1     1   391
    ## 2     2     3

``` r
cities %>% 
  count(name) %>% 
  filter(n > 1)
```

    ## # A tibble: 3 x 2
    ##   name             n
    ##   <chr>        <int>
    ## 1 Elgin            2
    ## 2 Powdersville     2
    ## 3 Springdale       2

``` r
cities %>%
  group_by(name) %>% 
  summarize(tot_evic = sum(evictions)) %>% 
  arrange(desc(tot_evic)) 
```

    ## # A tibble: 394 x 2
    ##    name             tot_evic
    ##    <chr>               <dbl>
    ##  1 North Charleston    3660.
    ##  2 Columbia            2225.
    ##  3 Charleston          1546.
    ##  4 St. Andrews         1383.
    ##  5 Florence            1097.
    ##  6 Dentsville           769.
    ##  7 Myrtle Beach         729.
    ##  8 Anderson             642.
    ##  9 Hanahan              529.
    ## 10 Goose Creek          480.
    ## # … with 384 more rows
