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
#'model <- mirt::mirt(data, model = 1, itemtype = '2PL')
#'
#'plot <- ggicc(model, 1, 3)
#'@return
#'A publication quality item information plot


#'@importFrom mirt extract.item iteminfo
#' @export
ggicc <- function(model, item, theta){
  Theta <- matrix(seq(-theta,theta, by = .1))
  iteminfo <- mirt::extract.item(model, item)
  P <-mirt::probtrace(x=iteminfo , Theta=Theta  )
  icc <- data.frame(P = P, Theta = Theta)
  colnames(icc) <- c(paste("P", 1:ncol(P), sep=''), "Theta")
  icc2<- reshape(icc, direction='long', varying = paste("P", 1:ncol(P), sep=''), v.names = 'P',
                 times = paste("P", 1:ncol(P), sep=''))
  plot <- ggplot2::ggplot(icc2,aes(Theta,P, col =time))+geom_line()+xlab(expression(theta)) +
    ylab(expression(I(theta)))+ theme(legend.title=element_blank())
  return(plot)

}



