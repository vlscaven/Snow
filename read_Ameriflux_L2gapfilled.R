#Purpose: To read a set of L2 Ameriflux files and cat them together
#Author: davidjpmoore@email.arizona.edu
#Date: 03/11/2015
#to do - generalize code to create a function where you could pass the working directory and output the concantenated file.

# set working directory
#data is located on iPlant and available from Ameriflux
#setwd("D:/Sites_DOE/AmeriFlux/Niwot Ridge/L2_gap_filled/V008") #Francesc's data structure
setwd("C:/Users/dmoore1/Dropbox/rProjectsShare/Snow/data/FluxData/") #Dave's data structure

#Remove ALL DATAFRAMES FROM THE ENVIRIONMENT 
rm (list=ls()) #the only way I could work out how to bind all the new files together is to create a list of all dataframes in the environment after the loop | for safety I clear all variables at the outset.

#Column Names for Ameriflux format - took list from Francesc's code
AmerifluxCols = list("YEAR", "GAP", "DTIME", "DOY", "HRMIN", "UST", "TA", "WD", "WS", "NEE", "FC", "SFC", "H", "SH", "LE", "SLE", "FG", "TS1", "TSdepth1", "TS2", "TSdepth2", "PREC", "RH", "PRESS", "CO2", "VPD", "SWC1", "SWC2", "Rn", "PAR", "Rg", "Rgdif", "PARout", "RgOut", "Rgl", "RglOut", "H2O", "RE", "GPP", "CO2top", "CO2height", "APAR", "PARdif", "APARpct", "ZL")
#note it would be better to read the list of column names from a file rather than hardcoding them

# read all the .csv files in the working directory (L2 gap filled) available for NR1 (1998-2013)
tempFilelist = list.files(pattern="*.csv")

#loop through each element of the list of files and assigns 
for (i in 1:length(tempFilelist)) {
  assign(substr(tempFilelist[i], 5, 14), read.csv(tempFilelist[i],skip=20,header=FALSE))  
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
assign(substr(tempFilelist[1], 5, 9), do.call("rbind", allDataFrames))

#name that I just assigned to the dataframe
CombinedDataFrame=substr(temp[i], 5, 9)

#add column names to new dataframe
#hard coding the name of the dataframe works fine
colnames(USNR1) <- AmerifluxCols #works but I'd rather not hard code 'USNR1'

#attempt to add list of colnames to combined dataframe
#colnames(eval(CombinedDataFrame))=AmerifluxCols # error
#I think I have to use assign and do.call again INSTEAD of colnames;

# assign(substr(temp[1], 5, 9), do.call("colnames", AmerifluxCols)) #gives an error

