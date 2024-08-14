library(randomForestExplainer)
library(Boruta)
library(dplyr)
library(terra)
library(RStoolbox)
library(satellite)
library(landsat)
library(terra)
library(lidR)
library(sf)
library(randomForest)

set.seed(2024)

roiWI<-ext(520015.14, 520630.84, 279526.33, 280113.2)
roiWII<-ext(519350.35, 519895.33, 279179.09, 279550.2)

#ALS plot for 2015 WI prediction
normALS2015<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2015.las")
WInormLAS <- clip_rectangle(normALS2015, 520015.14,279526.33, 520630.84, 280113.2)
plot(WInormLAS, color = "Z", bg = "white", axis = TRUE, legend = TRUE)
outliers<- filter_poi(WInormLAS, Z >= 0, Z <= 23) #5 points over 100
plot(outliers, color = "Z", bg = "white", legend = TRUE)

#goal is pixel-by-pixel prediction

####bring in ALS data####
WImetrics2000_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_max.TIF"), roiWI)
WImetrics2000_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_mean.TIF"), roiWI)
WImetrics2000_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_sd.TIF"), roiWI)
WImetrics2000_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_entropy.TIF"), roiWI)
WImetrics2000_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_fhd.TIF"), roiWI)
WImetrics2000_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_cc.TIF"), roiWI)
WImetrics2000_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_crr.TIF"), roiWI)

WImetrics2005_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_max.TIF"), roiWI)
WImetrics2005_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_mean.TIF"), roiWI)
WImetrics2005_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_sd.TIF"), roiWI)
WImetrics2005_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_entropy.TIF"), roiWI)
WImetrics2005_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_fhd.TIF"), roiWI)
WImetrics2005_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_cc.TIF"), roiWI)
WImetrics2005_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_crr.TIF"), roiWI)

WImetrics2012_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_max.TIF"), roiWI)
WImetrics2012_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_mean.TIF"), roiWI)
WImetrics2012_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_sd.TIF"), roiWI)
WImetrics2012_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_entropy.TIF"), roiWI)
WImetrics2012_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_fhd.TIF"), roiWI)
WImetrics2012_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_cc.TIF"), roiWI)
WImetrics2012_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_crr.TIF"), roiWI)

WImetrics2015_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_max.TIF"), roiWI)
WImetrics2015_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_mean.TIF"), roiWI)
WImetrics2015_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_sd.TIF"), roiWI)
WImetrics2015_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_entropy.TIF"), roiWI)
WImetrics2015_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_fhd.TIF"), roiWI)
WImetrics2015_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_cc.TIF"), roiWI)
WImetrics2015_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_crr.TIF"), roiWI)

####bring in landsat data####

#toa reflectance data
WIL5B1_2000_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B1_blue_toa.TIF"), roiWI)
WIL5B2_2000_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B2_green_toa.TIF"), roiWI)
WIL5B3_2000_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B3_red_toa.TIF"), roiWI)
WIL5B4_2000_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B4_nir_toa.TIF"), roiWI)
WIL5B5_2000_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B5_swir1_toa.TIF"), roiWI)
WIL5B7_2000_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B7_swir2_toa.TIF"), roiWI)
names(WIL5B1_2000_blue) <- ("blue"); WIL5B1_2000_blue #rename
names(WIL5B2_2000_green) <- ("green"); WIL5B2_2000_green
names(WIL5B3_2000_red) <- ("red"); WIL5B3_2000_red
names(WIL5B4_2000_nir) <- ("nir"); WIL5B4_2000_nir
names(WIL5B5_2000_swir1) <- ("swir1"); WIL5B5_2000_swir1
names(WIL5B7_2000_swir2) <- ("swir2"); WIL5B7_2000_swir2

WIL5B1_2005_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B1_blue_toa.TIF"), roiWI)
WIL5B2_2005_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B2_green_toa.TIF"), roiWI)
WIL5B3_2005_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B3_red_toa.TIF"), roiWI)
WIL5B4_2005_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B4_nir_toa.TIF"), roiWI)
WIL5B5_2005_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B5_swir1_toa.TIF"), roiWI)
WIL5B7_2005_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B7_swir2_toa.TIF"), roiWI)
names(WIL5B1_2005_blue) <- ("blue"); WIL5B1_2005_blue #rename
names(WIL5B2_2005_green) <- ("green"); WIL5B2_2005_green
names(WIL5B3_2005_red) <- ("red"); WIL5B3_2005_red
names(WIL5B4_2005_nir) <- ("nir"); WIL5B4_2005_nir
names(WIL5B5_2005_swir1) <- ("swir1"); WIL5B5_2005_swir1
names(WIL5B7_2005_swir2) <- ("swir2"); WIL5B7_2005_swir2

WIL8B2_2013_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B2_blue_toa.TIF"), roiWI)
WIL8B3_2013_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B3_green_toa.TIF"), roiWI)
WIL8B4_2013_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B4_red_toa.TIF"), roiWI)
WIL8B5_2013_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B5_nir_toa.TIF"), roiWI)
WIL8B6_2013_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B6_swir1_toa.TIF"), roiWI)
WIL8B7_2013_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B7_swir2_toa.TIF"), roiWI)
names(WIL8B2_2013_blue) <- ("blue"); WIL8B2_2013_blue #rename
names(WIL8B3_2013_green) <- ("green"); WIL8B3_2013_green
names(WIL8B4_2013_red) <- ("red"); WIL8B4_2013_red
names(WIL8B5_2013_nir) <- ("nir"); WIL8B5_2013_nir
names(WIL8B6_2013_swir1) <- ("swir1"); WIL8B6_2013_swir1
names(WIL8B7_2013_swir2) <- ("swir2"); WIL8B7_2013_swir2

WIL8B2_2015_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B2_blue_toa.TIF"), roiWI)
WIL8B3_2015_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B3_green_toa.TIF"), roiWI)
WIL8B4_2015_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B4_red_toa.TIF"), roiWI)
WIL8B5_2015_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B5_nir_toa.TIF"), roiWI)
WIL8B6_2015_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B6_swir1_toa.TIF"), roiWI)
WIL8B7_2015_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B7_swir2_toa.TIF"), roiWI)
names(WIL8B2_2015_blue) <- ("blue"); WIL8B2_2015_blue #rename
names(WIL8B3_2015_green) <- ("green"); WIL8B3_2015_green
names(WIL8B4_2015_red) <- ("red"); WIL8B4_2015_red
names(WIL8B5_2015_nir) <- ("nir"); WIL8B5_2015_nir
names(WIL8B6_2015_swir1) <- ("swir1"); WIL8B6_2015_swir1
names(WIL8B7_2015_swir2) <- ("swir2"); WIL8B7_2015_swir2

#ndvi
WINDVI2000 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2000.TIF"), roiWI)
WINDVI2005 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2005.TIF"), roiWI)
WINDVI2013 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2013.TIF"), roiWI)
WINDVI2015 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2015.TIF"), roiWI)
names(WINDVI2000) <- ("NDVI")
names(WINDVI2005) <- ("NDVI")
names(WINDVI2013) <- ("NDVI")
names(WINDVI2015) <- ("NDVI")

#nbr
WINBR2000 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2000.TIF"), roiWI)
WINBR2005 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2005.TIF"), roiWI)
WINBR2013 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2013.TIF"), roiWI)
WINBR2015 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2015.TIF"), roiWI)
names(WINBR2000) <- ("NBR")
names(WINBR2005) <- ("NBR")
names(WINBR2013) <- ("NBR")
names(WINBR2015) <- ("NBR")

#tct
WITCT2000_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_brightness.TIF"), roiWI)
WITCT2000_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_greenness.TIF"), roiWI)
WITCT2000_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_wetness.TIF"), roiWI)

WITCT2005_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_brightness.TIF"), roiWI)
WITCT2005_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_greenness.TIF"), roiWI)
WITCT2005_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_wetness.TIF"), roiWI)

WITCT2013_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_brightness.TIF"), roiWI)
WITCT2013_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_greenness.TIF"), roiWI)
WITCT2013_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_wetness.TIF"), roiWI)

WITCT2015_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_brightness.TIF"), roiWI)
WITCT2015_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_greenness.TIF"), roiWI)
WITCT2015_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_wetness.TIF"), roiWI)

WIImetrics2000_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_max.TIF"), roiWII)
WIImetrics2000_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_mean.TIF"), roiWII)
WIImetrics2000_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_sd.TIF"), roiWII)
WIImetrics2000_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_entropy.TIF"), roiWII)
WIImetrics2000_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_fhd.TIF"), roiWII)
WIImetrics2000_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_cc.TIF"), roiWII)
WIImetrics2000_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_crr.TIF"), roiWII)

WIImetrics2005_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_max.TIF"), roiWII)
WIImetrics2005_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_mean.TIF"), roiWII)
WIImetrics2005_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_sd.TIF"), roiWII)
WIImetrics2005_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_entropy.TIF"), roiWII)
WIImetrics2005_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_fhd.TIF"), roiWII)
WIImetrics2005_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_cc.TIF"), roiWII)
WIImetrics2005_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_crr.TIF"), roiWII)

WIImetrics2012_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_max.TIF"), roiWII)
WIImetrics2012_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_mean.TIF"), roiWII)
WIImetrics2012_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_sd.TIF"), roiWII)
WIImetrics2012_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_entropy.TIF"), roiWII)
WIImetrics2012_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_fhd.TIF"), roiWII)
WIImetrics2012_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_cc.TIF"), roiWII)
WIImetrics2012_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_crr.TIF"), roiWII)

