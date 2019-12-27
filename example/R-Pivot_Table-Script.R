# Pivot Table - R
# 12/27/2019
# Ahmad Shaibani

# Load Packages
library(reshape2)
library(dplyr)

# Set directory
setwd("PATH/TO/DIRECTORY")

# Load Data
data = read.csv("green_tripdata_2019-06_SAMPLE.csv", stringsAsFactors = FALSE)

# Set up data frame for by-group processing.  
data_pivot = group_by(data, PULocationID)

# Calculate the summary metrics
data_pivot = summarise(data_pivot,
                       trips_sum = sum(RatecodeID),
                       trip_distance_average = mean(trip_distance))

# Write .csv
write.csv(data_pivot,"green_tripdata_2019-06_summarised.csv", row.names = FALSE)