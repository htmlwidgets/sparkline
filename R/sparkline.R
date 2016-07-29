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

sparkline_html <- function(id, style, class, ...){
  tags$span(id = id, class = class)
}

#' Shiny bindings for sparkline
#'
#' Output and render functions for using sparkline within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a sparkline
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name sparkline-shiny
#'
#' @export
sparklineOutput <- function(outputId, width = "60px", height = "20px") {
  htmlwidgets::shinyWidgetOutput(outputId, "sparkline", width, height)
}

#' @rdname sparkline-shiny
#' @export
renderSparkline <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sparklineOutput, env, quoted = TRUE)
}
