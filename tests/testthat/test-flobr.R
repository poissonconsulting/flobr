context("flobr")

test_that("flob_old", {
  expect_true(is_flob(flob_old))
  expect_error(check_flob(flob_old),
               "serialized element of flob_old must inherit from class exint")
  expect_identical(check_flob(flob_old, old = TRUE), flob_old)
  expect_identical(flob_ext(flob_old), "pdf")
  expect_identical(flob_name(flob_old), "file")
  expect_identical(unflob(flob_old, tempdir()),
                   file.path(tempdir(), paste("file", "pdf", sep = ".")))
})

test_that("flob_noname", {
  expect_true(is_flob(flob_noname))
  expect_identical(check_flob(flob_noname), flob_noname)
  expect_identical(flob_ext(flob_noname), "pdf")
  expect_identical(flob_name(flob_noname), "file")
  expect_identical(unflob(flob_old, tempdir()),
                   file.path(tempdir(), paste("file", "pdf", sep = ".")))
})

test_that("package with pdf", {

  path <- system.file("extdata", "flobr.pdf", package = "flobr", mustWork = TRUE)

  expect_error(flob(1), "path must be class character")
  expect_error(flob(paste(path, "1")), "pdf 1' does not exist")
  flob <- flob(path)
  expect_true(is_flob(flob))
  check_flob(flob)
  expect_identical(names(flob), path)
  expect_identical(flob_ext(flob), "pdf")
  expect_identical(flob_name(flob), "flobr")

  expect_identical(unflob(flob, tempdir()),
                   file.path(tempdir(), paste("flobr", "pdf", sep = ".")))

  expect_identical(unflob(flob, tempdir(), "file2"),
                   file.path(tempdir(), paste("file2", "pdf", sep = ".")))

  expect_identical(unflob(flob, tempdir(), "file2", "csv"),
                   file.path(tempdir(), paste("file2", "csv", sep = ".")))

  flob2 <- flob(file.path(tempdir(), paste("flobr", "pdf", sep = ".")))
  expect_identical(flob_ext(flob2), flob_ext(flob))
  expect_identical(flob_name(flob2), flob_name(flob))
  expect_equivalent(flob2, flob)
})
