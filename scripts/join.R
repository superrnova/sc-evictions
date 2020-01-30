# Description

# Author: Jenny Nova
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters

cities_rds_path <- here::here("data/2016_sc_evictions.rds")
boundaries_rds_path <- here::here("data/boundaries.rds")
output_path <- here::here("data/joined.rds")

#===============================================================================

Code
cities <- read_rds(cities_rds_path)
boundaries <- read_rds(boundaries_rds_path)

#all(boundaries$city_id %in% cities$GEOID)
#setdiff(cities$GEOID, boundaries$city_id)
#diff <-
  #cities %>%
  #filter(GEOID == 4536430, GEOID == 4558170)

joined <-
  boundaries %>%
  left_join(cities, by = c("city_id" = "GEOID", "name")) %>%
  write_rds(output_path)

