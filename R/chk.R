chk_exint <- function(x, x_name = NULL) {
  if (vld_exint(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  chk_s3_class(x, "exint", x_name = x_name)
  chk_scalar(x, x_name = x_name)
  chk_named(x, x_name = x_name)
  chk_s3_class(x[[1]], "integer", x_name = p0("Element of ", x_name))
  chk_no_missing(x[[1]], x_name = p0("Element of ", x_name))
}

#' Check flob
#'
#' Checks whether an object is a [flob()].
#'
#' @inheritParams chk::chk_flag
#' @param old A flag indicating whether old flobs are permitted.
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @seealso [flobr()] and [chk_flob()].
#' @export
#' @examples
#' chk_flob(flobr::flob_obj)
chk_flob <- function(x, old = FALSE, x_name = NULL) {
  if (vld_flob(x, old = old)) {
    return(invisible())
  }

  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  chk_s3_class(x, "flob", x_name = x_name)
  chk_scalar(x, x_name = x_name)

  exint <- unlist(x)
  exint <- try(unserialize(exint), silent = TRUE)
  if (inherits(exint, "try-error")) {
    abort_chk(x_name, " must be a blob of a serialized object.")
  }

  if (!vld_false(old)) class(exint) <- "exint"
  chk_exint(exint, x_name = paste("serialized element of", x_name))
}
