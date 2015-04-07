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

#trim Biomass data to 1998-2012
cutBiomass<-INCnwt$all[INCnwt$Year>1997]

#trim NEE data to 1998-2012 (from 2013)
cutmeanAnnNEE<-tapply(Ameriflux$NEE_fill..umol.m2.s.[fYear<2013],Ameriflux$fYear[fYear<2013], mean)
cutmeanAnnNEE


#pasted example from biomass and SWE plots
plot(biomassYear, snowpeaks[Yind<2013], type="l", col="blue", ylab="")
par(new=T)
plot(biomassYear, Biomass, type="l", col="green",ylab="")
par(new=F)


###plot of NEE and Biomass

#creating year range for x axis
NEEBiomassYear<-1998:2012

plot(NEEBiomassYear, cutBiomass, type="l", col="Forest Green", ylab="", xlab="", cex=2)
par(new=T)
plot(NEEBiomassYear, cutmeanAnnNEE, type="l",col="red", ylab="", xlab="", cex=2, yaxt="n")
axis(2, at=cutBiomass, labels=Biomass, col.axis="forest green", col.lab="forest green", las=2)
axis(4, at=NEE, col.axis="red", col.lab="red", las=2)
mtext("Mean Annual NEE (umol/m2/s))", col.lab="red", side=4,las=0)
title(main="Biomass and Mean Annual NEE",xlab="Year", ylab="Biomass (kg C per ha)")
legend("bottomleft", inset=c(-0.2, -0.5), col=c("forest green","red"),lty=1,legend=c("Biomass","NEE"))
par(xpd=TRUE)


#trim snowpeak to 1998-2013
trimSWEpeak<-SNOTELsummary$snowpeaks[SNOTELsummary$Yind>1997&Yind<2014]
trimSWEpeak
thirdplotyear<-1998:2013

#####plot of NEE and snowpeak
plot(thirdplotyear, trimSWEpeak, type="l", col="blue", ylab="", xlab="", cex=2)
par(new=T)
plot(thirdplotyear, meanAnnNEE, type="l",col="red", ylab="", xlab="", cex=2, yaxt="n")
axis(2, at=trimSWEpeak, labels=trimSWEpeak, col.axis="blue", col.lab="blue", las=2)
axis(4, at=prettyNEE, col.axis="red", col.lab="red", las=2)
mtext("Mean Annual NEE (umol/m2/s))", col.lab="red", side=4,las=0)
title(main="Peak SWE and Mean Annual NEE",xlab="Year", ylab="Peak SWE (in)")
legend("bottomleft", inset=c(-0.2, -0.5), col=c("blue","red"),lty=1,legend=c("Peak SWE","NEE"))
par(xpd=TRUE)

NEE<-pretty(cutmeanAnnNEE)
prettyNEE<-pretty(meanAnnNEE)
    par(mar=c(5, 4, 4, 5))  
    plot(biomassYear, snowpeaks[Yind<2013], type="l", col="blue", ylab="", xlab="")
    par(new=T)
    plot(biomassYear, Biomass, type="l", col="forest green",ylab="",xlab="", yaxt="n")
    axis(2, at=snowpeaks, labels=snowpeaks, col.axis="blue", col.lab="blue", las=2)
    axis(4, at=ryax, col.axis="black", col.lab="forest green", las=2)
    mtext("Biomass (kg C per ha)", col.lab="forest green", side=4,las=0)
    title(main="Peak SWE and Biomass",xlab="Year", ylab="Peak SWE (in)")
    legend("bottomleft", inset=c(-0.2, -0.5), col=c("blue","forest green"),lty=1,legend=c("Peak SWE","Biomass"))
    par(xpd=TRUE)






par(new=F)
axis(1:2, at = NEEBiomassYear)
axis(4, line =5)
mtext("Biomass (kg C per ha)",4, line=6.5, col="Forest Green", las=3)
axis(2, at=z,labels=cutmeanAnnNEE, col.axis="red", las=2)
title(main="NEE and Biomass versus year", xlab="Year")
axis(4, at=cutBiomass, labels=cutBiomass, col="Forest Green")
  axis(4, at = NULL, labels = TRUE, tick = TRUE, line = 1,
       pos = NA, outer = FALSE, font = NA, lty = "solid",
       lwd = 1, lwd.ticks = lwd, col = NULL, col.ticks = NULL,
       hadj = NA, padj = NA)
