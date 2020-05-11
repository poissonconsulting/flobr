path <- function(path, name) {
  flob_ext <- ext(name)
  flob_name <- file(name)

  if (ends_with_file_separator(path)) {
    return(p0(path, flob_name, ".", flob_ext))
  }

  path_ext <- tools::file_ext(path)

  if (identical(path_ext, "")) {
    return(p0(path, ".", flob_ext))
  }

  if (!identical(path_ext, flob_ext)) {
    err("Path extension must match '", flob_ext, "'.",
      .subclass = "flobr_error"
    )
  }

  path
}
