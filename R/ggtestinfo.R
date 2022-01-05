#' A Function for Creating  Publication Quality IRT Test Information plot
#'
#' This function will create publication worthy IRT Test information plot using ggplot2 from objects created from
#' mirt pack.
#' Using ggplot2 will enable the user to modify the Item plot in many ways
#'
#' @param  dataframe your data
#' @param  model A mirt package fitted object
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'model <- mirt(data, model = 1, itemtype = '2PL')
#'
#'plot <- ggtestinfo(data, model)
#'@return
#'A publication quality Test information plot


#'@importFrom mirt extract.item iteminfo
#' @export
ggtestinfo <- function(dataframe,model){
  Theta <- matrix(seq(-6,6, by = .1))
  T1 <- 0
  for(i in 1:ncol(dataframe)){
    T1 <- T1 + mirt::iteminfo(extract.item(model, i), Theta)
  }

  data <- as.data.frame(cbind(Theta, T1))
  plot <-  ggplot(data, aes(x=Theta, y=T1)) +
    geom_line() +labs(y="Test Information")
  return(plot)
}

