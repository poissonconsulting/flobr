context("path")

test_that("path", {
  expect_identical(path(file_separator(), "file2.png"),
                   "/file2.png")

  expect_identical(path(file_separator(), ".png"),
                   "/file.png")

  expect_error(path(".pdf", ".png"), "path extension must match 'png'")

  expect_identical(path("file2.pdf", ".pdf"), "file2.pdf")
  expect_identical(path("path/file2.pdf", ".pdf"), "path/file2.pdf")
  expect_identical(path("path/file2.pdf", "file3.pdf"), "path/file2.pdf")
  expect_identical(path("path/file2", "file3.jpg"), "path/file2.jpg")
})
