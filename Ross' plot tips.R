#parameter for the graph to be made.  Here I specify the margins, where I want the tics, and how I would like the axis labels arranged.  For more info type ?par into the console
par(mar=c(5, 4, 4, 9) + 0.1,tck=0.025, las=1)

#just setting up the line plot.  I've definined my w adn y limits, as well as given it a main title.  You can also designate the ylabel (ylab).  For multiple plots you want the first axis to be drawn so axes=T.  cex defines the font size of the graph.  For posters and presentations make things at least cex=2 so that people can see them
plot(vuf.mean.diff.area*.35*1000 ~ Year, data = vuf.allometric.full, type="l", lwd=2, xlim= c(2000,2015), ylim= c(0,900), main = "VUF Incremental Biomass vs. VCM GPP", ylab="Mean biomass increment (gC*m^-2)", axes=T, cex=2)

#making a new plot
par(new=T)

#plotting new plot, but now drawing the axes (axes=F), as I will add them to the right side of hte graph later.  Making the xlim and ylim align so that they can be read on the same scale
plot(vuf.mean.diff.area*.35*1000 ~ Year, data = vuf.allometric.full, xlim= c(2000,2015), ylim= c(0,900), pch=19, axes=F, ylab="", xlab="", cex=2)

#here you can define what you would like the axes to read
axis(1:2, at = c(1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020))

#turning off axes on the top
axis(3, labels=F)

#adding a horizontal dashed line to the graph
abline(h=mean(vuf.allometric.full$vuf.mean.diff.area*0.35*1000, na.rm=T), col = "red", lty="dashed", lwd=2)

#new graph
par(new=T)

#adding another plot
plot(vuf.all.count ~ Year, data = vuf.allometric.full, type="l", xlim= c(2000,2015), axes=F, col= "Forest Green", xlab="", ylab="")

#adding an axis on the right side of the graph
axis(4, line =5)

#mtext will let you add a label on the right side, 4 = right side of grapgh
mtext("Sample Depth (Tree)",4, line=6.5, col="Forest Green", las=3)
