
#load data using read table into a dataframe called "SNOWnwt"
SNOWnwt = read.table("data/SNOTELNiwot Tue Mar 10 2015.txt", head=TRUE, sep=",")
#SNOTELNiwot Tue Mar 10 2015.txt was downloaded from SNOTEL site see README file

#asking R to read the date as a date;
rDate=as.Date(SNOWnwt$Date)

#create variable "Year" from the date
Year=as.numeric(format(rDate, "%Y"))

#calculating annual snow totals
snowpeaks_ann=tapply(SNOWnwt$Snow.Water.Equivalent..in.,fdate,max)
snowsum_ann=tapply(SNOWnwt$Snow.Water.Equivalent..in.,fdate,sum)
barplot(tapply(snowpeaks_ann,Year,mean))

#defining the wateryear and waterdate
waterdate=SNOWnwt$rDate+90
wateryear=as.numeric(format(waterdate, "%Y"))

#caculate wateryear snow totals
snowpeaks=tapply(SNOWnwt$Snow.Water.Equivalent..in.,wateryear,max)
snowsum=tapply(SNOWnwt$Snow.Water.Equivalent..in.,wateryear,sum)

#simple plots
barplot(tapply(snowpeaks,wateryear,mean))
plot(snowsum,snowpeaks)

#TO DO merge new data vectors to SNOWnwt and store for later use

