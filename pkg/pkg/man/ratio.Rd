\name{ratio}
\Rdversion{1.1}
\alias{ratio}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(ratio)}
\format{
  The format is:
List of 9
 $ name       : chr "Rational function"
 $ formula    :  expression(S == over((c + z * A), (1 + f * A)))
 $ paramnumber: num 3
 $ paramnames : chr [1:3] "c" "z" "f"
 $ limits     : num [1:2, 1:3] -Inf Inf -Inf Inf -Inf ...
 $ parLim     : chr [1:3] "R" "R" "R"
 $ fun        :function (par, data)  
  ..- attr(*, "source")= chr "function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = (par[1] + par[2] * d) / (1 + par [3]*d) ; as.vector(s)}"
 $ rssfun     :function (par, data, opt)  
  ..- attr(*, "source")= chr "function(par,data,opt){if(opt)par=backLink(par,ratio$parLim) ; sum( ( data[[2]] - ((par[1] + par[2] * data[[1]]) / (1 + par [3]"| __truncated__
 $ init       :function (data)  
  ..- attr(*, "source")= chr "function(data){c(0,0,0)}"
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
data(ratio)
## maybe str(ratio) ; plot(ratio) ...
}
\keyword{datasets}
