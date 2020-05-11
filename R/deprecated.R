#' Deprecated Functions
#'
#' Deprecated `pkgtemplate` functions.
#'
#' @keywords internal
#' @name pkgtemplate_deprecated
NULL

#' @describeIn pkgtemplate_deprecated Check Function Template
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
#'
#' @examples
#'
#' check_flob(flobr::flob_obj)
check_flob <- function(x, old = FALSE, x_name = NULL) {
  deprecate_soft("0.2.0.9002",
    what = "check_flob()",
    with = "chk_flob()"
  )
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_flob(x, old = old, x_name = x_name)
}
