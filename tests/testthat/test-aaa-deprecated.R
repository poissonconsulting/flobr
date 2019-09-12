context("deprecated")

test_that("check_flob", {
  expect_null(check_flob(flob_old, old = TRUE))
  expect_invisible(check_flob(flob_old, old = TRUE))
})
