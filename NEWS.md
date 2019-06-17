flobs now include the original file name with the extension. 
The file name can be accessed using `flob_name()`.
In order to unflob to a file using the original filename the path 
should end with a file separator. 
This can be achieved using `file.path(path, "")`.
If the flob was saved without the file name using a previous version then it is 
named "file".

# flobr 0.1.0

* Added `flob_obj`

# flobr 0.0.1

* Added a `NEWS.md` file to track changes to the package.
