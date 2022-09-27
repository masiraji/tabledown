#' Produce Publication Quality Tables and Plots for Your Item Analysis, Factor Analysis (EFA, CFA) and Item Response Theory Based Analysis
#'
#' The tabledown package provides necessary data frames used throughout the book and some neat functions.
#'
#'
#' @section tabledown Data-frames:
#' 1. Rotter: Psychometric validation data of Bangla Rotter's Internal- External Scale.
#' 2. Gantt and Spot: Two sample data-frames for creating project management Gantt chart.
#' 3. FFMQ.CFA: Structural Validation data of Bangla Five Factor Mindfulness Questionnaire.
#' 4. FFMQ.Val:Correlational Validity evidences of Bangla Five Factor Mindfulness Questionnaire.
#'
#'
#' @section tabledown functions:
#'This packages includes some neat and useful functions to create tables and figures suitable for journal submission:
#'1. fac.tab(): Creates a publication ready table from the output of "psych"  package based factor analysis.
#'2. des.tab(): Creates a publication ready descriptive table of Item analysis with the reporting of normality assumptions.
#'3. normality.loop(): Compute normality test on the whole data frame. No grouping variable required.
#'4. bedTime(): Calculate total time spent in bed from the sleep log entry.
#'5. cfa.tab():Creates a table with necessary fit indices from a "lavaan" class objects.
#'6. cfa.tab/multi():creates a table with necessary fit indices from several lavaan class objects.
#'7. ggicc: Creates a ggplot2 based publication ready Item Characteristics Curve from the "mirt" package based item response theory estimations.
#'8. ggiteminfo: Creates a ggplot2 based publication ready Item Information Curve from the "mirt" package based item response theory estimations.
#'9. ggtestinfo: Creates a ggplot2 based publication ready Test Information Curve from the "mirt" package based item response theory estimations.
#'10. ggtestinfo_se: Creates a ggplot2 based publication ready Test Information Curve with standard error from the "mirt" package based item response theory estimations.

#'It is advisable that you load **tidyverse** along with **tabledown**
#'
#' @docType package
#' @name tabledown
NULL
#> NULL
