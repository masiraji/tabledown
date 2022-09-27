#' A Function for Creating  Publication Quality IRT test information plot with standard error.
#'
#' This function will create publication worthy IRT Test information plot with standard error using ggplot2 from objects created from
#' mirt pack.
#' Using ggplot2 will enable the user to modify the Item plot.
#'
#' @param  dataframe your data.
#' @param  model A mirt package fitted object.
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'model <- mirt::mirt(data, model = 1, itemtype = '2PL')
#'
#'plot <- ggtestinfo(data, model)
#'@return
#'A publication quality Test information plot with standard error (dashed line). Output object is a ggplot object.


#'@importFrom mirt extract.item iteminfo
#'
#' @export
ggtestinfo_se <- function(dataframe,model){
  Theta <- matrix(seq(-6,6, by = .1))
  T1 <- 0

  for(i in 1:ncol(dataframe)){
    T1 <- T1 + mirt::iteminfo(extract.item(model, i), Theta)
    se <- 1/(sqrt(T1))
  }

  data <- as.data.frame(cbind(Theta, T1, se))
  p1 <- ggplot2::ggplot(data, ggplot2::aes(x=Theta, y=T1)) +
    ggplot2::geom_line()+
    ggplot2::geom_line(data = data,linetype = "dashed",color = "red", ggplot2::aes(x=Theta, y=se))+
    ggplot2::xlab(expression(theta)) +
    ggplot2::ylab(expression(I(theta)))+ ggplot2::theme(legend.title=ggplot2::element_blank())

  return(p1)
}


