## Script to run an Rmd file multiple times
##
## So far we have been creating HTML output. But we can also create
## word documents by specifying the output_format. Make sure you also
## change the extension in the output file name.

library(fingertipsR)

if (!exists("LEdata")) LEdata <- fingertips_data(90366, AreaTypeID = 101)

## Select areas that are districts
areas <- unique(LEdata$AreaName[LEdata$AreaType == "District & UA (pre 4/19)"])

## Limit to the first five areas (to save time for now)
areas <- areas[1:5]

## Create the output folder if it does not already exist
if (!file.exists("../output")) dir.create("../output")

# Produce the reports using lapply()
produce_report <- function(this_area) {
  outfile <- paste0("../output/", this_area, ".docx")
  rmarkdown::render("district-report.Rmd",
                    params = list(area = this_area),
                    output_format = "word_document", # Word format
                    output_file = outfile)
}

lapply(areas, produce_report)

