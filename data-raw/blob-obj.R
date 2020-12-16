file <- "inst/extdata/flobr.pdf"
n <- file.info(file)$size
blob_obj <- readBin(file, what = "integer", n = n, endian = "little") %>% list()
names(blob_obj) <- "name"
blob_obj %<>% serialize(NULL) %>% list() %>% blob::as_blob()

usethis::use_data(blob_obj, overwrite = TRUE, internal = TRUE)
