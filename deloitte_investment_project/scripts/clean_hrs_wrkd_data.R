#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_hrs_wrkd_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: hrs_wrkd
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

hrs_wrkd <- read_csv(here("raw_data/OECD_Hours_Worked_JHios.csv")) %>% 
  clean_names()

#-----------------------------------------------------------------------
# 2. Convert time in datetime format.

hrs_wrkd <- hrs_wrkd %>%
  mutate(time = make_datetime(time)) 


#-----------------------------------------------------------------------
# 3. Check for missing values.

hrs_wrkd %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))


#-----------------------------------------------------------------------
# 4. Select rows and columns for analysis.

hrs_wrkd <- hrs_wrkd %>% 
  filter(measure == "HR_WKD") %>% 
  select(location, time, value)


#-----------------------------------------------------------------------
# 5. Rename variables accordingly.

hrs_wrkd <- hrs_wrkd %>% 
  rename(
    country = location,
    year = time,
    hr_wkd = value
  )
