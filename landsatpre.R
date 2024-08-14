#2000 and 2005 preprocessing is done


library(terra)
library(RStoolbox)
library(satellite)
library(landsat)
library(terra)
library(lidR)
library(sf)
library(randomForest)

#NOTE: some LTS data is UTM 30N and other is 31N
#reproject everything to OSGB36 British National Grid

#fyi: reflectance values over 100 are clouds
#https://surfaceheat.sites.yale.edu/sites/default/files/files/Greater%20than%201%20Reflectance%20Values.pdf

####2000####
L52000_L5_blue <- rast("D:/cambs/Landsat/LT05_L2SP_202023_20000618_20200906_02_T1_SR_B1.TIF")
L52000_L5_green <- rast("D:/cambs/Landsat/LT05_L2SP_202023_20000618_20200906_02_T1_SR_B2.TIF")
L52000_L5_red <- rast("D:/cambs/Landsat/LT05_L2SP_202023_20000618_20200906_02_T1_SR_B3.TIF")
L52000_L5_nir <- rast("D:/cambs/Landsat/LT05_L2SP_202023_20000618_20200906_02_T1_SR_B4.TIF")
L52000_L5_swir1 <- rast("D:/cambs/Landsat/LT05_L2SP_202023_20000618_20200906_02_T1_SR_B5.TIF")
L52000_L5_swir2 <- rast("D:/cambs/Landsat/LT05_L2SP_202023_20000618_20200906_02_T1_SR_B7.TIF")
plot(L52000_L5_nir) #check

#reproject all data
L52000_L5_blue<-project(L52000_L5_blue, "EPSG:27700")
L52000_L5_blue; plot(L52000_L5_blue) #check
L52000_L5_green<-project(L52000_L5_green, "EPSG:27700")
L52000_L5_green; plot(L52000_L5_green) #checkL52000_L5_red<-project(L52000_L5_red, "EPSG:27700")
L52000_L5_red; plot(L52000_L5_red) #check
L52000_L5_nir<-project(L52000_L5_nir, "EPSG:27700")
L52000_L5_nir; plot(L52000_L5_nir) #check
L52000_L5_swir1<-project(L52000_L5_swir1, "EPSG:27700")
L52000_L5_swir1; plot(L52000_L5_swir1) #check
L52000_L5_swir2<-project(L52000_L5_swir2, "EPSG:27700")
L52000_L5_swir2; plot(L52000_L5_swir2) #check

#clip to roi
roiextent<-ext(519000,521000,279000,281000)
L52000_L5_blue<-crop(L52000_L5_blue, roiextent)
L52000_L5_blue; plot(L52000_L5_blue) #check
L52000_L5_green<-crop(L52000_L5_green, roiextent)
L52000_L5_green; plot(L52000_L5_green) #check
L52000_L5_red<-crop(L52000_L5_red, roiextent)
L52000_L5_red; plot(L52000_L5_red) #check
L52000_L5_nir<-crop(L52000_L5_nir, roiextent)
L52000_L5_nir; plot(L52000_L5_nir) #check
L52000_L5_swir1<-crop(L52000_L5_swir1, roiextent)
L52000_L5_swir1; plot(L52000_L5_swir1) #check
L52000_L5_swir2<-crop(L52000_L5_swir2, roiextent)
L52000_L5_swir2; plot(L52000_L5_swir2) #check

#write all now clipped to roi
#done writeRaster(L52000_L5_blue, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52000_L5_blue.tif")
#done writeRaster(L52000_L5_green, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52000_L5_green.tif")
#done writeRaster(L52000_L5_red, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52000_L5_red.tif")
#done writeRaster(L52000_L5_nir, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52000_L5_nir.tif")
#done writeRaster(L52000_L5_swir1, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52000_L5_swir1.tif")
#done writeRaster(L52000_L5_swir2, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52000_L5_swir2.tif")

#https://www.gisagmaps.org/landsat-5-7-conversion-to-sr/
#https://gis.stackexchange.com/questions/419859/is-it-incorrect-to-calculate-ndvi-using-dn-digital-numbers-values-instead-of-u
#https://yceo.yale.edu/how-convert-landsat-dns-top-atmosphere-toa-reflectance 
#formulas from https://www.jstatsoft.org/article/view/v043i04
#ESUN values from here: http://dx.doi.org/10.1016/j.rse.2009.01.007 and https://www.jstatsoft.org/article/view/v043i04

#L5B1 = 1983
#L5B2 = 1796
#L5B3 = 1536
#L5B4 = 1031
#L5B5 = 220
#L5B7 = 83.44

#from MTL file
#EARTH_SUN_DISTANCE = 1.0160830
#SUN_ELEVATION = 55.92668482
#RADIANCE_MULT_BAND_1 = 7.6583E-01
#RADIANCE_MULT_BAND_2 = 1.4482E+00
#RADIANCE_MULT_BAND_3 = 1.0440E+00
#RADIANCE_MULT_BAND_4 = 8.7602E-01
#RADIANCE_MULT_BAND_5 = 1.2035E-01
#RADIANCE_MULT_BAND_7 = 6.5551E-02

#RADIANCE_ADD_BAND_1 = -2.28583
#RADIANCE_ADD_BAND_2 = -4.28819
#RADIANCE_ADD_BAND_3 = -2.21398
#RADIANCE_ADD_BAND_4 = -2.38602
#RADIANCE_ADD_BAND_5 = -0.49035
#RADIANCE_ADD_BAND_7 = -0.21555

