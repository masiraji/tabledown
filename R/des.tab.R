#' A Function for Descriptive data for item analysis
#'
#' This function will create a publication ready essential descriptive table for item analysis.
#' Normality is tested using shapiro.test from base stats with Bonferroni Correction.
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'table <- des.tab(data)
#' @param df A data frame


#' @export
des.tab <- function(df){

  Descriptives <- psych::describe(df)
  Mean <-MOTE::apa(Descriptives$mean,2,T)
  SD <-MOTE::apa(Descriptives$sd,2,T)
  Skew <-MOTE::apa(Descriptives$skew,2,T)
  Kurtosis <- MOTE::apa(Descriptives$kurtosis,2,T)
  alpha <- psych::alpha(df)
  Item.total.correlation <- MOTE::apa(alpha$item.stats$r.cor,2,T)
  normality.test <-normality.loop(df)
 statistics <-MOTE::apa(normality.test$statistic,2,T)
 sig <-(normality.test$significance)
 Normality <- paste(statistics, sig, sep = "" )
 des.tab <-as.data.frame((cbind(Mean, SD, Skew,Kurtosis,  Normality,Item.total.correlation)))
 des.tab

  }
