#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_gfcf_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: gfcf
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

gfcf <- read_csv(here("raw_data/OECD_Investment_GFCF_JHios.csv")) %>% 
  clean_names()

#-----------------------------------------------------------------------
# 2. Convert time in datetime format.

gfcf <- gfcf %>%
  mutate(time = make_datetime(time)) 


#-----------------------------------------------------------------------
# 3. Check for missing values.

gfcf %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))


#-----------------------------------------------------------------------
# 4. Select rows and columns for analysis.

gfcf <- gfcf %>% 
  filter(measure == "MLN_USD") %>% 
  select(location, time, value) 


#-----------------------------------------------------------------------
# 5. Rename variables accordingly.

gfcf <- gfcf %>% 
  rename(
    country = location,
    year = time,
    gfcf_mln_usd = value
  )