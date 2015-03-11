#total Precip accumulated (solid), SWE (long dash) and Precip increment each year
for( i in min(wateryear):max(wateryear)){
  
x1=rDate[wateryear==(i)]
y3=SNOWnwt$PrecInc_in[wateryear==(i)]
y2=SNOWnwt$SWE_in[wateryear==(i)]
y1=SNOWnwt$PrecAcc_in[wateryear==(i)]

plot(y1~x1,ann=FALSE,type="n")
lines(y1~x1,lwd=2)
lines(y2~x1,lwd=2,lty=2)
lines(y3~x1,lwd=2,lty=3)
title("Snow accumulation",xlab="Date",ylab="Precipitation")
}



