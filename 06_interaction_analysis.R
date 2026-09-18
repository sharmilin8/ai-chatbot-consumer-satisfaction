# Model including interactions with chatbot type
interaction_model <- lm(
  customer_satisfaction ~
    (
      consumer_privacy_concerns +
        consumer_trust_in_ai_chatbots +
        ai_familiarity
    ) * chatbot_type,
  data = analysis_data
)

# Compare model without and with interactions
anova(regression_model, interaction_model)

# Full interaction results
summary(interaction_model)


# Load package
library(emmeans)

# Privacy-satisfaction slope for each chatbot type
privacy_slopes <- emtrends(
  interaction_model,
  ~ chatbot_type,
  var = "consumer_privacy_concerns"
)

privacy_slopes

# Compare slopes between chatbot groups
pairs(privacy_slopes)




















































































