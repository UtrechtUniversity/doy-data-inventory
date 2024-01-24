library(here)
library(qualtRics)
library(readr)

factsheet_data <- fetch_survey(surveyID = "SV_23nEYHwKB4i0p8i",
                               force_request = TRUE,
                               verbose = TRUE)

write_csv2(factsheet_data, file = here(paste0("data/", "factsheet_data_", Sys.Date(), ".csv")))
