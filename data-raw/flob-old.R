library(usethis)

flob_old <- readRDS("data-raw/flob_old.rds")
use_data(flob_old, internal = TRUE, overwrite = TRUE)
