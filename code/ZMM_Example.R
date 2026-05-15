# ZMM Example Student Commit
# This code create a simple boxplot of charities by their total revenue.
# Written by Zachary Moore, 15 May 2026

# Use the 'Initial Analysis' code to open all the data. This command runs the whole script.  
source("code/Initial Analysis.R")

# Subset the dataframe
charSub <- line %>%
  left_join(select(charity, charityID, provinceID, designationID), by = "charityID") %>%
  left_join(select(form, formBox, formStar, formDesc), by = "formBox") %>%
  filter(is.na(lineValue)==F, formStar == "Y")

#Plot total revenue by province
for (pt in unique(charSub$provinceID)){ # Start looping through provinces
  
  # Create the graph
  charSub %>% # start from the subsetted data frame
    filter(formBox == 4700, provinceID == pt, lineYear != 2024) %>% # filter for desired parameters, similar to WHERE clause in SQL
    group_by(lineYear) %>% # tell R you want to group by year, similar to GROUP BY in SQL
    summarize( # start telling R what you want to summarize, similar to adding aggregate functions in the select clause in SQL
      medianRevenue = median(lineValue),
      p25Revenue = quantile(lineValue, 0.25),
      p75Revenue = quantile(lineValue, 0.75),
      sdRevenue = sd(lineValue),
      meanRevenue = mean(lineValue),
      minRevenue = min(lineValue),
      maxRevenue = max(lineValue)
    ) %>%
    ggplot(aes(x = lineYear, y = medianRevenue)) + # Start creating a graph using ggplot (MASSIVE customization potential here). 
    geom_point() + geom_line() + # add lines and points to the graph
    geom_errorbar(aes(ymin = p25Revenue, ymax = p75Revenue), width = 0.2) + # add error bars to the graph, using the 25th and 75th percentiles (Inter-quartile range)
    labs(title = paste("Median Revenue of Charities in ", pt, "(+/- IQR)"), x = "Tax Year", y = "Median Revenue") + # Add labels 
    theme_minimal() # one of several standard examples of themes to change the appearance of graphs in ggplot
  
  # Save each graph to file
  ggsave(paste0("data_output/zmm_example/Median_Revenue_", pt, ".png"), width = 8, height = 5) # save the graph to the output folder.
  
} # End looping through provinces
