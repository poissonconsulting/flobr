context("data")

test_that("data", {
  expect_identical(check_flob(flob_obj), flob_obj)
})
