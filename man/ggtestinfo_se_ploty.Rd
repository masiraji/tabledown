% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggtestinfo_se_plotly.R
\name{ggtestinfo_se_ploty}
\alias{ggtestinfo_se_ploty}
\title{A Function for Creating  Item Response Theory based test information plot with standard error with plotly.}
\usage{
ggtestinfo_se_ploty(dataframe, model)
}
\arguments{
\item{dataframe}{your data.}

\item{model}{A mirt package fitted object.}
}
\value{
A publication quality Test information plot with standard error (dashed line). Output object is a ggplot object.
}
\description{
This function will create Item Response Theory based Test information plot with standard error using ggplot2 and plotly from objects created from
mirt pack.
Using ggplot2 will enable the user to modify the Item plot.
}
\examples{
data <- tabledown::Rotter[, 11:31]
model <- mirt::mirt(data, model = 1, itemtype = '2PL')
plot <- ggtestinfo_se_ploty(data, model)
}
