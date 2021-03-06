% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk.R
\name{chk_flob}
\alias{chk_flob}
\title{Check flob}
\usage{
chk_flob(x, old = FALSE, x_name = NULL)
}
\arguments{
\item{x}{The object to check.}

\item{old}{A flag indicating whether old flobs are permitted.}

\item{x_name}{A string of the name of object x or NULL.}
}
\value{
\code{NULL}, invisibly. Called for the side effect of throwing an error
if the condition is not met.
}
\description{
Checks whether an object is a \code{\link[=flob]{flob()}}.
}
\examples{
chk_flob(flobr::flob_obj)
}
\seealso{
\code{\link[=flobr]{flobr()}} and \code{\link[=chk_flob]{chk_flob()}}.
}
