#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_gdp_phw_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: gdp_phw
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

gdp_phw <- read_csv(here("raw_data/OECD_GDP_per_Hour_Worked.csv")) %>% 
  clean_names() 

#-----------------------------------------------------------------------
# 2. Convert time in datetime format.

gdp_phw <- gdp_phw %>%
  mutate(time = make_datetime(time)) 


#-----------------------------------------------------------------------
# 3. Check for missing values.

gdp_phw %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))


#-----------------------------------------------------------------------
# 4. Rename variables accordingly.

gdp_phw <- gdp_phw %>% 
  rename(
    country = location,
    year = time
  )