#' A Function for Creating  Publication Quality Factor Tables
#'
#' This function will create publication worthy factor tables from objects created from
#' psych pack.
#' I have came across this beautiful piece of codes
#' at https://www.anthonyschmidt.co/post/2020-09-27-efa-tables-in-r/ and modified it a bit.
#'
#' @param  x A psych package object
#' @param  cut The value under which all factor loading will be suppressed
#' @param complexity To add complexity parameters
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'correlations <- psych::polychoric(data, correct = 0)
#'fa.5F.1 <- psych::fa(r=correlations$rho, nfactors = 5, fm= "pa",rotate ="varimax",
#'residuals = TRUE, SMC = TRUE, n.obs =428)
#'table <- fac.tab(fa.5F.1, .3)
#'#always save the output into an object
#'@return
#'A publication ready summary table for the Factor analysis conducted by psych Package


#' @importFrom magrittr  %>%
#'@importFrom dplyr across mutate
#'@importFrom tidyselect vars_select_helpers
#' @export
fac.tab <- function(x, cut,complexity =T ) {

  V1 <- V2 <- V3 <-NULL
  ifelse(complexity==T,{

    loadings <- psych::fa.sort(x)$loadings %>% round(2)

    loadings[abs(loadings) < abs(cut)] <- ""
    #get additional info
    add_info <- (cbind(x$communality,
                       x$uniquenesses,
                       x$complexity)) %>%
      # make it a data frame
      as.data.frame() %>%
      # column names
      dplyr::rename("Communality" = V1,
                    "Uniqueness" = V2,
                    "Complexity" = V3) %>%
      #get the item names from the vector
      tibble::rownames_to_column("item")
  },

  {loadings <- psych::fa.sort(x)$loadings %>% round(2)

  loadings[abs(loadings) < abs(cut)] <- ""
  #get additional info
  add_info <- (cbind(x$communality,
                     x$uniquenesses
  )) %>%
    # make it a data frame
    as.data.frame() %>%
    # column names
    dplyr::rename("Communality" = V1,
                  "Uniqueness" = V2
    ) %>%
    #get the item names from the vector
    tibble::rownames_to_column("item")
  })
  #build table
  loadings <- loadings %>%
    unclass() %>%
    as.data.frame() %>%
    tibble::rownames_to_column("item") %>%
    dplyr::left_join(add_info) %>%
    mutate(across(tidyselect::vars_select_helpers$where(is.numeric), round, 3)) %>%
    as.data.frame()
  variance <- x$Vaccounted %>%
    as.data.frame()%>%
    round(2)
  loadings <- rbind(data.table::setDT(loadings), data.table::setDT(variance[2,]), fill=TRUE)
  nr <- nrow(loadings)
  loadings[nr, 1] <- "% of Variance"
  loadings[is.na(loadings)] <- ""
  loadings
}