WIImetrics2015_max <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_max.TIF"), roiWII)
WIImetrics2015_mean <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_mean.TIF"), roiWII)
WIImetrics2015_sd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_sd.TIF"), roiWII)
WIImetrics2015_entropy <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_entropy.TIF"), roiWII)
WIImetrics2015_fhd <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_fhd.TIF"), roiWII)
WIImetrics2015_cc <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_cc.TIF"), roiWII)
WIImetrics2015_crr <- crop(rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_crr.TIF"), roiWII)

####bring in landsat data####

#toa reflectance data
WIIL5B1_2000_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B1_blue_toa.TIF"), roiWII)
WIIL5B2_2000_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B2_green_toa.TIF"), roiWII)
WIIL5B3_2000_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B3_red_toa.TIF"), roiWII)
WIIL5B4_2000_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B4_nir_toa.TIF"), roiWII)
WIIL5B5_2000_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B5_swir1_toa.TIF"), roiWII)
WIIL5B7_2000_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B7_swir2_toa.TIF"), roiWII)
names(WIIL5B1_2000_blue) <- ("blue"); WIIL5B1_2000_blue #rename
names(WIIL5B2_2000_green) <- ("green"); WIIL5B2_2000_green
names(WIIL5B3_2000_red) <- ("red"); WIIL5B3_2000_red
names(WIIL5B4_2000_nir) <- ("nir"); WIIL5B4_2000_nir
names(WIIL5B5_2000_swir1) <- ("swir1"); WIIL5B5_2000_swir1
names(WIIL5B7_2000_swir2) <- ("swir2"); WIIL5B7_2000_swir2

WIIL5B1_2005_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B1_blue_toa.TIF"), roiWII)
WIIL5B2_2005_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B2_green_toa.TIF"), roiWII)
WIIL5B3_2005_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B3_red_toa.TIF"), roiWII)
WIIL5B4_2005_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B4_nir_toa.TIF"), roiWII)
WIIL5B5_2005_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B5_swir1_toa.TIF"), roiWII)
WIIL5B7_2005_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B7_swir2_toa.TIF"), roiWII)
names(WIIL5B1_2005_blue) <- ("blue"); WIIL5B1_2005_blue #rename
names(WIIL5B2_2005_green) <- ("green"); WIIL5B2_2005_green
names(WIIL5B3_2005_red) <- ("red"); WIIL5B3_2005_red
names(WIIL5B4_2005_nir) <- ("nir"); WIIL5B4_2005_nir
names(WIIL5B5_2005_swir1) <- ("swir1"); WIIL5B5_2005_swir1
names(WIIL5B7_2005_swir2) <- ("swir2"); WIIL5B7_2005_swir2

WIIL8B2_2013_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B2_blue_toa.TIF"), roiWII)
WIIL8B3_2013_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B3_green_toa.TIF"), roiWII)
WIIL8B4_2013_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B4_red_toa.TIF"), roiWII)
WIIL8B5_2013_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B5_nir_toa.TIF"), roiWII)
WIIL8B6_2013_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B6_swir1_toa.TIF"), roiWII)
WIIL8B7_2013_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B7_swir2_toa.TIF"), roiWII)
names(WIIL8B2_2013_blue) <- ("blue"); WIIL8B2_2013_blue #rename
names(WIIL8B3_2013_green) <- ("green"); WIIL8B3_2013_green
names(WIIL8B4_2013_red) <- ("red"); WIIL8B4_2013_red
names(WIIL8B5_2013_nir) <- ("nir"); WIIL8B5_2013_nir
names(WIIL8B6_2013_swir1) <- ("swir1"); WIIL8B6_2013_swir1
names(WIIL8B7_2013_swir2) <- ("swir2"); WIIL8B7_2013_swir2

WIIL8B2_2015_blue <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B2_blue_toa.TIF"), roiWII)
WIIL8B3_2015_green <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B3_green_toa.TIF"), roiWII)
WIIL8B4_2015_red <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B4_red_toa.TIF"), roiWII)
WIIL8B5_2015_nir <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B5_nir_toa.TIF"), roiWII)
WIIL8B6_2015_swir1 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B6_swir1_toa.TIF"), roiWII)
WIIL8B7_2015_swir2 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B7_swir2_toa.TIF"), roiWII)
names(WIIL8B2_2015_blue) <- ("blue"); WIIL8B2_2015_blue #rename
names(WIIL8B3_2015_green) <- ("green"); WIIL8B3_2015_green
names(WIIL8B4_2015_red) <- ("red"); WIIL8B4_2015_red
names(WIIL8B5_2015_nir) <- ("nir"); WIIL8B5_2015_nir
names(WIIL8B6_2015_swir1) <- ("swir1"); WIIL8B6_2015_swir1
names(WIIL8B7_2015_swir2) <- ("swir2"); WIIL8B7_2015_swir2

#ndvi
WIINDVI2000 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2000.TIF"), roiWII)
WIINDVI2005 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2005.TIF"), roiWII)
WIINDVI2013 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2013.TIF"), roiWII)
WIINDVI2015 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2015.TIF"), roiWII)
names(WIINDVI2000) <- ("NDVI")
names(WIINDVI2005) <- ("NDVI")
names(WIINDVI2013) <- ("NDVI")
names(WIINDVI2015) <- ("NDVI")

#nbr
WIINBR2000 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2000.TIF"), roiWII)
WIINBR2005 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2005.TIF"), roiWII)
WIINBR2013 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2013.TIF"), roiWII)
WIINBR2015 <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2015.TIF"), roiWII)
names(WIINBR2000) <- ("NBR")
names(WIINBR2005) <- ("NBR")
names(WIINBR2013) <- ("NBR")
names(WIINBR2015) <- ("NBR")

#tct
WIITCT2000_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_brightness.TIF"), roiWII)
WIITCT2000_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_greenness.TIF"), roiWII)
WIITCT2000_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_wetness.TIF"), roiWII)

WIITCT2005_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_brightness.TIF"), roiWII)
WIITCT2005_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_greenness.TIF"), roiWII)
WIITCT2005_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_wetness.TIF"), roiWII)

WIITCT2013_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_brightness.TIF"), roiWII)
WIITCT2013_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_greenness.TIF"), roiWII)
WIITCT2013_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_wetness.TIF"), roiWII)

WIITCT2015_brightness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_brightness.TIF"), roiWII)
WIITCT2015_greenness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_greenness.TIF"), roiWII)
WIITCT2015_wetness <- crop(rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_wetness.TIF"), roiWII)

#stack by year
WIstack2000 <- list(WIL5B1_2000_blue, WIL5B2_2000_green, WIL5B3_2000_red,
                    WIL5B4_2000_nir, WIL5B5_2000_swir1, WIL5B7_2000_swir2,
                    WINDVI2000, WINBR2000,
                    WITCT2000_brightness, WITCT2000_wetness, WITCT2000_greenness,
                    WImetrics2000_max, WImetrics2000_mean, WImetrics2000_sd,
                    WImetrics2000_entropy, WImetrics2000_fhd, WImetrics2000_cc, WImetrics2000_crr)
WIdf2000<-as.data.frame(rast(WIstack2000))

WIIstack2000 <- list(WIIL5B1_2000_blue, WIIL5B2_2000_green, WIIL5B3_2000_red,
                     WIIL5B4_2000_nir, WIIL5B5_2000_swir1, WIIL5B7_2000_swir2,
                     WIINDVI2000, WIINBR2000,
                     WIITCT2000_brightness, WIITCT2000_wetness, WIITCT2000_greenness,
                     WIImetrics2000_max, WIImetrics2000_mean, WIImetrics2000_sd,
                     WIImetrics2000_entropy, WIImetrics2000_fhd, WIImetrics2000_cc, WIImetrics2000_crr)
WIIdf2000<-as.data.frame(rast(WIIstack2000))

WIstack2005 <- list(WIL5B1_2005_blue, WIL5B2_2005_green, WIL5B3_2005_red,
                    WIL5B4_2005_nir, WIL5B5_2005_swir1, WIL5B7_2005_swir2,
                    WINDVI2005, WINBR2005,
                    WITCT2005_brightness, WITCT2005_wetness, WITCT2005_greenness,
                    WImetrics2005_max, WImetrics2005_mean, WImetrics2005_sd,
                    WImetrics2005_entropy, WImetrics2005_fhd, WImetrics2005_cc, WImetrics2005_crr)
WIdf2005<-as.data.frame(rast(WIstack2005))

WIIstack2005 <- list(WIIL5B1_2005_blue, WIIL5B2_2005_green, WIIL5B3_2005_red,
                     WIIL5B4_2005_nir, WIIL5B5_2005_swir1, WIIL5B7_2005_swir2,
                     WIINDVI2005, WIINBR2005,
                     WIITCT2005_brightness, WIITCT2005_wetness, WIITCT2005_greenness,
                     WIImetrics2005_max, WIImetrics2005_mean, WIImetrics2005_sd,
                     WIImetrics2005_entropy, WIImetrics2005_fhd, WIImetrics2005_cc, WIImetrics2005_crr)
WIIdf2005<-as.data.frame(rast(WIIstack2005))

WIstack2012 <- list(WIL8B2_2013_blue, WIL8B3_2013_green, WIL8B4_2013_red, 
                    WIL8B5_2013_nir, WIL8B6_2013_swir1, WIL8B7_2013_swir2, 
                    WINDVI2013, WINBR2013, 
                    WITCT2013_brightness, WITCT2013_wetness, WITCT2013_greenness, 
                    WImetrics2012_max, WImetrics2012_mean, WImetrics2012_sd, 
                    WImetrics2012_entropy, WImetrics2012_fhd, WImetrics2012_cc, WImetrics2012_crr)
WIdf2012<-as.data.frame(rast(WIstack2012))

WIIstack2012 <- list(WIIL8B2_2013_blue, WIIL8B3_2013_green, WIIL8B4_2013_red, 
                     WIIL8B5_2013_nir, WIIL8B6_2013_swir1, WIIL8B7_2013_swir2, 
                     WIINDVI2013, WIINBR2013, 
                     WIITCT2013_brightness, WIITCT2013_wetness, WIITCT2013_greenness, 
                     WIImetrics2012_max, WIImetrics2012_mean, WIImetrics2012_sd, 
                     WIImetrics2012_entropy, WIImetrics2012_fhd, WIImetrics2012_cc, WIImetrics2012_crr)
WIIdf2012<-as.data.frame(rast(WIIstack2012))

WIstack2015 <- list(WIL8B2_2015_blue, WIL8B3_2015_green, WIL8B4_2015_red, 
                    WIL8B5_2015_nir, WIL8B6_2015_swir1, WIL8B7_2015_swir2, 
                    WINDVI2015, WINBR2015, 
                    WITCT2015_brightness, WITCT2015_wetness, WITCT2015_greenness, 
                    WImetrics2015_max, WImetrics2015_mean, WImetrics2015_sd, 
                    WImetrics2015_entropy, WImetrics2015_fhd, WImetrics2015_cc, WImetrics2015_crr)
WIdf2015<-as.data.frame(rast(WIstack2015))

WIIstack2015 <- list(WIIL8B2_2015_blue, WIIL8B3_2015_green, WIIL8B4_2015_red, 
                     WIIL8B5_2015_nir, WIIL8B6_2015_swir1, WIIL8B7_2015_swir2, 
                     WIINDVI2015, WIINBR2015, 
                     WIITCT2015_brightness, WIITCT2015_wetness, WIITCT2015_greenness, 
                     WIImetrics2015_max, WIImetrics2015_mean, WIImetrics2015_sd, 
                     WIImetrics2015_entropy, WIImetrics2015_fhd, WIImetrics2015_cc, WIImetrics2015_crr)
WIIdf2015<-as.data.frame(rast(WIIstack2015))

#write
# write.csv(WIdf2000,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIdf2000.csv")
# write.csv(WIdf2005,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIdf2005.csv")
# write.csv(WIdf2012,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIdf2012.csv")
# write.csv(WIdf2015,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIdf2015.csv")
# 
# write.csv(WIIdf2000,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIIdf2000.csv")
# write.csv(WIIdf2005,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIIdf2005.csv")
# write.csv(WIIdf2012,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIIdf2012.csv")
# write.csv(WIIdf2015,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/WIIdf2015.csv")

#stack predictors only (also by year)
WIstackpred2000 <- list(WIL5B1_2000_blue, WIL5B2_2000_green, WIL5B3_2000_red,
                        WIL5B4_2000_nir, WIL5B5_2000_swir1, WIL5B7_2000_swir2,
                        WINDVI2000, WINBR2000,
                        WITCT2000_brightness, WITCT2000_wetness, WITCT2000_greenness)
WIstackpred2000<-rast(WIstackpred2000)

WIstackpred2005 <- list(WIL5B1_2005_blue, WIL5B2_2005_green, WIL5B3_2005_red,
                        WIL5B4_2005_nir, WIL5B5_2005_swir1, WIL5B7_2005_swir2,
                        WINDVI2005, WINBR2005,
                        WITCT2005_brightness, WITCT2005_wetness, WITCT2005_greenness)
WIstackpred2005<-rast(WIstackpred2005)

WIstackpred2012 <- list(WIL8B2_2013_blue, WIL8B3_2013_green, WIL8B4_2013_red, 
                        WIL8B5_2013_nir, WIL8B6_2013_swir1, WIL8B7_2013_swir2, 
                        WINDVI2013, WINBR2013, 
                        WITCT2013_brightness, WITCT2013_wetness, WITCT2013_greenness)
WIstackpred2012<-rast(WIstackpred2012)

WIstackpred2015 <- list(WIL8B2_2015_blue, WIL8B3_2015_green, WIL8B4_2015_red, 
                        WIL8B5_2015_nir, WIL8B6_2015_swir1, WIL8B7_2015_swir2, 
                        WINDVI2015, WINBR2015, 
                        WITCT2015_brightness, WITCT2015_wetness, WITCT2015_greenness)
WIstackpred2015<-rast(WIstackpred2015)

WIIstackpred2000 <- list(WIIL5B1_2000_blue, WIIL5B2_2000_green, WIIL5B3_2000_red,
                         WIIL5B4_2000_nir, WIIL5B5_2000_swir1, WIIL5B7_2000_swir2,
                         WIINDVI2000, WIINBR2000,
                         WIITCT2000_brightness, WIITCT2000_wetness, WIITCT2000_greenness)
WIIstackpred2000<-rast(WIIstackpred2000)

WIIstackpred2005 <- list(WIIL5B1_2005_blue, WIIL5B2_2005_green, WIIL5B3_2005_red,
                         WIIL5B4_2005_nir, WIIL5B5_2005_swir1, WIIL5B7_2005_swir2,
                         WIINDVI2005, WIINBR2005,
                         WIITCT2005_brightness, WIITCT2005_wetness, WIITCT2005_greenness)
WIIstackpred2005<-rast(WIIstackpred2005)

WIIstackpred2012 <- list(WIIL8B2_2013_blue, WIIL8B3_2013_green, WIIL8B4_2013_red, 
                         WIIL8B5_2013_nir, WIIL8B6_2013_swir1, WIIL8B7_2013_swir2, 
                         WIINDVI2013, WIINBR2013, 
                         WIITCT2013_brightness, WIITCT2013_wetness, WIITCT2013_greenness)
WIIstackpred2012<-rast(WIIstackpred2012)

WIIstackpred2015 <- list(WIIL8B2_2015_blue, WIIL8B3_2015_green, WIIL8B4_2015_red, 
                         WIIL8B5_2015_nir, WIIL8B6_2015_swir1, WIIL8B7_2015_swir2, 
                         WIINDVI2015, WIINBR2015, 
                         WIITCT2015_brightness, WIITCT2015_wetness, WIITCT2015_greenness)
WIIstackpred2015<-rast(WIIstackpred2015)

####read the merged df of ROI back in####
data <- read.csv("D:/cambs/R_CH3_ALSspec/ALS_rasterize/ROI/df_mergedROI.csv")

sub2000 <- data %>% dplyr::filter(year=="2000")
sub2005 <- data %>% dplyr::filter(year=="2005")
sub2012 <- data %>% dplyr::filter(year=="2012")
sub2015 <- data %>% dplyr::filter(year=="2015")

set.seed(2024); train_sub2000 <- sample(nrow(sub2000), 0.7*nrow(sub2000), replace = FALSE)
sub2000_valid <- sub2000[-train_sub2000,]
sub2000_train <- sub2000[train_sub2000,]
set.seed(2024); train_sub2005 <- sample(nrow(sub2005), 0.7*nrow(sub2005), replace = FALSE)
sub2005_valid <- sub2005[-train_sub2005,]
sub2005_train <- sub2005[train_sub2005,]
set.seed(2024); train_sub2012 <- sample(nrow(sub2012), 0.7*nrow(sub2012), replace = FALSE)
sub2012_valid <- sub2012[-train_sub2012,]
sub2012_train <- sub2012[train_sub2012,]
set.seed(2024); train_sub2015 <- sample(nrow(sub2015), 0.7*nrow(sub2015), replace = FALSE)
sub2015_valid <- sub2015[-train_sub2015,]
sub2015_train <- sub2015[train_sub2015,]

forecast <- rbind(sub2000,sub2005,sub2012) #train with 2000, 2005, 2012 / predict on 2015
hindcast <- rbind(sub2005,sub2012,sub2015) #train with 2005, 2012, 2015 / predict on 2000
predict1a <- rbind(sub2000,sub2005,sub2015) #train with 2000, 2005, 2015 / predict on 2012
predict1b <- rbind(sub2000,sub2012,sub2015) #train with 2000, 2012, 2015 / predict on 2005
predict2 <- rbind(sub2000,sub2015) #train with 2000, 2015 / predict on 2005, 2012

set.seed(2024); train_forecast <- sample(nrow(forecast), 0.7*nrow(forecast), replace = FALSE)
forecast_valid <- forecast[-train_forecast,]
forecast_train <- forecast[train_forecast,]
set.seed(2024); train_hindcast <- sample(nrow(hindcast), 0.7*nrow(hindcast), replace = FALSE)
hindcast_valid <- hindcast[-train_hindcast,]
hindcast_train <- hindcast[train_hindcast,]
set.seed(2024); train_predict1a <- sample(nrow(predict1a), 0.7*nrow(predict1a), replace = FALSE)
predict1a_valid <- predict1a[-train_predict1a,]
predict1a_train <- predict1a[train_predict1a,]
set.seed(2024); train_predict1b <- sample(nrow(predict1b), 0.7*nrow(predict1b), replace = FALSE)
predict1b_valid <- predict1b[-train_predict1b,]
predict1b_train <- predict1b[train_predict1b,]
set.seed(2024); train_predict2 <- sample(nrow(predict2), 0.7*nrow(predict2), replace = FALSE)
predict2_valid <- predict2[-train_predict2,]
predict2_train <- predict2[train_predict2,]

#https://stats.stackexchange.com/questions/376959/random-forest-var-explained-oob-output-differs-from-test-dataset-results

####predict max height####
set.seed(2024)
rf_max_forecast <- randomForest(zmax ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = forecast_train, importance = TRUE)
rf_max_forecast

#importance
varImpPlot(rf_max_forecast, n.var=11)
#write.csv(importance(rf_max_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_forecast.csv')

#model validation using 30% of data
valid_rf_max_forecast <- predict(rf_max_forecast, forecast_valid, type = "response")
plot(forecast_valid$zmax, valid_rf_max_forecast)
#RMSE
res_valid_rf_max_forecast <- forecast_valid$zmax-valid_rf_max_forecast
RMSE_valid_rf_max_forecast <- sqrt(mean(res_valid_rf_max_forecast^2)); RMSE_valid_rf_max_forecast

#make temporal predictions
pred_rf_max_forecast <- predict(rf_max_forecast, sub2015, type = "response")
plot(sub2015$zmax, pred_rf_max_forecast)
#RMSE
res_pred_rf_max_forecast <- sub2015$zmax-pred_rf_max_forecast
RMSE_pred_rf_max_forecast <- sqrt(mean(res_pred_rf_max_forecast^2)); RMSE_pred_rf_max_forecast

#predict on raster
WIpred_rf_max_forecast_raster2015 <-predict(WIstackpred2015, rf_max_forecast)
plot(WIpred_rf_max_forecast_raster2015)
WIIpred_rf_max_forecast_raster2015 <-predict(WIIstackpred2015, rf_max_forecast)
plot(WIIpred_rf_max_forecast_raster2015)
#make absolute differenced raster
diff_max_forecast <- WIpred_rf_max_forecast_raster2015-WImetrics2015_max
plot(abs(diff_max_forecast)) #plot diff for WI
diff_max_forecast <- WIIpred_rf_max_forecast_raster2015-WIImetrics2015_max
plot(abs(diff_max_forecast)) #plot diff for WII
plot(WImetrics2015_max)

set.seed(2024)
rf_max_hindcast <- randomForest(zmax ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = hindcast_train, importance = TRUE)
rf_max_hindcast

#importance
varImpPlot(rf_max_hindcast, n.var=11)
#write.csv(importance(rf_max_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_hindcast.csv')

#model validation using 30% of data
valid_rf_max_hindcast <- predict(rf_max_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$zmax, valid_rf_max_hindcast)
#RMSE
res_valid_rf_max_hindcast <- hindcast_valid$zmax-valid_rf_max_hindcast
RMSE_valid_rf_max_hindcast <- sqrt(mean(res_valid_rf_max_hindcast^2)); RMSE_valid_rf_max_hindcast

#make temporal predictions
pred_rf_max_hindcast <- predict(rf_max_hindcast, sub2000, type = "response")
plot(sub2000$zmax, pred_rf_max_hindcast)
#RMSE
res_pred_rf_max_hindcast <- sub2000$zmax-pred_rf_max_hindcast
RMSE_pred_rf_max_hindcast <- sqrt(mean(res_pred_rf_max_hindcast^2)); RMSE_pred_rf_max_hindcast

#predict on raster
WIpred_rf_max_hindcast_raster2000 <-predict(WIstackpred2000, rf_max_hindcast)
plot(WIpred_rf_max_hindcast_raster2000)
WIIpred_rf_max_hindcast_raster2000 <-predict(WIIstackpred2000, rf_max_hindcast)
plot(WIIpred_rf_max_hindcast_raster2000)
#make absolute differenced raster
diff_max_hindcast <- WIpred_rf_max_hindcast_raster2000-WImetrics2000_max
plot(abs(diff_max_hindcast)) #plot diff for WI
diff_max_hindcast <- WIIpred_rf_max_hindcast_raster2000-WIImetrics2000_max
plot(abs(diff_max_hindcast)) #plot diff for WII

set.seed(2024)
rf_max_predict1a <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1a_train, importance = TRUE)
rf_max_predict1a

#importance
varImpPlot(rf_max_predict1a, n.var=11)
#write.csv(importance(rf_max_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict1a.csv')

#model validation using 30% of data
valid_rf_max_predict1a <- predict(rf_max_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$zmax, valid_rf_max_predict1a)
#RMSE
res_valid_rf_max_predict1a <- predict1a_valid$zmax-valid_rf_max_predict1a
RMSE_valid_rf_max_predict1a <- sqrt(mean(res_valid_rf_max_predict1a^2)); RMSE_valid_rf_max_predict1a

#make temporal predictions
pred_rf_max_predict1a <- predict(rf_max_predict1a, sub2012, type = "response")
plot(sub2012$zmax, pred_rf_max_predict1a)
#RMSE
res_pred_rf_max_predict1a <- sub2012$zmax-pred_rf_max_predict1a
RMSE_pred_rf_max_predict1a <- sqrt(mean(res_pred_rf_max_predict1a^2)); RMSE_pred_rf_max_predict1a

set.seed(2024)
rf_max_predict1b <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1b_train, importance = TRUE)
rf_max_predict1b

