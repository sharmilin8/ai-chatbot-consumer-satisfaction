# Regression diagnostic plots
par(mfrow = c(2, 2))
plot(interaction_model)
par(mfrow = c(1, 1))

# Check potentially influential observations
cooks_values <- cooks.distance(interaction_model)
influential_cases <- which(
  cooks_values > 4 / nrow(analysis_data)
)

length(influential_cases)
influential_cases

# Examine maximum Cook's distance
max(cooks_values)
which.max(cooks_values)
sum(cooks_values > 0.5)
sum(cooks_values > 1)

# Robust HC3 coefficient tests
robust_coefficients <- lmtest::coeftest(
  interaction_model,
  vcov. = sandwich::vcovHC(
    interaction_model,
    type = "HC3"
  )
)

round(robust_coefficients, 4)

# Robust comparison of interaction terms
lmtest::waldtest(
  regression_model,
  interaction_model,
  vcov = function(model) {
    sandwich::vcovHC(model, type = "HC3")
  }
)

# Robust HC3 results for the main-effects model
robust_main_coefficients <- lmtest::coeftest(
  regression_model,
  vcov. = sandwich::vcovHC(
    regression_model,
    type = "HC3"
  )
)

round(robust_main_coefficients, 4)

# Show Cook's distance summary again
max(cooks_values)
which.max(cooks_values)
sum(cooks_values > 0.5)
sum(cooks_values > 1)












































