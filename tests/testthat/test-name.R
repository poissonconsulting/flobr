test_that("name", {
  expect_identical(name("", "path/file2.png"), "file2.png")
  expect_identical(name("", "file2.png"), "file2.png")
  expect_identical(name("", "/file2.png"), "file2.png")

  expect_error(
    name("file3.more", "/file2.png"),
    "^Name 'file3.more' must not include an extension[.]$",
    class = "flobr_error"
  )

  expect_identical(name("file3", "path/file2.png"), "file3.png")
  expect_identical(name("file3", "file2.png"), "file3.png")
  expect_identical(name("file3", "/file2.png"), "file3.png")
})
