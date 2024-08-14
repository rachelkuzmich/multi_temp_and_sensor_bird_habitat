library(terra)
library(RStoolbox)
library(satellite)
library(landsat)
library(terra)
library(lidR)
library(sf)
library(randomForest)

#goal to rasterize same metrics as before aligned with corresponding Landsat grids

####bring in ALS data####
normALS2000<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2000.las")
normALS2005<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2005.las")
normALS2012<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2012.las")
normALS2015<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2015.las")

#this is a function to extract specific metrics from the ALS point cloud
metrics = function(z,rn){
  first  = rn == 1L
  zfirst = z[first]
  nfirst = length(zfirst)
  firstabove2 = sum(zfirst > 2)
  x = (firstabove2/nfirst)*100
  metrics = list(
    zmax = max(z),
    zmean = mean(z), 
    zsd = sd(z),
    entropy = entropy(z, by=1,zmax = max(z)),
    fhd =   (entropy(z, zmax = max(z)) * log(max(z))),
    cc = 1-(x/100),
    crr = (mean(z) - min(z)) / (max(z) - min(z))
  )
}  

#bring in landsat data to make a blank grid that aligns with these data
#make a blank raster with same dimensions as the landsat data
NDVI2000 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2000.TIF")
NDVI2005 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2005.TIF")
NDVI2013 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2013.TIF")
NDVI2015 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2015.TIF")

blankraster2000 <- NDVI2000
values(blankraster2000) <- NA
blankraster2000 #check, looks good

blankraster2005 <- NDVI2005
values(blankraster2005) <- NA
blankraster2005 #check, looks good

blankraster2012 <- NDVI2013
values(blankraster2012) <- NA
blankraster2012 #check, looks good

blankraster2015 <- NDVI2015
values(blankraster2015) <- NA
blankraster2015 #check, looks good

#convert LAS to metrics with same resolution as the blankraster
#spatially align with Landsat data: https://gis.stackexchange.com/questions/418332/change-extent-of-lidr-las-object-for-raster-alignment
metrics2000 <- pixel_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), res=blankraster2000) # use blank raster
#check
dim(metrics2000); dim(NDVI2000) #same dimensions
res(metrics2000); res(NDVI2000) #same resolution
plot(metrics2000, col = height.colors(50))
#looks good

metrics2000_max <- subset(metrics2000, 1); plot(metrics2000_max)
metrics2000_mean <- subset(metrics2000, 2); plot(metrics2000_mean)
metrics2000_sd <- subset(metrics2000, 3); plot(metrics2000_sd)
metrics2000_entropy <- subset(metrics2000, 4); plot(metrics2000_entropy)
metrics2000_fhd <- subset(metrics2000, 5); plot(metrics2000_fhd)
metrics2000_cc <- subset(metrics2000, 6); plot(metrics2000_cc)
metrics2000_crr <- subset(metrics2000, 7); plot(metrics2000_crr)

# writeRaster(metrics2000_max,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_max.tif",overwrite=TRUE)
# writeRaster(metrics2000_mean,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_mean.tif",overwrite=TRUE)
# writeRaster(metrics2000_sd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_sd.tif",overwrite=TRUE)
# writeRaster(metrics2000_entropy,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_entropy.tif",overwrite=TRUE)
# writeRaster(metrics2000_fhd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_fhd.tif",overwrite=TRUE)
# writeRaster(metrics2000_cc,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_cc.tif",overwrite=TRUE)
# writeRaster(metrics2000_crr,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_crr.tif",overwrite=TRUE)

#convert LAS to metrics with same resolution as the blankraster
#spatially align with Landsat data: https://gis.stackexchange.com/questions/418332/change-extent-of-lidr-las-object-for-raster-alignment
metrics2005 <- pixel_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), res=blankraster2005) # use blank raster
#check
dim(metrics2005); dim(NDVI2005) #same dimensions
res(metrics2005); res(NDVI2005) #same resolution
plot(metrics2005, col = height.colors(50))
#looks good

metrics2005_max <- subset(metrics2005, 1); plot(metrics2005_max)
metrics2005_mean <- subset(metrics2005, 2); plot(metrics2005_mean)
metrics2005_sd <- subset(metrics2005, 3); plot(metrics2005_sd)
metrics2005_entropy <- subset(metrics2005, 4); plot(metrics2005_entropy)
metrics2005_fhd <- subset(metrics2005, 5); plot(metrics2005_fhd)
metrics2005_cc <- subset(metrics2005, 6); plot(metrics2005_cc)
metrics2005_crr <- subset(metrics2005, 7); plot(metrics2005_crr)

