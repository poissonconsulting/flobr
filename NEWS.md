# flobr 0.2.0

By default flobs now include the original file name with the extension. 

To save with a different file name use the name argument to `flob()`.
The saved file name can be accessed using `flob_name()`.

In order to unflob to a file using the original filename the path 
should end with a file separator (this can be achieved using `name = file.path(path, "")`).
By default `name = file.path(".", "")` which means the file is saved in the working directory.

If the flob was saved using a previous version of flobr which means it lacks a file name  then it is named "file".

# flobr 0.1.0

* Added `flob_obj`

# flobr 0.0.1

* Added a `NEWS.md` file to track changes to the package.
