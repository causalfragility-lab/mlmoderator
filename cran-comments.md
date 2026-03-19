## R CMD check results

0 errors | 0 warnings | 1 note

The single NOTE is:

    checking for future file timestamps ... NOTE
    unable to verify current time

This NOTE is caused by a network/firewall restriction on the submission
machine (a university OneDrive-synced directory) that prevents R from
reaching an NTP time server. It is not related to the package code and
does not appear on win-builder or other external check platforms.

---

## Win-builder results

Checked on both R-devel and R-release via win-builder.r-project.org.

R-devel:  0 errors | 0 warnings | 2 notes (see below)
R-release: awaiting results

Notes on win-builder R-devel:

1. "New submission" -- expected for a first CRAN submission.

2. HTML validation NOTE for <pred> tag in two Rd files -- fixed in
   this submission. The angle brackets around pred in two @param
   descriptions have been removed.

---

## Downstream dependencies

This is a new package. There are no downstream dependencies.

---

## Notes to CRAN reviewers

- All examples run in under 5 seconds. The mlm_sensitivity() example
  uses a small simulated dataset (20 clusters x 10 observations).
  The full school_data workflow is wrapped in \donttest{}.

- The package includes one simulated dataset (school_data) generated
  by data-raw/generate_school_data.R with set.seed(42) for
  reproducibility.

- Standard OLS-based sensitivity tools (E-value, ITCV) are
  intentionally excluded from mlm_sensitivity(). The function provides
  ICC-shift robustness and leave-one-cluster-out (LOCO) diagnostics,
  which are appropriate for multilevel models. This design decision is
  documented in the function scope and in README.md.

- The CRAN badge in README.md has been removed as the package is not
  yet on CRAN. It will be restored after acceptance.
