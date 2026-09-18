# Keep only completed responses
completed_data <- analysis_data |>
  filter(finished == 1)

nrow(completed_data)

# Main-effects model using completed responses
completed_main_model <- lm(
  customer_satisfaction ~
    consumer_privacy_concerns +
    consumer_trust_in_ai_chatbots +
    ai_familiarity +
    chatbot_type,
  data = completed_data
)

# Interaction model using completed responses
completed_interaction_model <- lm(
  customer_satisfaction ~
    (
      consumer_privacy_concerns +
        consumer_trust_in_ai_chatbots +
        ai_familiarity
    ) * chatbot_type,
  data = completed_data
)

# Robust results for the completed-response main model
completed_robust_results <- lmtest::coeftest(
  completed_main_model,
  vcov. = sandwich::vcovHC(
    completed_main_model,
    type = "HC3"
  )
)

round(completed_robust_results, 4)

# Robust comparison of interaction terms
lmtest::waldtest(
  completed_main_model,
  completed_interaction_model,
  vcov = function(model) {
    sandwich::vcovHC(model, type = "HC3")
  }
)