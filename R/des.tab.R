#' A Function for Descriptive data for item analysis.
#'
#' This function will create a publication ready essential descriptive table for item analysis.
#' Normality is tested using shapiro.test from base stats with Bonferroni Correction.
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'table <- des.tab(data)
#' @param df A data frame.
#'@return
#'Returns a summary table of descriptives in a data frame structure.

#' @export
des.tab <- function(df){
  Descriptives <- psych::describe(df)
  Mean <-MOTE::apa(Descriptives$mean,2,TRUE)
  SD <-MOTE::apa(Descriptives$sd,2,TRUE)
  Skew <-MOTE::apa(Descriptives$skew,2,TRUE)
  Kurtosis <- MOTE::apa(Descriptives$kurtosis,2,TRUE)
  alpha <- psych::alpha(df,check.keys=TRUE)
  Items <- rownames(alpha$item.stats)
  Corrected.item.total.correlation <- MOTE::apa(alpha$item.stats$r.cor,2,TRUE)
normality.test <-normality.loop(df)
 statistics <-MOTE::apa(normality.test$statistic,2,TRUE)
 sig <-(normality.test$significance)
 Normality <- paste(statistics, sig, sep = "" )
 des.tab <-as.data.frame((cbind(Items, Mean, SD, Skew,Kurtosis,  Normality,Corrected.item.total.correlation)))
 des.tab

  }
