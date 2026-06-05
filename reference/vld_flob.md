# Validate flob Object

Validates a
[`flob()`](https://poissonconsulting.github.io/flobr/reference/flob.md)
object.

## Usage

``` r
vld_flob(x, old = FALSE)
```

## Arguments

- x:

  The object to check.

- old:

  A flag indicating whether old flobs are permitted.

## Value

A flag indicating whether the object passed the test.

## See also

[`chk_flob()`](https://poissonconsulting.github.io/flobr/reference/chk_flob.md)

## Examples

``` r
vld_flob(flobr::flob_obj)
#> [1] TRUE
vld_flob(1)
#> [1] FALSE
```
