# Load packages
library(tidyverse)

# Descriptive statistics for key variables
descriptive_stats <- analysis_data |>
  summarise(
    across(
      c(
        customer_satisfaction,
        consumer_privacy_concerns,
        consumer_trust_in_ai_chatbots,
        ai_familiarity
      ),
      list(
        mean = ~ mean(.x, na.rm = TRUE),
        sd = ~ sd(.x, na.rm = TRUE),
        min = ~ min(.x, na.rm = TRUE),
        max = ~ max(.x, na.rm = TRUE)
      )
    )
  )

descriptive_stats

# Convert results into a readable table
descriptive_table <- descriptive_stats |>
  pivot_longer(
    cols = everything(),
    names_to = c("variable", ".value"),
    names_pattern = "(.*)_(mean|sd|min|max)$"
  ) |>
  mutate(
    across(c(mean, sd, min, max), ~ round(.x, 2))
  )

descriptive_table

# Descriptive statistics by chatbot type
group_descriptive <- analysis_data |>
  group_by(chatbot_type) |>
  summarise(
    participants = n(),
    satisfaction_mean = mean(customer_satisfaction),
    privacy_mean = mean(consumer_privacy_concerns),
    trust_mean = mean(consumer_trust_in_ai_chatbots),
    ai_familiarity_mean = mean(ai_familiarity),
    .groups = "drop"
  ) |>
  mutate(
    across(where(is.numeric), ~ round(.x, 2))
  )

group_descriptive












































































