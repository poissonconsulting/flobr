test_that("file_ext", {
  expect_identical(file_ext("pdf"), "")
  expect_identical(file_ext(".pdf"), "pdf")
  expect_identical(file_ext("file.pdf"), "pdf")
  expect_identical(file_ext("path/file.tar.gz"), "gz")
  expect_identical(file_ext(character()), character())
  expect_identical(
    file_ext(c("pdf", ".pdf", "file.pdf")),
    c("", "pdf", "pdf")
  )
})

test_that("tools file_path_sans_ext", {
  expect_identical(tools::file_path_sans_ext("pdf"), "pdf")
  expect_identical(tools::file_path_sans_ext(".pdf"), ".pdf")
  expect_identical(tools::file_path_sans_ext("file.pdf"), "file")
  expect_identical(
    tools::file_path_sans_ext(c("pdf", ".pdf", "file.pdf")),
    c("pdf", ".pdf", "file")
  )
})
