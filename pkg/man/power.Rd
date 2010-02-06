\name{power}
\Rdversion{0.1}
\alias{power}
\docType{data}
\title{
%%   ~~ The power law SAR model (Arrhenius 1921) ~~
}
\description{
%%  ~~ The power law SAR model is the most ancient model fitted to SARs.\cr

	\tab s == c * a^z ~~
}
\usage{The power model is an argument of the rssoptim function, it can be passed along with other models to the multiSAR function}
\format{
  The format is:
List of 9
 $ name       : chr "Power"
 $ formula    :  expression(s == c * a^z)
 $ paramnumber: num 2
 $ paramnames : chr [1:2] "c" "z"
 $ limits     : num [1:2, 1:2] 0 Inf 0 1
 $ parLim     : chr [1:2] "Rplus" "unif"
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,power$parLim) ; sum(   (data[,2] - par[1]*data[,1]^par[2]) ^2     )}"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[1]*d^par[2]; names(s)=c(\"s.power\"); s}"
 $ init       :function (data)  
  ..- attr(*, "source")= chr "function(data){log.data=log(data);res=lm(s~a,log.data)$coefficients;c(exp(res[1]),res[2])}"
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ Arrhenius, O. 1921. Species and area. Journal of Ecology. 9: 95-99.  ~~
}
\references{
%%  ~~ Arrhenius, O. 1921. Species and area. Journal of Ecology. 9: 95-99. ~~
}
\examples{
rssoptim(power,data)
}
\keyword{mmSAR model object}
\keyword{non linear regression}
