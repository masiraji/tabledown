#' A Function for computing univariate normality test on data frame
#'
#' This function will compute normality on entire data set. Sometime in dlookr package p
#' values turns out to be null thus failing to test normality of the data set. T
#' his is a good alternative of dlookr function
#'
#' @param df A data frame
#' @param bonf If Ture a bonferonni correction will be conducted
#' @param alpha Desired alpha
#'
#'@examples
#'data <- BAAP::Rotter[, 11:31]
#'normality.loop(data)
#'
#'
#' @export
normality.loop <- function(df, bonf= TRUE, alpha= 0.05) {
  l <- lapply(df, stats::shapiro.test)
  s <- do.call("c", lapply(l, "[[", 1))
  p <- do.call("c", lapply(l, "[[", 2))
  if (bonf == TRUE) {
    sig <- ifelse(p > alpha / length(l), "H0", "*")
  } else {
    sig <- ifelse(p > alpha, "H0", "*")
  }
  return(list(statistic= s,
              p.value= p,
              significance= sig,
              method= ifelse(bonf == TRUE, "Shapiro-Wilks test with Bonferroni Correction",
                             "Shapiro-Wilks test without Bonferroni Correction")))
}
