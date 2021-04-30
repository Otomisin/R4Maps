#Cleaning work space
rm(list=ls())

install.packages("raster") # you only have to do this once
install.packages("rgdal")  # you only have to do this once
install.packages("rasterVis")
install.packages("sp")

library(raster)
library(rgdal)
library(rasterVis)
library(sp)
##set your working directory##

setwd("C:/Users/User/Documents/UniversitatBONN/Courses/Thesis/01_DataEthiopia/EthiopiaThesis_Data/DHI/SPEI/SPEI_MA/SPEI6_ETH_March_August_nan_1980_2019Last/2Decades/Masked/MSE")
getwd
list.files()

################################################
## load raster and take a look at the summary ##
################################################

SPEI_MA2000_mask<- raster("SPEI_MA2000_mask.tif")
SPEI_MA2001_mask<- raster("SPEI_MA2001_mask.tif")
SPEI_MA2002_mask<- raster("SPEI_MA2002_mask.tif")
SPEI_MA2003_mask<- raster("SPEI_MA2003_mask.tif")
SPEI_MA2004_mask<- raster("SPEI_MA2004_mask.tif")
SPEI_MA2005_mask<- raster("SPEI_MA2005_mask.tif")
SPEI_MA2006_mask<- raster("SPEI_MA2006_mask.tif")
SPEI_MA2007_mask<- raster("SPEI_MA2007_mask.tif")
SPEI_MA2008_mask<- raster("SPEI_MA2008_mask.tif")
SPEI_MA2009_mask<- raster("SPEI_MA2009_mask.tif")
SPEI_MA2010_mask<- raster("SPEI_MA2010_mask.tif")
SPEI_MA2011_mask<- raster("SPEI_MA2011_mask.tif")
SPEI_MA2012_mask<- raster("SPEI_MA2012_mask.tif")
SPEI_MA2013_mask<- raster("SPEI_MA2013_mask.tif")
SPEI_MA2014_mask<- raster("SPEI_MA2014_mask.tif")
SPEI_MA2015_mask<- raster("SPEI_MA2015_mask.tif")
SPEI_MA2016_mask<- raster("SPEI_MA2016_mask.tif")
SPEI_MA2017_mask<- raster("SPEI_MA2017_mask.tif")
SPEI_MA2018_mask<- raster("SPEI_MA2018_mask.tif")
SPEI_MA2019_mask<- raster("SPEI_MA2019_mask.tif")

SPEI_NaN_year_ETH_2001<-raster("SPEI_NaN_year_ETH_2001.tif")
plot(SPEI_MA2019_mask)
summary(SPEI_MA2019_mask)

#Load Ethiopia Shapefile
Eth_shp0 <- readOGR(dsn = ".", layer = "ETH_adm0")
Eth_shp1 <- readOGR(dsn = ".", layer = "ETH_adm1")

plot(Eth_shp1, bg = "transparent", add = TRUE)
#####################################################
## remove all values above -1 from raster image   ###
## view summary of raster and plot raster         ###
## visualize moderate, sever and extreme drought  ###
#####################################################

SPEI_NaN_year_ETH_2001[SPEI_NaN_year_ETH_2001>(-1)]<-NA

SPEI_MA2000_mask[SPEI_MA2000_mask>(-1)]<- NA
SPEI_MA2001_mask[SPEI_MA2001_mask>(-1)]<- NA
SPEI_MA2002_mask[SPEI_MA2002_mask>(-1)]<- NA
SPEI_MA2003_mask[SPEI_MA2003_mask>(-1)]<- NA
SPEI_MA2004_mask[SPEI_MA2004_mask>(-1)]<- NA
SPEI_MA2005_mask[SPEI_MA2005_mask>(-1)]<- NA
SPEI_MA2006_mask[SPEI_MA2006_mask>(-1)]<- NA
SPEI_MA2007_mask[SPEI_MA2007_mask>(-1)]<- NA
SPEI_MA2008_mask[SPEI_MA2008_mask>(-1)]<- NA
SPEI_MA2009_mask[SPEI_MA2009_mask>(-1)]<- NA
SPEI_MA2010_mask[SPEI_MA2010_mask>(-1)]<- NA
SPEI_MA2011_mask[SPEI_MA2011_mask>(-1)]<- NA
SPEI_MA2012_mask[SPEI_MA2012_mask>(-1)]<- NA
SPEI_MA2013_mask[SPEI_MA2013_mask>(-1)]<- NA
SPEI_MA2014_mask[SPEI_MA2014_mask>(-1)]<- NA
SPEI_MA2015_mask[SPEI_MA2015_mask>(-1)]<- NA
SPEI_MA2016_mask[SPEI_MA2016_mask>(-1)]<- NA
SPEI_MA2017_mask[SPEI_MA2017_mask>(-1)]<- NA
SPEI_MA2018_mask[SPEI_MA2018_mask>(-1)]<- NA
SPEI_MA2019_mask[SPEI_MA2019_mask>(-1)]<- NA


