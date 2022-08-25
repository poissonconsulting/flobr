#' Flob File
#'
#' Converts a file into a flob.
#'  Flobs are useful for saving files in databases.
#'
#'  A flob is a file that was read into binary in integer-mode as little endian,
#'  saved as the single element of a named list
#'  (where the name is the extension of the original file)
#'  and then serialized before being coerced into a blob.
#'
#' @param path A string of the path to the file.
#' @param name A string of the name (without the extension) for the flob.
#' If "" (the default) then the original file name is used.
#' @return A named flob of the file.
#' @seealso [flobr()]
#' @examples
#' path <- system.file("extdata", "flobr.pdf", package = "flobr")
#' flob <- flob(path)
#' flob
#' @export
flob <- function(path, name = "") {
  chk_string(path)
  chk_file(path)
  chk_string(name)

  n <- file.info(path)$size
  flob <- readBin(path, what = "integer", n = n, endian = "little")
  flob <- list(flob)
  class(flob) <- "exint"

  names(flob) <- name(name, path)

  flob <- serialize(flob, NULL)
  flob <- list(flob)
  flob <- as_blob(flob)
  attr(flob, "ptype") <- NULL
  class(flob) <- c("flob", "blob")

  names(flob) <- path

  flob
}

#' Unflob to File
#'
#' Converts a [flob()] back to its original file format.
#'
#' If path ends with a file separator then the name and extension
#' of the flob is added.
#' If the flob is an older flob that was not saved with a name then
#' it is named 'file'.
#'
#' If path ends with a file name without an extension then the
#' extension of the flob
#' is automatically added.
#' Alternatively if path also includes an extension
#' then it must match the flob's extension.
#'
#' @param flob The [flob()] to save to file.
#' @param dir A string of the path to the directory to save the file in.
#' @param name A string of the name (without the extension) for the file.
#' If "" (the default) then the original file name is used.
#' @param ext A string of the extension for the file.
#' If "" (the default) then the original extension is used.
#' @param slob A logical scalar specifying whether to process slobs (serialized blobs) instead of flobs.
#' If NA, either will be accepted, but slobs require that ext and name be provided.
#' @param check A flag indicating whether to run comprehensive checks on user input.
#' @return An invisible string of the path to the saved file.
#' @export
#' @examples
#' unflob(flob_obj, tempdir())
unflob <- function(flob, dir = ".", name = "", ext = "", slob = FALSE, check = TRUE) {

  chk_string(dir)
  chk_string(name)
  chk_string(ext)
  chk_lgl(slob)
  chk_flag(check)

  if(check){
    if (vld_false(slob)){
      chk_flob(flob, old = TRUE)
    } else if (vld_true(slob)){
      chk_slob(flob)
      if (identical(name, "") || identical(ext, "")) err("`name` and `ext` must be provided for slob objects.")
    } else if (!vld_flob(flob)) {
      if(!vld_slob(flob) && !vld_flob(flob, old = TRUE)) {
        chkor_vld(vld_slob(flob), vld_flob(flob, old = TRUE))
      }
      if (identical(name, "") || identical(ext, "")) err("`name` and `ext` must be provided for slob objects.")
    }
  }

  flob <- unlist(flob)
  flob <- unserialize(flob)
  names <- names(flob)
  flob <- unlist(flob)

  if (identical(name, "")) name <- file(names)
  if (identical(ext, "")) ext <- ext(names)

  path <- file.path(dir, paste(name, ext, sep = "."))
  writeBin(flob, con = path, endian = "little")
  invisible(path)
}
