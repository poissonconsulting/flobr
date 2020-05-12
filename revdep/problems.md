# dbflobr

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/dbflobr
* URL: https://github.com/poissonconsulting/dbflobr
* BugReports: https://github.com/poissonconsulting/dbflobr/issues
* Date/Publication: 2019-08-24 09:20:02 UTC
* Number of recursive dependencies: 49

Run `revdep_details(,"dbflobr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m 4. [39mflobr::flob_ext(flob2)
      [90m 5. [39mflobr::chk_flob(flob, old = TRUE)
      [90m 6. [39mchk::chk_s3_class(x, "flob", x_name = x_name)
      [90m 7. [39mchk::abort_chk(...)
      [90m 8. [39mchk::err(..., n = n, tidy = tidy, .subclass = "chk_error")
      [90m 9. [39mrlang::exec(abort, msg, .subclass = .subclass, !!!args[named])
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 86 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 3 ]
      1. Failure: check_flob_query (@test-check.R#94) 
      2. Failure: write flob works (@test-zzz-package.R#22) 
      3. Error: write flob works (@test-zzz-package.R#60) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

