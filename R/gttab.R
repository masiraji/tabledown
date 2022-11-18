#' A Function for Creating  Publication Quality Factor Tables.
#'
#' This function will create publication worthy factor tables from objects created from
#' psych pack.
#' I have came across this beautiful piece of codes
#' at https://www.anthonyschmidt.co/post/2020-09-27-efa-tables-in-r/ and modified it a bit.
#'
#' @param  x A psych package object.
#' @param  cut The value under which all factor loading will be suppressed.
#' @param complexity To add complexity parameters.
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'correlations <- psych::polychoric(data, correct = 0)
#'fa.5F.1 <- psych::fa(r=correlations$rho, nfactors = 5, fm= "pa",rotate ="varimax",
#'residuals = TRUE, SMC = TRUE, n.obs =428)
#'table <- fac.tab(fa.5F.1, .3)
#'#always save the output into an object
#'@return
#'A publication ready summary table for the Factor analysis conducted by psych Package. Output structure is data frame.


#' @importFrom magrittr  %>%
#'@importFrom dplyr across mutate
#'@importFrom tidyselect vars_select_helpers
#'@importFrom tidyr gather
#'@importFrom tidyr dplyr group_by, summarise, inner_join, mutate, across, starts_with
#'@importFrom kutils likert
#'@importFrom tibble rownames_to_column

#' @export
gt_tab <- function(dataframe, recode_code){

  longtab <- as.data.frame(tidyr::gather(dataframe, Items, value))
  longtab$value <- as.numeric(as.character(longtab$value))

  ##Summarizing and creating gt object

  summary_tab <- longtab %>%
    dplyr::group_by(Items) %>%
    # calculate summary stats & create data for the histogram and density plot
    dplyr::summarise(
      nr = n(),
      mean = mean(value, na.rm = TRUE),
      med = median(value, na.rm = TRUE),
      sd = sd(value, na.rm = TRUE),
      hist_data = list(value),
      dens_data = list(value),
      .groups = "drop"
    )


  descriptive_tab <- tabledown::des.tab(dataframe)
  summary_tab_2 <- dplyr::inner_join(summary_tab, descriptives_tab, by = "Items")
  data_likert_1 <- dataframe
  data_likert_2 <-  dplyr::mutate(data_likert_1, dplyr::across(dplyr::starts_with(c("item")), ~unname(recode_code[.])))
  data_Factor_1 = as.data.frame(lapply(data_likert_2,factor, ordered = T))

  #get the items name
  items <- names(data_Factor_1)
  #Calculate percentage
  percentage_1 <- kutils::likert(data_Factor_1, vlist = items )

  percentage_2 <- percentage_1$table %>%
    as.data.frame(.)
  #data wrangling

  labels<- tibble::rownames_to_column(percentage_2, "Items")

  full_percentage_1<- as.data.frame(t(labels )) #transpose
  full_percentage_2 <- full_percentage_1[,-6] #removing 1st row and total column
  full_percentage_3 <- tibble::rownames_to_column(full_percentage_2, "Items")
  col_names <- full_percentage_3[1,]
  full_percentage_4 <-full_percentage_3[-1,]
  full_percentage_5 <- as.data.frame(full_percentage_4)
  full_percentage_6 <- as.data.frame(full_percentage_5[order(Items),])
  colnames(full_percentage_6) <- (col_names)

  full.table <-  dplyr::inner_join( summary_tab_2, full_percentage_6, by = "Items")

  return(full.table )
}




