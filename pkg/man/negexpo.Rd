\name{negexpo}
\Rdversion{1.1}
\alias{negexpo}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(negexpo)}
\format{
  The format is:
List of 9
 $ name       : chr "Negative exponential"
 $ formula    :  expression(s == c * (1 - exp(-z * a)))
 $ paramnumber: num 2
 $ paramnames : chr [1:2] "c" "z"
 $ limits     : num [1:2, 1:2] 0 Inf 0 1
 $ parLim     : chr [1:2] "Rplus" "unif"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[1]*(1 - exp(-par[2]*d)) ; names(s)=c(\"s.negexpo\"); as."| __truncated__
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,negexpo$parLim) ; sum( ( data[[2]] -  par[1] * (1 - exp(-par[2] * data[[1]]) ) )"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr "function(data){c=max(data[[2]]); Z=( -log( (-data[[2]]/(max(data[[2]])+1))+1))/data[[1]]; z = mean(Z); c(c,z)}"
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
data(negexpo)
## maybe str(negexpo) ; plot(negexpo) ...
}
\keyword{datasets}
