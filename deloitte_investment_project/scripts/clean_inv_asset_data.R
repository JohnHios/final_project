#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_inv_asset_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: inv_asset
#----- Created Date: 14/06/2022
#----- Created By: John Hios
#-----------------------------------------------------------------------
#=======================================================================
#----- Assumptions:
#=======================================================================
#----- Version History: v0.1
#=======================================================================
#----- Peer reviewer:
#----- Peer review date:
#=======================================================================
#-----------------------------------------------------------------------


# Load libraries
library(tidyverse)
library(janitor)
library(here)
library(lubridate)

#-----------------------------------------------------------------------
# 1. Read csv data and change names of variables to follow our naming standards.

inv_asset <- read_csv(here("raw_data/OECD_Investment_by_Asset_JHios.csv")) %>% 
  clean_names()

#-----------------------------------------------------------------------
# 2. Convert time in datetime format.

inv_asset <- inv_asset %>%
  mutate(time = make_datetime(time)) 


#-----------------------------------------------------------------------
# 3. Check for missing values.

inv_asset %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))


#-----------------------------------------------------------------------
# 4. Rename variables accordingly.

inv_asset <- inv_asset %>% 
  rename(
    country = location,
    year = time
  )