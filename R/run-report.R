## Script to run an Rmd file
##
## Now that we re-use the LEdata object this script should run faster.
##
## It's usually a good idea to keep the outputs separate from the 
## source code, so this time we will create an output folder if 
## it does not already exist and specify the path to the output file.
##

if (!file.exists("../output")) dir.create("../output")

rmarkdown::render("district-report.Rmd", 
                  params = list(area = "Medway"),
                  output_file = "../output/Medway.html")

rmarkdown::render("district-report.Rmd", 
                  params = list(area = "Birmingham"),
                  output_file = "../output/Birmingham.html")

rmarkdown::render("district-report.Rmd", 
                  params = list(area = "Leicester"),
                  output_file = "../output/Leicester.html")
