## R Pivot Table
This script lets you summarize data tables into a "pivot table" as you would in Microsoft Excel.

## Motivation
I was tasked with working with large datasets that would not work on Excel, and needed to be summarized. I had become comfortable using R and figured that there should be a way to do so in R. This script is based on [this tutorial](https://www.rforexcelusers.com/make-pivottable-in-r/) from John Taveras.

## Code
```
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
write.csv(data_pivot,"green_tripdata_2019-06_summarized.csv", row.names = FALSE)
```
