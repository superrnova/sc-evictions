# Description A script to read in and out the SC city boundaries data 

# Author: Jenny Nova
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(sf)

# Parameters
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
output_path <- here::here("data/boundaries.rds")


cols_wanted <-
  c(
    city_id = "GEOID",
    name = "n",
    geometry = "geometry"
  )


#===============================================================================

Code

url_data %>%
  read_sf() %>%
  select(cols_wanted)  %>%
  mutate(city_id = as.integer(city_id)) %>%
  write_rds(output_path)




