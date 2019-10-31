## Script to run an Rmd file for three different areas
##
## Now we call render() three times with different areas each time. 
## We also specify the name of the output file. We could specify 
## the output_dir and not the file name, but this would call each
## report district-report.Rmd so each subsequent report would 
## over-write the previous one.


rmarkdown::render("district-report.Rmd", 
                  params = list(area = "Medway"),
                  output_file = "Medway.html")

rmarkdown::render("district-report.Rmd", 
                  params = list(area = "Birmingham"),
                  output_file = "Birmingham.html")

rmarkdown::render("district-report.Rmd", 
                  params = list(area = "Leicester"),
                  output_file = "Leicester.html")



## One problem with this approach is that it calls fingertips_data() each time
## and therefore will be slow when we need to run it for lots of areas.
## We can improve this by changing our Rmd file slightly.