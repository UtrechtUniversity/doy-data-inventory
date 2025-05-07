install.packages("dataverse")
library("dataverse")

proactive_metadata <- get_dataset("doi:10.34894/FXUGHW", server = "dataverse.nl")

library(readxl)

proactive_metadata <- read_excel("playground/playground.xlsx", sheet = 1)

library(simplermarkdown)
md <- md_table(proactive_metadata)
