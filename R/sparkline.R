#' @export
#' @import htmltools
#' @import htmlwidgets
sparkline <- function(values, ..., width = 60, height = 20){
  params = list(values = paste(values, collapse = ','), 
    options = list(..., height = height, width = width), 
    width = width , height = height
  )
  params = Filter(Negate(is.null), params)
  structure(params, class = c('sparkline', 'htmlwidget'))
}

#' @export
widget_div.sparkline <- function(x, id, class, style){
  tags$span(id = id, class = class, x$values)
}