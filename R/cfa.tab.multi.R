#' A Function for Creating  Publication Quality Tables with CFA fit indices from several lavaan objects
#'
#' Often researchers are required to show fit indices from several CFA models.
#' This function will create publication worthy tables with CFA fit indices
#' from several lavaan class objects.
#'#' To run this function successfully one need to provide at least two lavaan lavaan objects.
#'This command supports up-to five lavaan models.
#'
#'
#' @param  x first object of class lavaan (Mandatory).
#' @param  y second object of class lavaan (Mandatory).
#' @param  z third object of class lavaan (Optional).
#' @param  a fourth object of class lavaan (Optional).
#' @param  b fifth object of class lavaan (Optional).
#' @param  robust If TRUE, will provide robust fit indices when applicable instead of the default indices.
#'
#'@examples
#'data <- tabledown::FFMQ.CFA
#'FF.model.Original <- "Observe =~ item1 + item6 + item11 + item15 +
#'item20 + item26 + item31 + item 36
#'Describe =~ item2 + item7 + Ritem12 + Ritem16 + Ritem22 + item27 +
#'item32 + item37
#' Awareness =~ Ritem5 + Ritem8 + Ritem13 + Ritem18 + Ritem23 + Ritem28 +
#' Ritem34 + Ritem38
#' Nonjudge =~ Ritem3 + Ritem10 + Ritem14 + Ritem17 + Ritem25 +
#' Ritem30+ Ritem35 + Ritem39
#' Nonreact =~ item4 + item9 + item19 + item21 + item24 + item29 + item33 "

#'fit.original <- lavaan::cfa(FF.model.Original, data = data,
#'estimator = "MLR", mimic = "Mplus")

#'FF.model.Cor <-  "Observe =~ item1 + item6 + item11 + item15 +
#'item20 + item26 + item31 + item 36
#'  Describe =~ item2 + item7   + item27 + item32 + item37
#' Awareness =~ Ritem5 + Ritem8 + Ritem13 + Ritem18 + Ritem23 +
#' Ritem28 + Ritem34
#' Nonjudge =~  Ritem10 + Ritem14 + Ritem25 + Ritem30+ Ritem35
#'  Nonreact =~ item4 + item9 + item19 + item21 + item24 + item29 + item33
#'Ritem28 ~~ Ritem34
#'Ritem23 ~~ Ritem34"
#'fit.Cor <- lavaan::cfa(FF.model.Cor, data = data, estimator = "MLR", mimic = "Mplus")

#'FF.short <- "Observe =~ item36 + item26 +item20 + item11
#'Describe =~ item2 + item7 + item27 +  item32
#'Awareness =~  Ritem8 + Ritem13 + Ritem23 + Ritem28
#' Nonjudge =~ Ritem10  + Ritem25 + Ritem30 + Ritem35
#' Nonreact =~ item9 + item19 + item21 + item24"
#'fit.short <- lavaan::cfa(FF.short, data = data, estimator = "MLR", mimic = "Mplus")

#'table <- cfa.tab.multi(fit.original, fit.Cor, fit.short, robust = TRUE)
#'
#'@return
#'A  summary of CFA fit indices from several lavaan class objects
#' @importFrom lavaan  fitmeasures
#' @importFrom MOTE apa
#' @export
cfa.tab.multi <- function(x,y,z=NULL, a=NULL, b=NULL, robust = F){
  if(is.null(z) & is.null(a) & is.null(b)){
    ifelse(robust == TRUE,{
      table1 <- cfa.tab(x,robust = TRUE )
      table2 <- cfa.tab(y,robust = TRUE )

    },
    {
      table1 <- cfa.tab(x,robust = F )
      table2 <- cfa.tab(y,robust = F )

    })
    table <- rbind(table1, table2)
    rownames(table) <- c("Model1", "Model2")
  } else if (is.null(a) & is.null(b)){
    ifelse(robust == TRUE,{
      table1 <- cfa.tab(x,robust = TRUE )
      table2 <- cfa.tab(y,robust = TRUE )
      table3 <- cfa.tab(z,robust = TRUE )

    },
    {table1 <- cfa.tab(x,robust = F )
    table2 <- cfa.tab(y,robust = F )
    table3 <- cfa.tab(z,robust = F )


    })
    table <- rbind(table1, table2, table3)
    rownames(table) <- c("Model1", "Model2", "Model3")

  }else if (is.null(b)){
    ifelse(robust == T,{
      table1 <- cfa.tab(x,robust = T )
      table2 <- cfa.tab(y,robust = T )
      table3 <- cfa.tab(z,robust = T )
      table4 <- cfa.tab(a,robust = T )
    },
    {table1 <- cfa.tab(x,robust = F )
    table2 <- cfa.tab(y,robust = F )
    table3 <- cfa.tab(z,robust = F )
    table4 <- cfa.tab(a,robust = F )

    })
    table <- rbind(table1, table2, table3, table4)
    rownames(table) <- c("Model1", "Model2", "Model3", "Model4")
  } else{
    ifelse(robust == T,{
      table1 <- cfa.tab(x,robust = T )
      table2 <- cfa.tab(y,robust = T )
      table3 <- cfa.tab(z,robust = T )
      table4 <- cfa.tab(a,robust = T )
      table5 <- cfa.tab(b,robust = T )
    },
    {table1 <- cfa.tab(x,robust = F )
    table2 <- cfa.tab(y,robust = F )
    table3 <- cfa.tab(z,robust = F )
    table4 <- cfa.tab(a,robust = F )
    table5 <- cfa.tab(b,robust = F )

    })
    table <- rbind(table1, table2, table3, table4, table5)
    rownames(table) <- c("Model1", "Model2", "Model3", "Model4", "Model5")
  }
  table
}
