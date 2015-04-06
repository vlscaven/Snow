##working with Ameriflux data
#Tori Scaven
#4/6/15



##need to convert year decimals to rDates:

#code copied from http://stackoverflow.com/questions/26965699/converting-date-in-year-decimal-form-in-r
x <- c(1988.0, 1988.25, 1988.5, 1988.75)
library(lubridate)
(f <- format(date_decimal(x), "%d-%m-%Y"))

#playing around
library(lubridate)
fluxDates<-format(date_decimal(Ameriflux$Time..decimal.year.), "%d-%m-%Y")
Ameriflux$fluxDates<-fluxDates
