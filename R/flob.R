#' Flob File
#'
#' Converts a file into a flob.
#'
#' A flob is a serialized blob of a file,
#' which was read into binary in integer-mode as little endian,
#' that also includes the extension of the original file.
#'
#' @param path A string of the path to the file.
#' @return A named flob of the file.
#' @seealso \code{\link{blob}}, \code{\link{serialize}}, \code{\link{readBin}}
#' and \code{\link{unflob}}
#' @examples
#' path <- system.file("extdata", "flobr.pdf", package = "flobr")
#' flob <- flob(path)
#' flob
#' is_flob(flob)
#' flob_ext(flob)
#' unflob(flob, tempfile())
#' @export
flob <- function(path) {
  if(!is.character(path) || !identical(length(path), 1L) || is.na(path))
    stop("path must be a string", call. = FALSE)

  if (!file.exists(path)) stop("file '", path, "' does not exist", call. = FALSE)

  n <- file.info(path)$size
  flob <- readBin(path, what = "integer", n = n, endian = "little")
  flob <- list(flob)
  names(flob) <- tools::file_ext(path)

  flob <- serialize(flob, NULL)
  flob <- list(flob)
  flob <- as.blob(flob)
  class(flob) <- c("flob", "blob")

  names(flob) <- path

  flob
}

#' Flob Extension
#'
#' @param flob A \code{\link{flob}}
#' @return A string of the extension of the original file.
#' @export
flob_ext <- function(flob) {
  if (!is_flob(flob) || !identical(length(flob), 1L))
    stop("flob must be a flob scalar", call. = FALSE)

  flob <- unlist(flob)
  flob <- unserialize(flob)
  names(flob)
}

#' Is flob
#'
#' @param x An object to test
#'
#' @return A flag indicating whether x inherits from \code{\link{flob}}.
#' @export
is_flob <- function(x) {
  inherits(x, "flob")
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
unflob <- function(flob, path) {
  if (!is_flob(flob) || !identical(length(flob), 1L))
    stop("flob must be a flob scalar", call. = FALSE)

  if(!is.character(path) || !identical(length(path), 1L) || is.na(path))
    stop("path must be a string", call. = FALSE)

  flob <- unlist(flob)
  flob <- unserialize(flob)

  flob_ext <- names(flob)
  path_ext <- tools::file_ext(path)

  if(identical(path_ext, "")) {
    path <- paste0(path, flob_ext)
  } else if(!identical(path_ext, flob_ext))
    stop("path extension must match '", flob_ext, "'", call. = FALSE)

  flob <- unlist(flob)

  writeBin(flob, con = path, endian = "little")

  invisible(path)
}
