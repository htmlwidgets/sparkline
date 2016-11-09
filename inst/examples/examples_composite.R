library(sparkline)

sl1 <- sparkline(
  c(5,4,5,-2,0,3),
  type='bar',
  barColor="#aaf",
  chartRangeMin=-5,
  chartRangeMax=10,
  # set an id that will make it easier to refer
  #  in the next sparkline
  elementId="sparkline-for-composite"
)

sl2 <- sparkline(
  c(4,1,5,7,9,9,8,7,6,6,4,7,8,4,3,2,2,5,6,7),
  type="line",
  fillColor = FALSE,
  lineColor ='red',
  chartRangeMin = -5,
  chartRangeMax = 10
)

# add sparkline as a composite
spk_composite(sl1, sl2)

# add values and options as a composite
spk_composite(
  sl1,
  values=c(4,1,5,7,9,9,8,7,6,6,4,7,8,4,3,2,2,5,6,7),
  options = list(
    type="line",
    fillColor = FALSE,
    lineColor ='red',
    chartRangeMin = -5,
    chartRangeMax = 10
  )
)

# add combination of sparkline and options as a composite
spk_composite(
  sl1,
  sl2,
  options = list(
    type="box"
  )
)
