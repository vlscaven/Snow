
#load data using read table into a dataframe called "INCnwt"
INCnwt = read.table("data/site_biomass_increment_recon_plotB_kg_per_ha.txt", head=TRUE, sep="\t")
#Data came from Flurin Babst via email 
#TODO place data on iPlant with README file. 
#NOTE on first read there was a missing TAB between Year and all in header

Allfrom82= INCnwt$all[INCnwt$Year>1981]
firfrom82= INCnwt$fir[INCnwt$Year>1981]
pinefrom82= INCnwt$pine[INCnwt$Year>1981]
sprucefrom82= INCnwt$spruce[INCnwt$Year>1981]
YearINCnwt= INCnwt$Year[INCnwt$Year>1981]
maxYearINCnwt= max(YearINCnwt)

snowpeaks_inc1 = snowpeaks[1981<Yind]
SnowMeltWindow1 = SnowMeltWindow[1981<Yind]
Year_inc1 = Yind[1981<Yind]
#define SnowMeltWindow
SnowMeltWindow=SNOTELsummary$PeakSWEDate-SNOTELsummary$ZeroSWEdate
SnowMeltWindow[SNOTELsummary$Yind>1981]
abs(SnowMeltWindow[SNOTELsummary$Yind>1981])
SnowMeltWindow1<-abs(SnowMeltWindow[SNOTELsummary$Yind>1981])
SnowMeltWindow1

snowpeaks_inc = snowpeaks_inc1[Year_inc1<maxYearINCnwt+1]
SnowMeltWindow_inc = SnowMeltWindow1[Year_inc1<maxYearINCnwt+1]
Year_inc = Year_inc1[Year_inc1<(maxYearINCnwt+1)]
snowpeaks_inc
SnowMeltWindow_inc
INCnwt$Year

#extract biomass data from 1981-2012
RelTreeRingData<-INCnwt$all[INCnwt$Year>1980]
RelTreeRingData
plot(RelTreeRingData)
plot(INCnwt$Year[INCnwt$Year>1980], RelTreeRingData)
Biomass<-RelTreeRingData
biomassYear<-INCnwt$Year[INCnwt$Year>1980]
plot(INCnwt$Year[INCnwt$Year>1980], Biomass)
plot(INCnwt$Year[INCnwt$Year>1980], Biomass)
plot(Biomass, snowpeaks[Yind<2013])
plot(Yind, snowpeaks)
plot(biomassYear, Biomass)


#need to take 2013-2015 out of snowpeaks to be able to plot against biomass, biomass only goes through 2012
plot(Yind[Yind<2013], snowpeaks[Yind<2013])

####plotting two variables on the same plot
#copied from https://stat.ethz.ch/pipermail/r-help/2007-October/144218.html
> plot(mat,a,type="l",col="red",ylim=c(0,1))
> lines(mat,b,col="green")
> lines(mat,c,col="blue")

#playing around with copied code
plot(biomassYear,snowpeaks[Yind<2013], type="l", col="red")
lines(biomassYear,Biomass, type="l", col="blue")

> yrange<-range(c(datavector1,datavector2,datavector3))
> plot(datavector1,type="l",ylim=yrange,col=2)
lines(datavector2,type="l",col=3)

#copied code from http://cran.r-project.org/doc/contrib/Lemon-kickstart/kr_addat.html
> plot(6:25,rnorm(20),type="b",xlim=c(1,30),ylim=c(-2.5,2.5),col=2)
> par(new=T)
> plot(rnorm(30),type="b",axes=F,col=3)
> par(new=F)
#playing around 
plot(biomassYear, snowpeaks[Yind<2013], type="l", col="red")
par(new=T)
plot(Biomass, type="l", cold="blue")
par(new=F)

#copied code
> plot(rnorm(100),type="l",col=2)
> lines(rnorm(100),col=3)

#playing around
plot(biomassYear, snowpeak[Yind<2013],type="l", col="red")
lines(Biomass, type="l", col="blue")



