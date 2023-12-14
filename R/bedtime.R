#' A Function for calculating time spent in bed.
#'
#' This function will help you to calculate the time a person spent in bed based on their sleep log.
#' This type of calculation is very common in sleep research.
#' However, as one can guess, working with dates in R is a bit tricky.
#' This function will ease the task.
#' More importantly  you do not require to entry the dates to calculate bed time.
#' Just wake up time and time to go to bed is enough (24 hour format).
#' @param x A vector containing time to do to bed.
#' @param y A vector containing time of wake.
#'
#'@examples
#'#Please use 24 hour format.
#'#Easiest way is to enter the data as character.
#' bed <-c("20:00", "21:00", "23:00")
#' wake <-c("6:00", "7:00", "8:00")
#'bedtime <- bedTime(bed, wake)
#'
#'@return
#'Calculates time spent in bed in hours. Output class is numeric.

#' @export
bedTime <- function(x, y) {
  if (is.na(x) | is.na(y)) {
    warning("Either bedtime or waking time was NA. Hours in bed returned as NA")
    return(NA)
  } else if (grepl("[0-9][0-9]:[0-9][0-9]", x) | grepl("[0-9][0-9]:[0-9][0-9]", y)) { 
    bed <- x
    wake <- y
    wake <- paste(Sys.Date(), wake)
    tmpbed <- paste(Sys.Date(), bed)
    d <- apply(data.frame(tmpbed, wake), 1, function(x) difftime(x[2], x[1], units = "hours"))
    adjust <- -(d < 0)
    tmpbed <- paste(Sys.Date()+adjust, bed)
    bed_hours <- apply(data.frame(tmpbed, wake), 1, function(x) difftime(x[2], x[1], units = "hours"))
    return(bed_hours)
  } else { 
    warning("Either bedtime or waking time is not a string variable, or is not formatted as 'hh:mm'")
    return(NA)}}
}

