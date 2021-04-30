rm(list=ls(all=T))
library(rworldmap)
library(ncdf4)
library(fields)
library(SPEI)
install.packages("rworldxtra")
library(rworldxtra)

setwd("C:/Users/User/Documents/UniversitatBONN/Courses/Thesis/EthiopiaThesis_Data/Data/GPCC_Data/RawData") ### CHANGE 
nc<-nc_open("full_data_monthly_v2018_025.nc")
nc
#---------------------The Bounding box for Ethiopia
## Get the related bounding box for Ethiopia in the datasets using the code below
##Xmin LongMin
which(lons=="33.125")
#XmasLongMax
which(lons=="47.875")
#ymin LatMin
which(lats== "3.375")
##ymax LatMax
which(lats== "14.875")

#-----------------------Get the long, lat and precipitaton 
#The start contaings the equivalent value of the longmin(853), latmax(301) and Timealue(1510) in the datasets

lons <- ncvar_get(nc, "lon")
lats <- ncvar_get(nc, "lat")
Time <- ncvar_get(nc, "time")
PR <- ncvar_get(nc, "precip", start=c(853,301, 1510), count=c(60,47,1))
dim(PR)


tmp_slice<-PR
lons_n<-lons[853:912]
dim(lons_n)
lats_n<-lats[347:301]
dim(lats_n)

print(lats_n)

#revert lat
#lat_rev <- rev(lats_n)
graphics.off()
image(lons_n,lats_n,tmp_slice)


#--------------------How to get the long and lat figure
#1. first get the bunding box long max and min, then lat max and min

##Nigeria

xmin <-which(lons=="33.125"); ymin<- which(lats== "3.375")
xmax<-which(lons=="47.875"); ymax<- which(lats== "14.875")


#------------------Plot map -------------------------
#To OPen up a saveale and large map use, x11(). 
x11()
newmap <- getMap(resolution = "high")
image.plot(lons[853:912],lats[347:301],PR)                                        
plot(newmap, add=TRUE)

#-------------  SPEI Computation  -------------------

SPI3 <- array(NA,c(50,40,1512))

for (x in 1:50){
  for (y in 1:40){
    
    pp <- ts(PR[x,y,], freq=12, start=c(1900,1))     

# agregation period and Baseline need to be chosen 

        SPI <- spi( pp, 3, ref.start = c(1980,1), ref.end = c(2010,12), na.rm = TRUE) 
    
    SPI3[x,y,] <- as.vector(SPI$fitted[1:1512,1])
    
  }}

#----------------- Plot SPI for some months --------

image.plot(lons[853:912],lats[301:347],PR[,40:1,50])                                              
plot(newmap, add=TRUE)



