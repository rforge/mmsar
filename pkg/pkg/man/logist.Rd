\name{logist}
\Rdversion{1.1}
\alias{logist}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(logist)}
\format{
  The format is:
List of 10
 $ name       : chr "Logistic function"
 $ formula    :  expression(S == over(c, (1 + exp(-z * A + f))))
 $ Formula    :Class 'formula' length 3 s ~ over(par1, (1 + exp(-par2 * a + par3)))
  .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
 $ paramnumber: num 3
 $ paramnames : chr [1:3] "c" "z" "f"
 $ limits     : num [1:2, 1:3] 0 Inf 0 Inf -Inf ...
 $ parLim     : chr [1:3] "Rplus" "Rplus" "R"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[1] / (1 + exp(-par[2]*d+par[3])) ; as.vector(s)}"
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,logist$parLim) ; sum( ( data[[2]] - (par[1] / (1 + exp(-par[2]*data[[1]]+par[3])"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr [1:14] "function(data){" ...
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
data(logist)
## maybe str(logist) ; plot(logist) ...
}
\keyword{datasets}
