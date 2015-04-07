#exporting SNOTELsummary table

write.table(mydata, "c:/mydata.txt", sep="\t")

write.table(SNOTELsummary, "/Users/vlscaven/Desktop")

###converting first day of no snow (spring start dates) into days of year

DoY<-strptime(ZeroSWEdate), "%Y-%m-%d")$yday+1

##plot of SWE versus first day of growing season

plot(snowpeaks[Yind<2015], doyZeroSWE[Yind<2015], ylab="", xlab="")
text(snowpeaks[Yind<2015], doyZeroSWE[Yind<2015], labels=Yind, cex=0.5, pos=3)
title(main="Peak SWE vs First Day of Zero Snow Cover",xlab="Annual Peak SWE (in)", ylab="First Day of Zero Snow Cover (DOY)")

cor(snowpeaks[Yind<2015], doyZeroSWE[Yind<2015])

##plot of precip and SWE vs biomass


###plot of LE vs time

