library(sparkline)
library(htmltools)

# plot the histogram  of iris petal length
#  as a sparkline bar
sparkline(
  hist(iris$Petal.Length,plot=FALSE)$counts,
  type = "bar"
)

# now split by species and plot the histograms
#  in a tagList by species for comparison
browsable(
  tagList(
    tags$h1("Iris Petal Length by Species"),
    lapply(
      split(iris, iris$Species),
      function(species){
        hpl_iris <- hist(iris$Petal.Length, plot=FALSE)
        hpl <- hist(species$Petal.Length, breaks = hpl_iris$breaks, plot=FALSE)
        tags$div(
          tags$h3(species[1,]$Species),
          sparkline(
            hpl$counts,
            type = "bar",
            zeroColor = "lightgray",
            chartRangeMin = 0,
            chartRangeMax = 50
          )
        )
      }
    )
  )
)

# however, more than likely we might like to plot
#  histograms for each of the variables as a sparkline
#  bar, and in this case, a table will provide a nice
#  layout for the histograms
library(formattable)
library(dplyr)
library(purrr)
library(tibble)
# get histograms for each of the columns on the entire set
#  so we can use breaks for consistent histograms by species
hist_iris <- iris %>%
  as_tibble() %>%
  select(-Species) %>%
  summarize_each(
    funs(
      list(hist(., plot=FALSE))
    )
  )

split(iris, iris$Species) %>%
  lapply(
    function(species){
      mapply(
        function(x, breaks){
          hist(x, breaks=breaks, plot=FALSE)
        },
        species %>% select(-Species),
        hist_iris %>%
          lapply(function(column){column[[1]]$breaks})
      )
    }
  ) %>%
  map(function(x) x["counts",]) %>% 
  bind_rows() %>%
  mutate(variable = colnames(iris)[1:4]) %>%
  select(variable, everything()) %>%
  formattable(
    list(
      area(col=2:4) ~ function(x){
        lapply(x,function(xx){
          as.character(as.tags(
            sparkline(xx,type = "bar", chartRangeMin = 0, chartRangeMax = 50, zeroColor = "lightgray")
          ))
        })
      }
    )
  ) %>%
  formattable::as.htmlwidget() %>%
  tagList() %>%
  attachDependencies(htmlwidgets:::widget_dependencies("sparkline","sparkline")) %>%
  browsable()