#' A Function for Creating  Publication Quality Tables with CFA fit indices from several lavaan objects.
#'
#' Often researchers are required to show fit indices from several CFA models.
#' This function will create publication worthy tables with CFA fit indices
#' from several lavaan class objects.
#'#' To run this function successfully one need to provide at least two lavaan  objects.
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
#' @importFrom lavaan  fitmeasures
#' @importFrom MOTE apa
#' @export
cfa.tab.multi <- function(x,y,z=NULL, a=NULL, b=NULL, robust = FALSE){
  if(is.null(z) & is.null(a) & is.null(b)){
    ifelse(robust == TRUE,{
      table1 <- cfa.tab(x,robust = TRUE )
      table2 <- cfa.tab(y,robust = TRUE )

    },
    {
      table1 <- cfa.tab(x,robust = FALSE )
      table2 <- cfa.tab(y,robust = FALSE )

    })
    table <- rbind(table1, table2)
    rownames(table) <- c("Model1", "Model2")
  } else if (is.null(a) & is.null(b)){
    ifelse(robust == TRUE,{
      table1 <- cfa.tab(x,robust = TRUE )
      table2 <- cfa.tab(y,robust = TRUE )
      table3 <- cfa.tab(z,robust = TRUE )

    },
    {table1 <- cfa.tab(x,robust = FALSE )
    table2 <- cfa.tab(y,robust = FALSE )
    table3 <- cfa.tab(z,robust = FALSE )


    })
    table <- rbind(table1, table2, table3)
    rownames(table) <- c("Model1", "Model2", "Model3")

  }else if (is.null(b)){
    ifelse(robust == TRUE,{
      table1 <- cfa.tab(x,robust = TRUE )
      table2 <- cfa.tab(y,robust = TRUE )
      table3 <- cfa.tab(z,robust = TRUE )
      table4 <- cfa.tab(a,robust = TRUE )
    },
    {table1 <- cfa.tab(x,robust = FALSE )
    table2 <- cfa.tab(y,robust = FALSE )
    table3 <- cfa.tab(z,robust = FALSE )
    table4 <- cfa.tab(a,robust = FALSE )

    })
    table <- rbind(table1, table2, table3, table4)
    rownames(table) <- c("Model1", "Model2", "Model3", "Model4")
  } else{
    ifelse(robust == TRUE,{
      table1 <- cfa.tab(x,robust = TRUE )
      table2 <- cfa.tab(y,robust = TRUE )
      table3 <- cfa.tab(z,robust = TRUE )
      table4 <- cfa.tab(a,robust = TRUE )
      table5 <- cfa.tab(b,robust = TRUE )
    },
    {table1 <- cfa.tab(x,robust = FALSE )
    table2 <- cfa.tab(y,robust = FALSE )
    table3 <- cfa.tab(z,robust = FALSE )
    table4 <- cfa.tab(a,robust = FALSE )
    table5 <- cfa.tab(b,robust = FALSE )

    })
    table <- rbind(table1, table2, table3, table4, table5)
    rownames(table) <- c("Model1", "Model2", "Model3", "Model4", "Model5")
  }
  table
}
