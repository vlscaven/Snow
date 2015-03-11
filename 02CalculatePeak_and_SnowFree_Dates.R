
####Example of a loop from Mike's course
# NT = 100        ## number of time steps
# N0 = 1              ## initial population size
# r = 0.2             ## population growth rate
# K = 10              ## carrying capacity
# N = rep(N0,NT)
# for(t in 2:NT){
#   N[t] = N[t-1] + r*N[t-1]*(1-N[t-1]/K)    ## discrete logistic growth
# }
# plot(N)

#define object SWE as the SWE in Inches from the SNOWnwt dataframe
SWE = SNOWnwt$SWE_in
#define Yind (year index) from the first to the last Water Year
Yind=(min(wateryear):max(wateryear))
#limits
N0=min(Yind)
NT=max(Yind)
#define starting year
syear=min(Yind)
#allocate size of each of the quantities to be calculated
snowpeaks = rep(1,length(Yind))
PeakSWEday = rep(1,length(Yind))
PeakSWEDate = rep(1,length(Yind))

##
## Loop to calculate similar quantities on all years

for(t in 1:length(Yind)){
  Yt = t-1+syear #Yt used to just convert from timestep of loop (t) to a year
  snowpeaks[t]=max(SWE[wateryear==(Yt)]) #within each wateryear calculate max SWE
  tempdate =rDate[wateryear==(Yt)] #assign a temporary date (this wateryear)
  PeakSWEday[t]=max((tempdate[SWE[wateryear==Yt]==(snowpeaks[t])])) #calculate the LATEST date of max SWE within this year
  
}
PeakSWEDate=as.Date(PeakSWEday,origin = "1970-01-01") #convert dates into rDate format

snowpeaks=max(SWE[wateryear==1994+1])
tempdate =rDate[wateryear==1994+1]
PeakSWEday = max((tempdate[SWE[wateryear==1994+1]==(snowpeaks)]))
