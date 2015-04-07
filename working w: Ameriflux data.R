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
plot(Biomass, meanAnnNEE)

plot(biomassYear, snowpeaks[Yind<2013], type="l", col="blue", ylab="")
par(new=T)
plot(biomassYear, Biomass, type="l", col="green",ylab="")
par(new=F)

summary(Biomass)
Ameriflux$fYear
