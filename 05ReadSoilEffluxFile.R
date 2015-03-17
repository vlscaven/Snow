#Purpose: To load the cleaned Soil Efflux Data from Licor into R data frame
#Author : Dave Moore
#Date: 03/16/2015
#
#
#load data using read table into a dataframe called "rSoilNWT2008"
rSoil2008 = read.table("data/EffluxData//rSoil_summer08_raw.csv", na.strings=c('.'), stringsAsFactors=FALSE, head=TRUE, sep=",")
#rSoil_summer08_raw.csv was uploaded to iPlant as a test

#input file asks r to assign data with characters in it as char - NOT FACTORS |stringsAsFactors=FALSE | but Treatment is a factor - here I'm pulling Treatment from rSoil2008$Treatment just to play around.  
rSoil2008$Treatment=as.factor(rSoil2008$Treatment)

#simple plots
plot (Treatment,rSoil2008$EFFLUX)
plot (rSoil2008$Tair,rSoil2008$EFFLUX)

# rDate =as.Date(rSoil2008$Date)
year=as.numeric(substr(rSoil2008$Date, 1,4))
month = as.numeric(substr(rSoil2008$Date, 5,6))
day = as.numeric(substr(rSoil2008$Date, 7,8))

#define a date that R understands as a date
rDate = ISOdate(year,month,day)
#define 
Day1 = ISOdate(year,1,1) #- 1  #cause dave might be wrong

#calculate the number of days from Jan 1 of the year to the measurement date
Doy = rDate - Day1
