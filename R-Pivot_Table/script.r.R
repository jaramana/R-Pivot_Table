# Pivot Table - R
# 12/27/2019
# Ahmad Shaibani

# Packages
library(reshape2)
library(dplyr)


# Set directory
setwd("C:/Users/shabania/Desktop/")

# Load Data
data = read.csv("green_tripdata_2019-06.csv", stringsAsFactors = FALSE)

# Set up data frame for by-group processing.  
data_pivot = group_by(data, PULocationID)

# Calculate the summary metrics
data_pivot = summarise(data_pivot,
                       trips_sum = sum(RatecodeID),
                       trip_distance_average = mean(trip_distance))