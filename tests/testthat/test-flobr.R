context("flobr")

test_that("flob_old", {
  expect_true(is_flob(flob_old))
  expect_error(check_flob(flob_old),
               "serialized element of flob_old must inherit from class exint")
  expect_identical(check_flob(flob_old, old = TRUE), flob_old)
  expect_identical(flob_ext(flob_old), "pdf")
  file <- tempfile(fileext = ".pdf")
  expect_identical(unflob(flob_old, file), file)
  expect_error(unflob(flob_old, tempfile(fileext = ".pdf1")), "path extension must match 'pdf'")
})

test_that("package", {

  path <- system.file("extdata", "flobr.pdf", package = "flobr", mustWork = TRUE)

  expect_error(flob(1), "path must be class character")
  expect_error(flob(paste(path, "1")), "pdf 1' does not exist")
  flob <- flob(path)
  expect_true(is_flob(flob))
  check_flob(flob)
  expect_identical(names(flob), path)
  expect_identical(flob_ext(flob), "pdf")

  new_path <- unflob(flob, tempfile(fileext = ".pdf"))
  expect_equivalent(flob(new_path), flob)
  expect_error(unflob(flob, tempfile(fileext = ".pdf1")), "path extension must match 'pdf'")
  file <- tempfile()
  expect_identical(unflob(flob, file), paste0(file, ".pdf"))
})
