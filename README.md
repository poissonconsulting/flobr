
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/poissonconsulting/flobr.svg?branch=master)](https://travis-ci.org/poissonconsulting/flobr)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/flobr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/flobr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Introduction

`flobr` is an R package to convert a file to and from a flob.

A flob is a serialized blob of a file, which was read into binary in
integer-mode as little endian, that also includes the extension of the
original file.

## Utilisation

``` r
library(flobr)

path <- system.file("extdata", "flobr.pdf", package = "flobr", mustWork = TRUE)

flob <- flob(path)
flob
#> /Library/Frameworks/R.framework/Versions/3.5/Resources/library/flobr/extdata/flobr.pdf 
#>                                                                        blob[133.79 kB]
flob_ext(flob)
#> [1] "pdf"

new_path <- tempfile(fileext = ".pdf")

unflob(flob, new_path)

all.equal(flob, flob(new_path), check.attributes = FALSE)
#> [1] TRUE
```

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/flobr)

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/flobr")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("flobr")

## Citation

``` 

To cite package 'flobr' in publications use:

  Joe Thorley (2018). flobr: Convert a file to and from binary
  data (BLOB). R package version 0.0.0.9000.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {flobr: Convert a file to and from binary data (BLOB)},
    author = {Joe Thorley},
    year = {2018},
    note = {R package version 0.0.0.9000},
  }
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/flobr/issues).

[Pull requests](https://github.com/poissonconsulting/flobr/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

## Creditation

The [blob](https://github.com/tidyverse/blob) package.
