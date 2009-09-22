\name{rssoptim}
\Rdversion{1.1}
\alias{rssoptim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rssoptim(model, data, norTest = "lillie", graph = T, verb = T, PNGout = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
%%     ~~Describe \code{model} here~~
}
  \item{data}{
%%     ~~Describe \code{data} here~~
}
  \item{norTest}{
%%     ~~Describe \code{norTest} here~~
}
  \item{graph}{
%%     ~~Describe \code{graph} here~~
}
  \item{verb}{
%%     ~~Describe \code{verb} here~~
}
  \item{PNGout}{
%%     ~~Describe \code{PNGout} here~~
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
function(model,data,norTest="lillie",graph=T,verb=T,PNGout=NULL){

######################################################
#                  INPUTS                            #   
######################################################
#                                                    #
# model: the model -list- (ex:  power)               #
# data: the data -data.frame-                        #
# norTest : kolmo OR shapiro OR lillie               #
# graph : print graphics?                            #
# verb : print info in console?                      #
######################################################

if (norTest == "lillie") library(nortest)


data.name=data$name
data=data$data[,1:2]

if (verb){
    cat("**********************************\n")
    cat("----------------------------------\n")
    cat("-FITTING: Residual Sum of Squares-\n")
    cat("< MODEL: ",model$name,">\n")
    cat("<  DATA: ",data.name,">\n")
    cat("----------------------------------\n")
  }

    l <- data[[2]]
    a <- data[[1]]

if (verb){
    cat("--------------DATAS---------------\n")
    cat("A:",a,"\n")
    cat("S:",l,"\n")
    cat("----------------------------------\n")
  }

	#paramters bounds
	parLim = model$parLim

	#Transformed initial paramters
	start <- model$init(data)
	cat("start :", start,"\n")


	for (i in 1:length(start)) { if(parLim[i]!="R"){if(start[i]<=0){ start[i]=0.1 } }  }	

	startMod = transLink(start,parLim)
    
	#RSS function
	rssfun <- model$rssfun

	
if (verb){
    cat("------INITIAL VALUES--------------\n")
    cat(start,"\n")
    cat("----------------------------------\n")
    cat("-transformed INITIAL VALUES-------\n")
    cat(startMod,"\n")
    cat("----------------------------------\n")

  }


#if (model$name == "Exponential") res1=optim(start,rssfun,hessian=F,data=data, method="SANN", control=list(maxit=10000)) else 
res1=optim(startMod,rssfun,hessian=F,data=data,opt=T, method="Nelder-Mead", control=list(maxit=50000)) # CG SANN Nelder-Mead BFGS

#Backtransformation of parameters values

res1$par = backLink(res1$par,parLim)

#if (res1$par[2] <= 0) res1$par[2] <- start[2]
names(res1$par)=model$paramnames

l.calc=NULL
l.calc = as.vector(model$fun(res1$par,data))
residu = as.vector(l - l.calc)

#cat("les residus :" , residu, "\n")

res2 = list(startvalues=start,data=data,model=model,calculated=l.calc,residuals=residu)

#Residuals normality test

normaTest = switch(norTest, "shapiro" = shapiro.test(residu) , "kolmo" = ks.test(residu, "pnorm") , "lillie" = lillie.test(residu) )

#cat("P.Value de " ,norTest, " : " ,normaTest$p,"\n")

#if (norTest == "shapiro") { normaTest <- shapiro.test(residu) } else { normaTest = ks.test(residu, "pnorm") }

#Homogeneity of variance
cor <- cor.test(residu,data[[1]])

#Nullity of the residuals mean

nullMeanTest <- t.test(residu)

#Calcul des criteres R2a, AIC, AICc, BIC

#variables communes
n = length(a)
P = model$paramnumber + 1  # + 1 pour la variance estimee

#R2a
R2a <- 1 - ((res1$value/n) - P - 1) / (sum((l - mean(l))^2) / (n - 1) )

#AIC
AIC = n * log(res1$value / n) + 2 * P

#AICc
AICc = n * log(res1$value / n) + 2*P*(n / (n - P - 1))

#BIC
BIC = n *log(res1$value / n) + log(n) * P

if(verb){
        cat("----------FINAL VALUES-----------\n")
        cat(res1$par,"\n")
        cat("----------------------------------\n")
        cat("RSS.value:",res1$value,"\n")
        cat("----------------------------------\n")
	cat("------RESIDUALS NORMALITY --------\n")
	if (norTest == "shapiro") {
 	cat("Shapiro Test, W = ",normaTest$statistic,"\n")
	cat("Shapiro Test, p.value = ",normaTest$p.value,"\n")
	} else {
		if (norTest == "kolmo") {
 			cat("Kolmogorov Test, D = ",normaTest$statistic,"\n")
			cat("Kolmogorov Test, p.value = ",normaTest$p.value,"\n")
		} else {
			cat("Lilliefors Test, D = ",normaTest$statistic,"\n")
			cat("Lilliefors Test, p.value = ",normaTest$p.value,"\n")
		}
	}
        cat("------HOMOGENEITY OF VARIANCE ---------\n")
	cat("Pearson coef. = " ,cor$estimate,"\n")
	cat("cor. Test p.value  = " ,cor$p.value,"\n")
	
	cat("------NULLITY OF RESIDUALS MEAN ---------\n")
	cat("t = " ,nullMeanTest$statistic,"\n")
	cat("T Test p.value  = " ,nullMeanTest$p.value,"\n")


	cat("--------- CRITERIONS -------------------\n")
	cat("AIC : ",AIC,"\n")
	cat("AICc : ",AICc,"\n")
	cat("BIC : ",BIC,"\n")
	cat("R2a : ",R2a,"\n")
	cat("**********************************\n")
  }#end of if verb

    res3 = list(AIC=AIC, AICc=AICc, BIC=BIC, R2a=R2a)
    res = c(res1,list(pearson=cor$estimate,pearpval=cor$p.value,normaTest=norTest,normaStat=normaTest$statistic,normaPval=normaTest$p.value,tTest=nullMeanTest$statistic,tTestpval=nullMeanTest$p.value),res2,res3,list(data.name=data.name))
   
invisible(res)

#END OF RSSOPTIM
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
