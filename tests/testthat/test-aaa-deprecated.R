test_that("check_flob", {
  expect_null(chk_flob(flob_old, old = TRUE))
  expect_invisible(chk_flob(flob_old, old = TRUE))
})
