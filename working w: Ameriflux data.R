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

plot(NEEBiomassYear, cutBiomass, type="l", col="Forest Green",axes=F, ylab="", xlab="", cex=2)
par(new=T)
plot(NEEBiomassYear, cutmeanAnnNEE, type="l",col="red", axes=F, ylab="", xlab="", cex=2)
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
