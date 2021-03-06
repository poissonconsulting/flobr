% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk.R
\name{chk_slob}
\alias{chk_slob}
\title{Check slob}
\usage{
chk_slob(x, x_name = NULL)
}
\arguments{
\item{x}{The object to check.}

\item{x_name}{A string of the name of object x or NULL.}
}
\value{
\code{NULL}, invisibly. Called for the side effect of throwing an error
if the condition is not met.
}
\description{
Checks whether an object is a slob (serialized blob).
}
\examples{
chk_slob(flobr:::slob_obj)
}
\seealso{
\code{\link[=flobr]{flobr()}} and \code{\link[=chk_slob]{chk_slob()}}.
}
