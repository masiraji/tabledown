% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cfa.tab.R
\name{cfa.tab}
\alias{cfa.tab}
\title{A Function for Creating  Publication Quality Tables with CFA fit indices.}
\usage{
cfa.tab(x, robust = FALSE)
}
\arguments{
\item{x}{A lavaan class object.}

\item{robust}{If TRUE, will provide robust fit indices when applicable instead of the default indices.}
}
\value{
A  summary with CFA fit indices in a matrix structure.
}
\description{
This function will create publication worthy tables with CFA fit indices from lavaan class object.
}
\examples{
data <- tabledown::FFMQ.CFA
FF.model.Original <- "Observe =~ item1 + item6 + item11 + item15 +
item20 + item26 + item31 + item36
Describe =~ item2 + item7 + Ritem12 + Ritem16 + Ritem22 + item27 +
item32 + item37
Awareness =~ Ritem5 + Ritem8 + Ritem13 + Ritem18 + Ritem23 + Ritem28
+ Ritem34 + Ritem38
Nonjudge =~ Ritem3 + Ritem10 + Ritem14 + Ritem17 + Ritem25 + Ritem30+
Ritem35 + Ritem39
Nonreact =~ item4 + item9 + item19 + item21 + item24 + item29 + item33 "
fit.original <- lavaan::cfa(FF.model.Original, data = data, estimator = "MLR",
mimic = "Mplus")
table <- cfa.tab(fit.original, robust =TRUE)


}
