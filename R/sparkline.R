#' Interactive Sparklines
#' 
#' Create interactive sparklines for inline visualization.
#'
#' @param values \code{vector} of values to visualize
#' @param ... additional options passed to \code{jquery.sparkline};  see
#'          \href{http://omnipotent.net/jquery.sparkline/#common}{jquery.sparkline docs}
#' @param height,width  height and width of sparkline htmlwidget
#'          specified in any valid \code{CSS} size unit.
#' @param elementId \code{string} id as a valid \code{CSS} element id.
#' @param renderSelector \code{string} as \code{CSS} selector to render
#'          in a DOM element other than the \code{htmlwidget} container
#'
#' @import htmlwidgets
#' @export
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
  htmltools::tags$span(id = id, class = class)
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
