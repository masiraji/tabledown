#' A Function for Creating  Publication Quality Tables with CFA fit indices.
#'
#' This function will create publication worthy tables with CFA fit indices from lavaan class object.
#'
#' @param  x A lavaan class object.
#' @param  robust If TRUE, will provide robust fit indices when applicable instead of the default indices.
#'


#' @importFrom lavaan  fitmeasures
#' @importFrom MOTE apa
#' @export
cfa.tab <- function(x, robust = FALSE ){
ifelse(robust==TRUE,{
  Model <- lavaan::fitmeasures(x, c("chisq", "df", "pvalue", "gfi",  "nfi",
                                    "cfi.robust","tli.robust",
                                    "rmsea.robust", "rmsea.ci.upper.robust",
                                    "rmsea.ci.lower.robust","srmr"))

},
{Model <- lavaan::fitmeasures(x, c("chisq", "df", "pvalue", "gfi",  "nfi",
                                   "cfi","tli","rmsea", "rmsea.ci.lower", "rmsea.ci.upper","srmr"))

})

Model <- MOTE::apa(Model, 2, TRUE)
Model <- as.data.frame(Model)
Model <- (t(Model))
colnames(Model) <- c("Chi-square", "df", "p", "GFI","NFI", "CFI", "TIL", "RMSEA", "RMSEA-Upper", "RMSEA-Lower", "SRMR")
Model
}
