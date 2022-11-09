# Contents: Make cleaned data for Intro to R course, 2022
# Author: Sophie Meakin
# Date: 24 October 2022

library(here)
library(rio)
library(magrittr)
library(janitor)
library(dplyr)
library(ggplot2)


# Import data -------------------------------------------------------------

# World Bank’s published list of countries belonging to world regions
# source: https://ourworldindata.org/world-region-map-definitions
regions_raw <- import(file = here("data", "raw", "world-regions-according-to-the-world-bank.csv"))

# Life expectancy vs. health expenditure, 1970 to 2015
# source: https://ourworldindata.org/grapher/life-expectancy-vs-health-expenditure
health_raw <- import(file = here("data", "raw", "life-expectancy-vs-health-expenditure.csv"))



# Clean data --------------------------------------------------------------

# World regions
regions <- regions_raw %>%
  clean_names() %>%
  rename(region = world_region_according_to_the_world_bank) %>%
  select(region, entity)

# Life expectancy vs. health expenditure
health_clean <- health_raw %>%
  clean_names() %>%
  rename(life_expectancy = life_expectancy_at_birth_total_years,
         health_expenditure = health_expenditure_and_financing_per_capita_oec_dstat_2017) %>%
  mutate(health_expenditure = as.numeric(health_expenditure)) %>%
  filter(year == 2015) %>%
  left_join(regions, by = "entity") %>%
  select(region,
         country = entity,
         year,
         life_expectancy, health_expenditure)
  

# Reshape data for exporting ----------------------------------------------

# Life expectancy by country
life_exp <- data_clean %>%
  filter(!is.na(region)) %>%
  select(region, country, year,
         life_expectancy_years = life_expectancy)

export(x = life_exp,
       file = here("data", "life_expectancy.csv"))

# Life expectancy and health expenditure by country
life_exp_health <- data_clean %>%
  filter(!is.na(region)) %>%
  select(region, country, year,
         life_expectancy_years = life_expectancy,
         health_expenditure_usd = health_expenditure)

export(x = life_exp_health,
       file = here("data", "life_expectancy_vs_health_expenditure.csv"))



