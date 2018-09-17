context("flobr")

test_that("flob_old", {
  expect_is(flob_old, "flob")
})

test_that("package", {

  path <- system.file("extdata", "flobr.pdf", package = "flobr", mustWork = TRUE)

  expect_error(flob(1), "path must be a string")
  expect_error(flob(paste(path, "1")), "pdf 1' does not exist")
  flob <- flob(path)
  expect_is(flob, "blob")
  expect_true(is_flob(flob))
  expect_identical(names(flob), path)
  expect_identical(flob_ext(flob), "pdf")

  new_path <- unflob(flob, tempfile(fileext = ".pdf"))
  expect_equivalent(flob(new_path), flob)
  expect_error(unflob(flob, tempfile(fileext = ".pdf1")), "path extension must match 'pdf'")
})
