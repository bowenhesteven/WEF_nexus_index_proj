# calculate the WEF index baseline scenario
library(tidyverse)
library(dplyr)
library(stats)
library(GPArotation)
library(sf)
library(stringr)
library(BBmisc)
library(paran)
library(rprojroot)

proj_root <- find_root(is_rstudio_project)

source(paste0(proj_root, "/R/WEF_funcs.R"))
variable <- readRDS(paste0(proj_root, '/data/gen/variable.rds'))

# calculate the baseline scenario of WEF index
# indicator transformation: averaged by area, "2"
# indicator normalization: z-score normalization, "4"
# pca selection: Kaiser selection, "6"
# pca rotation: Varimax rotation, "10"
# weighting scheme: equal weight sum, "15"
wef_baseline <- wef_calc(variable, indicator_transformation = '2', indicator_normalization = '4', pca_selection =  '6', pca_rotation =  '10', weight_scheme = '15')

#saveRDS(wef_baseline, file = (paste0(proj_root, "/data/gen/wef_baseline.rds")))