# Load Libraries
library(plyr)
library(sf)
library(ggplot2)
# library(urbnmapr)
library(readxl)
library(readr)
library(dplyr)
library(pastecs)
library(tidyverse)

get_data <- function() {
  # get the data from Excel file
  df <- readxl::read_excel("occurrence_2020.xlsx")
  df <- na.omit(df)
  
  counts <- ddply(df, .(df$eventDate, df$species, df$year), nrow)
  names(counts) <- c("eventDate", "species", "year", "Freq")
  
  return(counts)
}

countBarData <- function(date_year) {
  # generate and return frog count on map chart based on single date input
  df <- get_data()
  
  output_df <- df %>% 
    filter(year == date_year)  # reactive input here

    return(output_df)
}

countOverTimeData <- function(date_range, selected_species) {
  # generate and return frog count over time chart based on date range input
  
  df <- get_data()
  
  output_df <- df %>% 
    filter(eventDate >= date_range[1] & eventDate <= date_range[2]) # reactive input here
  # filter(species == selected_species) %>% # reactive input here
  
  return(output_df)
}


