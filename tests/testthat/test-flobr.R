context("flobr")

test_that("flob_old", {
  expect_true(is_flob(flob_old))
  expect_error(check_flob(flob_old),
               "serialized element of flob_old must inherit from class exint")
  expect_identical(check_flob(flob_old, old = TRUE), flob_old)
  expect_identical(flob_ext(flob_old), "pdf")
  expect_identical(flob_name(flob_old), "file")
  file <- tempfile(fileext = ".pdf")
  expect_identical(unflob(flob_old, file), file)
  expect_error(unflob(flob_old, tempfile(fileext = ".pdf1")), "path extension must match 'pdf'")
})

test_that("flob_noname", {
  expect_true(is_flob(flob_noname))
  expect_identical(check_flob(flob_noname), flob_noname)
  expect_identical(flob_ext(flob_noname), "pdf")
  expect_identical(flob_name(flob_noname), "file")
  file <- tempfile(fileext = ".pdf")
  expect_identical(unflob(flob_noname, file), file)
  expect_error(unflob(flob_noname, tempfile(fileext = ".pdf1")), "path extension must match 'pdf'")
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

  new_path <- unflob(flob, file.path(dirname(tempfile()), ""))
  expect_error(unflob(flob, tempfile(fileext = ".pdf1")), "path extension must match 'pdf'")
  file <- tempfile()
  expect_identical(unflob(flob, file), paste0(file, ".pdf"))

  flob2 <- flob(new_path)
  expect_identical(flob_name(flob2), flob_name(flob))
  expect_identical(flob_ext(flob2), flob_ext(flob))
  expect_identical(flob2[[1]][1:133838], flob[[1]][1:133838])

  # on windows there is a slight difference in the flobs to the end
  # flob: 09 00 00 00 | 09 66 6c 6f 62 72 | 2e 70 64 66 00 00 00 fe 00 00 00 00 00 00
  # flob2: 09 00 00 00 | 0e 52 74 6d 70 53 77 6f 52 4f 36 | 2e 70 64 66 00 00 00 fe 00 00 00 00 00 00
  # the files appears to be the same
  skip_on_os("windows")
  expect_equivalent(flob(new_path), flob)
})

test_that("package with csv", {

  path <- system.file("extdata", "count.csv", package = "flobr", mustWork = TRUE)

  expect_error(flob(1), "path must be class character")
  expect_error(flob(paste(path, "1")), "csv 1' does not exist")
  flob <- flob(path)
  expect_true(is_flob(flob))
  check_flob(flob)
  expect_identical(names(flob), path)
  expect_identical(flob_ext(flob), "csv")
  expect_identical(flob_name(flob), "count")

  new_path <- unflob(flob, file.path(dirname(tempfile()), ""))
  expect_error(unflob(flob, tempfile(fileext = ".pdf1")), "path extension must match 'csv'")
  file <- tempfile()
  expect_identical(unflob(flob, file), paste0(file, ".csv"))

  flob2 <- flob(new_path)
  expect_identical(flob_name(flob2), flob_name(flob))
  expect_identical(flob_ext(flob2), flob_ext(flob))

  expect_identical(flob2[[1]], flob[[1]])
  expect_equivalent(flob(new_path), flob)
})
