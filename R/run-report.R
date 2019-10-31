## Script to run an Rmd file multiple times
##
## Rather than having to specify the names of the areas we want to run 
## this for, we can get the names from the data file. We can then use 
## these area names in a for loop or create a function and use lapply()

library(fingertipsR)


if (!exists("LEdata")) LEdata <- fingertips_data(90366, AreaTypeID = 101)

## Have a look at the data set
head(LEdata)

## See what area types we have 
table(LEdata$AreaType)

## Select areas that are districts
areas <- unique(LEdata$AreaName[LEdata$AreaType == "District & UA (pre 4/19)"])

## Have a look at the first few district names
head(areas)

## Limit to the first five areas (to save time for now)
areas <- areas[1:5]

## Create the output folder if it does not already exist
if (!file.exists("../output")) dir.create("../output")

## Produce the reports using a for loop
for (i in 1:length(areas)) {
  this_area <- areas[i]
  outfile <- paste0("../output/", this_area, ".html")
  rmarkdown::render("district-report.Rmd", 
                  params = list(area = this_area),
                  output_file = outfile)
}
 

## Produce the reports using lapply()

produce_report <- function(this_area) {
  outfile <- paste0("../output/", this_area, ".html")
  rmarkdown::render("district-report.Rmd", 
                    params = list(area = this_area),
                    output_file = outfile)
}

lapply(areas, produce_report)

