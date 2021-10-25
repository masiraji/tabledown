#' baap: A Companion of the book "Basic and Advanced Psychometrics in R"
#'
#' The baap package provides necessary data frames used through out the book and some neat functions
#'
#'
#' @section baap Data-frames:
#' 1. Rotter: Psychometric validation data of Bangla Rotter's Internal- External Data
#' 2. Gantt and Spot: Two sample data-frames for creating project management Gantt chart
#' 3. FFMQ.CFA: Structural Validation data of Bangla Five Factor Mindfulness Questionnaire.
#' 4. FFMQ.Val:Correlational Validity evidences of Bangla Five Factor Mindfulness Questionnaire.
#'
#'
#' @section baap functions:
#'This packages includes some neat functions. Some of the functions presented here are from
#'stack overflow and other resources that we find very helpful in formatting the outputs
#'in a publication ready state.
#'1. fac.table(): Creates a publication ready table from the output of psych based factor analysis.
#'2. des.table(): Creates a publication ready descriptive table of Item analysis with the reporting of normality assumptions.
#'3. normality.loop(): Compute normality test on the whole data frame. No grouping required.
#'4. bedTime(): Calculate total time spent in bed from the sleep log entry.
#'5. cfa.tab():Creates a table with necessary fit indices from a lavaan class objects
#'6. cfa.tab/multi():creates a table with necessary fit indices from several lavaan class objects
#'
#'It is advisable that you load **tidyverse** along with **baap**
#'
#' @docType package
#' @name baap
NULL
#> NULL
