##working with Ameriflux data
#Tori Scaven
#4/6/15



##need to convert year decimals to rDates:

#code copied from http://stackoverflow.com/questions/26965699/converting-date-in-year-decimal-form-in-r
x <- c(1988.0, 1988.25, 1988.5, 1988.75)
library(lubridate)
(f <- format(date_decimal(x), "%d-%m-%Y"))

#formatting dates
library(lubridate)
fluxDates<-format(date_decimal(Ameriflux$Time..decimal.year.), "%Y-%m-%d")
Ameriflux$fluxDates<-fluxDates
fluxDates

fDate<-as.Date(fluxDates)
fDate

fYear<-(format(fDate, "%Y"))
Ameriflux$fYear<-fYear
fYear
fDate

#finding mean NEE_fill for each year
meanAnnNEE<-tapply(Ameriflux$NEE_fill..umol.m2.s., Ameriflux$fYear, mean )
meanAnnNEE
Biomass

#####CORRECTION: want SUM rather than mean
#NEE_ann=summed NEE for each year (excluding 1998)

biom_ann=Biomass/10

biom_ann
######### So now we have NEE_ann and biom_ann

#trim Biomass data to 1999-2012
cutBiomass<-INCnwt$all[INCnwt$Year>1998]
correctedcutBiomass<-cutBiomass/10

correctedcutBiomass
cutBiomass

#trim NEE data to 2012
trimNEE_ann<-tapply(NEEgm[Ameriflux$fYear>1998&fYear<2013],Ameriflux$fYear[Ameriflux$fYear>1998&fYear<2013],sum)



cutmeanAnnNEE<-tapply(Ameriflux$NEE_fill..umol.m2.s.[fYear<2013&fYear>1998],Ameriflux$fYear[fYear<2013&fYear>1998], mean)

#pasted example from biomass and SWE plots
plot(biomassYear, snowpeaks[Yind<2013], type="l", col="blue", ylab="")
par(new=T)
plot(biomassYear, Biomass, type="l", col="green",ylab="")
par(new=F)


#creating year range for x axis
NEEBiomassYear<-1999:2012
NEE<-pretty(trimNEE_ann)

###plot of NEE and Biomass

plot(NEEBiomassYear, correctedcutBiomass, type="l", col="Forest Green", ylab="", xlab="", cex=2)
par(new=T)
plot(NEEBiomassYear, trimNEE_ann, type="l",col="red", ylab="", xlab="", cex=2, yaxt="n")
axis(2, at=correctedcutBiomass, col.axis="forest green", col.lab="forest green", las=2)
axis(4, at=NEE, col.axis="red", col.lab="red", las=2)
mtext("Annual NEE (g of C per m^2))", col.lab="red", side=4,las=0)
title(main="Annual Biomass and NEE",xlab="Year", ylab="Biomass (g of C per m^2)")
legend("bottomleft", inset=c(-0.2, -0.5), col=c("forest green","red"),lty=1,legend=c("Biomass","NEE"))
par(xpd=TRUE)

cor.test(correctedcutBiomass, trimNEE_ann)
cor(cutBiomass, cutmeanAnnNEE)

#trim snowpeak to 1999-2013
trimSWEpeak<-SNOTELsummary$snowpeaks[SNOTELsummary$Yind>1998&Yind<2014]
trimSWEpeak
thirdplotyear<-1999:2013

#trim NEE to 1999-2013
NEE_ann


#####plot of NEE and snowpeak
prettyNEE<-pretty(NEE_ann)
##correction for SWE from inches to cm
annSWEcm<-trimSWEpeak*2.54
annSWEcm

plot(thirdplotyear, annSWEcm, type="l", col="blue", ylab="", xlab="", cex=2)
par(new=T)
plot(thirdplotyear, NEE_ann, type="l",col="red", ylab="", xlab="", cex=2, yaxt="n")
axis(2, at=annSWEcm, labels=trimSWEpeak, col.axis="blue", col.lab="blue", las=2)
axis(4, at=prettyNEE, col.axis="red", col.lab="red", las=2)
mtext("Annual NEE (g of C per m^2))", col.lab="red", side=4,las=0)
title(main="Annual Peak SWE and NEE",xlab="Year", ylab="Peak SWE (cm)")
legend("bottomleft", inset=c(-0.2, -0.5), col=c("blue","red"),lty=1,legend=c("Peak SWE","NEE"))
par(xpd=TRUE)

cor.test(annSWEcm,NEE_ann)

cor(trimSWEpeak, trimNEE)

#old #troubleshooting
trimNEE<-tapply(Ameriflux$NEE_fill..umol.m2.s.[fYear>1998],Ameriflux$fYear[fYear>1998], mean)


  




