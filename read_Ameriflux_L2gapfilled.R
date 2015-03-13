#Purpose: To read a set of L2 Ameriflux files and cat them together
#Author: davidjpmoore@email.arizona.edu
#Date: 03/11/2015
#to do - generalize code to create a function where you could pass the working directory and output the concantenated file.

# set working directory
#data is located on iPlant and available from Ameriflux
#setwd("D:/Sites_DOE/AmeriFlux/Niwot Ridge/L2_gap_filled/V008") #Francesc's data structure
#setwd("C:/Users/dmoore1/Dropbox/rProjectsShare/Snow/data/FluxData/") #Dave's data structure laptop
#setwd("D:/Dropbox/rProjectsShare/Snow")  #Dave's data structure desktop
#Remove ALL DATAFRAMES FROM THE ENVIRIONMENT 
rm (list=ls()) #the only way I could work out how to bind all the new files together is to create a list of all dataframes in the environment after the loop | for safety I clear all variables at the outset.
# 

# read all the .csv files in the working directory (L2 gap filled) available for NR1 (1998-2013)
#USES RELATIVE PATH to data/FluxData
tempFilelist = list.files(path = "data/FluxData/",pattern="*.csv")

#loop through each element of the list of files and assigns until length(tempFilelist)
#can't figure out how to read lines 18 and 19 as headers using this approach
for (i in 1:3) {
  assign(substr(tempFilelist[i], 5, 14), read.csv(file = paste0("data/FluxData/",tempFilelist[i]),skip=20,header=FALSE, na.strings=c('-9999','-6999'), stringsAsFactors=FALSE))  
}


#custom function that returns a list of all dataframes in the environment
#function origin:Bill Dunlap http://comments.gmane.org/gmane.comp.lang.r.general/312495 
#I would RATHER create the list from the loop but I haven't been able to work that out.
#The use of finddataframes (below) requires that there are NO OTHER data frames in the environment *rm (list=ls())*
finddataframes <- function(envir = globalenv()) {
  tmp <- eapply(envir,
                all.names=TRUE,
                FUN=function(obj) if (is.data.frame(obj))
                  obj else NULL)
  # remove NULL's now
  tmp[!vapply(tmp, is.null, TRUE)]
}

#uses function 
allDataFrames <- finddataframes(globalenv()) # or just finddataframes()
#combines all the dataframes using rbind
#names the new dataframe with Ameriflux code max 5 characters (without the years)
# assign(substr(tempFilelist[1], 5, 9), do.call("rbind", allDataFrames))
assign("aggFluxtemp", do.call("rbind", allDataFrames))

#name that I just assigned to the dataframe
CombinedDataFrame=substr(tempFilelist[1], 5, 9)

#Read header from file
AmFluxheader=read.csv(file = paste0("data/FluxData/",tempFilelist[i]),skip=17, strip.white=TRUE, nrows=1 ,header=FALSE, na.strings=c('-9999','-6999'),stringsAsFactors=FALSE)
AmerifluxCols = as.list(AmFluxheader)

#Read Units
AmFluxUnits= read.csv(file = paste0("data/FluxData/",tempFilelist[i]),skip=18, nrows=1 ,header=FALSE, na.strings=c('-9999','-6999'), stringsAsFactors=FALSE)

colnames(AmFluxUnits)=AmerifluxCols
#add column names to new dataframe
#colnames(USNR1) <- AmerifluxCols #works but I'd rather not hard code 'USNR1'
colnames(aggFluxtemp) <- AmerifluxCols #works but I'd rather not hard code 'USNR1'
assign(substr(tempFilelist[1], 5, 9), aggFluxtemp)

#     save (USNR1, file="USNR1_cat.dat", ascii = TRUE)
#     write.csv(USNR1, file="USNR1.csv", quote=FALSE, row.names=FALSE)
#     save(USNR1, file="USNR1.rda")

#Creating output file for EddyData
# 
# Year  DoY	Hour	NEE	LE	H	Rg	Tair	Tsoil	rH	VPD	Ustar
# -	-	-	umolm-2s-1	Wm-2	Wm-2	Wm-2	degC	degC	%	hPa	ms-1
# 1998	1	0.5	-1.21	1.49	-11.77	0	7.4	4.19	55.27	4.6	0.72
# 1998	1	1	1.72	3.8	-13.5	0	7.5	4.2	55.95	4.6	0.52
# 1998	1	1.5	-9999	1.52	-18.3	0	7.1	4.22	57.75	4.3	0.22
# 1998	1	2	-9999	3.94	-17.47	0	6.6	4.23	60.2	3.9	0.2
# 1998	1	2.5	2.55	8.3	-21.42	0	6.6	4.22	59.94	3.9	0.33
# 
# Eddyout = c(aggFluxtemp$Year)



