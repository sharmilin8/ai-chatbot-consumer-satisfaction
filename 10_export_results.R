library(tidyverse)

# Create folder for tables
dir.create("Tables", showWarnings = FALSE)

# Export descriptive and reliability tables
write_csv(
  descriptive_table,
  "Tables/descriptive_statistics.csv"
)

write_csv(
  group_descriptive,
  "Tables/group_descriptive_statistics.csv"
)

write_csv(
  reliability_results,
  "Tables/reliability_results.csv"
)

# Export correlation matrix
correlation_table <- as.data.frame(
  round(correlation_results$r, 3)
) |>
  rownames_to_column("variable")

write_csv(
  correlation_table,
  "Tables/correlation_matrix.csv"
)

# Create and export robust regression table
robust_regression_table <- tibble(
  term = rownames(robust_matrix),
  estimate = robust_matrix[, 1],
  robust_se = robust_matrix[, 2],
  t_value = robust_matrix[, 3],
  p_value = robust_matrix[, 4]
) |>
  mutate(
    lower_95 = estimate - 1.96 * robust_se,
    upper_95 = estimate + 1.96 * robust_se
  ) |>
  mutate(
    across(
      where(is.numeric),
      ~ round(.x, 4)
    )
  )

write_csv(
  robust_regression_table,
  "Tables/robust_regression_results.csv"
)

# Check exported files
list.files("Tables")



































