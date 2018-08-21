#' Blob File
#'
#' Converts a file in the directory into a named blob.
#'
#' @param path A string of the path to the file.
#' @export
blob_file <- function(path) {
  if(!is.character(path) || !identical(length(path), 1L) || is.na(path))
    stop("path must be a string", call. = FALSE)

  if (!file.exists(path)) stop("file '", path, "' does not exist", call. = FALSE)

  n <- file.info(path)$size
  blob <- readBin(path, what = "integer", n = n, endian = "little")
  blob <- list(blob)
  names(blob) <- tools::file_ext(path)

  blob <- serialize(blob, NULL)
  blob <- list(blob)
  blob <- as.blob(blob)

  names(blob) <- path

  blob
}
