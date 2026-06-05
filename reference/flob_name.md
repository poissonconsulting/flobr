# Flob Name

Gets a character vector of the name of the file (without the extension).
If the flob does not have a file name it returns "file".

## Usage

``` r
flob_name(flob)
```

## Arguments

- flob:

  A
  [`flob()`](https://poissonconsulting.github.io/flobr/reference/flob.md)

## Value

A character vector of the name of the file (without the extension).

## See also

[`flobr()`](https://poissonconsulting.github.io/flobr/reference/flobr-package.md)
and
[`flob_ext()`](https://poissonconsulting.github.io/flobr/reference/flob_ext.md).

## Examples

``` r
flob_name(flob_obj)
#> [1] "flobr"
```
