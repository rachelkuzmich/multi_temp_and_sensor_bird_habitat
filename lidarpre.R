library(RCSF)
library(terra)
library(RStoolbox)
library(satellite)
library(landsat)
library(terra)
library(lidR)
library(sf)
library(randomForest)

###bring in data and set crs####
ALS2000 <-readLAS("D:/cambs/MW_lidar/las_files/2000_MW_LeafON/2000_LeafON.las")
las_check(ALS2000)
ALS2000
plot(ALS2000)

ALS2005 <-readLAS("D:/cambs/MW_lidar/las_files/2005_MW_LeafON/MW_2005_xyzi_TrueZ.las")
las_check(ALS2005)
ALS2005
plot(ALS2005)

ALS2012 <-readLAS("D:/cambs/MW_lidar/las_files/2012_MW_LeafON_Julian259/MWarea_2012.las")
las_check(ALS2012)
ALS2012
plot(ALS2012)

ALS2015 <-readLAS("D:/cambs/MW_lidar/las_files/2015_MW_ALS/las2015_all.las")
las_check(ALS2015)
ALS2015
plot(ALS2015)

#define CRS: OSGB36 British National Grid
epsg(ALS2000) <- 27700; ALS2000
epsg(ALS2005) <- 27700; ALS2005
epsg(ALS2012) <- 27700; ALS2012
epsg(ALS2015) <- 27700; ALS2015

#clip all to ROI, this will make processing faster (xleft, ybottom, xright, ytop)
ALS2000clip <- clip_rectangle(ALS2000, 519000,279000, 521000, 281000)
ALS2005clip <- clip_rectangle(ALS2005, 519000,279000, 521000, 281000)
ALS2012clip <- clip_rectangle(ALS2012, 519000,279000, 521000, 281000) 
ALS2015clip <- clip_rectangle(ALS2015, 519000,279000, 521000, 281000)

#remove duplicated points, all years have some
ALS2000filt <-filter_duplicates(ALS2000clip); las_check(ALS2000filt)
ALS2005filt <-filter_duplicates(ALS2005clip); las_check(ALS2005filt)
ALS2012filt <-filter_duplicates(ALS2012clip); las_check(ALS2012filt)
ALS2015filt <-filter_duplicates(ALS2015clip); las_check(ALS2015filt)

#check max/min to see if data are already normalized
max(ALS2000filt$Z);min(ALS2000filt$Z) #-4.84, 24.96
max(ALS2005filt$Z);min(ALS2005filt$Z) #-3.79, 26.48
max(ALS2012filt$Z);min(ALS2012filt$Z) #-1, 57.704
max(ALS2015filt$Z);min(ALS2015filt$Z) #-43.127, 1167.372

#check number of points over 40 or under 0
sum(ALS2000filt$Z<0); sum(ALS2000filt$Z>40) #147313, 0
sum(ALS2005filt$Z<0); sum(ALS2005filt$Z>40) #30755, 0
sum(ALS2012filt$Z<0); sum(ALS2012filt$Z>30) #6, 1
sum(ALS2015filt$Z<0); sum(ALS2015filt$Z>40) #2, 2882328

#filter above 40 and below 0
ALS2000outliers<- filter_poi(ALS2000filt, Z >= 0, Z <= 40)
plot(ALS2000filt)
plot(ALS2000outliers)

ALS2005outliers<- filter_poi(ALS2005filt, Z >= 0, Z <= 40)
plot(ALS2005filt)
plot(ALS2005outliers)

ALS2012outliers<- filter_poi(ALS2012filt, Z >= 0, Z <= 30)
plot(ALS2012filt, color = "Z", bg = "white", axis = TRUE, legend = TRUE)
plot(ALS2012outliers, color = "Z", bg = "white", axis = TRUE, legend = TRUE)

ALS2015outliers<- filter_poi(ALS2015filt, Z >= 0, Z <= 100) #5 points over 100
plot(ALS2015outliers, color = "Z", bg = "white", axis = TRUE, legend = TRUE)


####segment ground points, generate dtm, normalize data and write LAS####
#2015 data only, all others are normalized properly
ground_ALS2015 <- classify_ground(ALS2015outliers, algorithm = csf())
plot(ground_ALS2015, color = "Classification", size = 3, bg = "white") 
dtm_ALS2015 <- grid_terrain(ground_ALS2015, 1, kriging(k = 10L)); plot(dtm_ALS2015) #plot check

#done writeRaster(dtm_ALS2015,"D:/cambs/MW_lidar/DTMs/dtm_ALS2015.tif", type="GTIFF", overwrite=TRUE)

norm_ALS2015 <- normalize_height(ALS2015outliers, dtm_ALS2015)
plot(norm_ALS2015)
min(norm_ALS2015$Z); max(norm_ALS2015$Z) #check max/min for spikes
spikes_ALS2015 <- filter_poi(norm_ALS2015, Z >= 0, Z <= 30)
sum(spikes_ALS2015$Z>30) #none over 30
plot(spikes_ALS2015, color = "Z", bg = "white", axis = TRUE, legend = TRUE) #remove spikes; plot check

#write las: now filtered, with crs, clipped to ROI and normalized
#done writeLAS(ALS2000outliers,"D:/cambs/R_CH3_ALSspec/norm_woods/norm_ALS2000.las")
#done writeLAS(ALS2005outliers,"D:/cambs/R_CH3_ALSspec/norm_woods/norm_ALS2005.las")
#done writeLAS(ALS2012outliers,"D:/cambs/R_CH3_ALSspec/norm_woods/norm_ALS2012.las")
#done writeLAS(spikes_ALS2015,"D:/cambs/R_CH3_ALSspec/norm_woods/norm_ALS2015.las")
