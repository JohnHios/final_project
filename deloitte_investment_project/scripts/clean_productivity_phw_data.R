#-----------------------------------------------------------------------
#=======================================================================
#----- File Name: clean_productivity_phw_data
#----- Description: Cleaning data script that returns a tibble
#----- Output: productivity_phw
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
library(readxl)
library(lubridate)

#-----------------------------------------------------------------------
# 1. Read excel data.

productivity_phw <- read_excel(here("raw_data/International_Labour_Productivity-Europe.xls"), 
                               sheet = "Table 1 R-proc") %>% 
  

#-----------------------------------------------------------------------
# 2. Check for missing values.

productivity_phw %>% 
  summarise(across(.cols = everything(),
                   .fns = ~sum(is.na(.x))))


#-----------------------------------------------------------------------
# 3. Pivot data to long format.

tidy_productivity_phw <- productivity_phw %>%
  pivot_longer(-c(`A*10 (excl L)`, `NACE Industry`), names_to = "Country", values_to = "Output_per_hour") 