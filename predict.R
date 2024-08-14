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

#goal is pixel-by-pixel prediction

####bring in ALS data####
metrics2000_max <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_max.TIF")
metrics2000_mean <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_mean.TIF")
metrics2000_sd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_sd.TIF")
metrics2000_entropy <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_entropy.TIF")
metrics2000_fhd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_fhd.TIF")
metrics2000_cc <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_cc.TIF")
metrics2000_crr <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2000_crr.TIF")

metrics2005_max <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_max.TIF")
metrics2005_mean <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_mean.TIF")
metrics2005_sd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_sd.TIF")
metrics2005_entropy <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_entropy.TIF")
metrics2005_fhd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_fhd.TIF")
metrics2005_cc <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_cc.TIF")
metrics2005_crr <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2005_crr.TIF")

metrics2012_max <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_max.TIF")
metrics2012_mean <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_mean.TIF")
metrics2012_sd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_sd.TIF")
metrics2012_entropy <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_entropy.TIF")
metrics2012_fhd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_fhd.TIF")
metrics2012_cc <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_cc.TIF")
metrics2012_crr <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2012_crr.TIF")

metrics2015_max <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_max.TIF")
metrics2015_mean <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_mean.TIF")
metrics2015_sd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_sd.TIF")
metrics2015_entropy <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_entropy.TIF")
metrics2015_fhd <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_fhd.TIF")
metrics2015_cc <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_cc.TIF")
metrics2015_crr <- rast("D:/cambs/R_CH3_ALSspec/ALS_rasterize/metrics2015_crr.TIF")

####bring in landsat data####

#toa reflectance data
L5B1_2000_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B1_blue_toa.TIF")
L5B2_2000_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B2_green_toa.TIF")
L5B3_2000_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B3_red_toa.TIF")
L5B4_2000_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B4_nir_toa.TIF")
L5B5_2000_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B5_swir1_toa.TIF")
L5B7_2000_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B7_swir2_toa.TIF")
names(L5B1_2000_blue) <- ("blue"); L5B1_2000_blue #rename
names(L5B2_2000_green) <- ("green"); L5B2_2000_green
names(L5B3_2000_red) <- ("red"); L5B3_2000_red
names(L5B4_2000_nir) <- ("nir"); L5B4_2000_nir
names(L5B5_2000_swir1) <- ("swir1"); L5B5_2000_swir1
names(L5B7_2000_swir2) <- ("swir2"); L5B7_2000_swir2

L5B1_2005_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B1_blue_toa.TIF")
L5B2_2005_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B2_green_toa.TIF")
L5B3_2005_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B3_red_toa.TIF")
L5B4_2005_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B4_nir_toa.TIF")
L5B5_2005_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B5_swir1_toa.TIF")
L5B7_2005_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B7_swir2_toa.TIF")
names(L5B1_2005_blue) <- ("blue"); L5B1_2005_blue #rename
names(L5B2_2005_green) <- ("green"); L5B2_2005_green
names(L5B3_2005_red) <- ("red"); L5B3_2005_red
names(L5B4_2005_nir) <- ("nir"); L5B4_2005_nir
names(L5B5_2005_swir1) <- ("swir1"); L5B5_2005_swir1
names(L5B7_2005_swir2) <- ("swir2"); L5B7_2005_swir2

L8B2_2013_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B2_blue_toa.TIF")
L8B3_2013_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B3_green_toa.TIF")
L8B4_2013_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B4_red_toa.TIF")
L8B5_2013_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B5_nir_toa.TIF")
L8B6_2013_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B6_swir1_toa.TIF")
L8B7_2013_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B7_swir2_toa.TIF")
names(L8B2_2013_blue) <- ("blue"); L8B2_2013_blue #rename
names(L8B3_2013_green) <- ("green"); L8B3_2013_green
names(L8B4_2013_red) <- ("red"); L8B4_2013_red
names(L8B5_2013_nir) <- ("nir"); L8B5_2013_nir
names(L8B6_2013_swir1) <- ("swir1"); L8B6_2013_swir1
names(L8B7_2013_swir2) <- ("swir2"); L8B7_2013_swir2

L8B2_2015_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B2_blue_toa.TIF")
L8B3_2015_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B3_green_toa.TIF")
L8B4_2015_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B4_red_toa.TIF")
L8B5_2015_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B5_nir_toa.TIF")
L8B6_2015_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B6_swir1_toa.TIF")
L8B7_2015_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B7_swir2_toa.TIF")
names(L8B2_2015_blue) <- ("blue"); L8B2_2015_blue #rename
names(L8B3_2015_green) <- ("green"); L8B3_2015_green
names(L8B4_2015_red) <- ("red"); L8B4_2015_red
names(L8B5_2015_nir) <- ("nir"); L8B5_2015_nir
names(L8B6_2015_swir1) <- ("swir1"); L8B6_2015_swir1
names(L8B7_2015_swir2) <- ("swir2"); L8B7_2015_swir2

#ndvi
NDVI2000 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2000.TIF")
NDVI2005 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2005.TIF")
NDVI2013 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2013.TIF")
NDVI2015 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2015.TIF")
names(NDVI2000) <- ("NDVI")
names(NDVI2005) <- ("NDVI")
names(NDVI2013) <- ("NDVI")
names(NDVI2015) <- ("NDVI")

#nbr
NBR2000 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2000.TIF")
NBR2005 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2005.TIF")
NBR2013 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2013.TIF")
NBR2015 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2015.TIF")
names(NBR2000) <- ("NBR")
names(NBR2005) <- ("NBR")
names(NBR2013) <- ("NBR")
names(NBR2015) <- ("NBR")

#tct
TCT2000_brightness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_brightness.TIF")
TCT2000_greenness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_greenness.TIF")
TCT2000_wetness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52000_tc_wetness.TIF")

TCT2005_brightness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_brightness.TIF")
TCT2005_greenness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_greenness.TIF")
TCT2005_wetness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L52005_tc_wetness.TIF")

TCT2013_brightness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_brightness.TIF")
TCT2013_greenness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_greenness.TIF")
TCT2013_wetness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82013_tc_wetness.TIF")

TCT2015_brightness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_brightness.TIF")
TCT2015_greenness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_greenness.TIF")
TCT2015_wetness <- rast("D:/cambs/R_CH3_ALSspec/Landsat_TCT/L82015_tc_wetness.TIF")

#check plots to see how values differ between years
#plot all blue
plot(L5B1_2000_blue)
plot(L5B1_2005_blue)
plot(L8B2_2013_blue)
plot(L8B2_2015_blue)
#plot all green
plot(L5B2_2000_green)
plot(L5B2_2005_green)
plot(L8B3_2013_green)
plot(L8B3_2015_green)
#plot all red
plot(L5B3_2000_red)
plot(L5B3_2005_red)
plot(L8B4_2013_red)
plot(L8B4_2015_red)
#plot all nir
plot(L5B4_2000_nir)
plot(L5B4_2005_nir)
plot(L8B5_2013_nir)
plot(L8B5_2015_nir)
#plot all swir1
plot(L5B5_2000_swir1)
plot(L5B5_2005_swir1)
plot(L8B6_2013_swir1)
plot(L8B6_2015_swir1)
#plot all swir2
plot(L5B7_2000_swir2)
plot(L5B7_2005_swir2)
plot(L8B7_2013_swir2)
plot(L8B7_2015_swir2)
#plot all NDVI
plot(NDVI2000)
plot(NDVI2005)
plot(NDVI2013)
plot(NDVI2015)
#plot all NBR
plot(NBR2000)
plot(NBR2005)
plot(NBR2013)
plot(NBR2015)
#plot all TCT brightness
plot(TCT2000_brightness)
plot(TCT2005_brightness)
plot(TCT2013_brightness)
plot(TCT2015_brightness)
#plot all TCT greenness
plot(TCT2000_greenness)
plot(TCT2005_greenness)
plot(TCT2013_greenness)
plot(TCT2015_greenness)
#plot all TCT wetness
plot(TCT2000_wetness)
plot(TCT2005_wetness)
plot(TCT2013_wetness)
plot(TCT2015_wetness)

#stack by year
stack2000 <- list(L5B1_2000_blue, L5B2_2000_green, L5B3_2000_red,
                  L5B4_2000_nir, L5B5_2000_swir1, L5B7_2000_swir2,
                  NDVI2000, NBR2000,
                  TCT2000_brightness, TCT2000_wetness, TCT2000_greenness,
                  metrics2000_max, metrics2000_mean, metrics2000_sd,
                  metrics2000_entropy, metrics2000_fhd, metrics2000_cc, metrics2000_crr)
df2000<-as.data.frame(rast(stack2000))
#write.csv(df2000,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/df2000.csv")

stack2005 <- list(L5B1_2005_blue, L5B2_2005_green, L5B3_2005_red, 
                  L5B4_2005_nir, L5B5_2005_swir1, L5B7_2005_swir2, 
                  NDVI2005, NBR2005, 
                  TCT2005_brightness, TCT2005_wetness, TCT2005_greenness, 
                  metrics2005_max, metrics2005_mean, metrics2005_sd, 
                  metrics2005_entropy, metrics2005_fhd, metrics2005_cc, metrics2005_crr)
df2005<-as.data.frame(rast(stack2005))
#write.csv(df2005,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/df2005.csv")