#importance
varImpPlot(rf_max_predict1b, n.var=11)
#write.csv(importance(rf_max_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict1b.csv')

#model validation using 30% of data
valid_rf_max_predict1b <- predict(rf_max_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$zmax, valid_rf_max_predict1b)
#RMSE
res_valid_rf_max_predict1b <- predict1b_valid$zmax-valid_rf_max_predict1b
RMSE_valid_rf_max_predict1b <- sqrt(mean(res_valid_rf_max_predict1b^2)); RMSE_valid_rf_max_predict1b

#make temporal predictions
pred_rf_max_predict1b <- predict(rf_max_predict1b, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict1b)
#RMSE
res_pred_rf_max_predict1b <- sub2005$zmax-pred_rf_max_predict1b
RMSE_pred_rf_max_predict1b <- sqrt(mean(res_pred_rf_max_predict1b^2)); RMSE_pred_rf_max_predict1b

#predict on raster
WIpred_rf_max_predict1b_raster2005 <-predict(WIstackpred2005, rf_max_predict1b)
plot(WIpred_rf_max_predict1b_raster2005)
WIIpred_rf_max_predict1b_raster2005 <-predict(WIIstackpred2005, rf_max_predict1b)
plot(WIIpred_rf_max_predict1b_raster2005)
#make absolute differenced raster
diff_max_predict1b <- WIpred_rf_max_predict1b_raster2005-WImetrics2005_max
plot(abs(diff_max_predict1b)) #plot diff for WI
diff_max_predict1b <- WIIpred_rf_max_predict1b_raster2005-WIImetrics2005_max
plot(abs(diff_max_predict1b)) #plot diff for WII

set.seed(2024)
rf_max_predict2 <- randomForest(zmax ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict2_train, importance = TRUE)
rf_max_predict2

#importance
varImpPlot(rf_max_predict2, n.var=11)
#write.csv(importance(rf_max_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict2.csv')

#model validation using 30% of data
valid_rf_max_predict2 <- predict(rf_max_predict2, predict2_valid, type = "response")
plot(predict2_valid$zmax, valid_rf_max_predict2)
#RMSE
res_valid_rf_max_predict2 <- predict2_valid$zmax-valid_rf_max_predict2
RMSE_valid_rf_max_predict2 <- sqrt(mean(res_valid_rf_max_predict2^2)); RMSE_valid_rf_max_predict2

#make temporal predictions: 2005
pred_rf_max_predict2 <- predict(rf_max_predict2, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict2)
#RMSE
res_pred_rf_max_predict2 <- sub2005$zmax-pred_rf_max_predict2
RMSE_pred_rf_max_predict2 <- sqrt(mean(res_pred_rf_max_predict2^2)); RMSE_pred_rf_max_predict2

#predict on raster: 2005
WIpred_rf_max_predict2_raster2005 <-predict(WIstackpred2005, rf_max_predict2)
plot(WIpred_rf_max_predict2_raster2005)
WIIpred_rf_max_predict2_raster2005 <-predict(WIIstackpred2005, rf_max_predict2)
plot(WIIpred_rf_max_predict2_raster2005)
#make absolute differenced raster
diff_max_predict2 <- WIpred_rf_max_predict2_raster2005-WImetrics2005_max
plot(abs(diff_max_predict2)) #plot diff for WI
diff_max_predict2 <- WIIpred_rf_max_predict2_raster2005-WIImetrics2005_max
plot(abs(diff_max_predict2)) #plot diff for WII
plot(WImetrics2005_max)
#make temporal predictions: 2012
pred_rf_max_predict2 <- predict(rf_max_predict2, sub2012, type = "response")
plot(sub2012$zmax, pred_rf_max_predict2)
#RMSE
res_pred_rf_max_predict2 <- sub2012$zmax-pred_rf_max_predict2
RMSE_pred_rf_max_predict2 <- sqrt(mean(res_pred_rf_max_predict2^2)); RMSE_pred_rf_max_predict2

