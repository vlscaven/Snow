#Purpose: To load the SNOTEL DATA INTO A DATAFRAME
#Author : Dave Moore
#Date: 03/13/2015
#
#
#load data using read table into a dataframe called "SNOWnwt"
SNOWnwt = read.table("data/SNOTELNiwot Tue Mar 10 2015.txt", head=TRUE, sep=",")
#SNOTELNiwot Tue Mar 10 2015.txt was downloaded from SNOTEL site see README file

#asking R to read the date as a date;
rDate=as.Date(Niwotdaily$Date)

#create variable "Year" from the date
Year=as.numeric(format(rDate, "%Y"))

#calculating annual snow totals
snowpeaks_ann=tapply(Niwotdaily$Snow.Water.Equivalent..in.,Year,max)
snowsum_ann=tapply(Niwotdaily$Snow.Water.Equivalent..in,Year,sum)



#defining the wateryear and waterdate
waterdate=rDate+92
wateryear=as.numeric(format(waterdate, "%Y"))


Yind=(min(wateryear):max(wateryear))
barplot(tapply(Niwotdaily$Snow.Water.Equivalent..in.,Year,sum))
barplot(snowpeaks_ann)
barplot(snowsum_ann)
#caculate wateryear snow totals
snowpeaks=tapply(Niwotdaily$Snow.Water.Equivalent..in.,wateryear,max)
snowsum=tapply(Niwotdaily$Snow.Water.Equivalent..in.,wateryear,sum)
prec_acc=tapply(Niwotdaily$Precipitation.Accumulation..in.,wateryear,sum)


#simple plots
barplot(tapply(Niwotdaily$Snow.Water.Equivalent..in.,wateryear,max))
plot(snowsum,snowpeaks)
cor(snowsum, snowpeaks)
#quick plot showing how cummulative SWE for the year and water year differ
plot(snowsum_ann,prec_acc)


#TO DO: I've made a mess and made a lot of variables in the global environment  merge new data vectors to SNOWnwt and store for later use

