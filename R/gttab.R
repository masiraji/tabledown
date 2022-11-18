#' A Function for gtExtra package friendly data summary.
#'
#' This function will gtExtra package friendly data summary using the datafrmae provided
#' psych pack.

#' @param  datafrmae Dataframe with all items.
#' @param  recode_code Recode key
#'@examples
#'data <- tabledown::FFMQ.CFA[, 9:18]
#'recode_code <- c( "1" = "Never or very rarely true", "2" = "Rarely true", "3"= "Sometimes true","4" = "Often true","5" = "Very often or always true")
#'sample_tab <- gt_tab(data,recode_code)
#'@return
#'A publication ready descriptive summary table in png format.


#' @importFrom magrittr  %>%
#'@importFrom dplyr
#'@importFrom tidyselect vars_select_helpers
#'@importFrom tidyr gather
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
      nr = dplyr::n(),
      mean = mean(value, na.rm = TRUE),
      med = median(value, na.rm = TRUE),
      sd = sd(value, na.rm = TRUE),
      hist_data = list(value),
      dens_data = list(value),
      .groups = "drop"
    )


  descriptive_tab <- tabledown::des.tab(dataframe)
  summary_tab_2 <- dplyr::inner_join(summary_tab, descriptive_tab, by = "Items")
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

  colnames(full_percentage_5) <- (col_names)

  full.table <-  dplyr::inner_join( summary_tab_2, full_percentage_5, by = "Items")

  return(full.table )
}





