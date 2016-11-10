\dontrun{
  #spk_chr works well with dplyr summarise
  
  library(dplyr)
  library(sparkline)
  library(formattable)
  
  mtcars %>%
    group_by(cyl) %>%
    summarise(
      hp = spk_chr(
        hp, type="box",
        chartRangeMin=0, chartRangeMax=max(mtcars$hp)
      ),
      mpg = spk_chr(
        mpg, type="box",
        chartRangeMin=0, chartRangeMax=max(mtcars$mpg)
      )
    ) %>%
    formattable() %>%
    formattable::as.htmlwidget() %>%
    spk_add_deps()
}
