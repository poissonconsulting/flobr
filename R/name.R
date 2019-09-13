name <- function(name, path) {
  path <- basename(path)

  if (identical(name, "")) {
    return(path)
  }

  if (grepl("[.]", name)) {
    err("Name '", name, "' must not include an extension.",
      .subclass = "flobr_error"
    )
  }

  p0(name, ".", tools::file_ext(path))
}
