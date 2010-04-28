\name{multiSAR}
\Rdversion{1.1}
\alias{multiSAR}
\title{multiSAR}
\description{multi-model averaging (of non-linear SAR models) and non parametric confidence intervals calculation.
}
\usage{
multiSAR(modelList = models, data = dat.F, nBoot = 9999, verb = TRUE, crit = "Bayes")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{modelList}{
	Vector of character string with the names of the models to be fitted.
}
  \item{data}{
	An mmSAR data object (a list with two elements : $name (a character sting with the name of the data set) and $data (a data.frame with 2 columns : area and richness ) ).
}
  \item{nBoot}{
	The number of bootstrap resamples for the construction of the non parametric confidence interval.
}
  \item{verb}{
	A boolean stipulationg if the function should report informations while running.
  \item{crit}{
	One of "Bayes" (for a comparison of the models based on the Bayesian Information Criterion -BIC-) or "Info" (for a comparison of the models based on the Akaike Information Criterion (AIC) -note that the function will switch automatically between AIC and it's "small sample corrected version, AICc" depending on the size of the data set- ). 
}
}
\details{
	   multiSAR is the model averaging function : fitting of SAR models is performed by calling the function \code{\link{rssoptim}}, model selection is performed using the criterion specified in argument (argument "crit"), multi-model averaging is realised for valid SAR models (see \code{\link{rssoptim}} for a description of the test performed on the fits, finally a non-parametric confidence interval is obtained using a bootstraping procedure (the argument "nBoot" give the number of bootstrap resamples). More details about the multimodel SAR methodology can be found in Guilhaumon et al. (2008) and the companion paper of this package (Guilhaumon et al., 2010).

}
\value{
	A list with the folowwong elements :
\enumerate{
\item data : the mmSAR data object passed to the function (a list with two elements : $name (a character sting with the name of the data set) and $data (a data.frame with 2 columns : area and richness ) )
\item models : Vector of character string with the names of the models
\item optimRes : a matrix with the informations about the fit of the models (self explanatory).
\item filtOptimRes : a matrix with the informations about the fit of the models which satisfied the regression hypotheses.
\item calculated : a matrix of species richness infered from each of the SAR models.
\item filtCalculated : a matrix of species richness infered from each of the valid SAR models.
\item averaged : the vector of multimodel averaged species richness.
\item DeltaIC : a vector containing for each valid model the AIC (AICc) or BIC differences.
\item akaikeweight : a vector containing the Aikaike weights for each valid model.
\item avResiduals : a vector of residuals for the multimodel SAR.
\item shapAvRes : the result of a "shapiro.test" on the vector of residuals for the multimodel SAR.
\item corAvRes : the result of a "cor.test" betwwen the vector of residuals for the multimodel SAR and areas in the dataset.
\item bootSort : a matrix with "nBoot" rows containing the SORTED species richness from the mulimodel SAR. It is used to calculated the confidence interval using the percentil method.
\item bootHat : a matrix with "nBoot" rows containing the species richness from the mulimodel SAR.
\item bootMatrix : bootMatrix.
\item IC : the information criterion used for model selection.
}


}
\references{
\enumerate{

\item Guilhaumon et al. 2008. Taxonomic and regional uncertainty in species-area relationships and the identification of richness hotspots. – Proc Natl Acad Sci USA 105:15458-15463.

\item Guilhaumon, F., Mouillot, D. and Gimenez, O. 2010. mmSAR : an R-package for multimodel species-area relationship inference (http://mmsar.r-forge.r-project.org) Ecography XX: XXX–XXX.


}
}
\author{
François Guilhaumon
}

\seealso{
\code{\link{rssoptim}}
}
\examples{

#loading all available models
data(power);data(expo);data(negexpo);data(monod);data(ratio);data(logist);data(lomolino);data(weibull)

#loading the Galapagos Islands plants data set 
data(data.galap)

#creating a vector of model names
mods <- c("power","expo","negexpo","monod","logist","ratio","lomolino","weibull")

#fitting all the models to the Galapagos dataset and perform multimodel averaging
resAverage <- multiSAR(modelList=mods,data.galap)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ SAR }
\keyword{ multimodel }
\keyword{ non lienar regression }
\keyword{ bootstrap }