stack2012 <- list(L8B2_2013_blue, L8B3_2013_green, L8B4_2013_red, 
                  L8B5_2013_nir, L8B6_2013_swir1, L8B7_2013_swir2, 
                  NDVI2013, NBR2013, 
                  TCT2013_brightness, TCT2013_wetness, TCT2013_greenness, 
                  metrics2012_max, metrics2012_mean, metrics2012_sd, 
                  metrics2012_entropy, metrics2012_fhd, metrics2012_cc, metrics2012_crr)
df2012<-as.data.frame(rast(stack2012))
#write.csv(df2012,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/df2012.csv")

stack2015 <- list(L8B2_2015_blue, L8B3_2015_green, L8B4_2015_red, 
                  L8B5_2015_nir, L8B6_2015_swir1, L8B7_2015_swir2, 
                  NDVI2015, NBR2015, 
                  TCT2015_brightness, TCT2015_wetness, TCT2015_greenness, 
                  metrics2015_max, metrics2015_mean, metrics2015_sd, 
                  metrics2015_entropy, metrics2015_fhd, metrics2015_cc, metrics2015_crr)
df2015<-as.data.frame(rast(stack2015))
#write.csv(df2015,"D:/cambs/R_CH3_ALSspec/ALS_rasterize/df2015.csv")

#stack predictors only (also by year)
stackpred2000 <- list(L5B1_2000_blue, L5B2_2000_green, L5B3_2000_red,
                  L5B4_2000_nir, L5B5_2000_swir1, L5B7_2000_swir2,
                  NDVI2000, NBR2000,
                  TCT2000_brightness, TCT2000_wetness, TCT2000_greenness)
stackpred2000<-rast(stackpred2000)


stackpred2005 <- list(L5B1_2005_blue, L5B2_2005_green, L5B3_2005_red, 
                  L5B4_2005_nir, L5B5_2005_swir1, L5B7_2005_swir2, 
                  NDVI2005, NBR2005, 
                  TCT2005_brightness, TCT2005_wetness, TCT2005_greenness)
stackpred2005<-rast(stack2005)

stackpred2012 <- list(L8B2_2013_blue, L8B3_2013_green, L8B4_2013_red, 
                  L8B5_2013_nir, L8B6_2013_swir1, L8B7_2013_swir2, 
                  NDVI2013, NBR2013, 
                  TCT2013_brightness, TCT2013_wetness, TCT2013_greenness)
stackpred2012<-rast(stack2012)

stackpred2015 <- list(L8B2_2015_blue, L8B3_2015_green, L8B4_2015_red, 
                  L8B5_2015_nir, L8B6_2015_swir1, L8B7_2015_swir2, 
                  NDVI2015, NBR2015, 
                  TCT2015_brightness, TCT2015_wetness, TCT2015_greenness)
stackpred2015<-rast(stack2015)

###read in merged data####
data <- read.csv("D:/cambs/R_CH3_ALSspec/ALS_rasterize/df_merged.csv")

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
predict2 <- rbind(sub2000,sub2005) #train with 2000, 2015 / predict on 2005, 2012

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

normWI  <- readLAS("D:/cambs/norm_woods/norm_WildernessI2000.las")
normWII  <- readLAS("D:/cambs/norm_woods/norm_WildernessII2000.las")
ext(normWI) #520015.14, 520630.84, 279526.33, 280113.2 (xmin, xmax, ymin, ymax)
ext(normWII) #519350.35, 519895.33, 279179.09, 279550.2 (xmin, xmax, ymin, ymax)

roiWI<-ext(520015.14, 520630.84, 279526.33, 280113.2)
roiWII<-ext(519350.35, 519895.33, 279179.09, 279550.2)

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

#make temporal predictions
pred_rf_max_forecast <- predict(rf_max_forecast, sub2015, type = "response")
plot(sub2015$zmax, pred_rf_max_forecast)

#predict on raster
pred_rf_max_forecast_raster2015 <-predict(stackpred2015, rf_max_forecast)
plot(pred_rf_max_forecast_raster2015)

#differenced raster
diff_max_forecast <- pred_rf_max_forecast_raster2015-metrics2015_max
plot(abs(diff_max_forecast))
plot(abs(crop(diff_max_forecast, roiWI)))#plot WI
plot(abs(crop(diff_max_forecast, roiWII)))#plot WII

####start here####
#calculate R-squared validation
res_valid_rf_max_forecast <- forecast_valid$zmax-valid_rf_max_forecast
RMSE_valid_rf_max_forecast <- sqrt(mean(res_valid_rf_max_forecast^2)); RMSE_valid_rf_max_forecast

#not valid to do r-squared on a non-linear relationship
#rsq_valid_rf_max_forecast <- 1-(var(valid_rf_max_forecast)/ (var(forecast_valid$zmax)))
#rsq_valid_rf_max_forecast

#calculate R-squared temporal
#not valid to do r-squared on a non-linear relationship
res_pred_rf_max_forecast <- sub2015$zmax-pred_rf_max_forecast
RMSE_pred_rf_max_forecast <- sqrt(mean(res_pred_rf_max_forecast^2)); RMSE_pred_rf_max_forecast
#not valid to do r-squared on a non-linear relationship
#rsq_pred_rf_max_forecast <- 1-(var(pred_rf_max_forecast)/ (var(sub2015$zmax)))
#rsq_pred_rf_max_forecast

set.seed(2024)
rf_max_hindcast <- randomForest(zmax ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = hindcast_train, importance = TRUE)
rf_max_hindcast