#convert to radiance: (DN x RADIANCE_MULT_BAND) + RADIANCE_ADD_BAND
L52000_L5_blue_rad <- (L52000_L5_blue*7.6583E-01)+(-2.28583)
L52000_L5_green_rad <-(L52000_L5_green*1.4482)+(-4.28819)
L52000_L5_red_rad <-(L52000_L5_red*1.0440)+(-2.21398)
L52000_L5_nir_rad <-(L52000_L5_nir*8.7602E-01)+(-2.38602)
L52000_L5_swir1_rad <-(L52000_L5_swir1*1.2035E-01)+(-0.49035)
L52000_L5_swir2_rad <- (L52000_L5_swir2*6.5551E-02)+(-0.21555)

#Calculating the numerator and denominator in the COST TOA equation
L52000_L5_blue_num <- L52000_L5_blue_rad * pi * (1.0160830^2)
L52000_L5_blue_den <- 1983 * ((cos(90-55.92668482))^2) #ESUN values  change per band, everything else stays the same
L52000_L5_blue_toa <- L52000_L5_blue_num/L52000_L5_blue_den
plot(L52000_L5_blue_toa) #looks good
L52000_L5B1_blue_toa<-L52000_L5_blue_toa/100
plot(L52000_L5B1_blue_toa) #looks good

L52000_L5_green_num <- L52000_L5_green_rad * pi * (1.0160830^2)
L52000_L5_green_den <- 1796 * ((cos(90-55.92668482))^2) #ESUN values  change per band, everything else stays the same
L52000_L5_green_toa <- L52000_L5_green_num/L52000_L5_green_den
plot(L52000_L5_green_toa) #looks good
L52000_L5B2_green_toa<-L52000_L5_green_toa/100
plot(L52000_L5B2_green_toa) #looks good

L52000_L5_red_num <- L52000_L5_red_rad * pi * (1.0160830^2)
L52000_L5_red_den <- 1536 * ((cos(90-55.92668482))^2) #ESUN values  change per band, everything else stays the same
L52000_L5_red_toa <- L52000_L5_red_num/L52000_L5_red_den
plot(L52000_L5_red_toa) #looks good
L52000_L5B3_red_toa<-L52000_L5_red_toa/100
plot(L52000_L5B3_red_toa) #looks good

L52000_L5_nir_num <- L52000_L5_nir_rad * pi * (1.0160830^2)
L52000_L5_nir_den <- 1031 * ((cos(90-55.92668482))^2) #ESUN values  change per band, everything else stays the same
L52000_L5_nir_toa <- L52000_L5_nir_num/L52000_L5_nir_den
plot(L52000_L5_nir_toa) #this has some high values above 100
L52000_L5B4_nir_toa<-L52000_L5_nir_toa/100
plot(L52000_L5B4_nir_toa) #this has some high values above 100

L52000_L5_swir1_num <- L52000_L5_swir1_rad * pi * (1.0160830^2)
L52000_L5_swir1_den <- 220 * ((cos(90-55.92668482))^2) #ESUN values  change per band, everything else stays the same
L52000_L5_swir1_toa <- L52000_L5_swir1_num/L52000_L5_swir1_den
plot(L52000_L5_swir1_toa) #this has some high values above 100
L52000_L5B5_swir1_toa<-L52000_L5_swir1_toa/100
plot(L52000_L5B5_swir1_toa) #this has some high values above 100

L52000_L5_swir2_num <- L52000_L5_swir2_rad * pi * (1.0160830^2)
L52000_L5_swir2_den <- 83.44 * ((cos(90-55.92668482))^2) #ESUN values  change per band, everything else stays the same
L52000_L5_swir2_toa <- L52000_L5_swir2_num/L52000_L5_swir2_den
plot(L52000_L5_swir2_toa) #this has some high values above 100
L52000_L5B7_swir2_toa<-L52000_L5_swir2_toa/100
plot(L52000_L5B7_swir2_toa) #this has some high values above 100


####2005####
L52005_L5_blue <- rast("D:/cambs/Landsat/LT05_L2SP_201024_20050609_20200902_02_T1_SR_B1.TIF")
L52005_L5_green <- rast("D:/cambs/Landsat/LT05_L2SP_201024_20050609_20200902_02_T1_SR_B2.TIF")
L52005_L5_red <- rast("D:/cambs/Landsat/LT05_L2SP_201024_20050609_20200902_02_T1_SR_B3.TIF")
L52005_L5_nir <- rast("D:/cambs/Landsat/LT05_L2SP_201024_20050609_20200902_02_T1_SR_B4.TIF")
L52005_L5_swir1 <- rast("D:/cambs/Landsat/LT05_L2SP_201024_20050609_20200902_02_T1_SR_B5.TIF")
L52005_L5_swir2 <- rast("D:/cambs/Landsat/LT05_L2SP_201024_20050609_20200902_02_T1_SR_B7.TIF")
plot(L52005_L5_nir) #check

