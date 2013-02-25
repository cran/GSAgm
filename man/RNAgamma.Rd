\name{RNAgamma}
\alias{RNAgamma}
\title{RNA gamma}
\description{
For GSA of RNA-seq data, the following procedure, similar to the
analysis of SNP data, is implemented (see Fridley et al[2] for more
details on the method).  Step 1: Association of gene expression data
from RNA-seq (count data) is assessed for differential expression
between two groups using edgeR[3]. Step 2: P-values from the association
analysis within edgeR for genes within a given gene set are combined
using the Gamma Method to determine the association of the gene set with
the phenotype. Currently, the RNA-seq GSA allows only a binary phenotype
(i.e, treatment, control).
}
\usage{
RNAgamma(formula, data, rnaprefix="ENSG", gammaShape=1,STT=NULL,
         pheno.type=c("case.control"),tagwise=F,perm=T,n.perm=1000,seed=12212012) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{formula in R format: phenotype~cov1+cov2}
  \item{data}{data frame containing phenotype, covars, and RNA stuff}
  \item{rnaprefix}{RNA data prefix, defaults to ENSG ensembl genes}
  \item{gammaShape}{numeric indicating the gamma shape parameter to be
    used for p-value summarization}
  \item{STT}{numeric indicating soft truncation threshold to be used,
    will calculate gamma parameter (must be <= 0.4)}
  \item{pheno.type}{type of phenotype, case-control results in logistic
    regression, quantitative results in OLS, and survival results in cox
    model}
  \item{tagwise}{TRUE or FALSE for estimating tagwise dispersion values
    by an empirical Bayes method based on weighted conditional maximum
    likelihood.  Defaults to maximizing the negative binomial
    conditional common likelihood for the common dispersion across all tags.}
  \item{perm}{boolean indicating whether permutation p-value are to be
    used for the gamma summary method}
  \item{n.perm}{numeric indicating number of permutations to be used}
  \item{seed}{numeric to set RNG for reproducability}
}
\examples{
data(testdata)
data(rnaseq_counts)
testdata <- cbind(testdata,rnaseq_counts)
RNAgamma(pheno~strata(study)+age, data=testdata, rnaprefix="rnaseqcount", 
         pheno.type=c("case.control"),tagwise=FALSE,perm=TRUE,n.perm=5)

##No covars, no permutation
RNAgamma(pheno~., data=testdata, rnaprefix="rnaseqcount", 
         pheno.type=c("case.control"),tagwise=FALSE,perm=FALSE)

}
