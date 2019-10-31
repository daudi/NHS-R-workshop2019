## Script to run an Rmd file
##
## In this script we tell render() the parameter value we want to use
## by supplying a list.
##
## By default the output file name will be district-report.html
## 
## Note that by default this runs in your current environment, whereas using 
## the Knit menu runs the Rmd file in it's own environment. This means that 
## you Rmd file can modify or over-write any objects in your working enviroment.

rmarkdown::render("district-report.Rmd", params = list(area = "Medway"))