# writeRaster(metrics2005_max,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_max.tif",overwrite=TRUE)
# writeRaster(metrics2005_mean,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_mean.tif",overwrite=TRUE)
# writeRaster(metrics2005_sd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_sd.tif",overwrite=TRUE)
# writeRaster(metrics2005_entropy,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_entropy.tif",overwrite=TRUE)
# writeRaster(metrics2005_fhd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_fhd.tif",overwrite=TRUE)
# writeRaster(metrics2005_cc,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_cc.tif",overwrite=TRUE)
# writeRaster(metrics2005_crr,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_crr.tif",overwrite=TRUE)

#convert LAS to metrics with same resolution as the blankraster
#spatially align with Landsat data: https://gis.stackexchange.com/questions/418332/change-extent-of-lidr-las-object-for-raster-alignment
metrics2012 <- pixel_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), res=blankraster2012) # use blank raster
#check
dim(metrics2012); dim(NDVI2013) #same dimensions
res(metrics2012); res(NDVI2013) #same resolution
plot(metrics2012, col = height.colors(50))
#looks good

metrics2012_max <- subset(metrics2012, 1); plot(metrics2012_max)
metrics2012_mean <- subset(metrics2012, 2); plot(metrics2012_mean)
metrics2012_sd <- subset(metrics2012, 3); plot(metrics2012_sd)
metrics2012_entropy <- subset(metrics2012, 4); plot(metrics2012_entropy)
metrics2012_fhd <- subset(metrics2012, 5); plot(metrics2012_fhd)
metrics2012_cc <- subset(metrics2012, 6); plot(metrics2012_cc)
metrics2012_crr <- subset(metrics2012, 7); plot(metrics2012_crr)

# writeRaster(metrics2012_max,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_max.tif",overwrite=TRUE)
# writeRaster(metrics2012_mean,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_mean.tif",overwrite=TRUE)
# writeRaster(metrics2012_sd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_sd.tif",overwrite=TRUE)
# writeRaster(metrics2012_entropy,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_entropy.tif",overwrite=TRUE)
# writeRaster(metrics2012_fhd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_fhd.tif",overwrite=TRUE)
# writeRaster(metrics2012_cc,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_cc.tif",overwrite=TRUE)
# writeRaster(metrics2012_crr,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_crr.tif",overwrite=TRUE)

#convert LAS to metrics with same resolution as the blankraster
#spatially align with Landsat data: https://gis.stackexchange.com/questions/418332/change-extent-of-lidr-las-object-for-raster-alignment
metrics2015 <- pixel_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), res=blankraster2015) # use blank raster
#check
dim(metrics2015); dim(NDVI2015) #same dimensions
res(metrics2015); res(NDVI2015) #same resolution
plot(metrics2015, col = height.colors(50))
#looks good

metrics2015_max <- subset(metrics2015, 1); plot(metrics2015_max)
metrics2015_mean <- subset(metrics2015, 2); plot(metrics2015_mean)
metrics2015_sd <- subset(metrics2015, 3); plot(metrics2015_sd)
metrics2015_entropy <- subset(metrics2015, 4); plot(metrics2015_entropy)
metrics2015_fhd <- subset(metrics2015, 5); plot(metrics2015_fhd)
metrics2015_cc <- subset(metrics2015, 6); plot(metrics2015_cc)
metrics2015_crr <- subset(metrics2015, 7); plot(metrics2015_crr)

# writeRaster(metrics2015_max,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_max.tif",overwrite=TRUE)
# writeRaster(metrics2015_mean,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_mean.tif",overwrite=TRUE)
# writeRaster(metrics2015_sd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_sd.tif",overwrite=TRUE)
# writeRaster(metrics2015_entropy,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_entropy.tif",overwrite=TRUE)
# writeRaster(metrics2015_fhd,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_fhd.tif",overwrite=TRUE)
# writeRaster(metrics2015_cc,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_cc.tif",overwrite=TRUE)
# writeRaster(metrics2015_crr,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_crr.tif",overwrite=TRUE)
