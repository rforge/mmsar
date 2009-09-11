\name{weibull}
\Rdversion{1.1}
\alias{weibull}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(weibull)}
\format{
  The format is:
List of 9
 $ name       : chr "Cumulative Weibull"
 $ formula    :  expression(S == c(1 - exp(-z * A^f)))
 $ paramnumber: num 3
 $ paramnames : chr [1:3] "c" "z" "f"
 $ limits     : num [1:2, 1:3] 0 Inf 0 Inf 0 ...
 $ parLim     : chr [1:3] "Rplus" "Rplus" "Rplus"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[1] *  (1 - exp(-par[2]*(d^par[3])) ) ; as.vector(s)}"
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,weibull$parLim) ; sum( ( data[[2]] -   par[1] *  (1 - exp(-par[2]*(data[[1]]^par"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr [1:13] "function(data){" ...
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
data(weibull)
## maybe str(weibull) ; plot(weibull) ...
}
\keyword{datasets}
