## code to prepare `PsychData` dataset goes here


library(readr)
library(readxl)
Rotter <- readRDS("data-raw/WRotter.rds")
Gantt <-read.csv("data-raw/gantt.csv")
Spott <- read.csv("data-raw/spot.csv")
FFMQ.CFA <-read_excel("data-raw/FSS_Sturctural_analysis_teaches_278.xlsx")
FFMQ.Val <- read_excel("data-raw/Validity analysis of FSS (N= 255).xlsx")
LEBA <-readRDS("data-raw/Light_survey.rds")

usethis::use_data(Rotter, Gantt, Spott,FFMQ.CFA,FFMQ.Val,LEBA, overwrite = T)