#reproject all data
L52005_L5_blue<-project(L52005_L5_blue, "EPSG:27700")
L52005_L5_blue; plot(L52005_L5_blue) #check
L52005_L5_green<-project(L52005_L5_green, "EPSG:27700")
L52005_L5_green; plot(L52005_L5_green) #check
L52005_L5_red<-project(L52005_L5_red, "EPSG:27700")
L52005_L5_red; plot(L52005_L5_red) #check
L52005_L5_nir<-project(L52005_L5_nir, "EPSG:27700")
L52005_L5_nir; plot(L52005_L5_nir) #check
L52005_L5_swir1<-project(L52005_L5_swir1, "EPSG:27700")
L52005_L5_swir1; plot(L52005_L5_swir1) #check
L52005_L5_swir2<-project(L52005_L5_swir2, "EPSG:27700")
L52005_L5_swir2; plot(L52005_L5_swir2) #check

#clip to roi
roiextent<-ext(519000,521000,279000,281000)
L52005_L5_blue<-crop(L52005_L5_blue, roiextent)
L52005_L5_blue; plot(L52005_L5_blue) #check
L52005_L5_green<-crop(L52005_L5_green, roiextent)
L52005_L5_green; plot(L52005_L5_green) #check
L52005_L5_red<-crop(L52005_L5_red, roiextent)
L52005_L5_red; plot(L52005_L5_red) #check
L52005_L5_nir<-crop(L52005_L5_nir, roiextent)
L52005_L5_nir; plot(L52005_L5_nir) #check
L52005_L5_swir1<-crop(L52005_L5_swir1, roiextent)
L52005_L5_swir1; plot(L52005_L5_swir1) #check
L52005_L5_swir2<-crop(L52005_L5_swir2, roiextent)
L52005_L5_swir2; plot(L52005_L5_swir2) #check

#write all now clipped to roi
#done writeRaster(L52005_L5_blue, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52005_L5_blue.tif")
#done writeRaster(L52005_L5_green, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52005_L5_green.tif")
#done writeRaster(L52005_L5_red, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52005_L5_red.tif")
#done writeRaster(L52005_L5_nir, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52005_L5_nir.tif")
#done writeRaster(L52005_L5_swir1, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52005_L5_swir1.tif")
#done writeRaster(L52005_L5_swir2, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L52005_L5_swir2.tif")

#ESUN values from here: http://dx.doi.org/10.1016/j.rse.2009.01.007
#L5B1 = 1983
#L5B2 = 1796
#L5B3 = 1536
#L5B4 = 1031
#L5B5 = 220
#L5B7 = 83.44

#from MTL file
#EARTH_SUN_DISTANCE = 1.0151716
#SUN_ELEVATION = 57.61441844
#RADIANCE_MULT_BAND_1 = 7.6583E-01
#RADIANCE_MULT_BAND_2 = 1.4482E+00
#RADIANCE_MULT_BAND_3 = 1.0440E+00
#RADIANCE_MULT_BAND_4 = 8.7602E-01
#RADIANCE_MULT_BAND_5 = 1.2035E-01
#RADIANCE_MULT_BAND_7 = 6.5551E-02

#RADIANCE_ADD_BAND_1 = -2.28583
#RADIANCE_ADD_BAND_2 = -4.28819
#RADIANCE_ADD_BAND_3 = -2.21398
#RADIANCE_ADD_BAND_4 = -2.38602
#RADIANCE_ADD_BAND_5 = -0.49035
#RADIANCE_ADD_BAND_7 = -0.21555

#convert to radiance: (DN x RADIANCE_MULT_BAND) + RADIANCE_ADD_BAND
L52005_L5_blue_rad <- (L52005_L5_blue*7.6583E-01)+(-2.28583)
L52005_L5_green_rad <-(L52005_L5_green*1.4482)+( -4.28819)
L52005_L5_red_rad <-(L52005_L5_red*1.0440)+(-2.21398)
L52005_L5_nir_rad <-(L52005_L5_nir*8.7602E-01)+(-2.38602)
L52005_L5_swir1_rad <-(L52005_L5_swir1*1.2035E-01)+(-0.49035)
L52005_L5_swir2_rad <- (L52005_L5_swir2*6.5551E-02)+(-0.21555)

#Calculating the numerator and denominator in the COST TOA equation
L52005_L5_blue_num <- L52005_L5_blue_rad * pi * (1.0151716^2)
L52005_L5_blue_den <- 1983 * ((cos(90-57.61441844))^2) #ESUN values  change per band, everything else stays the same
L52005_L5_blue_toa <- L52005_L5_blue_num/L52005_L5_blue_den
plot(L52005_L5_blue_toa) #some high values over 100
L52005_L5B1_blue_toa<-L52005_L5_blue_toa/100
plot(L52005_L5B1_blue_toa)

L52005_L5_green_num <- L52005_L5_green_rad * pi * (1.0151716^2)
L52005_L5_green_den <- 1796 * ((cos(90-57.61441844))^2) #ESUN values  change per band, everything else stays the same
L52005_L5_green_toa <- L52005_L5_green_num/L52005_L5_green_den
plot(L52005_L5_green_toa) #some values over 100
L52005_L5B2_green_toa<-L52005_L5_green_toa/100
plot(L52005_L5B2_green_toa) #some values over 100

L52005_L5_red_num <- L52005_L5_red_rad * pi * (1.0151716^2)
L52005_L5_red_den <- 1536 * ((cos(90-57.61441844))^2) #ESUN values  change per band, everything else stays the same
L52005_L5_red_toa <- L52005_L5_red_num/L52005_L5_red_den
plot(L52005_L5_red_toa) #some values over 1000
L52005_L5B3_red_toa<-L52005_L5_red_toa/100
plot(L52005_L5B3_red_toa) #some values over 1000

