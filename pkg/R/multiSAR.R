multiSAR <-
function(modelList=c("power","expo","negexpo","monod","logist","ratio","lomolino","weibull"),data,nBoot=999,verb=FALSE,crit="Bayes") {

library(numDeriv)


############Criteria must be "Info" for AIC/AICc or "Bayes" for BIC
nlig <- length(modelList)

#Test on data points (if one richness == 0 then the data point is deleted)
isNull = which(data$data[[2]]==0)

if (length(isNull)!=0) {
	if(verb) cat("Dataset contained ",length(isNull)," zero abundance point(s) that was(were) deleted for analysis\n")
	data$data = data$data[-isNull,]
}#end of if isNull

#matrix of optimisation results
vars <- c("p1","p2","p3","AICc","D.AICc","AICcW","AIC","D.AIC","AICW","BIC","D.BIC","BICW","RSS","R2","Norm Stat","Norm p.val","Pearson","Pea p.val") #,"t Test","t p.val"
dig=6 #digits
optimResult = matrix(0,nlig,length(vars))
colnames(optimResult) = vars
rownames(optimResult) <- modelList

#List of Jacobian and Hat matrix
matList = list()

#matrix of calculated values and residuals and transformed residuals
nPoints <- length(data$data[[1]])
pointsNames <- paste("S",c(1:nPoints))
calculated <- residuals <- transResiduals <- matrix(0,nlig,length(pointsNames))
colnames(calculated) <- colnames(residuals) <- colnames(transResiduals) <- pointsNames
rownames(calculated) <- rownames(residuals) <- rownames(transResiduals) <- modelList

#vector of final values (model averaging)
finalVect <- vector("numeric",length(pointsNames))
names(finalVect) <- pointsNames


for (i in 1:nlig){

	optimres = rssoptim(eval(parse(text=as.character(modelList[i]))),data,"lillie",verb)

	for (j in 1:eval(parse(text=as.character(modelList[i])))$paramnumber) {optimResult[i,paste("p",j,sep="")] <- round(optimres$par[j],digits=dig)}
	optimResult[i,"AIC"] <- round(optimres$AIC,digits=dig)
	optimResult[i,"AICc"] <- round(optimres$AICc,digits=dig)
	optimResult[i,"BIC"] <- round(optimres$BIC,digits=dig)
	optimResult[i,"RSS"] <- round(optimres$value,digits=dig)
	optimResult[i,"R2"] <- round(optimres$R2,digits=dig)
	optimResult[i,"Norm Stat"] <- round(optimres$normaStat,digits=dig)
	optimResult[i,"Norm p.val"] <- round(optimres$normaPval,digits=dig)
	optimResult[i,"Pearson"] <- round(optimres$pearson,digits=dig)
	optimResult[i,"Pea p.val"] <- round(optimres$pearpval,digits=dig)

	calculated[i,] <- optimres$calculated
	residuals[i,] <- optimres$calculated - data$data[,2]
	
	#jacobian and Hat Matrix
	
	#first data Point
	jacob = jacobian( eval(parse(text=as.character(modelList[i])))$rssfun,optimres$par,data=data$data[1,],opt=FALSE)

	for (k in 2:nPoints) {
	jacob = rbind(jacob,jacobian( eval(parse(text=as.character(modelList[i])))$rssfun,optimres$par,data=data$data[k,],opt=FALSE))
	}
	
	jacobbis <- t(jacob)%*%jacob
	s <- svd(jacobbis)
	jacobbismun = s$v%*%(diag(1/s$d))%*%(t(s$u))
	hatMat = jacob%*%jacobbismun%*%t(jacob)
	matList[[i]] <- list(jacob=jacob,hatMat=hatMat)

	#Residuals transformation from Davidson and Hinkley, 1997 "Bootstrap methods and their applications" p 259 eq (6.9)
	diagHatMat = diag(hatMat)
	transResiduals[i,] <- residuals[i,] - mean(residuals[i,])
	transResiduals[i,] <- transResiduals[i,] / sqrt( 1 - diagHatMat )
	
}#end of for

names(matList) = modelList


#Fitting validation
flags <- vector("numeric",nlig)

for (i in 1:nlig) { if (optimResult[i,"Norm p.val"]<0.05 || optimResult[i,"Pea p.val"]<0.05) {flags[i]<-"KO"} else {flags[i]<-"OK"}  } 

filtOptimResult <- subset(optimResult,flags=="OK")
filtCalculated <- subset(calculated,flags=="OK")
filtMatList <- matList[flags=="OK"]
filtModelList <- modelList[flags=="OK"]

#Models comparaison

#choosing an IC criterion (AIC or AICc or BIC)
if(crit == "Info") {
	if ( (nPoints / 3) < 40 ) { IC = "AICc" } else { IC = "AIC"}
	} else {
	if(crit == "Bayes") { IC = "BIC" } else { stop("Criteria must be 'Info' for AIC/AICc or 'Bayes' for BIC")}
	}

if(verb) cat("Choosen criterion is ",IC,"\n")
DeltaICvect <- vector()
akaikeweightvect <- vector()

filtNlig <- dim(filtOptimResult)[1]

for (i in 1:filtNlig){

	#Delta IC = ICi - ICmin 
	DeltaIC <- filtOptimResult[i,IC] - min(filtOptimResult[,IC])
	DeltaICvect <- c(DeltaICvect,DeltaIC)
}

for (i in 1:filtNlig){
	#Akaike Weigths
	akaikesum <- sum(exp( -0.5*(DeltaICvect)))
	akaikeweight <- exp(-0.5*DeltaICvect[i]) / akaikesum
	akaikeweightvect <- c(akaikeweightvect,akaikeweight)
}

	
columnDelta = paste("D.",IC,sep="")
filtOptimResult[,columnDelta] <- round(DeltaICvect,digits=dig)
#filtOptimResult[,"AICcW"] <- round(akaikeweightvect,digits=5)
columnW = paste(IC,"W",sep="")
filtOptimResult[,columnW] <- akaikeweightvect

#Averaging
for (i in 1:nPoints) {
	finalVect[i] <- sum(akaikeweightvect*filtCalculated[,i])
}


#Averaging validation
avResiduals = data$data[[2]] - finalVect
shapRes= shapiro.test(avResiduals)
if(verb) cat("Averaging residuals normality (p.value) : ",shapRes$p.value,"\n")

cor <- cor.test(avResiduals,data$data[[1]])
if(verb) cat("Averaging residuals/X values correlation (method: ",cor$method,") (Value,p.value) : ",cor$estimate,",",cor$p.value,"\n")

################################################################################
#Bootstrapping residuals and model averaging
################################################################################

#Matrix of boot Samples
bootMatrix=matrix(0,nBoot,nPoints)

#array of optimisation results
optimBootResult = array(0,c(nlig,length(vars),nBoot),dimnames=list(modelList,vars,seq(1,nBoot)))

#array of calculated values
bootCalculated <- array(0,c(nlig,length(pointsNames),nBoot),dimnames=list(modelList,pointsNames,seq(1,nBoot)))

#flags for fitting validation
flags <- matrix(0,nlig,nBoot)

if(verb) cat("********************************************\n")
if(verb) cat(" Bootstrap Samples creation and\n")
if(verb) cat(" Model averaging on boot samples\n")
if(verb) cat("********************************************\n")


#vector of choosen models
choosenModels = vector()

#test variable
nGoodBoot = 1 

while (nGoodBoot < nBoot+1) {
    
	test <- 1

	chousModel = filtModelList[rmultinom(1, 1, akaikeweightvect)==1]
	if(verb) cat("Boot Sample : ",nGoodBoot," Choose model : ",chousModel,"\n")

	choosenModels[nGoodBoot] = chousModel

   	while (test != 0 ) {

		for (l in 1:nPoints) {
			positives = transResiduals[chousModel,][transResiduals[chousModel,] > 0]
			negatives = transResiduals[chousModel,][transResiduals[chousModel,] < 0]

			if (calculated[chousModel,l] > 0 ) {
				vtci = negatives[abs(negatives) <= calculated[chousModel,l] ]
				vtci = c(vtci,positives)
				value = sample(vtci,1)
			} else {
				
				vtci = positives[positives >= abs(calculated[chousModel,l]) ]
				value = sample(vtci,1)
			}

			bootMatrix[nGoodBoot,l] <- calculated[chousModel,l] + value
		}#end of for


		#test if one species richness is negative
		test=length( which(bootMatrix[nGoodBoot,]<0) )

		if(verb) cat("BootSample : ",bootMatrix[nGoodBoot,],"\n")
		

    	}#end of while
	
	###########################################################
	#Do the model averaging for each bootstrap sample
	###########################################################

	for (k in 1:nlig){
	###########################################################
	#ICI le tryCatch
	###########################################################

	badBoot = FALSE

	optimres = tryCatch(rssoptim(eval(parse(text=as.character(modelList[k]))),data=list(name="bootSample",data=data.frame(a=data$data[[1]],s=bootMatrix[nGoodBoot,])),"lillie",verb),error = function(e) {cat("Error from optim function, Swap the bootSample\n") ; list(convergence=999) } )

	if (optimres$convergence != 0) {
		badBoot=TRUE
	} else { 

		if (sum(optimres$calculated)==0) { badBoot=TRUE } else { 
			for (j in 1:eval(parse(text=as.character(modelList[k])))$paramnumber){optimBootResult[k,paste("p",j,sep=""),nGoodBoot] <- round(optimres$par[j],digits=dig)}
			optimBootResult[k,"AIC",nGoodBoot] <- round(optimres$AIC,digits=dig)
			optimBootResult[k,"AICc",nGoodBoot] <- round(optimres$AICc,digits=dig)
			optimBootResult[k,"BIC",nGoodBoot] <- round(optimres$BIC,digits=dig)
			optimBootResult[k,"RSS",nGoodBoot] <- round(optimres$value,digits=dig)
			optimBootResult[k,"R2",nGoodBoot] <- round(optimres$R2,digits=dig)
			optimBootResult[k,"Norm Stat",nGoodBoot] <- round(optimres$normaStat,digits=dig)
			optimBootResult[k,"Norm p.val",nGoodBoot] <- round(optimres$normaPval,digits=dig)
			optimBootResult[k,"Pearson",nGoodBoot] <- round(optimres$pearson,digits=dig)
			optimBootResult[k,"Pea p.val",nGoodBoot] <- round(optimres$pearpval,digits=dig)
			bootCalculated[k,,nGoodBoot] <- optimres$calculated

			#Fitting validation
			if (optimBootResult[k,"Norm p.val",nGoodBoot]<0.05 || optimBootResult[k,"Pea p.val",nGoodBoot]<0.05 || length(which(bootCalculated[k,,nGoodBoot]<0)) !=0 ) { flags[k,nGoodBoot]<-"KO"
			} else {
				flags[k,nGoodBoot]<-"OK"
			}#end of if/else on Shap and Corr
			}#end of if/else on convergence 2
			}#end of if/else on convergence 1
			
	}#end of for k

	if ( length(which(flags[,nGoodBoot]!="KO")) == 0 ) badBoot=TRUE
	if ( length(which(flags[,nGoodBoot]==0)) != 0 ) badBoot=TRUE

	if (badBoot == FALSE) { 
			    #write the bootSample to a file
			    #bootFileName = paste("bootSamp_",data$name,".txt",sep="")
			    #bootText = paste("BootSample",nGoodBoot,"\n",sep="")
			    #cat(bootText,file = bootFileName,append=TRUE)
			    #write(bootMatrix[nGoodBoot,], file = bootFileName,ncolumns= nPoints, append = TRUE, sep = " ")
			    nGoodBoot <- nGoodBoot + 1
	}#end of if badBoot
}#end of while




#Applying the filter (flags)
#transform 3D table to list
filtOptimBootResult=vector("list", nBoot)
for (i in 1:nBoot) filtOptimBootResult[[i]] <- optimBootResult[,,i]
for (i in 1:nBoot) filtOptimBootResult[[i]] <- subset(filtOptimBootResult[[i]],flags[,i]=="OK")
filtBootCalculated = vector("list", nBoot)
for (i in 1:nBoot) filtBootCalculated[[i]] <- bootCalculated[,,i]
for (i in 1:nBoot) filtBootCalculated[[i]] <- subset(filtBootCalculated[[i]],flags[,i]=="OK")

bootHat = matrix(0,nBoot,nPoints)
nBadBoot = 0
f=0

for (k in 1:nBoot) {

	cat("Boot Sample : ",k,"\n")

	#Models comparaison
	#choosing an IC criterion (AIC or AICc or BIC)
	if(crit == "Info") {
		if ( (nPoints / 3) < 40 ) { IC = "AICc" } else { IC = "AIC"}
		} else {
		if(crit == "Bayes") { IC <- "BIC" } else { stop("Criteria must be 'Info' for AIC/AICc or 'Bayes' for BIC")}
		}

	if(verb) cat("Choosen criterion is ",IC,"\n")

	DeltaICvect <- vector()
	akaikeweightvect <- vector()
	filtNlig <- dim(filtOptimBootResult[[k]])[1]

	if (filtNlig != 0) {

	for (i in 1:filtNlig){

		#Delta IC = ICi - ICmin 
		DeltaIC <- filtOptimBootResult[[k]][i,IC] - min(filtOptimBootResult[[k]][,IC])
		DeltaICvect <- c(DeltaICvect,DeltaIC)
	}#end of for i

	for (i in 1:filtNlig){
		#Akaike Weigths
		akaikesum <- sum(exp( -0.5*(DeltaICvect)))
		akaikeweight <- exp(-0.5*DeltaICvect[i]) / akaikesum
		akaikeweightvect <- c(akaikeweightvect,akaikeweight)
	}#end of for i

	columnDelta = paste("D.",IC,sep="")
	columnW = paste(IC,"W",sep="")

	filtOptimBootResult[[k]][,columnDelta] <- round(DeltaICvect,digits=dig)
	filtOptimBootResult[[k]][,columnW] <- akaikeweightvect

	#Averaging
	for (i in 1:nPoints) {
		bootHat[k,i] <- sum(akaikeweightvect*filtBootCalculated[[k]][,i])
	}#end of for i

	} else { bootHat[k,] <- rep(0,nPoints) }

} #end of for k

cat("Bad boot: ",nBadBoot,"\n")

bootSort=apply(bootHat,2,sort)

res=list(data=data,models=modelList,optimRes=optimResult,filtOptimRes=filtOptimResult,calculated=calculated,filtCalculated=filtCalculated,averaged=finalVect,DeltaIC=DeltaICvect,akaikeweight=akaikeweightvect,avResiduals=avResiduals,shapAvRes=shapRes,corAvRes=cor,bootMatrix=bootMatrix,optimBootResult=optimBootResult,bootCalculated=bootCalculated,flags=flags,filtOptimBootResult=filtOptimBootResult,filtBootCalculated=filtBootCalculated,bootSort=bootSort,bootHat=bootHat,bootMatrix=bootMatrix,IC=IC) 

invisible(res)

} #end of resAverage

