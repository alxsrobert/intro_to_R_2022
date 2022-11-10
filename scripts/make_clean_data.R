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
         health_expenditure = health_expenditure_and_financing_per_capita_oec_dstat_2017,
         pop = population_historical_estimates) %>%
  mutate(health_expenditure = as.numeric(health_expenditure),
         pop_100k = as.numeric(pop/1e5)) %>%
  filter(year == 2015) %>%
  left_join(regions, by = "entity") %>%
  select(region,
         country = entity,
         year,
         pop_100k, life_expectancy, health_expenditure)
  

# Reshape data for exporting ----------------------------------------------

# Life expectancy and health expenditure by country
life_exp_health <- health_clean %>%
  filter(!is.na(region)) %>%
  select(region, country,
         pop_100k,
         life_expectancy_years = life_expectancy,
         health_expenditure_usd = health_expenditure)

export(x = life_exp_health,
       file = here("data", "life_expectancy.csv"))



