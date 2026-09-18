# Multiple regression model
regression_model <- lm(
  customer_satisfaction ~
    consumer_privacy_concerns +
    consumer_trust_in_ai_chatbots +
    ai_familiarity +
    chatbot_type,
  data = analysis_data
)

# Model results
summary(regression_model)

# 95% confidence intervals
confint(regression_model)

# Concise coefficient table
round(coef(summary(regression_model)), 4)