\name{STTtoShapeParameter}
\alias{STTtoShapeParameter}
\title{Soft Truncation Threshold}
\description{
In using the Gamma Method[4], a soft truncation threshold (STT) must be
specified (that is, shape parameter for gamma distribution). For
combining p values using Fisher's method, set STT to 1/e. Based on
simulation studies, we have found that STT between 0.10 and 0.20 achieve
optimal power for a variety of situations. Empirical p values for the
gene set association are determined via permutations.

This function is called by the pcgamma one.}
\usage{STTtoShapeParameter(STT)}
\arguments{
  \item{STT}{numeric indicating soft truncation threshold (STT) to
    convert to gamma parameter (must be <= 0.4)}
}
\examples{
STTtoShapeParameter(0.2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{  }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
