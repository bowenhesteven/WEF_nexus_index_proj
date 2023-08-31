# Data Organization #
# Functions to combine the index value and the SADC countries geometry

library('rgdal')
library('sf')
library('readxl')
library('tidyverse')

# read in SADC shapefile #
sadc <- read_sf('~/Desktop/WEF_proj/Material/SADC_countries_shapefile/countries.shp')

# read in index value data sheet
water <- read_excel('~/Desktop/WEF_proj/Data/water_subindex.xlsx')
energy <- read_excel('~/Desktop/WEF_proj/Data/energy_subindex.xlsx')
food <- read_excel('~/Desktop/WEF_proj/Data/food_subindex.xlsx')
availability <- read_excel('~/Desktop/WEF_proj/Data/availability.xlsx')
accessibility <- read_excel('~/Desktop/WEF_proj/Data/accessibility.xlsx')
governance <- read_excel('~/Desktop/WEF_proj/Data/governance.xlsx')
wef <- read_excel('~/Desktop/WEF_proj/Data/wef.xlsx')

# Combine and join the index value data sheet and SADC shapefile

water_df <- sadc %>% left_join(water, by = 'COUNTRY')
energy_df <- sadc %>% left_join(energy, by = 'COUNTRY')
food_df <- sadc %>% left_join(food, by = 'COUNTRY')
availability_df <- sadc %>% left_join(availability, by = 'COUNTRY')
accessibility_df <- sadc %>% left_join(accessibility, by = 'COUNTRY')
governance_df <- sadc %>% left_join(governance, by = 'COUNTRY')
wef_df <- sadc %>% left_join(wef, by = 'COUNTRY')

# Export as shapefile
st_write(water_df, "water.shp")
st_write(energy_df, "energy.shp")
st_write(food_df, "food.shp")
st_write(availability_df, "availability.shp")
st_write(accessibility_df, "accessibility.shp")
st_write(governance_df, 'governance.shp')
st_write(wef_df, 'wef.shp')
