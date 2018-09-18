#' Flob Extension
#'
#' @param flob A \code{\link{flob}}
#' @return A string of the extension of the original file.
#' @seealso \code{\link{flobr}}
#' @export
#' @examples
#' flob_ext(flob_obj)
flob_ext <- function(flob) {
  check_flob(flob, old = TRUE)
  flob <- unlist(flob)
  flob <- unserialize(flob)
  names(flob)
}

#' Is flob
#'
#' @param x An object to test
#' @return A flag indicating whether x inherits from \code{\link{flob}}.
#' @seealso \code{\link{flobr}}
#' @export
#' @examples
#' is_flob(flob_obj)
is_flob <- function(x) {
  inherits(x, "flob")
}
