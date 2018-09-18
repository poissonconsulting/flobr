check_exint <- function(x, x_name) {
  check_inherits(x, "exint", x_name = x_name)
  check_length(x, 1L, x_name = x_name)
  check_named(x, x_name = x_name)
  check_vector(x[[1]], 1L, x_name = paste("element of ", x_name))
  invisible(x)
}

#' Check flob
#'
#' Checks whether an object is a \code{\link{flob}}.
#'
#' @param x The object to check.
#' @param old A flag indicating whether old flobs are permitted.
#' @param x_name A string of the object name.
#' @return An invisible copy of x.
#' @seealso \code{\link{flobr}}
#' @export
#' @examples
#' check_flob(flob_obj)
check_flob <- function(x, old = FALSE, x_name = substitute(x)) {
  check_flag(old)

  if (!is.character(x_name)) x_name <- deparse(x_name)
  check_string(x_name)

  check_inherits(x, "flob", x_name = x_name)
  check_inherits(x, "blob", x_name = x_name)
  check_classes(x, c("flob", "blob"), x_name = x_name)
  check_length(x, 1L, x_name = x_name)

  exint <- unlist(x)
  exint <- try(unserialize(exint), silent = TRUE)
  if(inherits(exint, "try-error"))
    err("'", x_name, "' must be a blob of a serialized object")

  if(old) class(exint) <- "exint"
  check_exint(exint, x_name = paste("serialized element of", x_name))
  invisible(x)
}
