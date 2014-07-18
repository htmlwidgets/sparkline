#' @export
#' @import htmltools
#' @import htmlwidgets
sparkline <- function(values, ..., width = 20, height = 10){
  params = list(values = paste(values, collapse = ','), options = list(...), 
    width = width , height = height
  )
  params = Filter(Negate(is.null), params)
  structure(params, class = c('sparkline', 'htmlwidget'))
}

#' @export
widget_div.sparkline <- function(x, id, class, style){
  tags$span(id = id, class = class, x$values)
}