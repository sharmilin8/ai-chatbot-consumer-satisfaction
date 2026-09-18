# Load packages
library(tidyverse)
library(psych)

# Select and rename key variables
correlation_data <- analysis_data |>
  transmute(
    Satisfaction = customer_satisfaction,
    Privacy = consumer_privacy_concerns,
    Trust = consumer_trust_in_ai_chatbots,
    AI_Familiarity = ai_familiarity
  )

# Pearson correlation analysis
correlation_results <- psych::corr.test(
  correlation_data,
  method = "pearson",
  adjust = "none"
)

# Correlation coefficients
round(correlation_results$r, 2)

# P-values
round(correlation_results$p, 3)





















