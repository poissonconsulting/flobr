name <- function(name, path) {
  path <- basename(path)

  if(identical(name, "")) return(path)

  if(grepl("[.]", name)) err("name '", name, "' must not include an extension")

  p0(name, ".", tools::file_ext(path))
}
