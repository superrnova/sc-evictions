# Reading in and wranging SC evictions data

# Author: Jenny Nova
# Version: 2020-01-28

# Libraries
library(tidyverse)

# Parameters
##Change to cities_csv
##Boundaries to cities_geo.json
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
output_path <- here::here("data/2016_sc_evictions.rds")

vars_types <-
  cols_only(
    `GEOID` = col_integer(),
    `year` = col_double(),
    `name` = col_character(),
    `evictions` = col_double()
  )
#===============================================================================

Code

url_data %>%
  read_csv(col_types = vars_types) %>%
  rename("geoid" = "GEOID") %>%
  filter(year == 2016) %>%
  write_rds(output_path)
