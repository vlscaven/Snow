#exporting SNOTELsummary table

write.table(mydata, "c:/mydata.txt", sep="\t")

write.table(SNOTELsummary, "/Users/vlscaven/Desktop")

###converting first day of no snow (spring start dates) into days of year

DoY<-strptime(ZeroSWEdate), "%Y-%m-%d")$yday+1

##plot of SWE versus first day of growing season
cmsnowpeaks<-snowpeaks[Yind<2015]*2.54


plot(cmsnowpeaks, doyZeroSWE[Yind<2015], ylab="", xlab="")
text(cmsnowpeaks, doyZeroSWE[Yind<2015], labels=Yind, cex=0.5, pos=3)
title(main="Peak SWE vs First Day of Zero Snow Cover",xlab="Annual Peak SWE (cm)", ylab="First Day of Zero Snow Cover (DOY)")

####plot of first day of zero snow versus biomass
plot(doyZeroSWE[Yind<2013],fixbiomass, ylab="", xlab="")
text(doyZeroSWE[Yind<2013], fixbiomass, labels=doyZeroSWE, cex=0.5, pos=3)
title(main="First Day of Zero Snow Cover vs Biomass",xlab="First Day of Zero Snow Cover(DOY)", ylab="Annual Biomass (g of C per m^2)")

cor.test(doyZeroSWE[Yind<2013], fixbiomass)

#######correlations

library(Hmisc)
cor(cmsnowpeaks, doyZeroSWE[Yind<2015])

rcorr(cmsnowpeaks, doyZeroSWE[Yind<2015], type="pearson")

cor.test(cmsnowpeaks,doyZeroSWE[Yind<2015])

##plot of precip and SWE vs biomass


###plot of LE vs time
#copied from Ameriflux data workup
library(lubridate)
fluxDates<-format(date_decimal(Ameriflux$Time..decimal.year.), "%Y-%m-%d")
Ameriflux$fluxDates<-fluxDates

#formatting LE dates into R-happy dates
library(lubridate)
leDates<-format(date_decimal(Ameriflux$Time..decimal.year.), "%Y-%m-%d" )
LE.data$leDates<-leDates

LDate<-as.Date(leDates)
LDate

LYear<-(format(LDate, "%Y"))

#finding mean LE for each year
meanAnnLE<-tapply(LE.data$LE_fill..W.m2., LYear, mean )
meanAnnLE

#trimming precipitation down to compare
trimPrecip<-SNOTELsummary$PrecAcc_in_total[SNOTELsummary]