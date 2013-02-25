\name{testdata}
\alias{testdata}
\docType{data}
\title{
Test data
}
\description{
  A dummy dataset for testing these functions.  It contains
  two covariates (age and study), SNP data, and phenotype (coded 0/1).
}
\usage{data(testdata)}
\format{
  A data frame with 150 observations on the following 18 variables.
  \describe{
    \item{\code{age}}{a numeric vector}
    \item{\code{study}}{a factor with levels \code{AAA} \code{BBB} \code{CCC}}
    \item{\code{snp1}}{a numeric vector}
    \item{\code{snp2}}{a numeric vector}
    \item{\code{snp3}}{a numeric vector}
    \item{\code{snp4}}{a numeric vector}
    \item{\code{snp5}}{a numeric vector}
    \item{\code{snp6}}{a numeric vector}
    \item{\code{snp7}}{a numeric vector}
    \item{\code{snp8}}{a numeric vector}
    \item{\code{snp9}}{a numeric vector}
    \item{\code{snp10}}{a numeric vector}
    \item{\code{snp11}}{a numeric vector}
    \item{\code{snp12}}{a numeric vector}
    \item{\code{snp13}}{a numeric vector}
    \item{\code{snp14}}{a numeric vector}
    \item{\code{snp15}}{a numeric vector}
    \item{\code{pheno}}{a numeric vector}
  }
}
\examples{
data(testdata)
## maybe str(testdata) ; plot(testdata) ...
}
\keyword{datasets}
