rm(list = ls())


install.packages("ggspatial")
install.packages("ggrepel")
install.packages("googleway")
install.packages("rnaturalearthdata")
install.packages("rnaturalearth")
install.packages("sf")
install.packages("libwgeom")
install.packages("sp")
install.packages("rgeos")
install.packages("dplyr")
install.packages("classInt")
install.packages("tmap")

library("ggspatial")
library("ggrepel")
library("googleway")
library("rnaturalearthdata")
library("rnaturalearth")
library("sf")
library("libwgeom")
library("sp")
library("rgeos")
library("dplyr")
library("classInt")
library("tmap")
library("spplot")
library(tidyr)
library(readxl)
library(plyr)
library(tidyverse)
library(purrr)
library(tibble)
library(data.table)


getwd()
setwd("C:/Users/User/Documents/SkillsIT/R/MultipleMaps")

#Read in Shape file
GDMaps<- st_read("G:/My Drive/JOBS/EVES/EVES_c/Shapefile/GDMap.shp")
names(GDMaps)
head(GDMaps)

#Read in excel
GDExcel<- read_excel("G:/My Drive/JOBS/EVES/EVES_c/GlobalDroguht_Risk_TimeSeriesR.xlsx", sheet = "GD_Countries_Risk4VizM") #Read in Excel
names(GDExcel)

warnings()


## Merge Excel and Shapefile
GDMergedfile<- merge(GDMaps,GDExcel, by.x = "ADM0_A3", by.y = "ADM0_A3")

#GDMergedfilex<- merge(GDMaps,GDExcel, by.x = "ADM0_A3", by.y = "ADM0_A3", all.x = TRUE)


View(GDMergedfilex)
View(GDMergedfileall)

names(GDMergedfile)

GDMergedfile$ADM0_A3

#Filter Exel
#DataDVR  <- Mergedfile %>% select(-(S_WAT: S_EMP),-Shape_Leng )
#names(DataDVR)
#View(DataDVR)

#Visualization xxxxxxxxx
plot(DataDVR ["SOC"], main = "Vulnerability Map")

tm_shape(Mergedfile2["SOC"])+ tm_polygons() #Testing this

#Visualize maps 
#https://spatialanalysis.github.io/lab_tutorials/4_R_Mapping.html#common-map-classifications
#https://geocompr.github.io/post/2019/tmap-color-scales/#k-means-clustering
#https://rkabacoff.github.io/datavis/


#Risk Risk(Risk(IrrigatedxVul))
tmap_mode("plot") #Set tmap to ploting
tm_shape(GDMergedfile) + tm_polygons(col = "Risk(IrrigatedxVul)",n=5 , style = "equal", title= "Risk Legend (Rainfed)", palette= "YlOrRd")+ tm_facets(by = "Years", ncol=4)+
  tm_legend(show = T, outside= TRUE)



###################################################
##Filter maps per year and save
#Save a map in png or other formats
#https://stackoverflow.com/questions/7144118/how-to-save-a-plot-as-image-on-the-disk
#https://www.youtube.com/watch?v=ZbxIBFpB2K4&ab_channel=TheNomadicOwl

setwd("G:/My Drive/JOBS/EVES/EVES_c/Outputs") #Set a working directory 

#Give equal legends, filter by years and map

#Plot all maps

tmap_mode("plot") #Set tmap to plotting

#Vulnerability 
tm_shape(GDMergedfile) + 
  tm_polygons(col = "Vul Inde", n=9, style = "fixed", title= "Vulnerability", palette= "Oranges",breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1),labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.5-0.6","0.6-0.7","0.7-0.8","0.8-0.9",">0.9"))+ 
  tm_facets(by = "Quarterly", ncol=2)+  
  tm_legend(show = T, outside= TRUE)

Vul<-tm_shape(GDMergedfile) + 
  tm_polygons(col = "Vul Inde", n=9, style = "fixed", title= "Vulnerability", palette= "Oranges",breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1),labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.5-0.6","0.6-0.7","0.7-0.8","0.8-0.9",">0.9"))+ 
  tm_facets(by = "Quarterly", ncol=2)+  
  tm_legend(show = T, outside= TRUE)


tm_shape(GDMergedfile%>% filter(Years== 2003)) + 
  tm_polygons(col = "Rainfed_mm",n=8 , style = "fixed", title= "Risk Legend (Irrigated)", palette= "YlOrRd",breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7),labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.5-0.6",">0.6"))+ 
  tm_legend(show = T, outside= TRUE)+
  tm_layout(main.title = "2003 Irrigatd Risk ")



#Save all Maps
tmap_save(RMap, filename="MapRainfed.svg", height=8.5, width=11, units="in", dpi=300)
tmap_save(Vul, filename="Vul.pdf", height=8.5, width=11, units="in", dpi=300)


#Plot per years 
tmap_mode("plot") #Set tmap to ploting


tm_shape(GDMergedfile%>% filter(Years== 2003)) + 
  tm_polygons(col = "Risk(IrrigatedxVul)",n=8 , style = "fixed", title= "Risk Legend (Irrigated)", palette= "YlOrRd",breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7),labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.5-0.6",">0.6"))+ 
  tm_legend(show = F, outside= TRUE)+
  tm_layout(main.title = "2003 Irrigatd Risk ")


I2003<-tm_shape(GDMergedfile%>% filter(Years== 2003)) + 
  tm_polygons(col = "Risk(IrrigatedxVul)",n=8 , style = "fixed", title= "Risk Legend (Irrigated)", palette= "YlOrRd",breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7),labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.5-0.6",">0.6"))+ 
  tm_legend(show = F, outside= TRUE)+
  tm_layout(main.title = "2003 Irrigatd Risk ")




# save each years as pdf
tmap_save(I2003, filename="I2003.pdf", height=8.5, width=11, units="in", dpi=300)

tmap_save(I2001, filename="I2001.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2002, filename="I2002.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2003, filename="I2003.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2004, filename="I2004.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2005, filename="I2005.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2006, filename="I2006.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2007, filename="I2007.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2008, filename="I2008.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2009, filename="I2009.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2010, filename="I2010.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2011, filename="I2011.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2012, filename="I2012.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2013, filename="I2013.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2014, filename="I2014.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2015, filename="I2015.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2016, filename="I2016.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2017, filename="I2017.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2018, filename="I2018.pdf", height=8.5, width=11, units="in", dpi=300)
tmap_save(I2019, filename="I2019.pdf", height=8.5, width=11, units="in", dpi=300)





# save image
tmap_save(map, "Riskmap.png", width=1920, height=1080, asp=0)
tmap_save(map, "Riskmap.pdf", width=1920, height=1080, asp=0)

tmap_save(amtrak_map, filename="amtrak.svg", height=8.5, width=11, units="in", dpi=300)
tmap_save(amtrak_map, filename="amtrak.pdf", height=8.5, width=11, units="in", dpi=300)



getwd()