L52005_L5_nir_num <- L52005_L5_nir_rad * pi * (1.0151716^2)
L52005_L5_nir_den <- 1031 * ((cos(90-57.61441844))^2) #ESUN values  change per band, everything else stays the same
L52005_L5_nir_toa <- L52005_L5_nir_num/L52005_L5_nir_den
plot(L52005_L5_nir_toa) #some high values above 100
L52005_L5B4_nir_toa<-L52005_L5_nir_toa/100
plot(L52005_L5B4_nir_toa) #some high values above 100

L52005_L5_swir1_num <- L52005_L5_swir1_rad * pi * (1.0151716^2)
L52005_L5_swir1_den <- 220 * ((cos(90-57.61441844))^2) #ESUN values  change per band, everything else stays the same
L52005_L5_swir1_toa <- L52005_L5_swir1_num/L52005_L5_swir1_den
plot(L52005_L5_swir1_toa) #this has some high values above 100
L52005_L5B5_swir1_toa<-L52005_L5_swir1_toa/100
plot(L52005_L5B5_swir1_toa) #this has some high values above 100

L52005_L5_swir2_num <- L52005_L5_swir2_rad * pi * (1.0151716^2)
L52005_L5_swir2_den <- 83.44 * ((cos(90-57.61441844))^2) #ESUN values  change per band, everything else stays the same
L52005_L5_swir2_toa <- L52005_L5_swir2_num/L52005_L5_swir2_den
plot(L52005_L5_swir2_toa) #this has some high values above 100
L52005_L5B7_swir2_toa<-L52005_L5_swir2_toa/100
plot(L52005_L5B7_swir2_toa) #this has some high values above 100

####2012####
L82013_L8B2_blue <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20130717_20200912_02_T1_SR_B2.TIF")
L82013_L8B3_green <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20130717_20200912_02_T1_SR_B3.TIF")
L82013_L8B4_red <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20130717_20200912_02_T1_SR_B4.TIF")
L82013_L8B5_nir <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20130717_20200912_02_T1_SR_B5.TIF")
L82013_L8B6_swir1 <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20130717_20200912_02_T1_SR_B6.TIF")
L82013_L8B7_swir2 <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20130717_20200912_02_T1_SR_B7.TIF")
plot(L82013_L8B5_nir) #check

#reproject all data
L82013_L8B2_blue<-project(L82013_L8B2_blue, "EPSG:27700")
L82013_L8B2_blue; plot(L82013_L8B2_blue) #check
L82013_L8B3_green<-project(L82013_L8B3_green, "EPSG:27700")
L82013_L8B3_green; plot(L82013_L8B3_green) #check
L82013_L8B4_red<-project(L82013_L8B4_red, "EPSG:27700")
L82013_L8B4_red; plot(L82013_L8B4_red) #check
L82013_L8B5_nir<-project(L82013_L8B5_nir, "EPSG:27700")
L82013_L8B5_nir; plot(L82013_L8B5_nir) #check
L82013_L8B6_swir1<-project(L82013_L8B6_swir1, "EPSG:27700")
L82013_L8B6_swir1; plot(L82013_L8B6_swir1) #check
L82013_L8B7_swir2<-project(L82013_L8B7_swir2, "EPSG:27700")
L82013_L8B7_swir2; plot(L82013_L8B7_swir2) #check

#clip to roi
roiextent<-ext(519000,521000,279000,281000)
L82013_L8B2_blue<-crop(L82013_L8B2_blue, roiextent)
L82013_L8B2_blue; plot(L82013_L8B2_blue) #check
L82013_L8B3_green<-crop(L82013_L8B3_green, roiextent)
L82013_L8B3_green; plot(L82013_L8B3_green) #check
L82013_L8B4_red<-crop(L82013_L8B4_red, roiextent)
L82013_L8B4_red; plot(L82013_L8B4_red) #check
L82013_L8B5_nir<-crop(L82013_L8B5_nir, roiextent)
L82013_L8B5_nir; plot(L82013_L8B5_nir) #check
L82013_L8B6_swir1<-crop(L82013_L8B6_swir1, roiextent)
L82013_L8B6_swir1; plot(L82013_L8B6_swir1) #check
L82013_L8B7_swir2<-crop(L82013_L8B7_swir2, roiextent)
L82013_L8B7_swir2; plot(L82013_L8B7_swir2) #check

#write all now clipped to roi
#done writeRaster(L82013_L8B2_blue, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82013_L8B2_blue.tif")
#done writeRaster(L82013_L8B3_green, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82013_L8B3_green.tif")
#done writeRaster(L82013_L8B4_red, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82013_L8B4_red.tif")
#done writeRaster(L82013_L8B5_nir, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82013_L8B5_nir.tif")
#done writeRaster(L82013_L8B6_swir1, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82013_L8B6_swir1.tif")
#done writeRaster(L82013_L8B7_swir2, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82013_L8B7_swir2.tif")

#L8B2 = 2067
#L8B3 = 1893
#L8B4 = 1603
#L8B5 = 972.6
#L8B6 = 245
#L8B7 = 79.72

