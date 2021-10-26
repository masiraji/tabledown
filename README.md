# baap

<!-- badges: start -->

[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![R-CMD-check](https://github.com/masiraji/baap/workflows/R-CMD-check/badge.svg)](https://github.com/masiraji/baap/actions) [![CRAN status](https://www.r-pkg.org/badges/version/baap)](https://CRAN.R-project.org/package=baap) [![metacran downloads](https://cranlogs.r-pkg.org/badges/baap)](https://cran.r-project.org/package=baap) [![thanks-md](https://img.shields.io/badge/THANKS-md-ff69b4.svg)](THANKS.md) [![license](https://img.shields.io/badge/license-GPL%20(%3E=3)-lightgrey.svg)](https://choosealicense.com/)

<!-- badges: end -->

This package is a companion R package for the Book " Basic and Advanced Psychometrics in R" [work in Progress]

This package includes data-frames and some interesting functions to create publication-friendly summary tables for factor analysis, confirmatory factor analysis and item analysis.

## Installation

You can install the development version of baap from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("masiraji/baap")
```

## Example

### Creating A Summary Table of Factor Analysis

Commonly it is very difficult to create a publication friendly table that summaries all necessary information of a factor analysis. This example will help you in that pursuit with the help of **fac.tab()** function

    library(baap)
    library(tidyverse)
    library(psych)
    library(papaja)

    Load the data from baap package
    data <- baap::Rotter[, 11:31]

    Create a correlational matrix to compute factor analysis
    correlations <- psych::polychoric(data, correct = 0)

    fa.5F.1 <- psych::fa(r=correlations$rho, nfactors = 5, fm= "pa",rotate ="varimax",
    residuals = TRUE, SMC = TRUE, n.obs =428)


    table <- baap::fac.tab(fa.5F.1, .3, complexity = F)

    papaja::apa_table(table, caption= "A Beautiful Table describing the Fator analysis Output ")

![](docs/reference/figures/fac.tab.jpg "Table 1: A Beautiful Summary Table of Factor Analysis Output")

### Creating A Summary Table of Fit indices in Confitmatory Factor Analyis

When reporting the confirmatory factor analysis results, modern psychometrics suggest fitting several possible structural models of the latent construct and reporting the fit indices for them. [**lavan**](https://github.com/yrosseel/lavaan) package does a fantastic job doing the confirmatory factor analysis. Here we will see how to create a publication friendly summary of fit indices from several fitted models using **cfa.tab.multi()** function.

    {Load required packages}
    library(baap)
    library(tidyverse)
    library(lavaan)
    library(papaja)

    load the data
    data <- baap::FFMQ.CFA

     First CFA model

    FF.model.Original <- "Observe =~ item1 + item6 + item11 + item15 +item20 + item26 + item31 + item 36
    Describe =~ item2 + item7 + Ritem12 + Ritem16 + Ritem22 + item27 +
    item32 + item37
    Awareness =~ Ritem5 + Ritem8 + Ritem13 + Ritem18 + Ritem23 + Ritem28 + Ritem34 + Ritem38
    Nonjudge =~ Ritem3 + Ritem10 + Ritem14 + Ritem17 + Ritem25 + Ritem30+ Ritem35 + Ritem39
    Nonreact =~ item4 + item9 + item19 + item21 + item24 + item29 + item33 "

    fit.original <- lavaan::cfa(FF.model.Original, data = data, estimator = "MLR", mimic = "Mplus")

     Second CFA Model
    FF.model.Cor <-  "Observe =~ item1 + item6 + item11 + item15 +item20 + item26 + item31 + item 36
    Describe =~ item2 + item7   + item27 + item32 + item37
    Awareness =~ Ritem5 + Ritem8 + Ritem13 + Ritem18 + Ritem23 +Ritem28 + Ritem34
    Nonjudge =~  Ritem10 + Ritem14 + Ritem25 + Ritem30+ Ritem35
    Nonreact =~ item4 + item9 + item19 + item21 + item24 + item29 + item33
    Ritem28 ~~ Ritem34
    Ritem23 ~~ Ritem34"
    fit.Cor <- lavaan::cfa(FF.model.Cor, data = data, estimator = "MLR", mimic = "Mplus")

    Third CFA Model

    FF.short <- "Observe =~ item36 + item26 +item20 + item11
    Describe =~ item2 + item7 + item27 +  item32
    Awareness =~  Ritem8 + Ritem13 + Ritem23 + Ritem28
    Nonjudge =~ Ritem10  + Ritem25 + Ritem30 + Ritem35
    Nonreact =~ item9 + item19 + item21 + item24"

    fit.short <- lavaan::cfa(FF.short, data = data, estimator = "MLR", mimic = "Mplus")

    # Creating Summary table of fit indices from three fitted model (lavaan class objects)

    table <- cfa.tab.multi(fit.original, fit.Cor, fit.short, robust = TRUE)

    papaja::apa_table(table, caption= "A Beautiful Table describing the Fit Indices of Three Fitted Model ")

![A Beautiful Summary Table of Fit Indices of Three Fitted CFA Models](docs/reference/figures/cfa.tab.jpg)

### Creating Summary Table for Item Analysis

In psychometrics conducting item-analysis is very common. [**psych**](https://cran.r-project.org/web/packages/psych/index.html) packages have provided enough tools to run the item analysis smoothly. Here we will create a publication friendly summary table of item analysis with all necessary information using function **des.tab()**

     library(baap) 
     library(tidyverse) 
     library(psych)

    data <- baap::Rotter[, 11:31] 

    table <- des.tab(data) papaja::apa_table(table, caption= "A Beautiful Table Summarizing the Output of Item Analysis ")

![A Beautiful Summary Table of Item-Analysis](docs/reference/figures/item%20analysis.jpg)
