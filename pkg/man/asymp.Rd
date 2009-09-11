\name{asymp}
\Rdversion{1.1}
\alias{asymp}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(asymp)}
\format{
  The format is:
List of 9
 $ name       : chr "asymptotic regression"
 $ formula    :  expression(S == c - z * f^A)
 $ paramnumber: num 3
 $ paramnames : chr [1:3] "c" "z" "f"
 $ limits     : num [1:2, 1:3] 0 Inf 0 Inf 0 ...
 $ parLim     : chr [1:3] "Rplus" "Rplus" "unif"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[1] - par[2] * par[3]^data[[1]]; as.vector(s)}"
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,asymp$parLim) ; sum( ( data[[2]] - (par[1] - par[2] * par[3]^data[[1]]) )^2  ) }"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr [1:10] "function(data){#Ratkowsky 1983 p178" ...
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
data(asymp)
## maybe str(asymp) ; plot(asymp) ...
}
\keyword{datasets}