#from MTL file
#EARTH_SUN_DISTANCE = 1.0163013
#SUN_ELEVATION = 56.54282212
#RADIANCE_MULT_BAND_2 = 1.2448E-02
#RADIANCE_MULT_BAND_3 = 1.1471E-02
#RADIANCE_MULT_BAND_4 = 9.6728E-03
#RADIANCE_MULT_BAND_5 = 5.9193E-03
#RADIANCE_MULT_BAND_6 = 1.4721E-03
#RADIANCE_MULT_BAND_7 = 4.9617E-04

#RADIANCE_ADD_BAND_2 = -62.24050
#RADIANCE_ADD_BAND_3 = -57.35409
#RADIANCE_ADD_BAND_4 = -48.36420
#RADIANCE_ADD_BAND_5 = -29.59648
#RADIANCE_ADD_BAND_6 = -7.36037
#RADIANCE_ADD_BAND_7 = -2.48084

#convert to radiance: (DN x RADIANCE_MULT_BAND) + RADIANCE_ADD_BAND
L82013_L8B2_blue_rad <- (L82013_L8B2_blue*1.2448E-02)+( -62.24050)
L82013_L8B3_green_rad <-(L82013_L8B3_green*1.1471E-02)+( -57.35409)
L82013_L8B4_red_rad <-(L82013_L8B4_red*9.6728E-03)+( -48.36420)
L82013_L8B5_nir_rad <-(L82013_L8B5_nir*5.9193E-03)+( -29.59648)
L82013_L8B6_swir1_rad <-(L82013_L8B6_swir1*1.4721E-03)+( -7.36037)
L82013_L8B7_swir2_rad <- (L82013_L8B7_swir2*4.9617E-04)+( -2.48084)

#Calculating the numerator and denominator in the COST TOA equation
L82013_L8B2_blue_num <- L82013_L8B2_blue_rad * pi * (1.0163013^2)
L82013_L8B2_blue_den <- 2067 * ((cos(90-56.54282212))^2) #ESUN values  change per band, everything else stays the same
L82013_L8B2_blue_toa <- L82013_L8B2_blue_num/L82013_L8B2_blue_den
plot(L82013_L8B2_blue_toa) #looks good

L82013_L8B3_green_num <- L82013_L8B3_green_rad * pi * (1.0163013^2)
L82013_L8B3_green_den <- 1893 * ((cos(90-56.54282212))^2) #ESUN values  change per band, everything else stays the same
L82013_L8B3_green_toa <- L82013_L8B3_green_num/L82013_L8B3_green_den
plot(L82013_L8B3_green_toa) #some values over 100

L82013_L8B4_red_num <- L82013_L8B4_red_rad * pi * (1.0163013^2)
L82013_L8B4_red_den <- 1603 * ((cos(90-56.54282212))^2) #ESUN values  change per band, everything else stays the same
L82013_L8B4_red_toa <- L82013_L8B4_red_num/L82013_L8B4_red_den
plot(L82013_L8B4_red_toa) #some values over 1000

L82013_L8B5_nir_num <- L82013_L8B5_nir_rad * pi * (1.0163013^2)
L82013_L8B5_nir_den <- 972.6 * ((cos(90-56.54282212))^2) #ESUN values  change per band, everything else stays the same
L82013_L8B5_nir_toa <- L82013_L8B5_nir_num/L82013_L8B5_nir_den
plot(L82013_L8B5_nir_toa) #some high values above 100

L82013_L8B6_swir1_num <- L82013_L8B6_swir1_rad * pi * (1.0163013^2)
L82013_L8B6_swir1_den <- 245 * ((cos(90-56.54282212))^2) #ESUN values  change per band, everything else stays the same
L82013_L8B6_swir1_toa <- L82013_L8B6_swir1_num/L82013_L8B6_swir1_den
plot(L82013_L8B6_swir1_toa) #this has some high values above 100

L82013_L8B7_swir2_num <- L82013_L8B7_swir2_rad * pi * (1.0163013^2)
L82013_L8B7_swir2_den <- 79.72 * ((cos(90-56.54282212))^2) #ESUN values  change per band, everything else stays the same
L82013_L8B7_swir2_toa <- L82013_L8B7_swir2_num/L82013_L8B7_swir2_den
plot(L82013_L8B7_swir2_toa) #this has some high values above 100

####2015####
L82015_L8B2_blue <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20150808_20200909_02_T1_SR_B2 (1).TIF")
L82015_L8B3_green <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20150808_20200909_02_T1_SR_B3 (1).TIF")
L82015_L8B4_red <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20150808_20200909_02_T1_SR_B4 (1).TIF")
L82015_L8B5_nir <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20150808_20200909_02_T1_SR_B5 (1).TIF")
L82015_L8B6_swir1 <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20150808_20200909_02_T1_SR_B6 (1).TIF")
L82015_L8B7_swir2 <- rast("D:/cambs/Landsat/LC08_L2SP_201024_20150808_20200909_02_T1_SR_B7 (1).TIF")
plot(L82015_L8B5_nir) #check

#reproject all data
L82015_L8B2_blue<-project(L82015_L8B2_blue, "EPSG:27700")
L82015_L8B2_blue; plot(L82015_L8B2_blue) #check
L82015_L8B3_green<-project(L82015_L8B3_green, "EPSG:27700")
L82015_L8B3_green; plot(L82015_L8B3_green) #check
L82015_L8B4_red<-project(L82015_L8B4_red, "EPSG:27700")
L82015_L8B4_red; plot(L82015_L8B4_red) #check
L82015_L8B5_nir<-project(L82015_L8B5_nir, "EPSG:27700")
L82015_L8B5_nir; plot(L82015_L8B5_nir) #check
L82015_L8B6_swir1<-project(L82015_L8B6_swir1, "EPSG:27700")
L82015_L8B6_swir1; plot(L82015_L8B6_swir1) #check
L82015_L8B7_swir2<-project(L82015_L8B7_swir2, "EPSG:27700")
L82015_L8B7_swir2; plot(L82015_L8B7_swir2) #check