#predict on raster: 2012
WIpred_rf_max_predict2_raster2012 <-predict(WIstackpred2012, rf_max_predict2)
plot(WIpred_rf_max_predict2_raster2012)
WIIpred_rf_max_predict2_raster2012 <-predict(WIIstackpred2012, rf_max_predict2)
plot(WIIpred_rf_max_predict2_raster2012)
#make absolute differenced raster
diff_max_predict2 <- WIpred_rf_max_predict2_raster2012-WImetrics2012_max
plot(abs(diff_max_predict2)) #plot diff for WI
diff_max_predict2 <- WIIpred_rf_max_predict2_raster2012-WIImetrics2012_max
plot(abs(diff_max_predict2)) #plot diff for WII

####predict mean height####
set.seed(2024)
rf_mean_forecast <- randomForest(zmean ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = forecast_train, importance = TRUE)
rf_mean_forecast

#importance
varImpPlot(rf_mean_forecast, n.var=11)
#write.csv(importance(rf_mean_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_forecast.csv')

#model validation using 30% of data
valid_rf_mean_forecast <- predict(rf_mean_forecast, forecast_valid, type = "response")
plot(forecast_valid$zmean, valid_rf_mean_forecast)
#RMSE
res_valid_rf_mean_forecast <- forecast_valid$zmean-valid_rf_mean_forecast
RMSE_valid_rf_mean_forecast <- sqrt(mean(res_valid_rf_mean_forecast^2)); RMSE_valid_rf_mean_forecast

#make temporal predictions
pred_rf_mean_forecast <- predict(rf_mean_forecast, sub2015, type = "response")
plot(sub2015$zmean, pred_rf_mean_forecast)
#RMSE
res_pred_rf_mean_forecast <- sub2015$zmean-pred_rf_mean_forecast
RMSE_pred_rf_mean_forecast <- sqrt(mean(res_pred_rf_mean_forecast^2)); RMSE_pred_rf_mean_forecast

#predict on raster
WIpred_rf_mean_forecast_raster2015 <-predict(WIstackpred2015, rf_mean_forecast)
plot(WIpred_rf_mean_forecast_raster2015)
WIIpred_rf_mean_forecast_raster2015 <-predict(WIIstackpred2015, rf_mean_forecast)
plot(WIIpred_rf_mean_forecast_raster2015)
#make absolute differenced raster
diff_mean_forecast <- WIpred_rf_mean_forecast_raster2015-WImetrics2015_mean
plot(abs(diff_mean_forecast)) #plot diff for WI
diff_mean_forecast <- WIIpred_rf_mean_forecast_raster2015-WIImetrics2015_mean
plot(abs(diff_mean_forecast)) #plot diff for WII
plot(WImetrics2015_mean)

set.seed(2024)
rf_mean_hindcast <- randomForest(zmean ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = hindcast_train, importance = TRUE)
rf_mean_hindcast

#importance
varImpPlot(rf_mean_hindcast, n.var=11)
#write.csv(importance(rf_mean_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_hindcast.csv')

#model validation using 30% of data
valid_rf_mean_hindcast <- predict(rf_mean_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$zmean, valid_rf_mean_hindcast)
#RMSE
res_valid_rf_mean_hindcast <- hindcast_valid$zmean-valid_rf_mean_hindcast
RMSE_valid_rf_mean_hindcast <- sqrt(mean(res_valid_rf_mean_hindcast^2)); RMSE_valid_rf_mean_hindcast

#make temporal predictions
pred_rf_mean_hindcast <- predict(rf_mean_hindcast, sub2000, type = "response")
plot(sub2000$zmean, pred_rf_mean_hindcast)
#RMSE
res_pred_rf_mean_hindcast <- sub2000$zmean-pred_rf_mean_hindcast
RMSE_pred_rf_mean_hindcast <- sqrt(mean(res_pred_rf_mean_hindcast^2)); RMSE_pred_rf_mean_hindcast

#predict on raster
WIpred_rf_mean_hindcast_raster2000 <-predict(WIstackpred2000, rf_mean_hindcast)
plot(WIpred_rf_mean_hindcast_raster2000)
WIIpred_rf_mean_hindcast_raster2000 <-predict(WIIstackpred2000, rf_mean_hindcast)
plot(WIIpred_rf_mean_hindcast_raster2000)
#make absolute differenced raster
diff_mean_hindcast <- WIpred_rf_mean_hindcast_raster2000-WImetrics2000_mean
plot(abs(diff_mean_hindcast)) #plot diff for WI
diff_mean_hindcast <- WIIpred_rf_mean_hindcast_raster2000-WIImetrics2000_mean
plot(abs(diff_mean_hindcast)) #plot diff for WII

set.seed(2024)
rf_mean_predict1a <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = predict1a_train, importance = TRUE)
rf_mean_predict1a

#importance
varImpPlot(rf_mean_predict1a, n.var=11)
#write.csv(importance(rf_mean_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict1a.csv')

#model validation using 30% of data
valid_rf_mean_predict1a <- predict(rf_mean_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$zmean, valid_rf_mean_predict1a)
#RMSE
res_valid_rf_mean_predict1a <- predict1a_valid$zmean-valid_rf_mean_predict1a
RMSE_valid_rf_mean_predict1a <- sqrt(mean(res_valid_rf_mean_predict1a^2)); RMSE_valid_rf_mean_predict1a

#make temporal predictions
pred_rf_mean_predict1a <- predict(rf_mean_predict1a, sub2012, type = "response")
plot(sub2012$zmean, pred_rf_mean_predict1a)
#RMSE
res_pred_rf_mean_predict1a <- sub2012$zmean-pred_rf_mean_predict1a
RMSE_pred_rf_mean_predict1a <- sqrt(mean(res_pred_rf_mean_predict1a^2)); RMSE_pred_rf_mean_predict1a

set.seed(2024)
rf_mean_predict1b <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = predict1b_train, importance = TRUE)
rf_mean_predict1b

#importance
varImpPlot(rf_mean_predict1b, n.var=11)
#write.csv(importance(rf_mean_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict1b.csv')

#model validation using 30% of data
valid_rf_mean_predict1b <- predict(rf_mean_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$zmean, valid_rf_mean_predict1b)
#RMSE
res_valid_rf_mean_predict1b <- predict1b_valid$zmean-valid_rf_mean_predict1b
RMSE_valid_rf_mean_predict1b <- sqrt(mean(res_valid_rf_mean_predict1b^2)); RMSE_valid_rf_mean_predict1b

#make temporal predictions
pred_rf_mean_predict1b <- predict(rf_mean_predict1b, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict1b)
#RMSE
res_pred_rf_mean_predict1b <- sub2005$zmean-pred_rf_mean_predict1b
RMSE_pred_rf_mean_predict1b <- sqrt(mean(res_pred_rf_mean_predict1b^2)); RMSE_pred_rf_mean_predict1b

#predict on raster
WIpred_rf_mean_predict1b_raster2005 <-predict(WIstackpred2005, rf_mean_predict1b)
plot(WIpred_rf_mean_predict1b_raster2005)
WIIpred_rf_mean_predict1b_raster2005 <-predict(WIIstackpred2005, rf_mean_predict1b)
plot(WIIpred_rf_mean_predict1b_raster2005)
#make absolute differenced raster
diff_mean_predict1b <- WIpred_rf_mean_predict1b_raster2005-WImetrics2005_mean
plot(abs(diff_mean_predict1b)) #plot diff for WI
diff_mean_predict1b <- WIIpred_rf_mean_predict1b_raster2005-WIImetrics2005_mean
plot(abs(diff_mean_predict1b)) #plot diff for WII

set.seed(2024)
rf_mean_predict2 <- randomForest(zmean ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict2_train, importance = TRUE)
rf_mean_predict2

#importance
varImpPlot(rf_mean_predict2, n.var=11)
#write.csv(importance(rf_mean_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict2.csv')

#model validation using 30% of data
valid_rf_mean_predict2 <- predict(rf_mean_predict2, predict2_valid, type = "response")
plot(predict2_valid$zmean, valid_rf_mean_predict2)
#RMSE
res_valid_rf_mean_predict2 <- predict2_valid$zmean-valid_rf_mean_predict2
RMSE_valid_rf_mean_predict2 <- sqrt(mean(res_valid_rf_mean_predict2^2)); RMSE_valid_rf_mean_predict2

#make temporal predictions: 2005
pred_rf_mean_predict2 <- predict(rf_mean_predict2, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict2)
#RMSE
res_pred_rf_mean_predict2 <- sub2005$zmean-pred_rf_mean_predict2
RMSE_pred_rf_mean_predict2 <- sqrt(mean(res_pred_rf_mean_predict2^2)); RMSE_pred_rf_mean_predict2

#predict on raster: 2005
WIpred_rf_mean_predict2_raster2005 <-predict(WIstackpred2005, rf_mean_predict2)
plot(WIpred_rf_mean_predict2_raster2005)
WIIpred_rf_mean_predict2_raster2005 <-predict(WIIstackpred2005, rf_mean_predict2)
plot(WIIpred_rf_mean_predict2_raster2005)
#make absolute differenced raster
diff_mean_predict2 <- WIpred_rf_mean_predict2_raster2005-WImetrics2005_mean
plot(abs(diff_mean_predict2)) #plot diff for WI
diff_mean_predict2 <- WIIpred_rf_mean_predict2_raster2005-WIImetrics2005_mean
plot(abs(diff_mean_predict2)) #plot diff for WII

#make temporal predictions: 2012
pred_rf_mean_predict2 <- predict(rf_mean_predict2, sub2012, type = "response")
plot(sub2012$zmean, pred_rf_mean_predict2)
#RMSE
res_pred_rf_mean_predict2 <- sub2012$zmean-pred_rf_mean_predict2
RMSE_pred_rf_mean_predict2 <- sqrt(mean(res_pred_rf_mean_predict2^2)); RMSE_pred_rf_mean_predict2

#predict on raster: 2012
WIpred_rf_mean_predict2_raster2012 <-predict(WIstackpred2012, rf_mean_predict2)
plot(WIpred_rf_mean_predict2_raster2012)
WIIpred_rf_mean_predict2_raster2012 <-predict(WIIstackpred2012, rf_mean_predict2)
plot(WIIpred_rf_mean_predict2_raster2012)
#make absolute differenced raster
diff_mean_predict2 <- WIpred_rf_mean_predict2_raster2012-WImetrics2012_mean
plot(abs(diff_mean_predict2)) #plot diff for WI
diff_mean_predict2 <- WIIpred_rf_mean_predict2_raster2012-WIImetrics2012_mean
plot(abs(diff_mean_predict2)) #plot diff for WII

####predict sd height####
set.seed(2024)
rf_sd_forecast <- randomForest(zsd ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = forecast_train, importance = TRUE)
rf_sd_forecast

#importance
varImpPlot(rf_sd_forecast, n.var=11)
#write.csv(importance(rf_sd_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_forecast.csv')

#model validation using 30% of data
valid_rf_sd_forecast <- predict(rf_sd_forecast, forecast_valid, type = "response")
plot(forecast_valid$zsd, valid_rf_sd_forecast)
#RMSE
res_valid_rf_sd_forecast <- forecast_valid$zsd-valid_rf_sd_forecast
RMSE_valid_rf_sd_forecast <- sqrt(mean(res_valid_rf_sd_forecast^2)); RMSE_valid_rf_sd_forecast

#make temporal predictions
pred_rf_sd_forecast <- predict(rf_sd_forecast, sub2015, type = "response")
plot(sub2015$zsd, pred_rf_sd_forecast)
#RMSE
res_pred_rf_sd_forecast <- sub2015$zsd-pred_rf_sd_forecast
RMSE_pred_rf_sd_forecast <- sqrt(mean(res_pred_rf_sd_forecast^2)); RMSE_pred_rf_sd_forecast

