#' A Function for Creating  Publication Quality Tables with CFA fit indices
#'
#' This function will create publication worthy tables with CFA fit indices from lavaan class object.
#'
#' @param  x A lavaan class object
#' @param  robust If TRUE, will provide robust fit indices when applicable instead of the default indices.
#'
#' @examples
#'data <- baap::FFMQ.CFA
#'FF.model.Original <- "Observe =~ item1 + item6 + item11 + item15 +
#'item20 + item26 + item31 + item 36
#'Describe =~ item2 + item7 + Ritem12 + Ritem16 + Ritem22 + item27 +
#'item32 + item37
#'Awareness =~ Ritem5 + Ritem8 + Ritem13 + Ritem18 + Ritem23 + Ritem28
#'+ Ritem34 + Ritem38
#'Nonjudge =~ Ritem3 + Ritem10 + Ritem14 + Ritem17 + Ritem25 + Ritem30+
#'Ritem35 + Ritem39
#'Nonreact =~ item4 + item9 + item19 + item21 + item24 + item29 + item33 "
#'fit.original <- lavaan::cfa(FF.model.Original, data = data, estimator = "MLR",
#'mimic = "Mplus")
#'table <- cfa.tab(fit.original, robust =TRUE)
#'
#'
#'@return
#'A  summary with CFA fit indices


#' @importFrom lavaan  fitmeasures
#' @importFrom MOTE apa
#' @export
cfa.tab <- function(x, robust = F ){
ifelse(robust==TRUE,{
  Model <- lavaan::fitmeasures(x, c("chisq", "df", "pvalue", "gfi",  "nfi",
                                    "cfi.robust","tli.robust",
                                    "rmsea.robust", "rmsea.ci.upper.robust",
                                    "rmsea.ci.lower.robust","srmr"))

},
{Model <- lavaan::fitmeasures(x, c("chisq", "df", "pvalue", "gfi",  "nfi",
                                   "cfi","tli","rmsea", "rmsea.ci.lower", "rmsea.ci.upper","srmr"))

})

Model <- MOTE::apa(Model, 2, T)
Model <- as.data.frame(Model)
Model <- (t(Model))
colnames(Model) <- c("Chi-square", "df", "p", "GFI","NFI", "CFI", "TIL", "RMSEA", "RMSEA-Upper", "RMSEA-Lower", "SRMR")
Model
}
