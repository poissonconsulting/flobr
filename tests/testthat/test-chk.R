context("chk")

test_that("chk_flob", {
  expect_null(chk_flob(flob_old, old = TRUE))
  expect_invisible(chk_flob(flob_old, old = TRUE))
  expect_error(chk_flob(1), "^`1` must inherit from S3 class 'flob'[.]$",
    class = "chk_error"
  )
  x <- as_blob(charToRaw("oeu"))
  expect_error(chk_flob(x), "^`x` must inherit from S3 class 'flob'[.]$",
    class = "chk_error"
  )
  expect_error(chk_flob(flob_old),
    "^Serialized element of `flob_old` must inherit from S3 class 'exint'[.]$",
    class = "chk_error"
  )

  x <- list(x = 1)
  class(x) <- "flob"
  expect_error(chk_flob(x), "^`x` must be a blob of a serialized object[.]$",
    class = "chk_error"
  )
})

test_that("chk_blob", {
  expect_null(chk_blob(blob_obj))
  expect_invisible(chk_blob(blob_obj))

  expect_null(chk_blob(flob_obj))
  expect_invisible(chk_blob(flob_obj))

  expect_null(chk_blob(flob_old))
  expect_invisible(chk_blob(flob_old))


  expect_error(chk_blob(1), "^`1` must inherit from S3 class 'blob'[.]$",
               class = "chk_error"
  )
  x <- as_blob(charToRaw("oeu"))
  expect_error(chk_blob(x), "^`x` must be a blob of a serialized object[.]$",
               class = "chk_error"
  )

  x <- list(x = 1)
  class(x) <- "blob"
  expect_error(chk_blob(x), "^`x` must be a blob of a serialized object[.]$",
               class = "chk_error"
  )
})