#predict on raster
WIpred_rf_sd_forecast_raster2015 <-predict(WIstackpred2015, rf_sd_forecast)
plot(WIpred_rf_sd_forecast_raster2015)
WIIpred_rf_sd_forecast_raster2015 <-predict(WIIstackpred2015, rf_sd_forecast)
plot(WIIpred_rf_sd_forecast_raster2015)
#make absolute differenced raster
diff_sd_forecast <- WIpred_rf_sd_forecast_raster2015-WImetrics2015_sd
plot(abs(diff_sd_forecast)) #plot diff for WI
diff_sd_forecast <- WIIpred_rf_sd_forecast_raster2015-WIImetrics2015_sd
plot(abs(diff_sd_forecast)) #plot diff for WII
plot(WImetrics2015_sd)

set.seed(2024)
rf_sd_hindcast <- randomForest(zsd ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = hindcast_train, importance = TRUE)
rf_sd_hindcast

#importance
varImpPlot(rf_sd_hindcast, n.var=11)
#write.csv(importance(rf_sd_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_hindcast.csv')

#model validation using 30% of data
valid_rf_sd_hindcast <- predict(rf_sd_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$zsd, valid_rf_sd_hindcast)
#RMSE
res_valid_rf_sd_hindcast <- hindcast_valid$zsd-valid_rf_sd_hindcast
RMSE_valid_rf_sd_hindcast <- sqrt(mean(res_valid_rf_sd_hindcast^2)); RMSE_valid_rf_sd_hindcast

#make temporal predictions
pred_rf_sd_hindcast <- predict(rf_sd_hindcast, sub2000, type = "response")
plot(sub2000$zsd, pred_rf_sd_hindcast)
#RMSE
res_pred_rf_sd_hindcast <- sub2000$zsd-pred_rf_sd_hindcast
RMSE_pred_rf_sd_hindcast <- sqrt(mean(res_pred_rf_sd_hindcast^2)); RMSE_pred_rf_sd_hindcast

#predict on raster
WIpred_rf_sd_hindcast_raster2000 <-predict(WIstackpred2000, rf_sd_hindcast)
plot(WIpred_rf_sd_hindcast_raster2000)
WIIpred_rf_sd_hindcast_raster2000 <-predict(WIIstackpred2000, rf_sd_hindcast)
plot(WIIpred_rf_sd_hindcast_raster2000)
#make absolute differenced raster
diff_sd_hindcast <- WIpred_rf_sd_hindcast_raster2000-WImetrics2000_sd
plot(abs(diff_sd_hindcast)) #plot diff for WI
diff_sd_hindcast <- WIIpred_rf_sd_hindcast_raster2000-WIImetrics2000_sd
plot(abs(diff_sd_hindcast)) #plot diff for WII

set.seed(2024)
rf_sd_predict1a <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1a_train, importance = TRUE)
rf_sd_predict1a

#importance
varImpPlot(rf_sd_predict1a, n.var=11)
#write.csv(importance(rf_sd_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict1a.csv')

#model validation using 30% of data
valid_rf_sd_predict1a <- predict(rf_sd_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$zsd, valid_rf_sd_predict1a)
#RMSE
res_valid_rf_sd_predict1a <- predict1a_valid$zsd-valid_rf_sd_predict1a
RMSE_valid_rf_sd_predict1a <- sqrt(mean(res_valid_rf_sd_predict1a^2)); RMSE_valid_rf_sd_predict1a

#make temporal predictions
pred_rf_sd_predict1a <- predict(rf_sd_predict1a, sub2012, type = "response")
plot(sub2012$zsd, pred_rf_sd_predict1a)
#RMSE
res_pred_rf_sd_predict1a <- sub2012$zsd-pred_rf_sd_predict1a
RMSE_pred_rf_sd_predict1a <- sqrt(mean(res_pred_rf_sd_predict1a^2)); RMSE_pred_rf_sd_predict1a

set.seed(2024)
rf_sd_predict1b <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1b_train, importance = TRUE)
rf_sd_predict1b

#importance
varImpPlot(rf_sd_predict1b, n.var=11)
#write.csv(importance(rf_sd_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict1b.csv')

#model validation using 30% of data
valid_rf_sd_predict1b <- predict(rf_sd_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$zsd, valid_rf_sd_predict1b)
#RMSE
res_valid_rf_sd_predict1b <- predict1b_valid$zsd-valid_rf_sd_predict1b
RMSE_valid_rf_sd_predict1b <- sqrt(mean(res_valid_rf_sd_predict1b^2)); RMSE_valid_rf_sd_predict1b

#make temporal predictions
pred_rf_sd_predict1b <- predict(rf_sd_predict1b, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict1b)
#RMSE
res_pred_rf_sd_predict1b <- sub2005$zsd-pred_rf_sd_predict1b
RMSE_pred_rf_sd_predict1b <- sqrt(mean(res_pred_rf_sd_predict1b^2)); RMSE_pred_rf_sd_predict1b

#predict on raster
WIpred_rf_sd_predict1b_raster2005 <-predict(WIstackpred2005, rf_sd_predict1b)
plot(WIpred_rf_sd_predict1b_raster2005)
WIIpred_rf_sd_predict1b_raster2005 <-predict(WIIstackpred2005, rf_sd_predict1b)
plot(WIIpred_rf_sd_predict1b_raster2005)
#make absolute differenced raster
diff_sd_predict1b <- WIpred_rf_sd_predict1b_raster2005-WImetrics2005_sd
plot(abs(diff_sd_predict1b)) #plot diff for WI
diff_sd_predict1b <- WIIpred_rf_sd_predict1b_raster2005-WIImetrics2005_sd
plot(abs(diff_sd_predict1b)) #plot diff for WII

set.seed(2024)
rf_sd_predict2 <- randomForest(zsd ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = predict2_train, importance = TRUE)
rf_sd_predict2

#importance
varImpPlot(rf_sd_predict2, n.var=11)
#write.csv(importance(rf_sd_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict2.csv')

#model validation using 30% of data
valid_rf_sd_predict2 <- predict(rf_sd_predict2, predict2_valid, type = "response")
plot(predict2_valid$zsd, valid_rf_sd_predict2)
#RMSE
res_valid_rf_sd_predict2 <- predict2_valid$zsd-valid_rf_sd_predict2
RMSE_valid_rf_sd_predict2 <- sqrt(mean(res_valid_rf_sd_predict2^2)); RMSE_valid_rf_sd_predict2

#make temporal predictions: 2005
pred_rf_sd_predict2 <- predict(rf_sd_predict2, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict2)
#RMSE
res_pred_rf_sd_predict2 <- sub2005$zsd-pred_rf_sd_predict2
RMSE_pred_rf_sd_predict2 <- sqrt(mean(res_pred_rf_sd_predict2^2)); RMSE_pred_rf_sd_predict2

#predict on raster: 2005
WIpred_rf_sd_predict2_raster2005 <-predict(WIstackpred2005, rf_sd_predict2)
plot(WIpred_rf_sd_predict2_raster2005)
WIIpred_rf_sd_predict2_raster2005 <-predict(WIIstackpred2005, rf_sd_predict2)
plot(WIIpred_rf_sd_predict2_raster2005)
#make absolute differenced raster
diff_sd_predict2 <- WIpred_rf_sd_predict2_raster2005-WImetrics2005_sd
plot(abs(diff_sd_predict2)) #plot diff for WI
diff_sd_predict2 <- WIIpred_rf_sd_predict2_raster2005-WIImetrics2005_sd
plot(abs(diff_sd_predict2)) #plot diff for WII

#make temporal predictions: 2012
pred_rf_sd_predict2 <- predict(rf_sd_predict2, sub2012, type = "response")
plot(sub2012$zsd, pred_rf_sd_predict2)
#RMSE
res_pred_rf_sd_predict2 <- sub2012$zsd-pred_rf_sd_predict2
RMSE_pred_rf_sd_predict2 <- sqrt(mean(res_pred_rf_sd_predict2^2)); RMSE_pred_rf_sd_predict2

#predict on raster: 2012
WIpred_rf_sd_predict2_raster2012 <-predict(WIstackpred2012, rf_sd_predict2)
plot(WIpred_rf_sd_predict2_raster2012)
WIIpred_rf_sd_predict2_raster2012 <-predict(WIIstackpred2012, rf_sd_predict2)
plot(WIIpred_rf_sd_predict2_raster2012)
#make absolute differenced raster
diff_sd_predict2 <- WIpred_rf_sd_predict2_raster2012-WImetrics2012_sd
plot(abs(diff_sd_predict2)) #plot diff for WI
diff_sd_predict2 <- WIIpred_rf_sd_predict2_raster2012-WIImetrics2012_sd
plot(abs(diff_sd_predict2)) #plot diff for WII

####predict entropy####
set.seed(2024)
rf_entropy_forecast <- randomForest(entropy ~ 
                                      blue+green+red+nir+swir1+swir2+
                                      NDVI+NBR+brightness+wetness+greenness, 
                                    data = forecast_train, importance = TRUE)
rf_entropy_forecast

#importance
varImpPlot(rf_entropy_forecast, n.var=11)
#write.csv(importance(rf_entropy_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_forecast.csv')

#model validation using 30% of data
valid_rf_entropy_forecast <- predict(rf_entropy_forecast, forecast_valid, type = "response")
plot(forecast_valid$entropy, valid_rf_entropy_forecast)
#RMSE
res_valid_rf_entropy_forecast <- forecast_valid$entropy-valid_rf_entropy_forecast
RMSE_valid_rf_entropy_forecast <- sqrt(mean(res_valid_rf_entropy_forecast^2)); RMSE_valid_rf_entropy_forecast

#make temporal predictions
pred_rf_entropy_forecast <- predict(rf_entropy_forecast, sub2015, type = "response")
plot(sub2015$entropy, pred_rf_entropy_forecast)
#RMSE
res_pred_rf_entropy_forecast <- sub2015$entropy-pred_rf_entropy_forecast
RMSE_pred_rf_entropy_forecast <- sqrt(mean(res_pred_rf_entropy_forecast^2)); RMSE_pred_rf_entropy_forecast

#predict on raster
WIpred_rf_entropy_forecast_raster2015 <-predict(WIstackpred2015, rf_entropy_forecast)
plot(WIpred_rf_entropy_forecast_raster2015)
WIIpred_rf_entropy_forecast_raster2015 <-predict(WIIstackpred2015, rf_entropy_forecast)
plot(WIIpred_rf_entropy_forecast_raster2015)
#make absolute differenced raster
diff_entropy_forecast <- WIpred_rf_entropy_forecast_raster2015-WImetrics2015_entropy
plot(abs(diff_entropy_forecast)) #plot diff for WI
diff_entropy_forecast <- WIIpred_rf_entropy_forecast_raster2015-WIImetrics2015_entropy
plot(abs(diff_entropy_forecast)) #plot diff for WII
plot(WImetrics2015_entropy)

set.seed(2024)
rf_entropy_hindcast <- randomForest(entropy ~ 
                                      blue+green+red+nir+swir1+swir2+
                                      NDVI+NBR+brightness+wetness+greenness, 
                                    data = hindcast_train, importance = TRUE)
rf_entropy_hindcast

#importance
varImpPlot(rf_entropy_hindcast, n.var=11)
#write.csv(importance(rf_entropy_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_hindcast.csv')

#model validation using 30% of data
valid_rf_entropy_hindcast <- predict(rf_entropy_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$entropy, valid_rf_entropy_hindcast)
#RMSE
res_valid_rf_entropy_hindcast <- hindcast_valid$entropy-valid_rf_entropy_hindcast
RMSE_valid_rf_entropy_hindcast <- sqrt(mean(res_valid_rf_entropy_hindcast^2)); RMSE_valid_rf_entropy_hindcast

#make temporal predictions
pred_rf_entropy_hindcast <- predict(rf_entropy_hindcast, sub2000, type = "response")
plot(sub2000$entropy, pred_rf_entropy_hindcast)
#RMSE
res_pred_rf_entropy_hindcast <- sub2000$entropy-pred_rf_entropy_hindcast
RMSE_pred_rf_entropy_hindcast <- sqrt(mean(res_pred_rf_entropy_hindcast^2)); RMSE_pred_rf_entropy_hindcast

