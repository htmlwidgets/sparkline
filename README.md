## Sparkline

This is an experimental R package that provides support for [jquery sparkline](http://omnipotent.net/jquery.sparkline/#s-about) as a HTML widget.

### Installation

You can install from github

```r
library(devtools)
install_github('rstudio/htmltools')
install_github('ramnathv/htmlwidgets')
install_github('ramnathv/sparkline')
```

### Usage

The API is pretty simple

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