#clip to roi
roiextent<-ext(519000,521000,279000,281000)
L82015_L8B2_blue<-crop(L82015_L8B2_blue, roiextent)
L82015_L8B2_blue; plot(L82015_L8B2_blue) #check
L82015_L8B3_green<-crop(L82015_L8B3_green, roiextent)
L82015_L8B3_green; plot(L82015_L8B3_green) #check
L82015_L8B4_red<-crop(L82015_L8B4_red, roiextent)
L82015_L8B4_red; plot(L82015_L8B4_red) #check
L82015_L8B5_nir<-crop(L82015_L8B5_nir, roiextent)
L82015_L8B5_nir; plot(L82015_L8B5_nir) #check
L82015_L8B6_swir1<-crop(L82015_L8B6_swir1, roiextent)
L82015_L8B6_swir1; plot(L82015_L8B6_swir1) #check
L82015_L8B7_swir2<-crop(L82015_L8B7_swir2, roiextent)
L82015_L8B7_swir2; plot(L82015_L8B7_swir2) #check

#write all now clipped to roi
#done writeRaster(L82015_L8B2_blue, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82015_L8B2_blue.tif")
#done writeRaster(L82015_L8B3_green, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82015_L8B3_green.tif")
#done writeRaster(L82015_L8B4_red, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82015_L8B4_red.tif")
#done writeRaster(L82015_L8B5_nir, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82015_L8B5_nir.tif")
#done writeRaster(L82015_L8B6_swir1, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82015_L8B6_swir1.tif")
#done writeRaster(L82015_L8B7_swir2, "D:/cambs/R_CH3_ALSspec/Landsat_clippedtoROI/L82015_L8B7_swir2.tif")

#L8B2 = 2067
#L8B3 = 1893
#L8B4 = 1603
#L8B5 = 972.6
#L8B6 = 245
#L8B7 = 79.72

#from MTL file
#EARTH_SUN_DISTANCE = 1.0140274
#SUN_ELEVATION = 51.71031301
#RADIANCE_MULT_BAND_2 = 1.2504E-02
#RADIANCE_MULT_BAND_3 = 1.1522E-02
#RADIANCE_MULT_BAND_4 = 9.7163E-03
#RADIANCE_MULT_BAND_5 = 5.9459E-03
#RADIANCE_MULT_BAND_6 = 1.4787E-03
#RADIANCE_MULT_BAND_7 = 4.9840E-04
#RADIANCE_ADD_BAND_2 = -62.51994
#RADIANCE_ADD_BAND_3 = -57.61159
#RADIANCE_ADD_BAND_4 = -48.58134
#RADIANCE_ADD_BAND_5 = -29.72936
#RADIANCE_ADD_BAND_6 = -7.39342
#RADIANCE_ADD_BAND_7 = -2.49198

#convert to radiance: (DN x RADIANCE_MULT_BAND) + RADIANCE_ADD_BAND
L82015_L8B2_blue_rad <- (L82015_L8B2_blue*1.2504E-02)+( -62.51994)
L82015_L8B3_green_rad <-(L82015_L8B3_green*1.1522E-02)+( -57.61159)
L82015_L8B4_red_rad <-(L82015_L8B4_red*9.7163E-03)+( -48.58134)
L82015_L8B5_nir_rad <-(L82015_L8B5_nir*5.9459E-03)+( -29.72936)
L82015_L8B6_swir1_rad <-(L82015_L8B6_swir1*1.4787E-03)+( -7.39342)
L82015_L8B7_swir2_rad <- (L82015_L8B7_swir2*4.9840E-04)+( -2.49198)

#Calculating the numerator and denominator in the COST TOA equation
L82015_L8B2_blue_num <- L82015_L8B2_blue_rad * pi * (1.0140274^2)
L82015_L8B2_blue_den <- 2067 * ((cos(90-51.71031301))^2) #ESUN values  change per band, everything else stays the same
L82015_L8B2_blue_toa <- L82015_L8B2_blue_num/L82015_L8B2_blue_den
plot(L82015_L8B2_blue_toa) #looks good

L82015_L8B3_green_num <- L82015_L8B3_green_rad * pi * (1.0140274^2)
L82015_L8B3_green_den <- 1893 * ((cos(90-51.71031301))^2) #ESUN values  change per band, everything else stays the same
L82015_L8B3_green_toa <- L82015_L8B3_green_num/L82015_L8B3_green_den
plot(L82015_L8B3_green_toa) #some values over 100

L82015_L8B4_red_num <- L82015_L8B4_red_rad * pi * (1.0140274^2)
L82015_L8B4_red_den <- 1603 * ((cos(90-51.71031301))^2) #ESUN values  change per band, everything else stays the same
L82015_L8B4_red_toa <- L82015_L8B4_red_num/L82015_L8B4_red_den
plot(L82015_L8B4_red_toa) #some values over 1000

