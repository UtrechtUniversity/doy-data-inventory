library(readr)
library(dplyr)
library(reactable)
library(htmltools)

data <- read_csv2("data/factsheet_data_2024-01-24.csv")

data <- rename(data, 
               "project_name" = `1 `,
               "project_abbreviation" = `2 `,
               "description" = `5 `,
               "institution" = `3 _1`,
               "author" = `4 _4`,
               "design" = `9 `)

data <- filter_at(data, vars("project_name", "project_abbreviation", "description", "institution", "author", "design"), ~!is.na(.))

data <- select(data, "project_name", "project_abbreviation", "description", "institution", "author", "design")

row_details <- function(index) {
  project <- data[index, ]
  
  project_field <- function(name, ...) {
    if (any(is.na(...))) NULL
    else tagList(div(class = "detail-label", name), ...)
  }
  
  detail <- div(
    class = "project-detail",
    div(class = "detail-header", project$project_name),
    div(class = "detail-abbreviation", project$project_abbreviation),
    project_field("Description", project$description),
    project_field("Institution", project$institution),
    project_field("Author", project$author),
    project_field("Research Design", project$design)
  )
}
  
tbl <- reactable(
  data[, c("project_name", "project_abbreviation")],
  onClick = "expand",
  details = row_details,
  theme = reactableTheme(
    borderColor = "#dfe2e5",
    stripedColor = "#f6f8fa",
    highlightColor = "#f0f5f9",
    cellPadding = "8px 12px",
    style = list(
      fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
    ),
    searchInputStyle = list(width = "100%")
  )
)