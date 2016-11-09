# use spk_add_deps with other htmlwidgets

library(sparkline)
library(formattable)

fw <- as.htmlwidget(
  formattable(
    data.frame(
      id = c("a", "b"),
      sparkline = c(
        spk_chr(runif(10,0,10), type="bar"),
        spk_chr(runif(10,0,5), type="bar")
      ),
      stringsAsFactors = FALSE
    )
  )
)

spk_add_deps(fw)

# use spk_add_deps with htmltools/shiny tags

library(sparkline)
library(htmltools)

div <- tags$div(
  spk_chr(1:10, type="bar")
)

spk_add_deps(div)
