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

GDMergedfilex<- merge(GDMaps,GDExcel, by.x = "ADM0_A3", by.y = "ADM0_A3", all.x = TRUE)


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


#Risk Risk(CDIxVul)
tmap_mode("plot") #Set tmap to ploting
tm_shape(GDMergedfile) + tm_polygons(col = "Risk(CDIxVul)",n=5 , style = "equal", title= "Risk Legend (Rainfed)", palette= "YlOrRd")+ tm_facets(by = "Years", ncol=4)+
  tm_legend(show = T, outside= TRUE)

#Risk Risk Risk(Irrigated)
tmap_mode("plot") #Set tmap to ploting
tm_shape(GDMergedfile) + tm_polygons(col = "Risk(IrrigatedxVul)",n=5 , style = "equal", title= "Risk Legend (Irrigated)", palette= "YlOrRd")+ tm_facets(by = "Years", ncol=4)+
  tm_legend(show = T, outside= TRUE)



###################################################
##Filter maps per year and save
#Save a map in png or other formats
#https://stackoverflow.com/questions/7144118/how-to-save-a-plot-as-image-on-the-disk
#https://www.youtube.com/watch?v=ZbxIBFpB2K4&ab_channel=TheNomadicOwl

setwd("G:/My Drive/JOBS/EVES/EVES_c/Outputs") #Set a working directory 

#Give equal legends, filter by years and map
tm_shape(GDMergedfile%>% filter(Years== 2003)) + 
  tm_polygons(col = "Risk(CDI*PGA*Vul)", n=8,style = "equal",  palette= "YlOrRd", 
              breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8),
              labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.6-0.7",">0.7"),
              text.size=1) +
  tm_legend(show = T, outside= T)+ 
  tm_layout(legend.position = c("right", "top"), title= '2003',  title.position = c('right', 'top'))



#Plot all maps
tmap_mode("plot") #Set tmap to ploting
tm_shape(GDMergedfile) + tm_polygons(col = "Risk(CDIxVul)",n=8 , style = "equal", title= "Risk Legend (Rainfed)", palette= "YlOrRd",
                                     breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8),
                                     labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.6-0.7",">0.7"))+ 
                                       tm_facets(by = "Years", ncol=4)+  tm_legend(show = F, outside= TRUE)


#Plot per years 
tmap_mode("plot") #Set tmap to ploting
tm_shape(GDMergedfile%>% filter(Years== 2003)) + tm_polygons(col = "Risk(CDIxVul)",n=8 , style = "fixed", title= "Risk Legend (Rainfed)", palette= "YlOrRd",
                                     breaks = c(-1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8),
                                     labels = c("<0", "0-0.1","0.1-0.2","0.2-0.3","0.3-0.4","0.4-0.5","0.5-0.6","0.6-0.7",">0.7"))+ tm_legend(show = F, outside= TRUE)




#flter and map

tm_shape(GDMergedfile%>% filter(Years== 2003)) + tm_polygons(col = "Risk(CDI*PGA*Vul)",n=5 , style = "equal", title= "Risk Legend (Rainfed_PGA)", palette= "YlOrRd")+
  tm_legend(show = T, outside= T)+ 
  tm_layout(legend.position = c("right", "top"), title= '2002',  title.position = c('right', 'top'))


map<-tm_shape(GDMergedfile%>% filter(Years== 2002)) + tm_polygons(col = "Risk(CDI*PGA*Vul)",n=5 , style = "equal", title= "Risk Legend (Rainfed_PGA)", palette= "YlOrRd")+
  tm_legend(show = F, outside= T)+ 
  tm_layout(legend.position = c("right", "top"), title= '2002',  title.position = c('right', 'top'))




# save image
tmap_save(map, "Riskmap.png", width=1920, height=1080, asp=0)

getwd()

