# This is an example code for the students of DATA9330 at Niagara College to Practice Using GitHub.

# Code Admin - Load Required Packages
library(tidyverse)

# Create objects to quickly load the datasets
location <- "data_input/DATA9115_DB03__Charity/"
files <- list.files(location)
files

# Create a loop through the files in the envchar database (csvs) to load them
for (f in files){ 
  
  csv <- read.csv(paste0(location, f)) # create a temporary object, csv, that reads the file
  
  f <- str_replace(f, ".csv", "") # replace the .csv extension with "" (nothing)
  
  assign(f, csv) # assign the temporary object as a new object (named f)
  
}

# Remove unnecessary objects from environment
rm(location, files, f, csv)

install.packages("tidyverse")
