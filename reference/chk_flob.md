# Check flob

Checks whether an object is a
[`flob()`](https://poissonconsulting.github.io/flobr/reference/flob.md).

## Usage

``` r
chk_flob(x, old = FALSE, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- old:

  A flag indicating whether old flobs are permitted.

- x_name:

  A string of the name of object x or NULL.

## Value

`NULL`, invisibly. Called for the side effect of throwing an error if
the condition is not met.

## See also

[`flobr()`](https://poissonconsulting.github.io/flobr/reference/flobr-package.md)
and `chk_flob()`.

## Examples

``` r
chk_flob(flobr::flob_obj)
```
