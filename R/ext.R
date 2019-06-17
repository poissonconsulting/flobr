ext <- function(x) {
  ext <- tools::file_ext(x)
  just_ext <- ext == ""
  ext[just_ext] <- x[just_ext]
  ext
}

file <- function(x) {
  file <- tools::file_path_sans_ext(x)
  just_ext <- file == x
  file[just_ext] <- "file"
  file
}

file_separator <- function() {
  file.path("", "")
}

ends_with_file_separator <- function(x) {
  grepl(p0(file_separator(), "$"), x)
}
