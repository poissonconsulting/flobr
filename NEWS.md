<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# flobr 0.2.3

- Fix HTML attribute.


# flobr 0.2.2

- Clarify back-compatibility with slobs (serialized blobs) instead of blobs.
- Added `chk_blob()` and `vld_blob()`.
- `unflob()` now accommodates blobs if name and ext provided and has a check argument to switch off checking.

# flobr 0.2.1

- Replace dependency on checkr by dependency on chk.
- Errors now in tidyverse style.

# flobr 0.2.0

By default flobs now include the original file name with the extension. 

To read with a different file name use the name argument to `flob()`.
The saved file name can be accessed using `flob_name()`.

To write with a different file name use the name argument to `unflob()`.

If the flob was read using a previous version of flobr which means it lacks a file name then by default it is written with the file name "file".

# flobr 0.1.0

* Added `flob_obj`

# flobr 0.0.1

* Added a `NEWS.md` file to track changes to the package.
