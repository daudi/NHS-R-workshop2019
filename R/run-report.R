## Script to run an Rmd file multiple times
##
## There are various options that you can set to control the 
## structure and appearance of your document. You can specify 
## these options in the YAML section of the Rmd file, and you 
## can also specify them in the output_format option when calling
## render(). Use html_document() or word_document() to do this.
## See their respective help files.
##
## In this example we include a table of contents.


library(fingertipsR)


if (!exists("LEdata")) LEdata <- fingertips_data(90366, AreaTypeID = 101)

## Select areas that are districts
areas <- unique(LEdata$AreaName[LEdata$AreaType == "District & UA (pre 4/19)"])

## Limit to the first five areas (to save time while testing)
areas <- areas[1:5]

## Create the output folder if it does not already exist
if (!file.exists("../output")) dir.create("../output")

## Produce the reports
for (i in 1:length(areas)) {
  this_area <- areas[i]
  outfile <- paste0("../output/", this_area, ".html")
  rmarkdown::render("district-report-5.Rmd", 
                  params = list(area = this_area),
                  output_format = rmarkdown::html_document(toc = TRUE),
                  output_file = outfile)
}
 

## Produce the reports
for (i in 1:length(areas)) {
  this_area <- areas[i]
  outfile <- paste0("../output/", this_area, ".docx")
  rmarkdown::render("district-report.Rmd", 
                  params = list(area = this_area),
                  output_format = rmarkdown::word_document(toc = TRUE),
                  output_file = outfile)
}
 

