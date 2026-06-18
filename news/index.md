# Changelog

## flobr 0.2.3.9001

- Add fledge-bump workflow
- Add fledge-tag-on-merge workflow
- Evan Amies-Galonski now maintainer.

## flobr 0.2.3.9000

- Same as previous version.

## flobr 0.2.3

CRAN release: 2022-08-25

- Fix HTML attribute.

## flobr 0.2.2

CRAN release: 2021-10-27

- Clarify back-compatibility with slobs (serialized blobs) instead of
  blobs.
- Added `chk_blob()` and `vld_blob()`.
- [`unflob()`](https://poissonconsulting.github.io/flobr/reference/unflob.md)
  now accommodates blobs if name and ext provided and has a check
  argument to switch off checking.

## flobr 0.2.1

CRAN release: 2020-05-15

- Replace dependency on checkr by dependency on chk.
- Errors now in tidyverse style.

## flobr 0.2.0

CRAN release: 2019-07-25

By default flobs now include the original file name with the extension.

To read with a different file name use the name argument to
[`flob()`](https://poissonconsulting.github.io/flobr/reference/flob.md).
The saved file name can be accessed using
[`flob_name()`](https://poissonconsulting.github.io/flobr/reference/flob_name.md).

To write with a different file name use the name argument to
[`unflob()`](https://poissonconsulting.github.io/flobr/reference/unflob.md).

If the flob was read using a previous version of flobr which means it
lacks a file name then by default it is written with the file name
“file”.

## flobr 0.1.0

CRAN release: 2018-11-14

- Added `flob_obj`

## flobr 0.0.1

- Added a `NEWS.md` file to track changes to the package.