L82015_L8B5_nir_num <- L82015_L8B5_nir_rad * pi * (1.0140274^2)
L82015_L8B5_nir_den <- 972.6 * ((cos(90-51.71031301))^2) #ESUN values  change per band, everything else stays the same
L82015_L8B5_nir_toa <- L82015_L8B5_nir_num/L82015_L8B5_nir_den
plot(L82015_L8B5_nir_toa) #some high values above 100

L82015_L8B6_swir1_num <- L82015_L8B6_swir1_rad * pi * (1.0140274^2)
L82015_L8B6_swir1_den <- 245 * ((cos(90-51.71031301))^2) #ESUN values  change per band, everything else stays the same
L82015_L8B6_swir1_toa <- L82015_L8B6_swir1_num/L82015_L8B6_swir1_den
plot(L82015_L8B6_swir1_toa) #this has some high values above 100

L82015_L8B7_swir2_num <- L82015_L8B7_swir2_rad * pi * (1.0140274^2)
L82015_L8B7_swir2_den <- 79.72 * ((cos(90-51.71031301))^2) #ESUN values  change per band, everything else stays the same
L82015_L8B7_swir2_toa <- L82015_L8B7_swir2_num/L82015_L8B7_swir2_den
plot(L82015_L8B7_swir2_toa) #this has some high values above 100

####write all the toa reflectance rasters####
#done writeRaster(L52000_L5B1_blue_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B1_blue_toa.tif",overwrite=TRUE)
#done writeRaster(L52000_L5B2_green_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B2_green_toa.tif",overwrite=TRUE)
#done writeRaster(L52000_L5B3_red_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B3_red_toa.tif",overwrite=TRUE)
#done writeRaster(L52000_L5B4_nir_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B4_nir_toa.tif",overwrite=TRUE)
#done writeRaster(L52000_L5B5_swir1_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B5_swir1_toa.tif",overwrite=TRUE)
#done writeRaster(L52000_L5B7_swir2_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B7_swir2_toa.tif",overwrite=TRUE)

#done writeRaster(L52005_L5B1_blue_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B1_blue_toa.tif",overwrite=TRUE)
#done writeRaster(L52005_L5B2_green_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B2_green_toa.tif",overwrite=TRUE)
#done writeRaster(L52005_L5B3_red_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B3_red_toa.tif",overwrite=TRUE)
#done writeRaster(L52005_L5B4_nir_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B4_nir_toa.tif",overwrite=TRUE)
#done writeRaster(L52005_L5B5_swir1_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B5_swir1_toa.tif",overwrite=TRUE)
#done writeRaster(L52005_L5B7_swir2_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B7_swir2_toa.tif",overwrite=TRUE)

#done writeRaster(L82013_L8B2_blue_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B2_blue_toa.tif",overwrite=TRUE)
#done writeRaster(L82013_L8B3_green_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B3_green_toa.tif",overwrite=TRUE)
#done writeRaster(L82013_L8B4_red_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B4_red_toa.tif",overwrite=TRUE)
#done writeRaster(L82013_L8B5_nir_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B5_nir_toa.tif",overwrite=TRUE)
#done writeRaster(L82013_L8B6_swir1_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B6_swir1_toa.tif",overwrite=TRUE)
#done writeRaster(L82013_L8B7_swir2_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B7_swir2_toa.tif",overwrite=TRUE)