#predict on raster
WIpred_rf_entropy_hindcast_raster2000 <-predict(WIstackpred2000, rf_entropy_hindcast)
plot(WIpred_rf_entropy_hindcast_raster2000)
WIIpred_rf_entropy_hindcast_raster2000 <-predict(WIIstackpred2000, rf_entropy_hindcast)
plot(WIIpred_rf_entropy_hindcast_raster2000)
#make absolute differenced raster
diff_entropy_hindcast <- WIpred_rf_entropy_hindcast_raster2000-WImetrics2000_entropy
plot(abs(diff_entropy_hindcast)) #plot diff for WI
diff_entropy_hindcast <- WIIpred_rf_entropy_hindcast_raster2000-WIImetrics2000_entropy
plot(abs(diff_entropy_hindcast)) #plot diff for WII

set.seed(2024)
rf_entropy_predict1a <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = predict1a_train, importance = TRUE)
rf_entropy_predict1a

#importance
varImpPlot(rf_entropy_predict1a, n.var=11)
#write.csv(importance(rf_entropy_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict1a.csv')

#model validation using 30% of data
valid_rf_entropy_predict1a <- predict(rf_entropy_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$entropy, valid_rf_entropy_predict1a)
#RMSE
res_valid_rf_entropy_predict1a <- predict1a_valid$entropy-valid_rf_entropy_predict1a
RMSE_valid_rf_entropy_predict1a <- sqrt(mean(res_valid_rf_entropy_predict1a^2)); RMSE_valid_rf_entropy_predict1a

#make temporal predictions
pred_rf_entropy_predict1a <- predict(rf_entropy_predict1a, sub2012, type = "response")
plot(sub2012$entropy, pred_rf_entropy_predict1a)
#RMSE
res_pred_rf_entropy_predict1a <- sub2012$entropy-pred_rf_entropy_predict1a
RMSE_pred_rf_entropy_predict1a <- sqrt(mean(res_pred_rf_entropy_predict1a^2)); RMSE_pred_rf_entropy_predict1a

set.seed(2024)
rf_entropy_predict1b <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = predict1b_train, importance = TRUE)
rf_entropy_predict1b

#importance
varImpPlot(rf_entropy_predict1b, n.var=11)
#write.csv(importance(rf_entropy_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict1b.csv')

#model validation using 30% of data
valid_rf_entropy_predict1b <- predict(rf_entropy_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$entropy, valid_rf_entropy_predict1b)
#RMSE
res_valid_rf_entropy_predict1b <- predict1b_valid$entropy-valid_rf_entropy_predict1b
RMSE_valid_rf_entropy_predict1b <- sqrt(mean(res_valid_rf_entropy_predict1b^2)); RMSE_valid_rf_entropy_predict1b

#make temporal predictions
pred_rf_entropy_predict1b <- predict(rf_entropy_predict1b, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict1b)
#RMSE
res_pred_rf_entropy_predict1b <- sub2005$entropy-pred_rf_entropy_predict1b
RMSE_pred_rf_entropy_predict1b <- sqrt(mean(res_pred_rf_entropy_predict1b^2)); RMSE_pred_rf_entropy_predict1b

#predict on raster
WIpred_rf_entropy_predict1b_raster2005 <-predict(WIstackpred2005, rf_entropy_predict1b)
plot(WIpred_rf_entropy_predict1b_raster2005)
WIIpred_rf_entropy_predict1b_raster2005 <-predict(WIIstackpred2005, rf_entropy_predict1b)
plot(WIIpred_rf_entropy_predict1b_raster2005)
#make absolute differenced raster
diff_entropy_predict1b <- WIpred_rf_entropy_predict1b_raster2005-WImetrics2005_entropy
plot(abs(diff_entropy_predict1b)) #plot diff for WI
diff_entropy_predict1b <- WIIpred_rf_entropy_predict1b_raster2005-WIImetrics2005_entropy
plot(abs(diff_entropy_predict1b)) #plot diff for WII

set.seed(2024)
rf_entropy_predict2 <- randomForest(entropy ~ 
                                      blue+green+red+nir+swir1+swir2+
                                      NDVI+NBR+brightness+wetness+greenness, 
                                    data = predict2_train, importance = TRUE)
rf_entropy_predict2

#importance
varImpPlot(rf_entropy_predict2, n.var=11)
#write.csv(importance(rf_entropy_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict2.csv')

#model validation using 30% of data
valid_rf_entropy_predict2 <- predict(rf_entropy_predict2, predict2_valid, type = "response")
plot(predict2_valid$entropy, valid_rf_entropy_predict2)
#RMSE
res_valid_rf_entropy_predict2 <- predict2_valid$entropy-valid_rf_entropy_predict2
RMSE_valid_rf_entropy_predict2 <- sqrt(mean(res_valid_rf_entropy_predict2^2)); RMSE_valid_rf_entropy_predict2

#make temporal predictions: 2005
pred_rf_entropy_predict2 <- predict(rf_entropy_predict2, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict2)
#RMSE
res_pred_rf_entropy_predict2 <- sub2005$entropy-pred_rf_entropy_predict2
RMSE_pred_rf_entropy_predict2 <- sqrt(mean(res_pred_rf_entropy_predict2^2)); RMSE_pred_rf_entropy_predict2

#predict on raster: 2005
WIpred_rf_entropy_predict2_raster2005 <-predict(WIstackpred2005, rf_entropy_predict2)
plot(WIpred_rf_entropy_predict2_raster2005)
WIIpred_rf_entropy_predict2_raster2005 <-predict(WIIstackpred2005, rf_entropy_predict2)
plot(WIIpred_rf_entropy_predict2_raster2005)
#make absolute differenced raster
diff_entropy_predict2 <- WIpred_rf_entropy_predict2_raster2005-WImetrics2005_entropy
plot(abs(diff_entropy_predict2)) #plot diff for WI
diff_entropy_predict2 <- WIIpred_rf_entropy_predict2_raster2005-WIImetrics2005_entropy
plot(abs(diff_entropy_predict2)) #plot diff for WII

#make temporal predictions: 2012
pred_rf_entropy_predict2 <- predict(rf_entropy_predict2, sub2012, type = "response")
plot(sub2012$entropy, pred_rf_entropy_predict2)
#RMSE
res_pred_rf_entropy_predict2 <- sub2012$entropy-pred_rf_entropy_predict2
RMSE_pred_rf_entropy_predict2 <- sqrt(mean(res_pred_rf_entropy_predict2^2)); RMSE_pred_rf_entropy_predict2

#predict on raster: 2012
WIpred_rf_entropy_predict2_raster2012 <-predict(WIstackpred2012, rf_entropy_predict2)
plot(WIpred_rf_entropy_predict2_raster2012)
WIIpred_rf_entropy_predict2_raster2012 <-predict(WIIstackpred2012, rf_entropy_predict2)
plot(WIIpred_rf_entropy_predict2_raster2012)
#make absolute differenced raster
diff_entropy_predict2 <- WIpred_rf_entropy_predict2_raster2012-WImetrics2012_entropy
plot(abs(diff_entropy_predict2)) #plot diff for WI
diff_entropy_predict2 <- WIIpred_rf_entropy_predict2_raster2012-WIImetrics2012_entropy
plot(abs(diff_entropy_predict2)) #plot diff for WII

####predict fhd####
set.seed(2024)
rf_fhd_forecast <- randomForest(fhd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = forecast_train, importance = TRUE)
rf_fhd_forecast

#importance
varImpPlot(rf_fhd_forecast, n.var=11)
#write.csv(importance(rf_fhd_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_forecast.csv')

#model validation using 30% of data
valid_rf_fhd_forecast <- predict(rf_fhd_forecast, forecast_valid, type = "response")
plot(forecast_valid$fhd, valid_rf_fhd_forecast)
#RMSE
res_valid_rf_fhd_forecast <- forecast_valid$fhd-valid_rf_fhd_forecast
RMSE_valid_rf_fhd_forecast <- sqrt(mean(res_valid_rf_fhd_forecast^2)); RMSE_valid_rf_fhd_forecast

#make temporal predictions
pred_rf_fhd_forecast <- predict(rf_fhd_forecast, sub2015, type = "response")
plot(sub2015$fhd, pred_rf_fhd_forecast)
#RMSE
res_pred_rf_fhd_forecast <- sub2015$fhd-pred_rf_fhd_forecast
RMSE_pred_rf_fhd_forecast <- sqrt(mean(res_pred_rf_fhd_forecast^2)); RMSE_pred_rf_fhd_forecast

#predict on raster
WIpred_rf_fhd_forecast_raster2015 <-predict(WIstackpred2015, rf_fhd_forecast)
plot(WIpred_rf_fhd_forecast_raster2015)
WIIpred_rf_fhd_forecast_raster2015 <-predict(WIIstackpred2015, rf_fhd_forecast)
plot(WIIpred_rf_fhd_forecast_raster2015)
#make absolute differenced raster
diff_fhd_forecast <- WIpred_rf_fhd_forecast_raster2015-WImetrics2015_fhd
plot(abs(diff_fhd_forecast)) #plot diff for WI
diff_fhd_forecast <- WIIpred_rf_fhd_forecast_raster2015-WIImetrics2015_fhd
plot(abs(diff_fhd_forecast)) #plot diff for WII
plot(WImetrics2015_fhd)

set.seed(2024)
rf_fhd_hindcast <- randomForest(fhd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = hindcast_train, importance = TRUE)
rf_fhd_hindcast

#importance
varImpPlot(rf_fhd_hindcast, n.var=11)
#write.csv(importance(rf_fhd_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_hindcast.csv')

#model validation using 30% of data
valid_rf_fhd_hindcast <- predict(rf_fhd_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$fhd, valid_rf_fhd_hindcast)
#RMSE
res_valid_rf_fhd_hindcast <- hindcast_valid$fhd-valid_rf_fhd_hindcast
RMSE_valid_rf_fhd_hindcast <- sqrt(mean(res_valid_rf_fhd_hindcast^2)); RMSE_valid_rf_fhd_hindcast

#make temporal predictions
pred_rf_fhd_hindcast <- predict(rf_fhd_hindcast, sub2000, type = "response")
plot(sub2000$fhd, pred_rf_fhd_hindcast)
#RMSE
res_pred_rf_fhd_hindcast <- sub2000$fhd-pred_rf_fhd_hindcast
RMSE_pred_rf_fhd_hindcast <- sqrt(mean(res_pred_rf_fhd_hindcast^2)); RMSE_pred_rf_fhd_hindcast

#predict on raster
WIpred_rf_fhd_hindcast_raster2000 <-predict(WIstackpred2000, rf_fhd_hindcast)
plot(WIpred_rf_fhd_hindcast_raster2000)
WIIpred_rf_fhd_hindcast_raster2000 <-predict(WIIstackpred2000, rf_fhd_hindcast)
plot(WIIpred_rf_fhd_hindcast_raster2000)
#make absolute differenced raster
diff_fhd_hindcast <- WIpred_rf_fhd_hindcast_raster2000-WImetrics2000_fhd
plot(abs(diff_fhd_hindcast)) #plot diff for WI
diff_fhd_hindcast <- WIIpred_rf_fhd_hindcast_raster2000-WIImetrics2000_fhd
plot(abs(diff_fhd_hindcast)) #plot diff for WII

set.seed(2024)
rf_fhd_predict1a <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1a_train, importance = TRUE)
rf_fhd_predict1a

#importance
varImpPlot(rf_fhd_predict1a, n.var=11)
#write.csv(importance(rf_fhd_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict1a.csv')

#model validation using 30% of data
valid_rf_fhd_predict1a <- predict(rf_fhd_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$fhd, valid_rf_fhd_predict1a)
#RMSE
res_valid_rf_fhd_predict1a <- predict1a_valid$fhd-valid_rf_fhd_predict1a
RMSE_valid_rf_fhd_predict1a <- sqrt(mean(res_valid_rf_fhd_predict1a^2)); RMSE_valid_rf_fhd_predict1a

#make temporal predictions
pred_rf_fhd_predict1a <- predict(rf_fhd_predict1a, sub2012, type = "response")
plot(sub2012$fhd, pred_rf_fhd_predict1a)
#RMSE
res_pred_rf_fhd_predict1a <- sub2012$fhd-pred_rf_fhd_predict1a
RMSE_pred_rf_fhd_predict1a <- sqrt(mean(res_pred_rf_fhd_predict1a^2)); RMSE_pred_rf_fhd_predict1a

set.seed(2024)
rf_fhd_predict1b <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1b_train, importance = TRUE)
rf_fhd_predict1b

