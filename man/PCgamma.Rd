\name{PCgamma}
\alias{PCgamma}
\title{PC gamma}
\description{
For GSA of SNP data, the following two-step procedure is implemented
(see Biernacka et al[1] for more details on the method). Step 1:
Principal components analysis for SNPs within a gene is completed with
the components needed to explain 80 percent of the variation
retained. Using these components, a gene-level association test is
completed to determine the association of the gene with the
phenotype. Step 2: The gene-level p values for genes within a given gene
set are combined using the Gamma Method, a variation of Fisher's Method,
to determine the association of the gene set with the phenotype. The GSA
function for SNP data allow quantitative, binary and time-to-event
phenotypes (i.e., linear models, logistic models, Cox proportional
hazard models).
}
\usage{PCgamma(formula,data,snpprefix="snp",gene,PCpctVar = 80,
gammaShape = 1, STT=NULL, pheno.type = c("case.control", "quantitative", "survival"),
perm = T, n.perm = 1000, seed = 12212012)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{formula for model, include phenotype and covars.
    SNPs will be added by function}
  \item{data}{All data including
    matrix of genetic markers, each marker represented by the
    dosage of some allele, could also be CNV, treated as continuous
    and covariates}
  \item{snpprefix}{prefix for SNP variable, defaults to "snp"}
  \item{gene}{vector disignating the gene each marker belongs to,
    must be in same order as SNPs}
  \item{PCpctVar}{numeric indicating the percent of variation (in
    percent) in the genetic markers that is to be explained by PCs}
  \item{gammaShape}{numeric indicating the gamma shape parameter to be
    used for p-value summarization}
  \item{STT}{numeric indicating soft truncation threshold to be used,
    will calculate gamma parameter (must be <= 0.4)}
  \item{pheno.type}{type of phenotype, case-control results in logistic
    regression, quantitative results in OLS, and survival results in cox
    model} 
  \item{perm}{boolean indicating whether permutation p-value are to be
    used for the gamma summary method}
  \item{n.perm}{numeric indicating number of permutations to be used}
  \item{seed}{numeric to set RNG for reproducability}
}
\value{
This functions returns a list.  
\item{gamma.pvalue}{Gamma P value}
\item{perm.pvalue}{Gamma permutation p value, if specified.  Else NA}
\item{gene.info}{Info for each gene}
}
\examples{
###Case Control (logistic) example
data(testdata)
data(gene_example)
PCgamma(pheno~strata(study)+age,
       data=testdata,gene=gene_example,pheno.type="case.control",
       STT = 0.2, gammaShape = NULL,
       perm=FALSE, n.perm = 10, seed = 12212012)

##Here is a survival example
set.seed(1234)
time_example <- rnorm(150, m=50, sd=10)  
event_example <- rbinom(150, 1, 0.3)
testdata <- cbind(testdata,time_example,event_example)

PCgamma(Surv(time_example,event_example)~strata(study)+age,
       data=testdata,gene=gene_example,pheno.type="survival",
       STT = 0.2, gammaShape = NULL,
       perm=FALSE, n.perm = 10, seed = 12212012)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