writeRaster(L82015_L8B2_blue_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B2_blue_toa.tif",overwrite=TRUE)
writeRaster(L82015_L8B3_green_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B3_green_toa.tif",overwrite=TRUE)
writeRaster(L82015_L8B4_red_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B4_red_toa.tif",overwrite=TRUE)
writeRaster(L82015_L8B5_nir_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B5_nir_toa.tif",overwrite=TRUE)
writeRaster(L82015_L8B6_swir1_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B6_swir1_toa.tif",overwrite=TRUE)
writeRaster(L82015_L8B7_swir2_toa,"D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B7_swir2_toa.tif",overwrite=TRUE)

####stack them together and calculate TCT####
#2000
L52000_stack <- rast( list(L52000_L5B1_blue_toa,L52000_L5B2_green_toa,L52000_L5B3_red_toa,L52000_L5B4_nir_toa,L52000_L5B5_swir1_toa,L52000_L5B7_swir2_toa))
L52000_tc <- tasseledCap(L52000_stack, sat = "Landsat5TM")

plot(L52000_tc) #check, looks good
L52000_tc_brightness<- subset(L52000_tc, 1); plot(L52000_tc_brightness)
L52000_tc_greenness<- subset(L52000_tc, 2); plot(L52000_tc_greenness)
L52000_tc_wetness<- subset(L52000_tc, 3); plot(L52000_tc_wetness)

#writeRaster(L52000_tc_brightness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_brightness.tif",overwrite=TRUE)
#writeRaster(L52000_tc_greenness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_greenness.tif",overwrite=TRUE)
#writeRaster(L52000_tc_wetness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_wetness.tif",overwrite=TRUE)

#2005
L52005_stack <- rast( list(L52005_L5B1_blue_toa,L52005_L5B2_green_toa,L52005_L5B3_red_toa,L52005_L5B4_nir_toa,L52005_L5B5_swir1_toa,L52005_L5B7_swir2_toa))
L52005_tc <- tasseledCap(L52005_stack, sat = "Landsat5TM")

plot(L52005_tc) #check, looks good
L52005_tc_brightness<- subset(L52005_tc, 1); plot(L52005_tc_brightness)
L52005_tc_greenness<- subset(L52005_tc, 2); plot(L52005_tc_greenness)
L52005_tc_wetness<- subset(L52005_tc, 3); plot(L52005_tc_wetness)

#done writeRaster(L52005_tc_brightness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_brightness.tif",overwrite=TRUE)
#done writeRaster(L52005_tc_greenness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_greenness.tif",overwrite=TRUE)
#done writeRaster(L52005_tc_wetness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_wetness.tif",overwrite=TRUE)

#2013
L82013_stack <- rast( list(L82013_L8B2_blue_toa,L82013_L8B3_green_toa,L82013_L8B4_red_toa,L82013_L8B5_nir_toa,L82013_L8B6_swir1_toa,L82013_L8B7_swir2_toa))
L82013_tc <- tasseledCap(L82013_stack, sat = "Landsat5TM")

plot(L82013_tc) #check, looks good
L82013_tc_brightness<- subset(L82013_tc, 1); plot(L82013_tc_brightness)
L82013_tc_greenness<- subset(L82013_tc, 2); plot(L82013_tc_greenness)
L82013_tc_wetness<- subset(L82013_tc, 3); plot(L82013_tc_wetness)

#done writeRaster(L82013_tc_brightness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_brightness.tif",overwrite=TRUE)
#done writeRaster(L82013_tc_greenness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_greenness.tif",overwrite=TRUE)
#done writeRaster(L82013_tc_wetness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_wetness.tif",overwrite=TRUE)

#2015
L82015_stack <- rast( list(L82015_L8B2_blue_toa,L82015_L8B3_green_toa,L82015_L8B4_red_toa,L82015_L8B5_nir_toa,L82015_L8B6_swir1_toa,L82015_L8B7_swir2_toa))
L82015_tc <- tasseledCap(L82015_stack, sat = "Landsat5TM")

plot(L82015_tc) #check, looks good
L82015_tc_brightness<- subset(L82015_tc, 1); plot(L82015_tc_brightness)
L82015_tc_greenness<- subset(L82015_tc, 2); plot(L82015_tc_greenness)
L82015_tc_wetness<- subset(L82015_tc, 3); plot(L82015_tc_wetness)

#done writeRaster(L82015_tc_brightness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_brightness.tif",overwrite=TRUE)
#done writeRaster(L82015_tc_greenness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_greenness.tif",overwrite=TRUE)
#done writeRaster(L82015_tc_wetness,"D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_wetness.tif",overwrite=TRUE)

#### calculate ndvi ####
#2000
NDVI2000 <- (L52000_L5B4_nir_toa - L52000_L5B3_red_toa) / (L52000_L5B4_nir_toa + L52000_L5B3_red_toa)
plot(NDVI2000) #check, looks good

#2005
NDVI2005 <- (L52005_L5B4_nir_toa - L52005_L5B3_red_toa) / (L52005_L5B4_nir_toa + L52005_L5B3_red_toa)
plot(NDVI2005) #check, looks good

#2013
NDVI2013 <- (L82013_L8B5_nir_toa - L82013_L8B4_red_toa) / (L82013_L8B5_nir_toa + L82013_L8B4_red_toa)
plot(NDVI2013)

#2015
NDVI2015 <- (L82015_L8B5_nir_toa - L82015_L8B4_red_toa) / (L82015_L8B5_nir_toa + L82015_L8B4_red_toa)
plot(NDVI2015) #check, looks good

#done writeRaster(NDVI2000,"D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2000.tif",overwrite=TRUE)
#done writeRaster(NDVI2005,"D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2005.tif",overwrite=TRUE)
#done writeRaster(NDVI2013,"D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2013.tif",overwrite=TRUE)
#done writeRaster(NDVI2015,"D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2015.tif",overwrite=TRUE)

#### calculate nbr ####
#https://www.sciencedirect.com/science/article/pii/S0034425717301360?via%3Dihub
#formula from link above: NBR <- (NIR-SWIR2)/(NIR+SWIR2)

#2000
NBR2000 <- (L52000_L5B4_nir_toa - L52000_L5B7_swir2_toa) / (L52000_L5B4_nir_toa + L52000_L5B7_swir2_toa)
plot(NBR2000) #check, looks good

#2005
NBR2005 <- (L52005_L5B4_nir_toa - L52005_L5B7_swir2_toa) / (L52005_L5B4_nir_toa + L52005_L5B7_swir2_toa)
plot(NBR2005) #check, looks good

#2013
NBR2013 <- (L82013_L8B5_nir_toa - L82013_L8B7_swir2_toa) / (L82013_L8B5_nir_toa + L82013_L8B7_swir2_toa)
plot(NBR2013) #check, looks good

#2015
NBR2015 <- (L82015_L8B5_nir_toa - L82015_L8B7_swir2_toa) / (L82015_L8B5_nir_toa + L82015_L8B7_swir2_toa)
plot(NBR2015) #check, looks good

#done writeRaster(NBR2000,"D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2000.tif",overwrite=TRUE)
#done writeRaster(NBR2005,"D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2005.tif",overwrite=TRUE)
#done writeRaster(NBR2013,"D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2013.tif",overwrite=TRUE)
#done writeRaster(NBR2015,"D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2015.tif",overwrite=TRUE)
