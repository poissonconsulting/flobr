vld_exint <- function(x) {
  vld_s3_class(x, "exint") && vld_scalar(x) && vld_named(x) &&
    vld_s3_class(x[[1]], "integer") && vld_not_any_na(x[[1]])
}

#' Validate flob Object
#'
#' Validates a [flob()] object.
#'
#' @param x The object to check.
#' @param old A flag indicating whether old flobs are permitted.
#' @return A flag indicating whether the object passed the test.
#' @seealso [chk_flob()]
#' @export
#' @examples
#' vld_flob(flobr::flob_obj)
#' vld_flob(1)
vld_flob <- function(x, old = FALSE) {
  if (!(vld_s3_class(x, "flob") && vld_scalar(x))) {
    return(FALSE)
  }

  exint <- unlist(x)
  exint <- try(unserialize(exint), silent = TRUE)
  if (inherits(exint, "try-error")) {
    return(FALSE)
  }

  if (old) class(exint) <- "exint"
  vld_exint(exint)
}