#importance
varImpPlot(rf_max_hindcast, n.var=11)
write.csv(importance(rf_max_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_hindcast.csv')

#model validation using 30% of data
valid_rf_max_hindcast <- predict(rf_max_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$zmax, valid_rf_max_hindcast)

#make temporal predictions
pred_rf_max_hindcast <- predict(rf_max_hindcast, sub2000, type = "response")
plot(sub2000$zmax, pred_rf_max_hindcast)

#predict on raster
pred_rf_max_hindcast_raster2000 <-predict(stackpred2000, rf_max_hindcast)
plot(pred_rf_max_hindcast_raster2000)
#differenced raster
diff_max_hindcast <- pred_rf_max_hindcast_raster2000-metrics2000_max
plot(abs(diff_max_hindcast))
plot(abs(crop(diff_max_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_max_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_max_predict1a <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1a_train, importance = TRUE)
rf_max_predict1a

#importance
varImpPlot(rf_max_predict1a, n.var=11)
write.csv(importance(rf_max_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict1a.csv')

#model validation using 30% of data
valid_rf_max_predict1a <- predict(rf_max_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$zmax, valid_rf_max_predict1a)

#make temporal predictions
pred_rf_max_predict1a <- predict(rf_max_predict1a, sub2012, type = "response")
plot(sub2013$zmax, pred_rf_max_predict1a)

#predict on raster
pred_rf_max_predict1a_raster2013 <-predict(stackpred2012, rf_max_predict1a)
plot(pred_rf_max_predict1a_raster2013)
#differenced raster
diff_max_predict1a <- pred_rf_max_predict1a_raster2013-metrics2012_max
plot(abs(diff_max_predict1a))
plot(abs(crop(diff_max_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_max_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_max_predict1b <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1b_train, importance = TRUE)
rf_max_predict1b

#importance
varImpPlot(rf_max_predict1b, n.var=11)
write.csv(importance(rf_max_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict1b.csv')

#model validation using 30% of data
valid_rf_max_predict1b <- predict(rf_max_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$zmax, valid_rf_max_predict1b)

#make temporal predictions
pred_rf_max_predict1b <- predict(rf_max_predict1b, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict1b)

#predict on raster
pred_rf_max_predict1b_raster2005 <-predict(stackpred2005, rf_max_predict1b)
plot(pred_rf_max_predict1b_raster2005)
#differenced raster
diff_max_predict1b <- pred_rf_max_predict1b_raster2005-metrics2005_max
plot(abs(diff_max_predict1b))
plot(abs(crop(diff_max_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_max_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_max_predict2 <- randomForest(zmax ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict2_train, importance = TRUE)
rf_max_predict2

#importance
varImpPlot(rf_max_predict2, n.var=11)
write.csv(importance(rf_max_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict2.csv')

#model validation using 30% of data
valid_rf_max_predict2 <- predict(rf_max_predict2, predict2_valid, type = "response")
plot(predict2_valid$zmax, valid_rf_max_predict2)

#make temporal predictions 2005
pred_rf_max_predict2 <- predict(rf_max_predict2, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict2)

#predict on raster 2005
pred_rf_max_predict2_raster2005 <-predict(stackpred2005, rf_max_predict2)
plot(pred_rf_max_predict2_raster2005)
#differenced raster
diff_max_predict2 <- pred_rf_max_predict2_raster2005-metrics2005_max
plot(abs(diff_max_predict2))
plot(abs(crop(diff_max_predict2, roiWI)))#plot WI
plot(abs(crop(diff_max_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_max_predict2 <- predict(rf_max_predict2, sub2012, type = "response")
plot(sub2012$zmax, pred_rf_max_predict2)

#predict on raster 2012
pred_rf_max_predict2_raster2012 <-predict(stackpred2012, rf_max_predict2)
plot(pred_rf_max_predict2_raster2012)
#differenced raster
diff_max_predict2 <- pred_rf_max_predict2_raster2012-metrics2012_max
plot(abs(diff_max_predict2))
plot(abs(crop(diff_max_predict2, roiWI)))#plot WI
plot(abs(crop(diff_max_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_max_predict3a <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2000_train, importance = TRUE)
rf_max_predict3a

varImpPlot(rf_max_predict3a, n.var=11)
write.csv(importance(rf_max_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict3a.csv')

pred_rf_max_predict3a <- predict(rf_max_predict3a, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict3a)

pred_rf_max_predict3a <- predict(rf_max_predict3a, sub2012, type = "response")
plot(sub2012$zmax, pred_rf_max_predict3a)

pred_rf_max_predict3a <- predict(rf_max_predict3a, sub2015, type = "response")
plot(sub2015$zmax, pred_rf_max_predict3a)

set.seed(2024) #2005
rf_max_predict3b <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2005_train, importance = TRUE)
rf_max_predict3b

varImpPlot(rf_max_predict3b, n.var=11)
write.csv(importance(rf_max_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict3b.csv')

pred_rf_max_predict3b <- predict(rf_max_predict3b, sub2000, type = "response")
plot(sub2000$zmax, pred_rf_max_predict3b)

pred_rf_max_predict3b <- predict(rf_max_predict3b, sub2012, type = "response")
plot(sub2012$zmax, pred_rf_max_predict3b)

pred_rf_max_predict3b <- predict(rf_max_predict3b, sub2015, type = "response")
plot(sub2015$zmax, pred_rf_max_predict3b)

set.seed(2024) #2012
rf_max_predict3c <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2012_train, importance = TRUE)
rf_max_predict3c

varImpPlot(rf_max_predict3c, n.var=11)
write.csv(importance(rf_max_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict3c.csv')

pred_rf_max_predict3c <- predict(rf_max_predict3c, sub2000, type = "response")
plot(sub2000$zmax, pred_rf_max_predict3c)

pred_rf_max_predict3c <- predict(rf_max_predict3c, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict3c)

pred_rf_max_predict3c <- predict(rf_max_predict3c, sub2015, type = "response")
plot(sub2015$zmax, pred_rf_max_predict3c)

set.seed(2024) #2015
rf_max_predict3d <- randomForest(zmax ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2015_train, importance = TRUE)
rf_max_predict3d

varImpPlot(rf_max_predict3d, n.var=11)
write.csv(importance(rf_max_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_max_predict3d.csv')

pred_rf_max_predict3d <- predict(rf_max_predict3d, sub2000, type = "response")
plot(sub2000$zmax, pred_rf_max_predict3d)

pred_rf_max_predict3d <- predict(rf_max_predict3d, sub2005, type = "response")
plot(sub2005$zmax, pred_rf_max_predict3d)

pred_rf_max_predict3d <- predict(rf_max_predict3d, sub2012, type = "response")
plot(sub2012$zmax, pred_rf_max_predict3d)

####predict mean height####
set.seed(2024)
rf_mean_forecast <- randomForest(zmean ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = forecast_train, importance = TRUE)
rf_mean_forecast

#importance
varImpPlot(rf_mean_forecast, n.var=11)
# write.csv(importance(rf_mean_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_forecast.csv')

#model validation using 30% of data
valid_rf_mean_forecast <- predict(rf_mean_forecast, forecast_valid, type = "response")
plot(forecast_valid$zmean, valid_rf_mean_forecast)

#make temporal predictions
pred_rf_mean_forecast <- predict(rf_mean_forecast, sub2015, type = "response")
plot(sub2015$zmean, pred_rf_mean_forecast)

#predict on raster
pred_rf_mean_forecast_raster2015 <-predict(stackpred2015, rf_mean_forecast)
plot(pred_rf_mean_forecast_raster2015)
#differenced raster
diff_mean_forecast <- pred_rf_mean_forecast_raster2015-metrics2015_mean
plot(abs(diff_mean_forecast))
plot(abs(crop(diff_mean_forecast, roiWI)))#plot WI
plot(abs(crop(diff_mean_forecast, roiWII)))#plot WII

set.seed(2024)
rf_mean_hindcast <- randomForest(zmean ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = hindcast_train, importance = TRUE)
rf_mean_hindcast

#importance
varImpPlot(rf_mean_hindcast, n.var=11)
write.csv(importance(rf_mean_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_hindcast.csv')

#model validation using 30% of data
valid_rf_mean_hindcast <- predict(rf_mean_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$zmean, valid_rf_mean_hindcast)

#make temporal predictions
pred_rf_mean_hindcast <- predict(rf_mean_hindcast, sub2000, type = "response")
plot(sub2000$zmean, pred_rf_mean_hindcast)

#predict on raster
pred_rf_mean_hindcast_raster2000 <-predict(stackpred2000, rf_mean_hindcast)
plot(pred_rf_mean_hindcast_raster2000)
#differenced raster
diff_mean_hindcast <- pred_rf_mean_hindcast_raster2000-metrics2000_mean
plot(abs(diff_mean_hindcast))
plot(abs(crop(diff_mean_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_mean_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_mean_predict1a <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = predict1a_train, importance = TRUE)
rf_mean_predict1a

#importance
varImpPlot(rf_mean_predict1a, n.var=11)
write.csv(importance(rf_mean_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict1a.csv')

#model validation using 30% of data
valid_rf_mean_predict1a <- predict(rf_mean_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$zmean, valid_rf_mean_predict1a)

#make temporal predictions
pred_rf_mean_predict1a <- predict(rf_mean_predict1a, sub2012, type = "response")
plot(sub2013$zmean, pred_rf_mean_predict1a)

#predict on raster
pred_rf_mean_predict1a_raster2013 <-predict(stackpred2012, rf_mean_predict1a)
plot(pred_rf_mean_predict1a_raster2013)
#differenced raster
diff_mean_predict1a <- pred_rf_mean_predict1a_raster2013-metrics2012_mean
plot(abs(diff_mean_predict1a))
plot(abs(crop(diff_mean_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_mean_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_mean_predict1b <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = predict1b_train, importance = TRUE)
rf_mean_predict1b

#importance
varImpPlot(rf_mean_predict1b, n.var=11)
write.csv(importance(rf_mean_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict1b.csv')

#model validation using 30% of data
valid_rf_mean_predict1b <- predict(rf_mean_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$zmean, valid_rf_mean_predict1b)

#make temporal predictions
pred_rf_mean_predict1b <- predict(rf_mean_predict1b, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict1b)

#predict on raster
pred_rf_mean_predict1b_raster2005 <-predict(stackpred2005, rf_mean_predict1b)
plot(pred_rf_mean_predict1b_raster2005)
#differenced raster
diff_mean_predict1b <- pred_rf_mean_predict1b_raster2005-metrics2005_mean
plot(abs(diff_mean_predict1b))
plot(abs(crop(diff_mean_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_mean_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_mean_predict2 <- randomForest(zmean ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict2_train, importance = TRUE)
rf_mean_predict2

#importance
varImpPlot(rf_mean_predict2, n.var=11)
write.csv(importance(rf_mean_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict2.csv')

#model validation using 30% of data
valid_rf_mean_predict2 <- predict(rf_mean_predict2, predict2_valid, type = "response")
plot(predict2_valid$zmean, valid_rf_mean_predict2)

#make temporal predictions 2005
pred_rf_mean_predict2 <- predict(rf_mean_predict2, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict2)

#predict on raster 2005
pred_rf_mean_predict2_raster2005 <-predict(stackpred2005, rf_mean_predict2)
plot(pred_rf_mean_predict2_raster2005)
#differenced raster
diff_mean_predict2 <- pred_rf_mean_predict2_raster2005-metrics2005_mean
plot(abs(diff_mean_predict2))
plot(abs(crop(diff_mean_predict2, roiWI)))#plot WI
plot(abs(crop(diff_mean_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_mean_predict2 <- predict(rf_mean_predict2, sub2012, type = "response")
plot(sub2012$zmean, pred_rf_mean_predict2)

#predict on raster 2012
pred_rf_mean_predict2_raster2012 <-predict(stackpred2012, rf_mean_predict2)
plot(pred_rf_mean_predict2_raster2012)
#differenced raster
diff_mean_predict2 <- pred_rf_mean_predict2_raster2012-metrics2012_mean
plot(abs(diff_mean_predict2))
plot(abs(crop(diff_mean_predict2, roiWI)))#plot WI
plot(abs(crop(diff_mean_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_mean_predict3a <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = sub2000_train, importance = TRUE)
rf_mean_predict3a

varImpPlot(rf_mean_predict3a, n.var=11)
write.csv(importance(rf_mean_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict3a.csv')

pred_rf_mean_predict3a <- predict(rf_mean_predict3a, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict3a)

pred_rf_mean_predict3a <- predict(rf_mean_predict3a, sub2012, type = "response")
plot(sub2012$zmean, pred_rf_mean_predict3a)

pred_rf_mean_predict3a <- predict(rf_mean_predict3a, sub2015, type = "response")
plot(sub2015$zmean, pred_rf_mean_predict3a)

set.seed(2024) #2005
rf_mean_predict3b <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = sub2005_train, importance = TRUE)
rf_mean_predict3b

varImpPlot(rf_mean_predict3b, n.var=11)
write.csv(importance(rf_mean_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict3b.csv')

pred_rf_mean_predict3b <- predict(rf_mean_predict3b, sub2000, type = "response")
plot(sub2000$zmean, pred_rf_mean_predict3b)

pred_rf_mean_predict3b <- predict(rf_mean_predict3b, sub2012, type = "response")
plot(sub2012$zmean, pred_rf_mean_predict3b)

pred_rf_mean_predict3b <- predict(rf_mean_predict3b, sub2015, type = "response")
plot(sub2015$zmean, pred_rf_mean_predict3b)

set.seed(2024) #2012
rf_mean_predict3c <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = sub2012_train, importance = TRUE)
rf_mean_predict3c

varImpPlot(rf_mean_predict3c, n.var=11)
write.csv(importance(rf_mean_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict3c.csv')

pred_rf_mean_predict3c <- predict(rf_mean_predict3c, sub2000, type = "response")
plot(sub2000$zmean, pred_rf_mean_predict3c)

pred_rf_mean_predict3c <- predict(rf_mean_predict3c, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict3c)

pred_rf_mean_predict3c <- predict(rf_mean_predict3c, sub2015, type = "response")
plot(sub2015$zmean, pred_rf_mean_predict3c)

set.seed(2024) #2015
rf_mean_predict3d <- randomForest(zmean ~ 
                                    blue+green+red+nir+swir1+swir2+
                                    NDVI+NBR+brightness+wetness+greenness, 
                                  data = sub2015_train, importance = TRUE)
rf_mean_predict3d

varImpPlot(rf_mean_predict3d, n.var=11)
write.csv(importance(rf_mean_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_mean_predict3d.csv')

pred_rf_mean_predict3d <- predict(rf_mean_predict3d, sub2000, type = "response")
plot(sub2000$zmean, pred_rf_mean_predict3d)

pred_rf_mean_predict3d <- predict(rf_mean_predict3d, sub2005, type = "response")
plot(sub2005$zmean, pred_rf_mean_predict3d)

pred_rf_mean_predict3d <- predict(rf_mean_predict3d, sub2012, type = "response")
plot(sub2012$zmean, pred_rf_mean_predict3d)

####predict sd height####
set.seed(2024)
rf_sd_forecast <- randomForest(zsd ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = forecast_train, importance = TRUE)
rf_sd_forecast

#importance
varImpPlot(rf_sd_forecast, n.var=11)
# write.csv(importance(rf_sd_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_forecast.csv')

#model validation using 30% of data
valid_rf_sd_forecast <- predict(rf_sd_forecast, forecast_valid, type = "response")
plot(forecast_valid$zsd, valid_rf_sd_forecast)

#make temporal predictions
pred_rf_sd_forecast <- predict(rf_sd_forecast, sub2015, type = "response")
plot(sub2015$zsd, pred_rf_sd_forecast)

#predict on raster
pred_rf_sd_forecast_raster2015 <-predict(stackpred2015, rf_sd_forecast)
plot(pred_rf_sd_forecast_raster2015)
#differenced raster
diff_sd_forecast <- pred_rf_sd_forecast_raster2015-metrics2015_sd
plot(abs(diff_sd_forecast))
plot(abs(crop(diff_sd_forecast, roiWI)))#plot WI
plot(abs(crop(diff_sd_forecast, roiWII)))#plot WII

set.seed(2024)
rf_sd_hindcast <- randomForest(zsd ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = hindcast_train, importance = TRUE)
rf_sd_hindcast

#importance
varImpPlot(rf_sd_hindcast, n.var=11)
write.csv(importance(rf_sd_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_hindcast.csv')

#model validation using 30% of data
valid_rf_sd_hindcast <- predict(rf_sd_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$zsd, valid_rf_sd_hindcast)

#make temporal predictions
pred_rf_sd_hindcast <- predict(rf_sd_hindcast, sub2000, type = "response")
plot(sub2000$zsd, pred_rf_sd_hindcast)

#predict on raster
pred_rf_sd_hindcast_raster2000 <-predict(stackpred2000, rf_sd_hindcast)
plot(pred_rf_sd_hindcast_raster2000)
#differenced raster
diff_sd_hindcast <- pred_rf_sd_hindcast_raster2000-metrics2000_sd
plot(abs(diff_sd_hindcast))
plot(abs(crop(diff_sd_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_sd_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_sd_predict1a <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1a_train, importance = TRUE)
rf_sd_predict1a

#importance
varImpPlot(rf_sd_predict1a, n.var=11)
write.csv(importance(rf_sd_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict1a.csv')

#model validation using 30% of data
valid_rf_sd_predict1a <- predict(rf_sd_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$zsd, valid_rf_sd_predict1a)

#make temporal predictions
pred_rf_sd_predict1a <- predict(rf_sd_predict1a, sub2012, type = "response")
plot(sub2013$zsd, pred_rf_sd_predict1a)

#predict on raster
pred_rf_sd_predict1a_raster2013 <-predict(stackpred2012, rf_sd_predict1a)
plot(pred_rf_sd_predict1a_raster2013)
#differenced raster
diff_sd_predict1a <- pred_rf_sd_predict1a_raster2013-metrics2012_sd
plot(abs(diff_sd_predict1a))
plot(abs(crop(diff_sd_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_sd_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_sd_predict1b <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1b_train, importance = TRUE)
rf_sd_predict1b

#importance
varImpPlot(rf_sd_predict1b, n.var=11)
write.csv(importance(rf_sd_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict1b.csv')

#model validation using 30% of data
valid_rf_sd_predict1b <- predict(rf_sd_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$zsd, valid_rf_sd_predict1b)

#make temporal predictions
pred_rf_sd_predict1b <- predict(rf_sd_predict1b, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict1b)

#predict on raster
pred_rf_sd_predict1b_raster2005 <-predict(stackpred2005, rf_sd_predict1b)
plot(pred_rf_sd_predict1b_raster2005)
#differenced raster
diff_sd_predict1b <- pred_rf_sd_predict1b_raster2005-metrics2005_sd
plot(abs(diff_sd_predict1b))
plot(abs(crop(diff_sd_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_sd_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_sd_predict2 <- randomForest(zsd ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = predict2_train, importance = TRUE)
rf_sd_predict2

#importance
varImpPlot(rf_sd_predict2, n.var=11)
write.csv(importance(rf_sd_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict2.csv')

#model validation using 30% of data
valid_rf_sd_predict2 <- predict(rf_sd_predict2, predict2_valid, type = "response")
plot(predict2_valid$zsd, valid_rf_sd_predict2)

#make temporal predictions 2005
pred_rf_sd_predict2 <- predict(rf_sd_predict2, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict2)

#predict on raster 2005
pred_rf_sd_predict2_raster2005 <-predict(stackpred2005, rf_sd_predict2)
plot(pred_rf_sd_predict2_raster2005)
#differenced raster
diff_sd_predict2 <- pred_rf_sd_predict2_raster2005-metrics2005_sd
plot(abs(diff_sd_predict2))
plot(abs(crop(diff_sd_predict2, roiWI)))#plot WI
plot(abs(crop(diff_sd_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_sd_predict2 <- predict(rf_sd_predict2, sub2012, type = "response")
plot(sub2012$zsd, pred_rf_sd_predict2)

#predict on raster 2012
pred_rf_sd_predict2_raster2012 <-predict(stackpred2012, rf_sd_predict2)
plot(pred_rf_sd_predict2_raster2012)
#differenced raster
diff_sd_predict2 <- pred_rf_sd_predict2_raster2012-metrics2012_sd
plot(abs(diff_sd_predict2))
plot(abs(crop(diff_sd_predict2, roiWI)))#plot WI
plot(abs(crop(diff_sd_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_sd_predict3a <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2000_train, importance = TRUE)
rf_sd_predict3a

varImpPlot(rf_sd_predict3a, n.var=11)
write.csv(importance(rf_sd_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict3a.csv')

pred_rf_sd_predict3a <- predict(rf_sd_predict3a, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict3a)

pred_rf_sd_predict3a <- predict(rf_sd_predict3a, sub2012, type = "response")
plot(sub2012$zsd, pred_rf_sd_predict3a)

pred_rf_sd_predict3a <- predict(rf_sd_predict3a, sub2015, type = "response")
plot(sub2015$zsd, pred_rf_sd_predict3a)

set.seed(2024) #2005
rf_sd_predict3b <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2005_train, importance = TRUE)
rf_sd_predict3b

varImpPlot(rf_sd_predict3b, n.var=11)
write.csv(importance(rf_sd_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict3b.csv')

pred_rf_sd_predict3b <- predict(rf_sd_predict3b, sub2000, type = "response")
plot(sub2000$zsd, pred_rf_sd_predict3b)

pred_rf_sd_predict3b <- predict(rf_sd_predict3b, sub2012, type = "response")
plot(sub2012$zsd, pred_rf_sd_predict3b)

pred_rf_sd_predict3b <- predict(rf_sd_predict3b, sub2015, type = "response")
plot(sub2015$zsd, pred_rf_sd_predict3b)

set.seed(2024) #2012
rf_sd_predict3c <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2012_train, importance = TRUE)
rf_sd_predict3c

varImpPlot(rf_sd_predict3c, n.var=11)
write.csv(importance(rf_sd_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict3c.csv')

pred_rf_sd_predict3c <- predict(rf_sd_predict3c, sub2000, type = "response")
plot(sub2000$zsd, pred_rf_sd_predict3c)

pred_rf_sd_predict3c <- predict(rf_sd_predict3c, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict3c)

pred_rf_sd_predict3c <- predict(rf_sd_predict3c, sub2015, type = "response")
plot(sub2015$zsd, pred_rf_sd_predict3c)

set.seed(2024) #2015
rf_sd_predict3d <- randomForest(zsd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2015_train, importance = TRUE)
rf_sd_predict3d

varImpPlot(rf_sd_predict3d, n.var=11)
write.csv(importance(rf_sd_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_sd_predict3d.csv')

pred_rf_sd_predict3d <- predict(rf_sd_predict3d, sub2000, type = "response")
plot(sub2000$zsd, pred_rf_sd_predict3d)

pred_rf_sd_predict3d <- predict(rf_sd_predict3d, sub2005, type = "response")
plot(sub2005$zsd, pred_rf_sd_predict3d)

pred_rf_sd_predict3d <- predict(rf_sd_predict3d, sub2012, type = "response")
plot(sub2012$zsd, pred_rf_sd_predict3d)

####predict entropy####
set.seed(2024)
rf_entropy_forecast <- randomForest(entropy ~ 
                                      blue+green+red+nir+swir1+swir2+
                                      NDVI+NBR+brightness+wetness+greenness, 
                                    data = forecast_train, importance = TRUE)
rf_entropy_forecast

#importance
varImpPlot(rf_entropy_forecast, n.var=11)
# write.csv(importance(rf_entropy_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_forecast.csv')

#model validation using 30% of data
valid_rf_entropy_forecast <- predict(rf_entropy_forecast, forecast_valid, type = "response")
plot(forecast_valid$entropy, valid_rf_entropy_forecast)

#make temporal predictions
pred_rf_entropy_forecast <- predict(rf_entropy_forecast, sub2015, type = "response")
plot(sub2015$entropy, pred_rf_entropy_forecast)

#predict on raster
pred_rf_entropy_forecast_raster2015 <-predict(stackpred2015, rf_entropy_forecast)
plot(pred_rf_entropy_forecast_raster2015)
#differenced raster
diff_entropy_forecast <- pred_rf_entropy_forecast_raster2015-metrics2015_entropy
plot(abs(diff_entropy_forecast))
plot(abs(crop(diff_entropy_forecast, roiWI)))#plot WI
plot(abs(crop(diff_entropy_forecast, roiWII)))#plot WII

set.seed(2024)
rf_entropy_hindcast <- randomForest(entropy ~ 
                                      blue+green+red+nir+swir1+swir2+
                                      NDVI+NBR+brightness+wetness+greenness, 
                                    data = hindcast_train, importance = TRUE)
rf_entropy_hindcast

#importance
varImpPlot(rf_entropy_hindcast, n.var=11)
write.csv(importance(rf_entropy_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_hindcast.csv')

#model validation using 30% of data
valid_rf_entropy_hindcast <- predict(rf_entropy_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$entropy, valid_rf_entropy_hindcast)

#make temporal predictions
pred_rf_entropy_hindcast <- predict(rf_entropy_hindcast, sub2000, type = "response")
plot(sub2000$entropy, pred_rf_entropy_hindcast)

#predict on raster
pred_rf_entropy_hindcast_raster2000 <-predict(stackpred2000, rf_entropy_hindcast)
plot(pred_rf_entropy_hindcast_raster2000)
#differenced raster
diff_entropy_hindcast <- pred_rf_entropy_hindcast_raster2000-metrics2000_entropy
plot(abs(diff_entropy_hindcast))
plot(abs(crop(diff_entropy_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_entropy_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_entropy_predict1a <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = predict1a_train, importance = TRUE)
rf_entropy_predict1a

#importance
varImpPlot(rf_entropy_predict1a, n.var=11)
write.csv(importance(rf_entropy_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict1a.csv')

#model validation using 30% of data
valid_rf_entropy_predict1a <- predict(rf_entropy_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$entropy, valid_rf_entropy_predict1a)

#make temporal predictions
pred_rf_entropy_predict1a <- predict(rf_entropy_predict1a, sub2012, type = "response")
plot(sub2013$entropy, pred_rf_entropy_predict1a)

#predict on raster
pred_rf_entropy_predict1a_raster2013 <-predict(stackpred2012, rf_entropy_predict1a)
plot(pred_rf_entropy_predict1a_raster2013)
#differenced raster
diff_entropy_predict1a <- pred_rf_entropy_predict1a_raster2013-metrics2012_entropy
plot(abs(diff_entropy_predict1a))
plot(abs(crop(diff_entropy_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_entropy_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_entropy_predict1b <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = predict1b_train, importance = TRUE)
rf_entropy_predict1b

#importance
varImpPlot(rf_entropy_predict1b, n.var=11)
write.csv(importance(rf_entropy_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict1b.csv')

#model validation using 30% of data
valid_rf_entropy_predict1b <- predict(rf_entropy_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$entropy, valid_rf_entropy_predict1b)

#make temporal predictions
pred_rf_entropy_predict1b <- predict(rf_entropy_predict1b, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict1b)

#predict on raster
pred_rf_entropy_predict1b_raster2005 <-predict(stackpred2005, rf_entropy_predict1b)
plot(pred_rf_entropy_predict1b_raster2005)
#differenced raster
diff_entropy_predict1b <- pred_rf_entropy_predict1b_raster2005-metrics2005_entropy
plot(abs(diff_entropy_predict1b))
plot(abs(crop(diff_entropy_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_entropy_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_entropy_predict2 <- randomForest(entropy ~ 
                                      blue+green+red+nir+swir1+swir2+
                                      NDVI+NBR+brightness+wetness+greenness, 
                                    data = predict2_train, importance = TRUE)
rf_entropy_predict2

#importance
varImpPlot(rf_entropy_predict2, n.var=11)
write.csv(importance(rf_entropy_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict2.csv')

#model validation using 30% of data
valid_rf_entropy_predict2 <- predict(rf_entropy_predict2, predict2_valid, type = "response")
plot(predict2_valid$entropy, valid_rf_entropy_predict2)

#make temporal predictions 2005
pred_rf_entropy_predict2 <- predict(rf_entropy_predict2, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict2)

#predict on raster 2005
pred_rf_entropy_predict2_raster2005 <-predict(stackpred2005, rf_entropy_predict2)
plot(pred_rf_entropy_predict2_raster2005)
#differenced raster
diff_entropy_predict2 <- pred_rf_entropy_predict2_raster2005-metrics2005_entropy
plot(abs(diff_entropy_predict2))
plot(abs(crop(diff_entropy_predict2, roiWI)))#plot WI
plot(abs(crop(diff_entropy_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_entropy_predict2 <- predict(rf_entropy_predict2, sub2012, type = "response")
plot(sub2012$entropy, pred_rf_entropy_predict2)

#predict on raster 2012
pred_rf_entropy_predict2_raster2012 <-predict(stackpred2012, rf_entropy_predict2)
plot(pred_rf_entropy_predict2_raster2012)
#differenced raster
diff_entropy_predict2 <- pred_rf_entropy_predict2_raster2012-metrics2012_entropy
plot(abs(diff_entropy_predict2))
plot(abs(crop(diff_entropy_predict2, roiWI)))#plot WI
plot(abs(crop(diff_entropy_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_entropy_predict3a <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = sub2000_train, importance = TRUE)
rf_entropy_predict3a

varImpPlot(rf_entropy_predict3a, n.var=11)
write.csv(importance(rf_entropy_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict3a.csv')

pred_rf_entropy_predict3a <- predict(rf_entropy_predict3a, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict3a)

pred_rf_entropy_predict3a <- predict(rf_entropy_predict3a, sub2012, type = "response")
plot(sub2012$entropy, pred_rf_entropy_predict3a)

pred_rf_entropy_predict3a <- predict(rf_entropy_predict3a, sub2015, type = "response")
plot(sub2015$entropy, pred_rf_entropy_predict3a)

set.seed(2024) #2005
rf_entropy_predict3b <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = sub2005_train, importance = TRUE)
rf_entropy_predict3b

varImpPlot(rf_entropy_predict3b, n.var=11)
write.csv(importance(rf_entropy_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict3b.csv')

pred_rf_entropy_predict3b <- predict(rf_entropy_predict3b, sub2000, type = "response")
plot(sub2000$entropy, pred_rf_entropy_predict3b)

pred_rf_entropy_predict3b <- predict(rf_entropy_predict3b, sub2012, type = "response")
plot(sub2012$entropy, pred_rf_entropy_predict3b)

pred_rf_entropy_predict3b <- predict(rf_entropy_predict3b, sub2015, type = "response")
plot(sub2015$entropy, pred_rf_entropy_predict3b)

set.seed(2024) #2012
rf_entropy_predict3c <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = sub2012_train, importance = TRUE)
rf_entropy_predict3c

varImpPlot(rf_entropy_predict3c, n.var=11)
write.csv(importance(rf_entropy_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict3c.csv')

pred_rf_entropy_predict3c <- predict(rf_entropy_predict3c, sub2000, type = "response")
plot(sub2000$entropy, pred_rf_entropy_predict3c)

pred_rf_entropy_predict3c <- predict(rf_entropy_predict3c, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict3c)

pred_rf_entropy_predict3c <- predict(rf_entropy_predict3c, sub2015, type = "response")
plot(sub2015$entropy, pred_rf_entropy_predict3c)

set.seed(2024) #2015
rf_entropy_predict3d <- randomForest(entropy ~ 
                                       blue+green+red+nir+swir1+swir2+
                                       NDVI+NBR+brightness+wetness+greenness, 
                                     data = sub2015_train, importance = TRUE)
rf_entropy_predict3d

varImpPlot(rf_entropy_predict3d, n.var=11)
write.csv(importance(rf_entropy_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_entropy_predict3d.csv')

pred_rf_entropy_predict3d <- predict(rf_entropy_predict3d, sub2000, type = "response")
plot(sub2000$entropy, pred_rf_entropy_predict3d)

pred_rf_entropy_predict3d <- predict(rf_entropy_predict3d, sub2005, type = "response")
plot(sub2005$entropy, pred_rf_entropy_predict3d)

pred_rf_entropy_predict3d <- predict(rf_entropy_predict3d, sub2012, type = "response")
plot(sub2012$entropy, pred_rf_entropy_predict3d)	

####predict fhd####
set.seed(2024)
rf_fhd_forecast <- randomForest(fhd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = forecast_train, importance = TRUE)
rf_fhd_forecast

#importance
varImpPlot(rf_fhd_forecast, n.var=11)
# write.csv(importance(rf_fhd_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_forecast.csv')

#model validation using 30% of data
valid_rf_fhd_forecast <- predict(rf_fhd_forecast, forecast_valid, type = "response")
plot(forecast_valid$fhd, valid_rf_fhd_forecast)

#make temporal predictions
pred_rf_fhd_forecast <- predict(rf_fhd_forecast, sub2015, type = "response")
plot(sub2015$fhd, pred_rf_fhd_forecast)

#predict on raster
pred_rf_fhd_forecast_raster2015 <-predict(stackpred2015, rf_fhd_forecast)
plot(pred_rf_fhd_forecast_raster2015)
#differenced raster
diff_fhd_forecast <- pred_rf_fhd_forecast_raster2015-metrics2015_fhd
plot(abs(diff_fhd_forecast))
plot(abs(crop(diff_fhd_forecast, roiWI)))#plot WI
plot(abs(crop(diff_fhd_forecast, roiWII)))#plot WII

set.seed(2024)
rf_fhd_hindcast <- randomForest(fhd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = hindcast_train, importance = TRUE)
rf_fhd_hindcast

#importance
varImpPlot(rf_fhd_hindcast, n.var=11)
write.csv(importance(rf_fhd_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_hindcast.csv')

#model validation using 30% of data
valid_rf_fhd_hindcast <- predict(rf_fhd_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$fhd, valid_rf_fhd_hindcast)

#make temporal predictions
pred_rf_fhd_hindcast <- predict(rf_fhd_hindcast, sub2000, type = "response")
plot(sub2000$fhd, pred_rf_fhd_hindcast)

#predict on raster
pred_rf_fhd_hindcast_raster2000 <-predict(stackpred2000, rf_fhd_hindcast)
plot(pred_rf_fhd_hindcast_raster2000)
#differenced raster
diff_fhd_hindcast <- pred_rf_fhd_hindcast_raster2000-metrics2000_fhd
plot(abs(diff_fhd_hindcast))
plot(abs(crop(diff_fhd_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_fhd_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_fhd_predict1a <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1a_train, importance = TRUE)
rf_fhd_predict1a

#importance
varImpPlot(rf_fhd_predict1a, n.var=11)
write.csv(importance(rf_fhd_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict1a.csv')

#model validation using 30% of data
valid_rf_fhd_predict1a <- predict(rf_fhd_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$fhd, valid_rf_fhd_predict1a)

#make temporal predictions
pred_rf_fhd_predict1a <- predict(rf_fhd_predict1a, sub2012, type = "response")
plot(sub2013$fhd, pred_rf_fhd_predict1a)

#predict on raster
pred_rf_fhd_predict1a_raster2013 <-predict(stackpred2012, rf_fhd_predict1a)
plot(pred_rf_fhd_predict1a_raster2013)
#differenced raster
diff_fhd_predict1a <- pred_rf_fhd_predict1a_raster2013-metrics2012_fhd
plot(abs(diff_fhd_predict1a))
plot(abs(crop(diff_fhd_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_fhd_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_fhd_predict1b <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1b_train, importance = TRUE)
rf_fhd_predict1b

#importance
varImpPlot(rf_fhd_predict1b, n.var=11)
write.csv(importance(rf_fhd_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict1b.csv')

#model validation using 30% of data
valid_rf_fhd_predict1b <- predict(rf_fhd_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$fhd, valid_rf_fhd_predict1b)

#make temporal predictions
pred_rf_fhd_predict1b <- predict(rf_fhd_predict1b, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict1b)

#predict on raster
pred_rf_fhd_predict1b_raster2005 <-predict(stackpred2005, rf_fhd_predict1b)
plot(pred_rf_fhd_predict1b_raster2005)
#differenced raster
diff_fhd_predict1b <- pred_rf_fhd_predict1b_raster2005-metrics2005_fhd
plot(abs(diff_fhd_predict1b))
plot(abs(crop(diff_fhd_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_fhd_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_fhd_predict2 <- randomForest(fhd ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict2_train, importance = TRUE)
rf_fhd_predict2

#importance
varImpPlot(rf_fhd_predict2, n.var=11)
write.csv(importance(rf_fhd_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict2.csv')

#model validation using 30% of data
valid_rf_fhd_predict2 <- predict(rf_fhd_predict2, predict2_valid, type = "response")
plot(predict2_valid$fhd, valid_rf_fhd_predict2)

#make temporal predictions 2005
pred_rf_fhd_predict2 <- predict(rf_fhd_predict2, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict2)

#predict on raster 2005
pred_rf_fhd_predict2_raster2005 <-predict(stackpred2005, rf_fhd_predict2)
plot(pred_rf_fhd_predict2_raster2005)
#differenced raster
diff_fhd_predict2 <- pred_rf_fhd_predict2_raster2005-metrics2005_fhd
plot(abs(diff_fhd_predict2))
plot(abs(crop(diff_fhd_predict2, roiWI)))#plot WI
plot(abs(crop(diff_fhd_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_fhd_predict2 <- predict(rf_fhd_predict2, sub2012, type = "response")
plot(sub2012$fhd, pred_rf_fhd_predict2)

#predict on raster 2012
pred_rf_fhd_predict2_raster2012 <-predict(stackpred2012, rf_fhd_predict2)
plot(pred_rf_fhd_predict2_raster2012)
#differenced raster
diff_fhd_predict2 <- pred_rf_fhd_predict2_raster2012-metrics2012_fhd
plot(abs(diff_fhd_predict2))
plot(abs(crop(diff_fhd_predict2, roiWI)))#plot WI
plot(abs(crop(diff_fhd_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_fhd_predict3a <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2000_train, importance = TRUE)
rf_fhd_predict3a

varImpPlot(rf_fhd_predict3a, n.var=11)
write.csv(importance(rf_fhd_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict3a.csv')

pred_rf_fhd_predict3a <- predict(rf_fhd_predict3a, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict3a)

pred_rf_fhd_predict3a <- predict(rf_fhd_predict3a, sub2012, type = "response")
plot(sub2012$fhd, pred_rf_fhd_predict3a)

pred_rf_fhd_predict3a <- predict(rf_fhd_predict3a, sub2015, type = "response")
plot(sub2015$fhd, pred_rf_fhd_predict3a)

set.seed(2024) #2005
rf_fhd_predict3b <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2005_train, importance = TRUE)
rf_fhd_predict3b

varImpPlot(rf_fhd_predict3b, n.var=11)
write.csv(importance(rf_fhd_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict3b.csv')

pred_rf_fhd_predict3b <- predict(rf_fhd_predict3b, sub2000, type = "response")
plot(sub2000$fhd, pred_rf_fhd_predict3b)

pred_rf_fhd_predict3b <- predict(rf_fhd_predict3b, sub2012, type = "response")
plot(sub2012$fhd, pred_rf_fhd_predict3b)

pred_rf_fhd_predict3b <- predict(rf_fhd_predict3b, sub2015, type = "response")
plot(sub2015$fhd, pred_rf_fhd_predict3b)

set.seed(2024) #2012
rf_fhd_predict3c <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2012_train, importance = TRUE)
rf_fhd_predict3c

varImpPlot(rf_fhd_predict3c, n.var=11)
write.csv(importance(rf_fhd_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict3c.csv')

pred_rf_fhd_predict3c <- predict(rf_fhd_predict3c, sub2000, type = "response")
plot(sub2000$fhd, pred_rf_fhd_predict3c)

pred_rf_fhd_predict3c <- predict(rf_fhd_predict3c, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict3c)

pred_rf_fhd_predict3c <- predict(rf_fhd_predict3c, sub2015, type = "response")
plot(sub2015$fhd, pred_rf_fhd_predict3c)

set.seed(2024) #2015
rf_fhd_predict3d <- randomForest(fhd ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2015_train, importance = TRUE)
rf_fhd_predict3d

varImpPlot(rf_fhd_predict3d, n.var=11)
write.csv(importance(rf_fhd_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_fhd_predict3d.csv')

pred_rf_fhd_predict3d <- predict(rf_fhd_predict3d, sub2000, type = "response")
plot(sub2000$fhd, pred_rf_fhd_predict3d)

pred_rf_fhd_predict3d <- predict(rf_fhd_predict3d, sub2005, type = "response")
plot(sub2005$fhd, pred_rf_fhd_predict3d)

pred_rf_fhd_predict3d <- predict(rf_fhd_predict3d, sub2012, type = "response")
plot(sub2012$fhd, pred_rf_fhd_predict3d)	

####predict cc####
set.seed(2024)
rf_cc_forecast <- randomForest(cc ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = forecast_train, importance = TRUE)
rf_cc_forecast

#importance
varImpPlot(rf_cc_forecast, n.var=11)
# write.csv(importance(rf_cc_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_forecast.csv')

#model validation using 30% of data
valid_rf_cc_forecast <- predict(rf_cc_forecast, forecast_valid, type = "response")
plot(forecast_valid$cc, valid_rf_cc_forecast)

#make temporal predictions
pred_rf_cc_forecast <- predict(rf_cc_forecast, sub2015, type = "response")
plot(sub2015$cc, pred_rf_cc_forecast)

#predict on raster
pred_rf_cc_forecast_raster2015 <-predict(stackpred2015, rf_cc_forecast)
plot(pred_rf_cc_forecast_raster2015)
#differenced raster
diff_cc_forecast <- pred_rf_cc_forecast_raster2015-metrics2015_cc
plot(abs(diff_cc_forecast))
plot(abs(crop(diff_cc_forecast, roiWI)))#plot WI
plot(abs(crop(diff_cc_forecast, roiWII)))#plot WII

set.seed(2024)
rf_cc_hindcast <- randomForest(cc ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = hindcast_train, importance = TRUE)
rf_cc_hindcast

#importance
varImpPlot(rf_cc_hindcast, n.var=11)
write.csv(importance(rf_cc_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_hindcast.csv')

#model validation using 30% of data
valid_rf_cc_hindcast <- predict(rf_cc_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$cc, valid_rf_cc_hindcast)

#make temporal predictions
pred_rf_cc_hindcast <- predict(rf_cc_hindcast, sub2000, type = "response")
plot(sub2000$cc, pred_rf_cc_hindcast)

#predict on raster
pred_rf_cc_hindcast_raster2000 <-predict(stackpred2000, rf_cc_hindcast)
plot(pred_rf_cc_hindcast_raster2000)
#differenced raster
diff_cc_hindcast <- pred_rf_cc_hindcast_raster2000-metrics2000_cc
plot(abs(diff_cc_hindcast))
plot(abs(crop(diff_cc_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_cc_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_cc_predict1a <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1a_train, importance = TRUE)
rf_cc_predict1a

#importance
varImpPlot(rf_cc_predict1a, n.var=11)
write.csv(importance(rf_cc_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict1a.csv')

#model validation using 30% of data
valid_rf_cc_predict1a <- predict(rf_cc_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$cc, valid_rf_cc_predict1a)

#make temporal predictions
pred_rf_cc_predict1a <- predict(rf_cc_predict1a, sub2012, type = "response")
plot(sub2013$cc, pred_rf_cc_predict1a)

#predict on raster
pred_rf_cc_predict1a_raster2013 <-predict(stackpred2012, rf_cc_predict1a)
plot(pred_rf_cc_predict1a_raster2013)
#differenced raster
diff_cc_predict1a <- pred_rf_cc_predict1a_raster2013-metrics2012_cc
plot(abs(diff_cc_predict1a))
plot(abs(crop(diff_cc_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_cc_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_cc_predict1b <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict1b_train, importance = TRUE)
rf_cc_predict1b

#importance
varImpPlot(rf_cc_predict1b, n.var=11)
write.csv(importance(rf_cc_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict1b.csv')

#model validation using 30% of data
valid_rf_cc_predict1b <- predict(rf_cc_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$cc, valid_rf_cc_predict1b)

#make temporal predictions
pred_rf_cc_predict1b <- predict(rf_cc_predict1b, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict1b)

#predict on raster
pred_rf_cc_predict1b_raster2005 <-predict(stackpred2005, rf_cc_predict1b)
plot(pred_rf_cc_predict1b_raster2005)
#differenced raster
diff_cc_predict1b <- pred_rf_cc_predict1b_raster2005-metrics2005_cc
plot(abs(diff_cc_predict1b))
plot(abs(crop(diff_cc_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_cc_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_cc_predict2 <- randomForest(cc ~ 
                                 blue+green+red+nir+swir1+swir2+
                                 NDVI+NBR+brightness+wetness+greenness, 
                               data = predict2_train, importance = TRUE)
rf_cc_predict2

#importance
varImpPlot(rf_cc_predict2, n.var=11)
write.csv(importance(rf_cc_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict2.csv')

#model validation using 30% of data
valid_rf_cc_predict2 <- predict(rf_cc_predict2, predict2_valid, type = "response")
plot(predict2_valid$cc, valid_rf_cc_predict2)

#make temporal predictions 2005
pred_rf_cc_predict2 <- predict(rf_cc_predict2, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict2)

#predict on raster 2005
pred_rf_cc_predict2_raster2005 <-predict(stackpred2005, rf_cc_predict2)
plot(pred_rf_cc_predict2_raster2005)
#differenced raster
diff_cc_predict2 <- pred_rf_cc_predict2_raster2005-metrics2005_cc
plot(abs(diff_cc_predict2))
plot(abs(crop(diff_cc_predict2, roiWI)))#plot WI
plot(abs(crop(diff_cc_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_cc_predict2 <- predict(rf_cc_predict2, sub2012, type = "response")
plot(sub2012$cc, pred_rf_cc_predict2)

#predict on raster 2012
pred_rf_cc_predict2_raster2012 <-predict(stackpred2012, rf_cc_predict2)
plot(pred_rf_cc_predict2_raster2012)
#differenced raster
diff_cc_predict2 <- pred_rf_cc_predict2_raster2012-metrics2012_cc
plot(abs(diff_cc_predict2))
plot(abs(crop(diff_cc_predict2, roiWI)))#plot WI
plot(abs(crop(diff_cc_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_cc_predict3a <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2000_train, importance = TRUE)
rf_cc_predict3a

varImpPlot(rf_cc_predict3a, n.var=11)
write.csv(importance(rf_cc_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict3a.csv')

pred_rf_cc_predict3a <- predict(rf_cc_predict3a, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict3a)

pred_rf_cc_predict3a <- predict(rf_cc_predict3a, sub2012, type = "response")
plot(sub2012$cc, pred_rf_cc_predict3a)

pred_rf_cc_predict3a <- predict(rf_cc_predict3a, sub2015, type = "response")
plot(sub2015$cc, pred_rf_cc_predict3a)

set.seed(2024) #2005
rf_cc_predict3b <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2005_train, importance = TRUE)
rf_cc_predict3b

varImpPlot(rf_cc_predict3b, n.var=11)
write.csv(importance(rf_cc_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict3b.csv')

pred_rf_cc_predict3b <- predict(rf_cc_predict3b, sub2000, type = "response")
plot(sub2000$cc, pred_rf_cc_predict3b)

pred_rf_cc_predict3b <- predict(rf_cc_predict3b, sub2012, type = "response")
plot(sub2012$cc, pred_rf_cc_predict3b)

pred_rf_cc_predict3b <- predict(rf_cc_predict3b, sub2015, type = "response")
plot(sub2015$cc, pred_rf_cc_predict3b)

set.seed(2024) #2012
rf_cc_predict3c <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2012_train, importance = TRUE)
rf_cc_predict3c

varImpPlot(rf_cc_predict3c, n.var=11)
write.csv(importance(rf_cc_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict3c.csv')

pred_rf_cc_predict3c <- predict(rf_cc_predict3c, sub2000, type = "response")
plot(sub2000$cc, pred_rf_cc_predict3c)

pred_rf_cc_predict3c <- predict(rf_cc_predict3c, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict3c)

pred_rf_cc_predict3c <- predict(rf_cc_predict3c, sub2015, type = "response")
plot(sub2015$cc, pred_rf_cc_predict3c)

set.seed(2024) #2015
rf_cc_predict3d <- randomForest(cc ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = sub2015_train, importance = TRUE)
rf_cc_predict3d

varImpPlot(rf_cc_predict3d, n.var=11)
write.csv(importance(rf_cc_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_cc_predict3d.csv')

pred_rf_cc_predict3d <- predict(rf_cc_predict3d, sub2000, type = "response")
plot(sub2000$cc, pred_rf_cc_predict3d)

pred_rf_cc_predict3d <- predict(rf_cc_predict3d, sub2005, type = "response")
plot(sub2005$cc, pred_rf_cc_predict3d)

pred_rf_cc_predict3d <- predict(rf_cc_predict3d, sub2012, type = "response")
plot(sub2012$cc, pred_rf_cc_predict3d)	

####predict crr####
set.seed(2024)
rf_crr_forecast <- randomForest(crr ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = forecast_train, importance = TRUE)
rf_crr_forecast

#importance
varImpPlot(rf_crr_forecast, n.var=11)
# write.csv(importance(rf_crr_forecast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_forecast.csv')

#model validation using 30% of data
valid_rf_crr_forecast <- predict(rf_crr_forecast, forecast_valid, type = "response")
plot(forecast_valid$crr, valid_rf_crr_forecast)

#make temporal predictions
pred_rf_crr_forecast <- predict(rf_crr_forecast, sub2015, type = "response")
plot(sub2015$crr, pred_rf_crr_forecast)

#predict on raster
pred_rf_crr_forecast_raster2015 <-predict(stackpred2015, rf_crr_forecast)
plot(pred_rf_crr_forecast_raster2015)
#differenced raster
diff_crr_forecast <- pred_rf_crr_forecast_raster2015-metrics2015_crr
plot(abs(diff_crr_forecast))
plot(abs(crop(diff_crr_forecast, roiWI)))#plot WI
plot(abs(crop(diff_crr_forecast, roiWII)))#plot WII

set.seed(2024)
rf_crr_hindcast <- randomForest(crr ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = hindcast_train, importance = TRUE)
rf_crr_hindcast

#importance
varImpPlot(rf_crr_hindcast, n.var=11)
write.csv(importance(rf_crr_hindcast), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_hindcast.csv')

#model validation using 30% of data
valid_rf_crr_hindcast <- predict(rf_crr_hindcast, hindcast_valid, type = "response")
plot(hindcast_valid$crr, valid_rf_crr_hindcast)

#make temporal predictions
pred_rf_crr_hindcast <- predict(rf_crr_hindcast, sub2000, type = "response")
plot(sub2000$crr, pred_rf_crr_hindcast)

#predict on raster
pred_rf_crr_hindcast_raster2000 <-predict(stackpred2000, rf_crr_hindcast)
plot(pred_rf_crr_hindcast_raster2000)
#differenced raster
diff_crr_hindcast <- pred_rf_crr_hindcast_raster2000-metrics2000_crr
plot(abs(diff_crr_hindcast))
plot(abs(crop(diff_crr_hindcast, roiWI)))#plot WI
plot(abs(crop(diff_crr_hindcast, roiWII)))#plot WII

set.seed(2024)
rf_crr_predict1a <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1a_train, importance = TRUE)
rf_crr_predict1a

#importance
varImpPlot(rf_crr_predict1a, n.var=11)
write.csv(importance(rf_crr_predict1a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict1a.csv')

#model validation using 30% of data
valid_rf_crr_predict1a <- predict(rf_crr_predict1a, predict1a_valid, type = "response")
plot(predict1a_valid$crr, valid_rf_crr_predict1a)

#make temporal predictions
pred_rf_crr_predict1a <- predict(rf_crr_predict1a, sub2012, type = "response")
plot(sub2013$crr, pred_rf_crr_predict1a)

#predict on raster
pred_rf_crr_predict1a_raster2013 <-predict(stackpred2012, rf_crr_predict1a)
plot(pred_rf_crr_predict1a_raster2013)
#differenced raster
diff_crr_predict1a <- pred_rf_crr_predict1a_raster2013-metrics2012_crr
plot(abs(diff_crr_predict1a))
plot(abs(crop(diff_crr_predict1a, roiWI)))#plot WI
plot(abs(crop(diff_crr_predict1a, roiWII)))#plot WII

set.seed(2024)
rf_crr_predict1b <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = predict1b_train, importance = TRUE)
rf_crr_predict1b

#importance
varImpPlot(rf_crr_predict1b, n.var=11)
write.csv(importance(rf_crr_predict1b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict1b.csv')

#model validation using 30% of data
valid_rf_crr_predict1b <- predict(rf_crr_predict1b, predict1b_valid, type = "response")
plot(predict1b_valid$crr, valid_rf_crr_predict1b)

#make temporal predictions
pred_rf_crr_predict1b <- predict(rf_crr_predict1b, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict1b)

#predict on raster
pred_rf_crr_predict1b_raster2005 <-predict(stackpred2005, rf_crr_predict1b)
plot(pred_rf_crr_predict1b_raster2005)
#differenced raster
diff_crr_predict1b <- pred_rf_crr_predict1b_raster2005-metrics2005_crr
plot(abs(diff_crr_predict1b))
plot(abs(crop(diff_crr_predict1b, roiWI)))#plot WI
plot(abs(crop(diff_crr_predict1b, roiWII)))#plot WII

set.seed(2024)
rf_crr_predict2 <- randomForest(crr ~ 
                                  blue+green+red+nir+swir1+swir2+
                                  NDVI+NBR+brightness+wetness+greenness, 
                                data = predict2_train, importance = TRUE)
rf_crr_predict2

#importance
varImpPlot(rf_crr_predict2, n.var=11)
write.csv(importance(rf_crr_predict2), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict2.csv')

#model validation using 30% of data
valid_rf_crr_predict2 <- predict(rf_crr_predict2, predict2_valid, type = "response")
plot(predict2_valid$crr, valid_rf_crr_predict2)

#make temporal predictions 2005
pred_rf_crr_predict2 <- predict(rf_crr_predict2, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict2)

#predict on raster 2005
pred_rf_crr_predict2_raster2005 <-predict(stackpred2005, rf_crr_predict2)
plot(pred_rf_crr_predict2_raster2005)
#differenced raster
diff_crr_predict2 <- pred_rf_crr_predict2_raster2005-metrics2005_crr
plot(abs(diff_crr_predict2))
plot(abs(crop(diff_crr_predict2, roiWI)))#plot WI
plot(abs(crop(diff_crr_predict2, roiWII)))#plot WII

#make temporal predictions 2012
pred_rf_crr_predict2 <- predict(rf_crr_predict2, sub2012, type = "response")
plot(sub2012$crr, pred_rf_crr_predict2)

#predict on raster 2012
pred_rf_crr_predict2_raster2012 <-predict(stackpred2012, rf_crr_predict2)
plot(pred_rf_crr_predict2_raster2012)
#differenced raster
diff_crr_predict2 <- pred_rf_crr_predict2_raster2012-metrics2012_crr
plot(abs(diff_crr_predict2))
plot(abs(crop(diff_crr_predict2, roiWI)))#plot WI
plot(abs(crop(diff_crr_predict2, roiWII)))#plot WII

#single year to train, check three years to validate, faster than above
set.seed(2024) #2000
rf_crr_predict3a <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2000_train, importance = TRUE)
rf_crr_predict3a

varImpPlot(rf_crr_predict3a, n.var=11)
write.csv(importance(rf_crr_predict3a), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict3a.csv')

pred_rf_crr_predict3a <- predict(rf_crr_predict3a, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict3a)

pred_rf_crr_predict3a <- predict(rf_crr_predict3a, sub2012, type = "response")
plot(sub2012$crr, pred_rf_crr_predict3a)

pred_rf_crr_predict3a <- predict(rf_crr_predict3a, sub2015, type = "response")
plot(sub2015$crr, pred_rf_crr_predict3a)

set.seed(2024) #2005
rf_crr_predict3b <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2005_train, importance = TRUE)
rf_crr_predict3b

varImpPlot(rf_crr_predict3b, n.var=11)
write.csv(importance(rf_crr_predict3b), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict3b.csv')

pred_rf_crr_predict3b <- predict(rf_crr_predict3b, sub2000, type = "response")
plot(sub2000$crr, pred_rf_crr_predict3b)

pred_rf_crr_predict3b <- predict(rf_crr_predict3b, sub2012, type = "response")
plot(sub2012$crr, pred_rf_crr_predict3b)

pred_rf_crr_predict3b <- predict(rf_crr_predict3b, sub2015, type = "response")
plot(sub2015$crr, pred_rf_crr_predict3b)

set.seed(2024) #2012
rf_crr_predict3c <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2012_train, importance = TRUE)
rf_crr_predict3c

varImpPlot(rf_crr_predict3c, n.var=11)
write.csv(importance(rf_crr_predict3c), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict3c.csv')

pred_rf_crr_predict3c <- predict(rf_crr_predict3c, sub2000, type = "response")
plot(sub2000$crr, pred_rf_crr_predict3c)

pred_rf_crr_predict3c <- predict(rf_crr_predict3c, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict3c)

pred_rf_crr_predict3c <- predict(rf_crr_predict3c, sub2015, type = "response")
plot(sub2015$crr, pred_rf_crr_predict3c)

set.seed(2024) #2015
rf_crr_predict3d <- randomForest(crr ~ 
                                   blue+green+red+nir+swir1+swir2+
                                   NDVI+NBR+brightness+wetness+greenness, 
                                 data = sub2015_train, importance = TRUE)
rf_crr_predict3d

varImpPlot(rf_crr_predict3d, n.var=11)
write.csv(importance(rf_crr_predict3d), 'D:/cambs/R_CH3_ALSspec/F2_RF_importance/rf_crr_predict3d.csv')

pred_rf_crr_predict3d <- predict(rf_crr_predict3d, sub2000, type = "response")
plot(sub2000$crr, pred_rf_crr_predict3d)

pred_rf_crr_predict3d <- predict(rf_crr_predict3d, sub2005, type = "response")
plot(sub2005$crr, pred_rf_crr_predict3d)

pred_rf_crr_predict3d <- predict(rf_crr_predict3d, sub2012, type = "response")
plot(sub2012$crr, pred_rf_crr_predict3d)	

#need to do r-squared for allllll scenarios