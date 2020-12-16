flob_old <- readRDS("data-raw/flob_old.rds")
load("data-raw/flob_noname.rda")
flob_noname <- flob_obj
rm(flob_obj)

file <- "inst/extdata/flobr.pdf"
n <- file.info(file)$size
blob_obj <- readBin(file, what = "integer", n = n, endian = "little") %>% list()
names(blob_obj) <- "name"
blob_obj %<>% serialize(NULL) %>% list() %>% blob::as_blob()


usethis::use_data(flob_old, flob_noname, blob_obj, internal = TRUE, overwrite = TRUE)
