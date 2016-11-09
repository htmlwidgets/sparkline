#' Add a Composite to an Existing Sparkline
#'
#' @param sparkline \code{\link{sparkline}} to which we would like to add
#'          a composite.
#' @param sparklineToAdd \code{\link{sparkline}} to add to another \code{\link{sparkline}}
#' @param ... extra arguments to modify \code{sparklineToAdd} or define a \code{\link{sparkline}}.
#'
#' @return \code{\link{sparkline}} object
#' @export
#'
#' @example inst/examples/examples_composite.R
spk_composite <- function(sparkline=NULL, sparklineToAdd=NULL, ...){
  stopifnot(
    !is.null(sparkline),
    inherits(sparkline,"sparkline")
  )
  
  sparkline_options <- list()
  
  # if a sparkline is provided to add
  #   then get its values and options
  if(!is.null(sparklineToAdd)) {
    sparkline_options <- list(
      values = sparklineToAdd$x$values,
      options = sparklineToAdd$x$options
    )
  }
  
  # if ... are provided
  #   then use these for values and options
  if(length(list(...)) > 0) {
    sparkline_options <- utils::modifyList(sparkline_options,list(...))
  }
  
  sparkline_options$options$composite <- TRUE
  sparkline$x$composites[[length(sparkline$x$composites)+1]] <- sparkline_options
  return(sparkline)
}
