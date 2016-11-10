#' Add Sparkline Dependencies to Tag or 'htmlwidget'
#'
#' @param tag_htmlwidget \code{shiny.tag} or \code{htmlwidget} to which
#'          you would like to add \code{sparkline} dependencies
#'
#' @return \code{shiny.tag} or \code{htmlwidget}
#' @export
#'
#' @example inst/examples/examples_dependencies.R

spk_add_deps <- function(tag_htmlwidget = NULL) {
  stopifnot(
    !is.null(tag_htmlwidget),
    inherits(tag_htmlwidget,c("htmlwidget", "shiny.tag"))
  )
  
  # if tag use attachDependencies
  if(inherits(tag_htmlwidget, "shiny.tag")) {
    return(
      htmltools::attachDependencies(
        tag_htmlwidget,
        spk_dependencies()
      )
    )
  }
  
  # if htmlwidget then append to $dependencies
  if(inherits(tag_htmlwidget, "htmlwidget")) {
    deps <- tag_htmlwidget$dependencies
    tag_htmlwidget$dependencies <- c(
      deps,
      spk_dependencies()
    )
    tag_htmlwidget
  }
}

#' @keywords internal
spk_dependencies <- function(){
  htmlwidgets::getDependency(name="sparkline", package="sparkline")
}
