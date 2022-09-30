#' A Function for Creating  Publication Quality Item Response Theory based reliability plot.
#'
#' This function will create publication worthy Item Response Theory based based reliability plot with standard error using ggplot2 from objects created from
#' mirt pack.
#' Using ggplot2 will enable the user to modify the Item plot.
#'
#' @param  dataframe your data.
#' @param  model A mirt package fitted object.
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'model <- mirt::mirt(data, model = 1, itemtype = '2PL')
#'
#'plot <- ggreliability(data, model)
#'@return
#'A publication quality reliability plot (dashed line). Output object is a ggplot object.


#'@importFrom mirt extract.item iteminfo
#'
#'@importFrom ggplot2 geom_line labs ylim xlab ylab
#'
#' @export
ggreliability <- function(dataframe,model){
  Theta <- matrix(seq(-6,6, by = .1))
  T1 <- 0
  se <- 0
  reliability <- 0
  for(i in 1:ncol(dataframe)){
    T1 <- T1 + mirt::iteminfo(extract.item(model, i), Theta)
    reliability <- T1/(T1+1)
  }

  data <- as.data.frame(cbind(Theta, T1,  reliability))
  p1 <-  ggplot2::ggplot(data, ggplot2::aes(x=Theta, y=reliability)) +ggplot2::ylim(0,1)+
    ggplot2::geom_line() + ggplot2::labs(y="Reliability") +
    ggplot2::xlab(expression(theta))+ggplot2::ylab(expression(r(theta)[xx]))

  return(p1)
}

