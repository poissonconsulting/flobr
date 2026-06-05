# Unflob to File

Converts a
[`flob()`](https://poissonconsulting.github.io/flobr/reference/flob.md)
back to its original file format.

## Usage

``` r
unflob(flob, dir = ".", name = "", ext = "", slob = FALSE, check = TRUE)
```

## Arguments

- flob:

  The
  [`flob()`](https://poissonconsulting.github.io/flobr/reference/flob.md)
  to save to file.

- dir:

  A string of the path to the directory to save the file in.

- name:

  A string of the name (without the extension) for the file. If "" (the
  default) then the original file name is used.

- ext:

  A string of the extension for the file. If "" (the default) then the
  original extension is used.

- slob:

  A logical scalar specifying whether to process slobs (serialized
  blobs) instead of flobs. If NA, either will be accepted, but slobs
  require that ext and name be provided.

- check:

  A flag indicating whether to run comprehensive checks on user input.

## Value

An invisible string of the path to the saved file.

## Details

If path ends with a file separator then the name and extension of the
flob is added. If the flob is an older flob that was not saved with a
name then it is named 'file'.

If path ends with a file name without an extension then the extension of
the flob is automatically added. Alternatively if path also includes an
extension then it must match the flob's extension.

## Examples

``` r
unflob(flob_obj, tempdir())
```
