\name{power}
\Rdversion{1.1}
\alias{power}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(power)}
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
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(power)
## maybe str(power) ; plot(power) ...
}
\keyword{datasets}
