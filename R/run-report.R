## Script to run an Rmd file multiple times
##
## Now produce a profile for all 326 districts and local authorities 
## in the country. It takes about 6 minutes on my laptop.
 

t1 <- Sys.time()

library(fingertipsR)


if (!exists("LEdata")) LEdata <- fingertips_data(90366, AreaTypeID = 101)

## Select areas that are districts
areas <- unique(LEdata$AreaName[LEdata$AreaType == "District & UA (pre 4/19)"])

## Create the output folder if it does not already exist
if (!file.exists("../output")) dir.create("../output")

## Produce the reports
for (i in 1:length(areas)) {
  this_area <- areas[i]
  outfile <- paste0("../output/", this_area, ".html")
  rmarkdown::render("district-report.Rmd", 
                  params = list(area = this_area),
                  output_format = rmarkdown::html_document(toc = TRUE),
                  output_file = outfile)
}
 


t2 <- Sys.time()

duration <- t2 - t1 # This took 6 minutes on my machine.