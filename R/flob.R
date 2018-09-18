#' Flob File
#'
#' Converts a file into a flob.
#'
#'  A flob is a file that was read into binary in integer-mode as little endian,
#'  saved as the single element of a named list
#'  (where the name is the extension of the original file)
#'  and then serialized before being coerced into a blob.
#'
#'  Flobs are useful for saving files in databases.
#'
#' @param path A string of the path to the file.
#' @return A named flob of the file.
#' @seealso \code{\link{flobr}}
#' @examples
#' path <- system.file("extdata", "flobr.pdf", package = "flobr")
#' flob <- flob(path)
#' flob
#' @export
flob <- function(path) {
  check_string(path)

  if (!file.exists(path)) stop("file '", path, "' does not exist", call. = FALSE)

  n <- file.info(path)$size
  flob <- readBin(path, what = "integer", n = n, endian = "little")
  flob <- list(flob)
  class(flob) <- "exint"
  names(flob) <- tools::file_ext(path)

  flob <- serialize(flob, NULL)
  flob <- list(flob)
  flob <- as.blob(flob)
  class(flob) <- c("flob", "blob")

  names(flob) <- path

  flob
}

#' Unflob to File
#'
#' Converts a \code{\link{flob}} back to its original file format.
#'
#' If path does not include an extension then it is added automatically.
#' If path does include an extension and then it must match the flob's extension.
#'
#' @param flob The \code{\link{flob}} to save to file.
#' @param path A string of the path to the new file.
#' @return An invisible string of the path to the saved file.
#' @export
#' @examples
#' unflob(flob_obj, tempfile())
unflob <- function(flob, path) {
  check_flob(flob, old = TRUE)
  check_string(path)

  flob <- unlist(flob)
  flob <- unserialize(flob)
  flob_ext <- names(flob)
  path_ext <- tools::file_ext(path)

  if(identical(path_ext, "")) {
    path <- paste0(path, ".", flob_ext)
  } else if(!identical(path_ext, flob_ext))
    stop("path extension must match '", flob_ext, "'", call. = FALSE)

  flob <- unlist(flob)

  writeBin(flob, con = path, endian = "little")

  invisible(path)
}
