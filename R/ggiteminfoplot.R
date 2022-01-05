#' A Function for Creating  Publication Quality IRT Item plot
#'
#' This function will create publication worthy IRT Item Information plot using ggplot2 from objects created from
#' mirt pack.
#' Using ggplot2 will enable the user to modify the Item Information plot in many ways
#'
#' @param  model A mirt package fitted object
#' @param  item Item number (i.e. 1,2,3,4)
#' @param theta Theta range. Put only one number. Theta =3 will be considered as theta range (-3 to 3)
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'model <- mirt(data, model = 1, itemtype = '2PL')
#'
#'plot <- ggiteminfo(model, 1, 3)
#'@return
#'A publication quality item information plot


#'@importFrom mirt extract.item iteminfo
#' @export
ggiteminfo <- function (model, item, theta){
  Theta <- matrix(seq(-theta,theta, by = .1))
  iteminfo <- mirt::extract.item(model, item)
  information <- mirt::iteminfo(iteminfo, Theta)
  data <- as.data.frame(cbind(Theta, information))
  plot <- ggplot(data, aes(x=Theta, y=information)) +
    geom_line()  +labs(y="Item Information")
  return(plot)

}



