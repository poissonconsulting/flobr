#' Flob Extension
#'
#' @param flob A [flob()]
#' @return A string of the extension of the original file.
#' @seealso [flobr()] and [flob_name()].
#' @export
#' @examples
#' flob_ext(flob_obj)
flob_ext <- function(flob) {
  chk_flob(flob, old = TRUE)
  flob <- unlist(flob)
  flob <- unserialize(flob)
  names <- names(flob)
  ext(names)
}

#' Flob Name
#'
#' Gets a character vector of the name of the file (without the extension).
#' If the flob does not have a file name it returns "file".
#'
#' @param flob A [flob()]
#' @return A character vector of the name of the file (without the extension).
#' @seealso [flobr()] and [flob_ext()].
#' @export
#' @examples
#' flob_name(flob_obj)
flob_name <- function(flob) {
  chk_flob(flob, old = TRUE)
  flob <- unlist(flob)
  flob <- unserialize(flob)
  names <- names(flob)
  file(names)
}

#' Is flob
#'
#' @param x An object to test
#' @return A flag indicating whether x inherits from [flob()].
#' @seealso [flobr()]
#' @export
#' @examples
#' is_flob(flob_obj)
is_flob <- function(x) inherits(x, "flob")
