ext <- function(x) {
  ext <- file_ext(x)
  just_ext <- ext == ""
  ext[just_ext] <- x[just_ext]
  ext
}

# tools::file_ext() ignores a leading dot in R >= 4.6
file_ext <- function(x) {
  has_ext <- grepl("[.][[:alnum:]]+$", x)
  ext <- rep("", length(x))
  ext[has_ext] <- sub("^.*[.]", "", x[has_ext])
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
