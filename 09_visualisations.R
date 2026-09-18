library(tidyverse)

# Create a folder for figures
dir.create("Figures", showWarnings = FALSE)

# Trust and customer satisfaction relationship
trust_plot <- ggplot(
  analysis_data,
  aes(
    x = consumer_trust_in_ai_chatbots,
    y = customer_satisfaction
  )
) +
  geom_jitter(
    width = 0.08,
    height = 0.08,
    alpha = 0.35,
    colour = "#2C7FB8"
  ) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    colour = "#D95F0E"
  ) +
  labs(
    title = "Consumer Trust and Chatbot Satisfaction",
    x = "Consumer trust in AI chatbots",
    y = "Customer satisfaction"
  ) +
  theme_minimal(base_size = 12)

trust_plot

ggsave(
  "Figures/trust_satisfaction.png",
  trust_plot,
  width = 7,
  height = 5,
  dpi = 300
)

# Prepare robust coefficient data
robust_matrix <- unclass(robust_main_coefficients)

coefficient_plot_data <- tibble(
  term = rownames(robust_matrix),
  estimate = robust_matrix[, 1],
  se = robust_matrix[, 2]
) |>
  filter(term != "(Intercept)") |>
  mutate(
    predictor = recode(
      term,
      consumer_privacy_concerns = "Privacy concerns",
      consumer_trust_in_ai_chatbots = "Consumer trust",
      ai_familiarity = "AI familiarity",
      `chatbot_typeAware - Centralized` = "Aware - Centralized vs Not aware",
      `chatbot_typeAware - Decentralized` = "Aware - Decentralized vs Not aware"
    ),
    lower = estimate - 1.96 * se,
    upper = estimate + 1.96 * se
  )

# Robust coefficient plot
coefficient_plot <- ggplot(
  coefficient_plot_data,
  aes(
    x = estimate,
    y = reorder(predictor, estimate)
  )
) +
  geom_vline(
    xintercept = 0,
    linetype = "dashed",
    colour = "grey45"
  ) +
  geom_errorbar(
    aes(xmin = lower, xmax = upper),
    width = 0.15,
    orientation = "y",
    colour = "#2C7FB8"
  ) +
  geom_point(
    size = 3,
    colour = "#D95F0E"
  ) +
  labs(
    title = "Predictors of Customer Satisfaction",
    subtitle = "HC3 robust estimates with 95% confidence intervals",
    x = "Regression coefficient",
    y = NULL
  ) +
  theme_minimal(base_size = 12)

coefficient_plot

ggsave(
  "Figures/robust_coefficients.png",
  coefficient_plot,
  width = 8,
  height = 5,
  dpi = 300
)