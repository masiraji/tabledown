#' A Function for Creating  Publication Quality Item Response Theory based item information plot.
#'
#' This function will create publication worthy Item Response Theory based item information plot. using ggplot2 from objects created from
#' mirt pack.
#'
#' @param  model A mirt package fitted object.
#' @param  item Item number (i.e. 1,2,3,4).
#' @param theta Theta range. Put only one number. Theta =3 will be considered as theta range (-3 to 3).
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'model <- mirt::mirt(data, model = 1, itemtype = '2PL')
#'
#'plot <- ggiteminfo(model, 1, 3)
#'@return
#'A publication quality item information plot.Output object is a ggplot object.


#'@importFrom mirt extract.item iteminfo
#' @export
ggiteminfo <- function (model, item, theta){
  Theta <- matrix(seq(-theta,theta, by = .1))
  iteminfo <- mirt::extract.item(model, item)
  information <- mirt::iteminfo(iteminfo, Theta)
  data <- as.data.frame(cbind(Theta, information))
  plot <- ggplot2::ggplot(data, ggplot2::aes(x=Theta, y=information)) +
    ggplot2::geom_line()+ggplot2::xlab(expression(theta)) +
    ggplot2::ylab(expression(I(theta)))+ ggplot2::theme(legend.title=ggplot2::element_blank())
  return(plot)

}



