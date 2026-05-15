
source("code/Initial Analysis.R")

# install.packages("tidyverse") 
library(ggplot2)

# Using the built-in 'mpg' dataset for our examples
data <- mpg

ggplot(data = data, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Engine Displacement vs. Highway MPG",
       x = "Engine Size (Liters)",
       y = "Highway Miles per Gallon",
       color = "Vehicle Type") +
  theme_minimal()