#Export

writeRaster(SPEI_MA2000_mask, filename = "SPEI_MA2000_Mask_MSE.tiff",format="GTiff")

plot(SPEI_MA2000_mask)
summary(SPEI_MA2018_mask_MSE)

writeRaster(SPEI_MA2000_mask, filename = "SPEI_MA2000_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2001_mask, filename = "SPEI_MA2001_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2002_mask, filename = "SPEI_MA2002_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2003_mask, filename = "SPEI_MA2003_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2004_mask, filename = "SPEI_MA2004_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2005_mask, filename = "SPEI_MA2005_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2006_mask, filename = "SPEI_MA2006_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2007_mask, filename = "SPEI_MA2007_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2008_mask, filename = "SPEI_MA2008_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2009_mask, filename = "SPEI_MA2009_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2010_mask, filename = "SPEI_MA2010_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2011_mask, filename = "SPEI_MA2011_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2012_mask, filename = "SPEI_MA2012_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2013_mask, filename = "SPEI_MA2013_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2014_mask, filename = "SPEI_MA2014_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2015_mask, filename = "SPEI_MA2015_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2016_mask, filename = "SPEI_MA2016_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2017_mask, filename = "SPEI_MA2017_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2018_mask, filename = "SPEI_MA2018_Mask_MSE.tiff",format="GTiff")
writeRaster(SPEI_MA2019_mask, filename = "SPEI_MA2019_Mask_MSE.tiff",format="GTiff")


########################################
## Stack all Raster Image ##############
########################################
#Stacking a raster image
# https://bit.ly/3c98vTW
path<- setwd("C:/Users/User/Documents/UniversitatBONN/Courses/Thesis/01_DataEthiopia/EthiopiaThesis_Data/DHI/SPEI/SPEI_MA/SPEI6_ETH_March_August_nan_1980_2019Last/2Decades/Masked/MSE")
list.files( path, pattern = "*.tif$") #List only tif files
AllTiff<- list.files( path, pattern = "*.tif$") # Parse the list of tif files
StackAll<- raster::stack(AllTiff) #Stack all raster
StackAll@layers # Check rhe list of the stacked raster file and other information, such as dimensions, min and max values
summary(StackAll)

plot(StackAll, col = color)
plot(StackAll$SPEI_MA2017_Mask_MSE, col = color)
plot(Eth_shp1, bg = "transparent", add = TRUE)


#############################################################
## Reclassify and unstack raster; Extreme (3), Severe(2), Moderate (1) #
#############################################################

StackAll_reclass <- reclassify(StackAll, c(-3.00, -2.00, -3, -2.00, -1.50 , -2, -1.50, -0.99, -1)) #Reclassify all stacked
plot(StackAll_reclass)

Listofraster<- unstack(StackAll_reclass)
plot(Listofraster[[1]]) # Plot the fist(2000) on the laster


##################
#Downscaling the resolution ##########
#####################

#load the cropland
Cropland<- raster("Cropland_2000.tif")
plot(Cropland)
SPEI_New_resolu <- resample(Cropland, drought_raster50m, method="ngb")


#x11() optional for graphic window
plot(SPEI_NaN_year_ETH_2001,col = color, axis.arg = arg)

  
x11()
par(mfrow=c(2,3))
plot(a,col = color, axis.arg = arg,main="2001",legend=F)
plot(b,col = color, axis.arg = arg,main="2002",legend=F)
plot(c,col = color, axis.arg = arg,main="2003",legend=F)
plot(a,col = color, axis.arg = arg,main="2004",legend=F)
plot(b,col = color, axis.arg = arg,main="2005",legend=F)
###Adding legend
plot(c,col = color, axis.arg = arg,legend.only=T, box=F)

###################################
#### Resampling Raster#############
###################################
crop_raster _50m<-resample(crop_raster300m, drought_raster50m, method="ngb")



 
