\name{expo}
\Rdversion{1.1}
\alias{expo}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(expo)}
\format{
  The format is:
List of 9
 $ name       : chr "Exponential"
 $ formula    :  expression(s == z * log(a) + c)
 $ paramnumber: num 2
 $ paramnames : chr [1:2] "c" "z"
 $ limits     : num [1:2, 1:2] 0 Inf 0 Inf
 $ parLim     : chr [1:2] "R" "Rplus"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[2] * log(d) + par[1]; names(s)=c(\"s.expo\"); as.vector("| __truncated__
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,expo$parLim) ; sum(   (data[[2]] - (par[2] * log(data[[1]]) + par[1]) ) ^2     )"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr [1:7] "function(data){" ...
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
data(expo)
## maybe str(expo) ; plot(expo) ...
}
\keyword{datasets}
