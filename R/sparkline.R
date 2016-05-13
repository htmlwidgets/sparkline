#' @export
#' @import htmltools
#' @import htmlwidgets
sparkline <- function(values, ..., width = 60, height = 20,
                      elementId = NULL, renderSelector = NULL){
  params = list(
    values = values, 
    options = list(..., height = height, width = width), 
    width = width , height = height,
    renderSelector = renderSelector
  )
  params = Filter(Negate(is.null), params)
  htmlwidgets::createWidget('sparkline', params,
    width = width,
    height = height,
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.fill = FALSE 
    ),
    elementId = elementId
  )
}

#' @export
sparkline_html <- function(id, style, class, ...){
  tags$span(id = id, class = class)
}

#' @export
sparklineOutput <- function(outputId, width = "60px", height = "20px") {
  htmlwidgets::shinyWidgetOutput(outputId, "sparkline", width, height)
}

#' @export
renderSparkline <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sparklineOutput, env, quoted = TRUE)
}
