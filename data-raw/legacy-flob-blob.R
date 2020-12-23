flob_old <- readRDS("data-raw/flob_old.rds")
load("data-raw/flob_noname.rda")
flob_noname <- flob_obj
rm(flob_obj)

file <- "inst/extdata/flobr.pdf"
n <- file.info(file)$size
slob_obj <- readBin(file, what = "integer", n = n, endian = "little") %>% list()
names(slob_obj) <- "name"
slob_obj %<>% serialize(NULL) %>% list() %>% blob::as_blob()


usethis::use_data(flob_old, flob_noname, slob_obj, internal = TRUE, overwrite = TRUE)
