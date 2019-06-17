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
#' @param name A string of the name (without the extension) for the flob.
#' If NULL (the default) then the original file name is used.
#' @return A named flob of the file.
#' @seealso \code{\link{flobr}}
#' @examples
#' path <- system.file("extdata", "flobr.pdf", package = "flobr")
#' flob <- flob(path)
#' flob
#' @export
flob <- function(path, name = NULL) {
  check_string(path)
  checkor(check_string(name), check_null(name))

  if (!file.exists(path)) stop("file '", path, "' does not exist", call. = FALSE)

  n <- file.info(path)$size
  flob <- readBin(path, what = "integer", n = n, endian = "little")
  flob <- list(flob)
  class(flob) <- "exint"
  names(flob) <- basename(path)

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
#' If path ends with a file separator then the name and extension of the flob is added.
#' If the flob is an older flob that was not saved with a name then it is named 'file'.
#'
#' If path ends with a file name without an extension then the extension of the flob
#' is automatically added.
#' Alternatively if path also includes an extension
#' then it must match the flob's extension.
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
  name <- names(flob)

  path <- path(path, name)

  flob <- unlist(flob)

  writeBin(flob, con = path, endian = "little")

  invisible(path)
}
