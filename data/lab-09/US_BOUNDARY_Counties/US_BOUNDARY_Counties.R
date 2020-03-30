library(dplyr)
library(here)
library(tigris)
library(sf)
library(stringr)

counties <- counties(cb = TRUE, resolution = "20m")
counties %>% 
  st_as_sf() %>%
  mutate(GEOID = as.numeric(str_c(STATEFP, COUNTYFP))) %>%
  select(GEOID, STATEFP, COUNTYFP, NAME, ALAND) -> countiesClean

st_write(countiesClean, here("data", "US_BOUNDARY_Counties", "US_BOUNDARY_Counties.shp"), delete_dsn = TRUE)
