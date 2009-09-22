\name{monod}
\Rdversion{1.1}
\alias{monod}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(monod)}
\format{
  The format is:
List of 9
 $ name       : chr "Monod"
 $ formula    :  expression(s == over(c * a, z + a))
 $ paramnumber: num 2
 $ paramnames : chr [1:2] "c" "z"
 $ limits     : num [1:2, 1:2] 0 Inf 0 Inf
 $ parLim     : chr [1:2] "Rplus" "Rplus"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = (par[1]*d) / (par[2]+d) ; names(s)=c(\"s.monod\"); as.vector"| __truncated__
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,monod$parLim) ; sum( ( data[\"s\"] -  (par[1]*data[\"a\"]) / (par[2]+data[\"a\"]"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr [1:12] "function(data){" ...
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
data(monod)
## maybe str(monod) ; plot(monod) ...
}
\keyword{datasets}
