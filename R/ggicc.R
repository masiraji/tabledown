#' A Function for Creating  Publication Quality IRT item characteristic plot.
#'
#' This function will create publication worthy IRT item characteristic plot using ggplot2 from objects created from
#' mirt pack.
#' Using ggplot2 will enable the user to modify the item characteristic plot.
#'
#' @param  model A mirt package fitted object.
#' @param  item Item number (i.e. 1,2,3,4).
#' @param theta Theta range. Put only one number. Theta =3 will be considered as theta range (-3 to 3).
#'@examples
#'data <- tabledown::Rotter[, 11:31]
#'model <- mirt::mirt(data, model = 1, itemtype = '2PL', SE = TRUE, Se.type = 'MHRM')
#'
#'plot <- tabledown::ggicc(model, 1, 3)
#'@return
#'A publication quality item characteristic plot. Output object is a ggplot object.


#'@importFrom mirt extract.item iteminfo
#'
#'@importFrom stats reshape time

#' @export
ggicc <- function(model, item, theta){
  Theta <- matrix(seq(-theta,theta, by = .1))
  iteminfo <- mirt::extract.item(model, item)
  P <-mirt::probtrace(x=iteminfo , Theta=Theta  )
  icc <- data.frame(P = P, Theta = Theta)
  colnames(icc) <- c(paste("P", 1:ncol(P), sep=''), "Theta")
  icc2<- reshape(icc, direction='long', varying = paste("P", 1:ncol(P), sep=''), v.names = 'P',
                 times = paste("P", 1:ncol(P), sep=''))
  plot <- ggplot2::ggplot(icc2, ggplot2::aes(Theta,P, col =time))+ggplot2::geom_line()+ggplot2::xlab(expression(theta)) +
    ggplot2::ylab(expression(P(theta)))+ ggplot2::theme(legend.title=ggplot2::element_blank())
  return(plot)

}



