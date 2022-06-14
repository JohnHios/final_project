#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_gdp_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: gdp
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

gdp <- read_csv(here("raw_data/OECD_Gross_Domestic_Product_GDP_JHios.csv")) %>% 
  clean_names()

#-----------------------------------------------------------------------
# 2. Convert time in datetime format.

gdp <- gdp %>%
  mutate(time = make_datetime(time)) 


#-----------------------------------------------------------------------
# 3. Check for missing values.

gdp %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))

