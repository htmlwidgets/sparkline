#' @export
#' @import htmltools
#' @import htmlwidgets
sparkline <- function(values, ..., width = 60, height = 20){
  params = list(
    values = values, 
    options = list(..., height = height, width = width), 
    width = width , height = height
  )
  params = Filter(Negate(is.null), params)
  htmlwidgets::createWidget('sparkline', params,
    width = width,
    height = height,
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.fill = FALSE 
    )
  )
}

#' @export
sparkline_html <- function(id, style, class, ...){
  tags$span(id = id, class = class)
}