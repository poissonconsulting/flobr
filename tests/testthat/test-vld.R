context("vld")

test_that("vld_flob", {
  expect_true(vld_s3_class(flob_old, "flob"))
  expect_true(vld_scalar(flob_old))
  expect_true(vld_flob(flob_old, old = TRUE))
  expect_false(vld_flob(flob_old))

  x <- list(x = 1)
  class(x) <- "flob"
  expect_false(vld_flob(x))
})
