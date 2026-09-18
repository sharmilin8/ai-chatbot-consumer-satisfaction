# Load package
library(psych)
library(tidyverse)

# Cronbach's alpha for each scale
reliability_results <- tibble(
  scale = c(
    "Customer satisfaction",
    "Privacy concerns",
    "Consumer trust",
    "AI familiarity"
  ),
  cronbach_alpha = c(
    psych::alpha(data |> select(matches("^cs_[1-4]$")))$total$raw_alpha,
    psych::alpha(data |> select(matches("^cpc_[1-3]$")))$total$raw_alpha,
    psych::alpha(data |> select(matches("^ct_[1-4]$")))$total$raw_alpha,
    psych::alpha(data |> select(matches("^aif_[1-2]$")))$total$raw_alpha
  )
) |>
  mutate(cronbach_alpha = round(cronbach_alpha, 3))

reliability_results

