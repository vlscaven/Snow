
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

snowpeaks_inc = snowpeaks_inc1[Year_inc1<maxYearINCnwt+1]
SnowMeltWindow_inc = SnowMeltWindow1[Year_inc1<maxYearINCnwt+1]
Year_inc = Year_inc1[Year_inc1<(maxYearINCnwt+1)]
