\name{transLink}
\Rdversion{1.1}
\alias{transLink}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
transLink(x, boundType)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{boundType}{
%%     ~~Describe \code{boundType} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x,boundType) {

	# fonction logit
	logit=function(y) {
		log(y/(1-y))
	}#end of logit

if (length(x) ==1) {
	res = switch(boundType,
		R = x,
		Rplus = log(x),
		unif = logit(x)
	)#end of switch
  } else {

res=vector()

	for (i in 1:length(x)) {

		res[i] = switch(boundType[i],
				R = x[i],
				Rplus = log(x[i]),
				unif = logit(x[i])
			)#end of switch
	}#end of for
res
  }#end of if/else
  }#end of transLink
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
