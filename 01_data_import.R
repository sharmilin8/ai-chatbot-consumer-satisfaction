#install.packages(c("readxl", "tidyverse", "janitor"))
# Load packages
library(readxl)
library(tidyverse)
library(janitor)

# Import and clean column names
data <- read_excel("Data/Data_File_for_MasterThesis.xlsx") |>
  clean_names()

# Initial inspection
dim(data)
names(data)
glimpse(data)

# Data-quality checks
data_quality <- data |>
  summarise(
    total_rows = n(),
    unique_ids = n_distinct(response_id),
    duplicate_ids = sum(duplicated(response_id)),
    completed = sum(finished == 1),
    unfinished = sum(finished == 0),
    missing_satisfaction = sum(is.na(customer_satisfaction)),
    missing_privacy = sum(is.na(consumer_privacy_concerns)),
    missing_trust = sum(is.na(consumer_trust_in_ai_chatbots)),
    missing_ai_familiarity = sum(is.na(ai_familiarity))
  )

data_quality

# Number of participants in each chatbot group
data |>
  count(chatbot_type)

# Inspect the 5 unfinished responses
data |>
  filter(finished == 0) |>
  select(
    response_id,
    chatbot_type,
    customer_satisfaction,
    consumer_privacy_concerns,
    consumer_trust_in_ai_chatbots,
    ai_familiarity
  )

# Create analysis dataset
analysis_data <- data |>
  select(
    response_id,
    finished,
    chatbot_type,
    customer_satisfaction,
    consumer_privacy_concerns,
    consumer_trust_in_ai_chatbots,
    ai_familiarity
  ) |>
  mutate(
    chatbot_type = factor(
      chatbot_type,
      levels = c(1, 2, 3),
      labels = c(
        "Not aware",
        "Aware - Centralized",
        "Aware - Decentralized"
      )
    )
  )

# Check the analysis dataset
dim(analysis_data)
glimpse(analysis_data)
count(analysis_data, chatbot_type)























































