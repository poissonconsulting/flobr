
<!-- README.md is generated from README.Rmd. Please edit that file -->

# flobr <img src="man/figures/logo.png" align="right" />

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/poissonconsulting/flobr.svg?branch=master)](https://travis-ci.org/poissonconsulting/flobr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/flobr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/flobr)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/flobr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/flobr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/flobr)](https://cran.r-project.org/package=flobr)

## Introduction

`flobr` is an R package to convert files to and from flobs.

A flob is a file that was read into binary in integer-mode as little
endian, saved as the single element of a named list (where the name is
the extension of the original file) and then serialized before being
coerced into a blob.

Flobs are useful for writing and reading files to and from databases.

## Utilisation

``` r
library(flobr)

path <- system.file("extdata", "flobr.pdf", package = "flobr")

flob <- flob(path)
flob
#> /Library/Frameworks/R.framework/Versions/3.5/Resources/library/flobr/extdata/flobr.pdf 
#>                                                                        blob[133.84 kB]
flob_ext(flob)
#> [1] "pdf"

new_path <- tempfile(fileext = ".pdf")

unflob(flob, new_path)

all.equal(flob, flob(new_path), check.attributes = FALSE)
#> [1] TRUE
```

## Installation

To install the latest version from
[CRAN](https://CRAN.R-project.org/package=flobr)

    install.packages("flobr")

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/flobr)

    install.packages("devtools")
    devtools::install_github("poissonconsulting/err")
    devtools::install_github("poissonconsulting/checkr")
    devtools::install_github("poissonconsulting/flobr")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("flobr")

## Creditation

The [blob](https://github.com/tidyverse/blob) package.

The hex was designed by [The Forest](http://www.theforest.ca).

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/flobr/issues).

[Pull requests](https://github.com/poissonconsulting/flobr/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
