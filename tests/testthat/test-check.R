context("check")

test_that("check_flob", {
  expect_error(check_flob(1), "1 must inherit from class flob")
  x <- as.blob(charToRaw("oeu"))
  expect_error(check_flob(x), "x must inherit from class flob")
})
