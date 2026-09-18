# Predictors of Consumer Satisfaction with AI-Powered Chatbots

## Overview

This project presents an independent secondary analysis examining how consumer trust, privacy concerns, AI familiarity, and chatbot awareness category are associated with satisfaction with AI-powered chatbots.

This is an independently developed portfolio project. It was not sponsored, supervised, or endorsed by Curtin University.

## Research Question

How are consumer trust, privacy concerns, AI familiarity, and chatbot awareness category associated with satisfaction with AI-powered chatbots, and does chatbot awareness category moderate these relationships?

## Data Source

The analysis uses a publicly available dataset originally published by Aytemir (2024) on Figshare:

https://doi.org/10.6084/m9.figshare.26068954

The original dataset remains available from its publisher. To avoid unnecessary redistribution, the raw data are not included in this repository. Users should obtain the data directly from Figshare and comply with the licence and attribution requirements stated on the dataset page.

## Methods

The analysis was conducted in R and included:

- Data-quality assessment
- Descriptive statistics
- Cronbach’s alpha reliability analysis
- Pearson correlation analysis
- Multiple linear regression
- Moderation analysis
- Regression diagnostics
- HC3 heteroskedasticity-robust inference
- Completed-response sensitivity analysis
- Data visualization

## Key Findings

- Consumer trust was the strongest positive predictor of customer satisfaction.
- Privacy concerns were positively associated with customer satisfaction.
- AI familiarity had a smaller positive association with customer satisfaction.
- After controlling for the continuous predictors, satisfaction did not differ significantly across the Not aware, Aware - Centralized, and Aware - Decentralized groups.
- There was no robust evidence that chatbot awareness category moderated the relationships between the continuous predictors and satisfaction.
- The overall conclusions remained stable when the analysis was restricted to completed responses.

These findings represent statistical associations and should not be interpreted as causal effects. The results also do not establish that changing chatbot disclosure practices would have no effect.

## Project Structure

- `01_data_import.R` — data import, cleaning, and quality checks
- `02_descriptive_analysis.R` — descriptive statistics
- `03_reliability_analysis.R` — scale reliability
- `04_correlation_analysis.R` — Pearson correlations
- `05_regression_analysis.R` — main-effects regression
- `06_interaction_analysis.R` — moderation analysis
- `07_model_diagnostics.R` — diagnostic and robust analyses
- `08_sensitivity_analysis.R` — completed-response sensitivity analysis
- `09_visualisations.R` — research figures
- `10_export_results.R` — exported result tables
- `11_research_report.Rmd` — reproducible research report
- `Figures/` — generated figures
- `Tables/` — exported statistical tables
- `Data/` — local source-data location; raw data not distributed

## Reproducing the Analysis

1. Download the original dataset from the Figshare DOI provided above.
2. Place the source Excel file inside the `Data` folder.
3. Open `AI_chatbot_consumer_trust.Rproj` in RStudio.
4. Install the R packages listed in the report setup section.
5. Run scripts `01` to `10` in numerical order.
6. Knit `11_research_report.Rmd` to generate the complete HTML report.

## AI Use Disclosure

Generative AI assistance was used during the development of this project. ChatGPT by OpenAI, accessed in August 2026, was used to assist with drafting and troubleshooting R code, structuring the analytical workflow, explaining statistical outputs, and drafting and editing portions of the report and project documentation.

The author independently selected the research question, obtained the publicly available dataset, ran the analyses in RStudio, inspected the outputs, reviewed the interpretations, checked the cited sources, assembled the reproducible project, and made the final decisions about the content presented. Generative AI was not treated as an author or an authoritative source.

The author takes responsibility for the accuracy, integrity, interpretation, and presentation of the analysis. The exact backend model version was not consistently displayed during the project and is therefore not stated.

## Limitations

This project uses one existing secondary dataset and is intended primarily as an independent research and analytics portfolio project. Its findings require replication with larger and more diverse datasets before stronger conclusions can be drawn.

## Licence

The R code in this repository is available under the MIT License. The research report, written content, tables, and original figures remain copyright © 2026 Noshin Sharmili unless otherwise stated.

The original dataset is not included in the repository and is not covered by the MIT License. It remains subject to the licence and attribution requirements specified by its original publisher on Figshare.

## Author

Noshin Sharmili  
Master of Commerce — AI & Business Analytics   
Curtin University