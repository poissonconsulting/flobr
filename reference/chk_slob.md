# Check slob

Checks whether an object is a slob (serialized blob).

## Usage

``` r
chk_slob(x, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

## Value

`NULL`, invisibly. Called for the side effect of throwing an error if
the condition is not met.

## See also

[`flobr()`](https://poissonconsulting.github.io/flobr/reference/flobr-package.md)
and `chk_slob()`.

## Examples

``` r
chk_slob(flobr:::slob_obj)
```
