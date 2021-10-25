test_that("ext", {
  expect_identical(ext("pdf"), "pdf")
  expect_identical(ext(".pdf"), "pdf")
  expect_identical(ext("file.pdf"), "pdf")
  expect_identical(ext(c("pdf", ".pdf", "file.pdf")), c("pdf", "pdf", "pdf"))
})

test_that("tools file", {
  expect_identical(file("pdf"), "file")
  expect_identical(file(".pdf"), "file")
  expect_identical(file("file2.pdf"), "file2")
  expect_identical(
    file(c("pdf", ".pdf", "file2.pdf")),
    c("file", "file", "file2")
  )
})

test_that("file_separator", {
  expect_identical(file_separator(), file.path("", ""))
})

test_that("ends_with_file_separator", {
  expect_true(ends_with_file_separator(file_separator()))
  expect_identical(
    ends_with_file_separator(c(file_separator(), file_separator())),
    c(TRUE, TRUE)
  )
  expect_false(ends_with_file_separator(file.path("path", "file")))
})