#importance
varImpPlot(rf_fhd_predict1b, n.var=11)
#write.csv(importance(rf_fhd_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict1b.csv')

#model validation using 30% of data
valid_rf_fhd_predict1b <- predict(rf_fhd_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$fhd, valid_rf_fhd_predict1b)
#RMSE
res_valid_rf_fhd_predict1b <- predict1b_valid$fhd-valid_rf_fhd_predict1b
RMSE_valid_rf_fhd_predict1b <- sqrt(mean(res_valid_rf_fhd_predict1b^2)); RMSE_valid_rf_fhd_predict1b

#make temporal predictions
pred_rf_fhd_predict1b <- predict(rf_fhd_predict1b, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict1b)
#RMSE
res_pred_rf_fhd_predict1b <- sub2005$fhd-pred_rf_fhd_predict1b
RMSE_pred_rf_fhd_predict1b <- sqrt(mean(res_pred_rf_fhd_predict1b^2)); RMSE_pred_rf_fhd_predict1b

#predict on raster
WIpred_rf_fhd_predict1b_raster2005 <-predict(WIstackpred2005, rf_fhd_predict1b)
plot(WIpred_rf_fhd_predict1b_raster2005)
WIIpred_rf_fhd_predict1b_raster2005 <-predict(WIIstackpred2005, rf_fhd_predict1b)
plot(WIIpred_rf_fhd_predict1b_raster2005)
#make absolute differenced raster
diff_fhd_predict1b <- WIpred_rf_fhd_predict1b_raster2005-WImetrics2005_fhd
plot(abs(diff_fhd_predict1b)) #plot diff for WI
diff_fhd_predict1b <- WIIpred_rf_fhd_predict1b_raster2005-WIImetrics2005_fhd
plot(abs(diff_fhd_predict1b)) #plot diff for WII

set.seed(2024)
rf_fhd_predict2 <- randomForest(fhd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict2_train, importance = TRUE)
rf_fhd_predict2

#importance
varImpPlot(rf_fhd_predict2, n.var=11)
#write.csv(importance(rf_fhd_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict2.csv')

#model validation using 30% of data
valid_rf_fhd_predict2 <- predict(rf_fhd_predict2, predict2_valid, type = "response")
plot(predict2_valid$fhd, valid_rf_fhd_predict2)
#RMSE
res_valid_rf_fhd_predict2 <- predict2_valid$fhd-valid_rf_fhd_predict2
RMSE_valid_rf_fhd_predict2 <- sqrt(mean(res_valid_rf_fhd_predict2^2)); RMSE_valid_rf_fhd_predict2

#make temporal predictions: 2005
pred_rf_fhd_predict2 <- predict(rf_fhd_predict2, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict2)
#RMSE
res_pred_rf_fhd_predict2 <- sub2005$fhd-pred_rf_fhd_predict2
RMSE_pred_rf_fhd_predict2 <- sqrt(mean(res_pred_rf_fhd_predict2^2)); RMSE_pred_rf_fhd_predict2

#predict on raster: 2005
WIpred_rf_fhd_predict2_raster2005 <-predict(WIstackpred2005, rf_fhd_predict2)
plot(WIpred_rf_fhd_predict2_raster2005)
WIIpred_rf_fhd_predict2_raster2005 <-predict(WIIstackpred2005, rf_fhd_predict2)
plot(WIIpred_rf_fhd_predict2_raster2005)
#make absolute differenced raster
diff_fhd_predict2 <- WIpred_rf_fhd_predict2_raster2005-WImetrics2005_fhd
plot(abs(diff_fhd_predict2)) #plot diff for WI
diff_fhd_predict2 <- WIIpred_rf_fhd_predict2_raster2005-WIImetrics2005_fhd
plot(abs(diff_fhd_predict2)) #plot diff for WII

#make temporal predictions: 2012
pred_rf_fhd_predict2 <- predict(rf_fhd_predict2, sub2012, type = "response")
plot(sub2012$fhd, pred_rf_fhd_predict2)
#RMSE
res_pred_rf_fhd_predict2 <- sub2012$fhd-pred_rf_fhd_predict2
RMSE_pred_rf_fhd_predict2 <- sqrt(mean(res_pred_rf_fhd_predict2^2)); RMSE_pred_rf_fhd_predict2

#predict on raster: 2012
WIpred_rf_fhd_predict2_raster2012 <-predict(WIstackpred2012, rf_fhd_predict2)
plot(WIpred_rf_fhd_predict2_raster2012)
WIIpred_rf_fhd_predict2_raster2012 <-predict(WIIstackpred2012, rf_fhd_predict2)
plot(WIIpred_rf_fhd_predict2_raster2012)
#make absolute differenced raster
diff_fhd_predict2 <- WIpred_rf_fhd_predict2_raster2012-WImetrics2012_fhd
plot(abs(diff_fhd_predict2)) #plot diff for WI
diff_fhd_predict2 <- WIIpred_rf_fhd_predict2_raster2012-WIImetrics2012_fhd
plot(abs(diff_fhd_predict2)) #plot diff for WII

####predict cc####
set.seed(2024)
rf_cc_forecast <- randomForest(cc ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = forecast_train, importance = TRUE)
rf_cc_forecast

#importance
varImpPlot(rf_cc_forecast, n.var=11)
#write.csv(importance(rf_cc_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_forecast.csv')

#model validation using 30% of data
valid_rf_cc_forecast <- predict(rf_cc_forecast, forecast_valid, type = "response")
plot(forecast_valid$cc, valid_rf_cc_forecast)
#RMSE
res_valid_rf_cc_forecast <- forecast_valid$cc-valid_rf_cc_forecast
RMSE_valid_rf_cc_forecast <- sqrt(mean(res_valid_rf_cc_forecast^2)); RMSE_valid_rf_cc_forecast

#make temporal predictions
pred_rf_cc_forecast <- predict(rf_cc_forecast, sub2015, type = "response")
plot(sub2015$cc, pred_rf_cc_forecast)
#RMSE
res_pred_rf_cc_forecast <- sub2015$cc-pred_rf_cc_forecast
RMSE_pred_rf_cc_forecast <- sqrt(mean(res_pred_rf_cc_forecast^2)); RMSE_pred_rf_cc_forecast

#predict on raster
WIpred_rf_cc_forecast_raster2015 <-predict(WIstackpred2015, rf_cc_forecast)
plot(WIpred_rf_cc_forecast_raster2015)
WIIpred_rf_cc_forecast_raster2015 <-predict(WIIstackpred2015, rf_cc_forecast)
plot(WIIpred_rf_cc_forecast_raster2015)
#make absolute differenced raster
diff_cc_forecast <- WIpred_rf_cc_forecast_raster2015-WImetrics2015_cc
plot(abs(diff_cc_forecast)) #plot diff for WI
diff_cc_forecast <- WIIpred_rf_cc_forecast_raster2015-WIImetrics2015_cc
plot(abs(diff_cc_forecast)) #plot diff for WII
plot(WImetrics2015_cc)

set.seed(2024)
rf_cc_hindcast <- randomForest(cc ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = hindcast_train, importance = TRUE)
rf_cc_hindcast

#importance
varImpPlot(rf_cc_hindcast, n.var=11)
#write.csv(importance(rf_cc_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_hindcast.csv')

#model validation using 30% of data
valid_rf_cc_hindcast <- predict(rf_cc_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$cc, valid_rf_cc_hindcast)
#RMSE
res_valid_rf_cc_hindcast <- hindcast_valid$cc-valid_rf_cc_hindcast
RMSE_valid_rf_cc_hindcast <- sqrt(mean(res_valid_rf_cc_hindcast^2)); RMSE_valid_rf_cc_hindcast

#make temporal predictions
pred_rf_cc_hindcast <- predict(rf_cc_hindcast, sub2000, type = "response")
plot(sub2000$cc, pred_rf_cc_hindcast)
#RMSE
res_pred_rf_cc_hindcast <- sub2000$cc-pred_rf_cc_hindcast
RMSE_pred_rf_cc_hindcast <- sqrt(mean(res_pred_rf_cc_hindcast^2)); RMSE_pred_rf_cc_hindcast

#predict on raster
WIpred_rf_cc_hindcast_raster2000 <-predict(WIstackpred2000, rf_cc_hindcast)
plot(WIpred_rf_cc_hindcast_raster2000)
WIIpred_rf_cc_hindcast_raster2000 <-predict(WIIstackpred2000, rf_cc_hindcast)
plot(WIIpred_rf_cc_hindcast_raster2000)
#make absolute differenced raster
diff_cc_hindcast <- WIpred_rf_cc_hindcast_raster2000-WImetrics2000_cc
plot(abs(diff_cc_hindcast)) #plot diff for WI
diff_cc_hindcast <- WIIpred_rf_cc_hindcast_raster2000-WIImetrics2000_cc
plot(abs(diff_cc_hindcast)) #plot diff for WII

set.seed(2024)
rf_cc_predict1a <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1a_train, importance = TRUE)
rf_cc_predict1a

#importance
varImpPlot(rf_cc_predict1a, n.var=11)
#write.csv(importance(rf_cc_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict1a.csv')

#model validation using 30% of data
valid_rf_cc_predict1a <- predict(rf_cc_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$cc, valid_rf_cc_predict1a)
#RMSE
res_valid_rf_cc_predict1a <- predict1a_valid$cc-valid_rf_cc_predict1a
RMSE_valid_rf_cc_predict1a <- sqrt(mean(res_valid_rf_cc_predict1a^2)); RMSE_valid_rf_cc_predict1a

#make temporal predictions
pred_rf_cc_predict1a <- predict(rf_cc_predict1a, sub2012, type = "response")
plot(sub2012$cc, pred_rf_cc_predict1a)
#RMSE
res_pred_rf_cc_predict1a <- sub2012$cc-pred_rf_cc_predict1a
RMSE_pred_rf_cc_predict1a <- sqrt(mean(res_pred_rf_cc_predict1a^2)); RMSE_pred_rf_cc_predict1a

set.seed(2024)
rf_cc_predict1b <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1b_train, importance = TRUE)
rf_cc_predict1b

#importance
varImpPlot(rf_cc_predict1b, n.var=11)
#write.csv(importance(rf_cc_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict1b.csv')

#model validation using 30% of data
valid_rf_cc_predict1b <- predict(rf_cc_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$cc, valid_rf_cc_predict1b)
#RMSE
res_valid_rf_cc_predict1b <- predict1b_valid$cc-valid_rf_cc_predict1b
RMSE_valid_rf_cc_predict1b <- sqrt(mean(res_valid_rf_cc_predict1b^2)); RMSE_valid_rf_cc_predict1b

#make temporal predictions
pred_rf_cc_predict1b <- predict(rf_cc_predict1b, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict1b)
#RMSE
res_pred_rf_cc_predict1b <- sub2005$cc-pred_rf_cc_predict1b
RMSE_pred_rf_cc_predict1b <- sqrt(mean(res_pred_rf_cc_predict1b^2)); RMSE_pred_rf_cc_predict1b

#predict on raster
WIpred_rf_cc_predict1b_raster2005 <-predict(WIstackpred2005, rf_cc_predict1b)
plot(WIpred_rf_cc_predict1b_raster2005)
WIIpred_rf_cc_predict1b_raster2005 <-predict(WIIstackpred2005, rf_cc_predict1b)
plot(WIIpred_rf_cc_predict1b_raster2005)
#make absolute differenced raster
diff_cc_predict1b <- WIpred_rf_cc_predict1b_raster2005-WImetrics2005_cc
plot(abs(diff_cc_predict1b)) #plot diff for WI
diff_cc_predict1b <- WIIpred_rf_cc_predict1b_raster2005-WIImetrics2005_cc
plot(abs(diff_cc_predict1b)) #plot diff for WII

set.seed(2024)
rf_cc_predict2 <- randomForest(cc ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = predict2_train, importance = TRUE)
rf_cc_predict2

#importance
varImpPlot(rf_cc_predict2, n.var=11)
#write.csv(importance(rf_cc_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict2.csv')

#model validation using 30% of data
valid_rf_cc_predict2 <- predict(rf_cc_predict2, predict2_valid, type = "response")
plot(predict2_valid$cc, valid_rf_cc_predict2)
#RMSE
res_valid_rf_cc_predict2 <- predict2_valid$cc-valid_rf_cc_predict2
RMSE_valid_rf_cc_predict2 <- sqrt(mean(res_valid_rf_cc_predict2^2)); RMSE_valid_rf_cc_predict2

