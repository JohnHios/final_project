#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_edu_exp_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: edu_exp
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

edu_exp <- read_csv(here("raw_data/OECD_Public_Spending_on_Education_JHios.csv")) %>% 
  clean_names()

#-----------------------------------------------------------------------
# 2. Convert time in datetime format.

edu_exp <- edu_exp %>%
  mutate(time = make_datetime(time)) 


#-----------------------------------------------------------------------
# 3. Check for missing values.

edu_exp %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))


#-----------------------------------------------------------------------
# 4. Rename variables accordingly.

edu_exp <- edu_exp  %>% 
  rename(
    country = location,
    year = time
  )