context("err")

test_that("err", {
  expect_error(err("a problem"), "a problem")
})

test_that("p0", {
  expect_identical(p0("a", "thing"), "athing")
})


