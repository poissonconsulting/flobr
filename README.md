
<!-- README.md is generated from README.Rmd. Please edit that file -->

# flobr <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/flobr/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/flobr/actions)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/flobr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/flobr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/flobr)](https://cran.r-project.org/package=flobr)
![CRAN Downloads](https://cranlogs.r-pkg.org/badges/flobr)
<!-- badges: end -->

## Introduction

`flobr` is an R package to convert files to and from flobs.

A flob is a file that was read into binary in integer-mode as little
endian, saved as the single element of a named list (where the name is
the name of the original file including its extension) and then
serialized before being coerced into a blob.

Flobs are useful for writing and reading files to and from databases.

## Demonstration

``` r
library(flobr)

path <- system.file("extdata", "flobr.pdf", package = "flobr")

flob <- flob(path)
str(flob)
#> List of 1
#>  $ /Library/Frameworks/R.framework/Versions/4.1/Resources/library/flobr/extdata/flobr.pdf: raw [1:133851] 58 0a 00 00 ...
#>  - attr(*, "class")= chr [1:2] "flob" "blob"
flob_name(flob)
#> [1] "flobr"
flob_ext(flob)
#> [1] "pdf"

unflob(flob, tempdir())

all.equal(flob, flob(file.path(tempdir(), "flobr.pdf")), check.attributes = FALSE)
#> [1] TRUE
```

## Installation

To install the latest release from [CRAN](https://cran.r-project.org)

``` r
install.packages("flobr")
```

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/flobr)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/flobr")
```

## Creditation

The [blob](https://github.com/tidyverse/blob) package.

The hex was designed by [The Forest](https://www.theforest.ca/).

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/flobr/issues).

[Pull requests](https://github.com/poissonconsulting/flobr/pulls) are
always welcome.

## Code of Conduct

Please note that the flobr project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
