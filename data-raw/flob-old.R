flob_old <- readRDS("data-raw/flob_old.rds")
load("data-raw/flob_noname.rda")
flob_noname <- flob_obj
rm(flob_obj)

usethis::use_data(flob_old, flob_noname, internal = TRUE, overwrite = TRUE)