#make temporal predictions: 2005
pred_rf_cc_predict2 <- predict(rf_cc_predict2, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict2)
#RMSE
res_pred_rf_cc_predict2 <- sub2005$cc-pred_rf_cc_predict2
RMSE_pred_rf_cc_predict2 <- sqrt(mean(res_pred_rf_cc_predict2^2)); RMSE_pred_rf_cc_predict2

#predict on raster: 2005
WIpred_rf_cc_predict2_raster2005 <-predict(WIstackpred2005, rf_cc_predict2)
plot(WIpred_rf_cc_predict2_raster2005)
WIIpred_rf_cc_predict2_raster2005 <-predict(WIIstackpred2005, rf_cc_predict2)
plot(WIIpred_rf_cc_predict2_raster2005)
#make absolute differenced raster
diff_cc_predict2 <- WIpred_rf_cc_predict2_raster2005-WImetrics2005_cc
plot(abs(diff_cc_predict2)) #plot diff for WI
diff_cc_predict2 <- WIIpred_rf_cc_predict2_raster2005-WIImetrics2005_cc
plot(abs(diff_cc_predict2)) #plot diff for WII

#make temporal predictions: 2012
pred_rf_cc_predict2 <- predict(rf_cc_predict2, sub2012, type = "response")
plot(sub2012$cc, pred_rf_cc_predict2)
#RMSE
res_pred_rf_cc_predict2 <- sub2012$cc-pred_rf_cc_predict2
RMSE_pred_rf_cc_predict2 <- sqrt(mean(res_pred_rf_cc_predict2^2)); RMSE_pred_rf_cc_predict2

#predict on raster: 2012
WIpred_rf_cc_predict2_raster2012 <-predict(WIstackpred2012, rf_cc_predict2)
plot(WIpred_rf_cc_predict2_raster2012)
WIIpred_rf_cc_predict2_raster2012 <-predict(WIIstackpred2012, rf_cc_predict2)
plot(WIIpred_rf_cc_predict2_raster2012)
#make absolute differenced raster
diff_cc_predict2 <- WIpred_rf_cc_predict2_raster2012-WImetrics2012_cc
plot(abs(diff_cc_predict2)) #plot diff for WI
diff_cc_predict2 <- WIIpred_rf_cc_predict2_raster2012-WIImetrics2012_cc
plot(abs(diff_cc_predict2)) #plot diff for WII

####predict crr####
set.seed(2024)
rf_crr_forecast <- randomForest(crr ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = forecast_train, importance = TRUE)
rf_crr_forecast

#importance
varImpPlot(rf_crr_forecast, n.var=11)
#write.csv(importance(rf_crr_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_forecast.csv')

#model validation using 30% of data
valid_rf_crr_forecast <- predict(rf_crr_forecast, forecast_valid, type = "response")
plot(forecast_valid$crr, valid_rf_crr_forecast)
#RMSE
res_valid_rf_crr_forecast <- forecast_valid$crr-valid_rf_crr_forecast
RMSE_valid_rf_crr_forecast <- sqrt(mean(res_valid_rf_crr_forecast^2)); RMSE_valid_rf_crr_forecast

#make temporal predictions
pred_rf_crr_forecast <- predict(rf_crr_forecast, sub2015, type = "response")
plot(sub2015$crr, pred_rf_crr_forecast)
#RMSE
res_pred_rf_crr_forecast <- sub2015$crr-pred_rf_crr_forecast
RMSE_pred_rf_crr_forecast <- sqrt(mean(res_pred_rf_crr_forecast^2)); RMSE_pred_rf_crr_forecast

#predict on raster
WIpred_rf_crr_forecast_raster2015 <-predict(WIstackpred2015, rf_crr_forecast)
plot(WIpred_rf_crr_forecast_raster2015)
WIIpred_rf_crr_forecast_raster2015 <-predict(WIIstackpred2015, rf_crr_forecast)
plot(WIIpred_rf_crr_forecast_raster2015)
#make absolute differenced raster
diff_crr_forecast <- WIpred_rf_crr_forecast_raster2015-WImetrics2015_crr
plot(abs(diff_crr_forecast)) #plot diff for WI
diff_crr_forecast <- WIIpred_rf_crr_forecast_raster2015-WIImetrics2015_crr
plot(abs(diff_crr_forecast)) #plot diff for WII
plot(WImetrics2015_crr)

set.seed(2024)
rf_crr_hindcast <- randomForest(crr ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = hindcast_train, importance = TRUE)
rf_crr_hindcast

#importance
varImpPlot(rf_crr_hindcast, n.var=11)
#write.csv(importance(rf_crr_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_hindcast.csv')

#model validation using 30% of data
valid_rf_crr_hindcast <- predict(rf_crr_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$crr, valid_rf_crr_hindcast)
#RMSE
res_valid_rf_crr_hindcast <- hindcast_valid$crr-valid_rf_crr_hindcast
RMSE_valid_rf_crr_hindcast <- sqrt(mean(res_valid_rf_crr_hindcast^2)); RMSE_valid_rf_crr_hindcast

#make temporal predictions
pred_rf_crr_hindcast <- predict(rf_crr_hindcast, sub2000, type = "response")
plot(sub2000$crr, pred_rf_crr_hindcast)
#RMSE
res_pred_rf_crr_hindcast <- sub2000$crr-pred_rf_crr_hindcast
RMSE_pred_rf_crr_hindcast <- sqrt(mean(res_pred_rf_crr_hindcast^2)); RMSE_pred_rf_crr_hindcast

#predict on raster
WIpred_rf_crr_hindcast_raster2000 <-predict(WIstackpred2000, rf_crr_hindcast)
plot(WIpred_rf_crr_hindcast_raster2000)
WIIpred_rf_crr_hindcast_raster2000 <-predict(WIIstackpred2000, rf_crr_hindcast)
plot(WIIpred_rf_crr_hindcast_raster2000)
#make absolute differenced raster
diff_crr_hindcast <- WIpred_rf_crr_hindcast_raster2000-WImetrics2000_crr
plot(abs(diff_crr_hindcast)) #plot diff for WI
diff_crr_hindcast <- WIIpred_rf_crr_hindcast_raster2000-WIImetrics2000_crr
plot(abs(diff_crr_hindcast)) #plot diff for WII

set.seed(2024)
rf_crr_predict1a <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1a_train, importance = TRUE)
rf_crr_predict1a

#importance
varImpPlot(rf_crr_predict1a, n.var=11)
#write.csv(importance(rf_crr_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict1a.csv')

#model validation using 30% of data
valid_rf_crr_predict1a <- predict(rf_crr_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$crr, valid_rf_crr_predict1a)
#RMSE
res_valid_rf_crr_predict1a <- predict1a_valid$crr-valid_rf_crr_predict1a
RMSE_valid_rf_crr_predict1a <- sqrt(mean(res_valid_rf_crr_predict1a^2)); RMSE_valid_rf_crr_predict1a

#make temporal predictions
pred_rf_crr_predict1a <- predict(rf_crr_predict1a, sub2012, type = "response")
plot(sub2012$crr, pred_rf_crr_predict1a)
#RMSE
res_pred_rf_crr_predict1a <- sub2012$crr-pred_rf_crr_predict1a
RMSE_pred_rf_crr_predict1a <- sqrt(mean(res_pred_rf_crr_predict1a^2)); RMSE_pred_rf_crr_predict1a

set.seed(2024)
rf_crr_predict1b <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1b_train, importance = TRUE)
rf_crr_predict1b

#importance
varImpPlot(rf_crr_predict1b, n.var=11)
#write.csv(importance(rf_crr_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict1b.csv')

#model validation using 30% of data
valid_rf_crr_predict1b <- predict(rf_crr_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$crr, valid_rf_crr_predict1b)
#RMSE
res_valid_rf_crr_predict1b <- predict1b_valid$crr-valid_rf_crr_predict1b
RMSE_valid_rf_crr_predict1b <- sqrt(mean(res_valid_rf_crr_predict1b^2)); RMSE_valid_rf_crr_predict1b

#make temporal predictions
pred_rf_crr_predict1b <- predict(rf_crr_predict1b, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict1b)
#RMSE
res_pred_rf_crr_predict1b <- sub2005$crr-pred_rf_crr_predict1b
RMSE_pred_rf_crr_predict1b <- sqrt(mean(res_pred_rf_crr_predict1b^2)); RMSE_pred_rf_crr_predict1b

#predict on raster
WIpred_rf_crr_predict1b_raster2005 <-predict(WIstackpred2005, rf_crr_predict1b)
plot(WIpred_rf_crr_predict1b_raster2005)
WIIpred_rf_crr_predict1b_raster2005 <-predict(WIIstackpred2005, rf_crr_predict1b)
plot(WIIpred_rf_crr_predict1b_raster2005)
#make absolute differenced raster
diff_crr_predict1b <- WIpred_rf_crr_predict1b_raster2005-WImetrics2005_crr
plot(abs(diff_crr_predict1b)) #plot diff for WI
diff_crr_predict1b <- WIIpred_rf_crr_predict1b_raster2005-WIImetrics2005_crr
plot(abs(diff_crr_predict1b)) #plot diff for WII

set.seed(2024)
rf_crr_predict2 <- randomForest(crr ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict2_train, importance = TRUE)
rf_crr_predict2

#importance
varImpPlot(rf_crr_predict2, n.var=11)
#write.csv(importance(rf_crr_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict2.csv')

#model validation using 30% of data
valid_rf_crr_predict2 <- predict(rf_crr_predict2, predict2_valid, type = "response")
plot(predict2_valid$crr, valid_rf_crr_predict2)
#RMSE
res_valid_rf_crr_predict2 <- predict2_valid$crr-valid_rf_crr_predict2
RMSE_valid_rf_crr_predict2 <- sqrt(mean(res_valid_rf_crr_predict2^2)); RMSE_valid_rf_crr_predict2

#make temporal predictions: 2005
pred_rf_crr_predict2 <- predict(rf_crr_predict2, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict2)
#RMSE
res_pred_rf_crr_predict2 <- sub2005$crr-pred_rf_crr_predict2
RMSE_pred_rf_crr_predict2 <- sqrt(mean(res_pred_rf_crr_predict2^2)); RMSE_pred_rf_crr_predict2

#predict on raster: 2005
WIpred_rf_crr_predict2_raster2005 <-predict(WIstackpred2005, rf_crr_predict2)
plot(WIpred_rf_crr_predict2_raster2005)
WIIpred_rf_crr_predict2_raster2005 <-predict(WIIstackpred2005, rf_crr_predict2)
plot(WIIpred_rf_crr_predict2_raster2005)
#make absolute differenced raster
diff_crr_predict2 <- WIpred_rf_crr_predict2_raster2005-WImetrics2005_crr
plot(abs(diff_crr_predict2)) #plot diff for WI
diff_crr_predict2 <- WIIpred_rf_crr_predict2_raster2005-WIImetrics2005_crr
plot(abs(diff_crr_predict2)) #plot diff for WII

#make temporal predictions: 2012
pred_rf_crr_predict2 <- predict(rf_crr_predict2, sub2012, type = "response")
plot(sub2012$crr, pred_rf_crr_predict2)
#RMSE
res_pred_rf_crr_predict2 <- sub2012$crr-pred_rf_crr_predict2
RMSE_pred_rf_crr_predict2 <- sqrt(mean(res_pred_rf_crr_predict2^2)); RMSE_pred_rf_crr_predict2

#predict on raster: 2012
WIpred_rf_crr_predict2_raster2012 <-predict(WIstackpred2012, rf_crr_predict2)
plot(WIpred_rf_crr_predict2_raster2012)
WIIpred_rf_crr_predict2_raster2012 <-predict(WIIstackpred2012, rf_crr_predict2)
plot(WIIpred_rf_crr_predict2_raster2012)
#make absolute differenced raster
diff_crr_predict2 <- WIpred_rf_crr_predict2_raster2012-WImetrics2012_crr
plot(abs(diff_crr_predict2)) #plot diff for WI
diff_crr_predict2 <- WIIpred_rf_crr_predict2_raster2012-WIImetrics2012_crr
plot(abs(diff_crr_predict2)) #plot diff for WII
