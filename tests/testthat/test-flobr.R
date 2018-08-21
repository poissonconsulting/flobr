context("flobr")

test_that("package", {

  path <- system.file("extdata", "flobr.pdf", package = "flobr", mustWork = TRUE)

  expect_error(blob_file(1), "path must be a string")
  expect_error(blob_file(paste(path, "1")), "pdf 1' does not exist")
  blob <- blob_file(path)
  expect_is(blob, "blob")
  expect_identical(names(blob), path)
})
