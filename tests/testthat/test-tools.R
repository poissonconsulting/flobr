context("tools")

test_that("tools file_ext", {
  expect_identical(tools::file_ext("pdf"), "")
  expect_identical(tools::file_ext(".pdf"), "pdf")
  expect_identical(tools::file_ext("file.pdf"), "pdf")
  expect_identical(
    tools::file_ext(c("pdf", ".pdf", "file.pdf")),
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
