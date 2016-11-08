[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sparkline)](https://cran.r-project.org/package=sparkline)

## Sparkline

This is an R package that provides support for [jquery sparkline](http://omnipotent.net/jquery.sparkline/#s-about) as a [htmlwidget](http://htmlwidgets.org).

### Installation

`sparkline` is on CRAN, so you can `install.packages("sparkline")`.

For the latest development version, please use `devtools::install_github("sparkline").

```r
library(devtools)
install_github('htmlwidgets/sparkline')
```

### Usage

The API is designed to be simple.

```r
x = rnorm(20)
sparkline(x)
sparkline(x, type = 'bar')
sparkline(x, type = 'box')
```

You can also use it in an R Markdown document.


	---
	title: "jquery Sparkline HTML Widget"
	author: "Ramnath Vaidyanathan"
	date: "July 18, 2014"
	output: html_document
	---

	```{r}
	library(htmlwidgets)
	library(sparkline)
	set.seed(1234)
	x = rnorm(10)
	y = rnorm(10)
	```


	Inline line graphs `r sparkline(x)`

	Bar charts  `r sparkline(abs(x), type = 'bar')`  negative values: `r sparkline(x, type = 'bar')`

	| Stock | Sparkline         | Boxplot  
	|-------|-------------------|--------
	| x     | `r sparkline(x)`  | `r sparkline(x, type ='box')`
	| y     | `r sparkline(y)`  | `r sparkline(y, type ='box')`
  
![sparkline](http://i.imgur.com/B99qnBj.png)


### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
