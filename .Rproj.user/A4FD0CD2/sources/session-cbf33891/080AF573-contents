library(terra)
library(RStoolbox)
library(satellite)
library(landsat)
library(terra)
library(lidR)
library(sf)
library(randomForest)

#RF models for each species: Landsat only, ALS only, fused

####bring in Landsat metrics####
setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/Landsat_metrics/CC/")
temp <- list.files(pattern="\\.csv$")
CC_Landsat <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/Landsat_metrics/CH/")
temp <- list.files(pattern="\\.csv$")
CH_Landsat <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/Landsat_metrics/BT/")
temp <- list.files(pattern="\\.csv$")
BT_Landsat <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/Landsat_metrics/WW/")
temp <- list.files(pattern="\\.csv$")
WW_Landsat <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

####bring in ALS metrics###
setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/ALS_metrics/CC/")
temp <- list.files(pattern="\\.csv$")
CC_ALS <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/ALS_metrics/CH/")
temp <- list.files(pattern="\\.csv$")
CH_ALS <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/ALS_metrics/BT/")
temp <- list.files(pattern="\\.csv$")
BT_ALS <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

setwd("D:/cambs/R_CH3_ALSspec/plotmetrics/ALS_metrics/WW/")
temp <- list.files(pattern="\\.csv$")
WW_ALS <- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))

#write merged metrics
# write.csv(CC_Landsat, file="D:/cambs/R_CH3_ALSspec/plotmetrics/CC_Landsat.csv")
# write.csv(CH_Landsat, file="D:/cambs/R_CH3_ALSspec/plotmetrics/CH_Landsat.csv")
# write.csv(BT_Landsat, file="D:/cambs/R_CH3_ALSspec/plotmetrics/BT_Landsat.csv")
# write.csv(WW_Landsat, file="D:/cambs/R_CH3_ALSspec/plotmetrics/WW_Landsat.csv")
# write.csv(CC_ALS, file="D:/cambs/R_CH3_ALSspec/plotmetrics/CC_ALS.csv")
# write.csv(CH_ALS, file="D:/cambs/R_CH3_ALSspec/plotmetrics/CH_ALS.csv")
# write.csv(BT_ALS, file="D:/cambs/R_CH3_ALSspec/plotmetrics/BT_ALS.csv")
# write.csv(WW_ALS, file="D:/cambs/R_CH3_ALSspec/plotmetrics/WW_ALS.csv")

BT_all<- read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_metrics/BT_merged.csv")
CC_all<- read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_metrics/CC_merged.csv")
CH_all<- read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_metrics/CH_merged.csv")
WW_all<- read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_metrics/WW_merged.csv")

#balance presence and absence - same values in ALL, ALS and Landsat
sum(BT_all$species == "BT_presence", na.rm=T) #429
sum(BT_all$species == "BT_absence", na.rm=T) #790
#need to remove 361 BT absences

sum(CC_all$species == "CC_presence", na.rm=T) #109
sum(CC_all$species == "CC_absence", na.rm=T) #1028
#need to remove 919 CC absences

sum(CH_all$species == "CH_presence", na.rm=T) #416
sum(CH_all$species == "CH_absence", na.rm=T) #776
#need to remove 360 CH absences

sum(WW_all$species == "WW_presence", na.rm=T) #257
sum(WW_all$species == "WW_absence", na.rm=T) #703
#need to remove 446 WW absences

#split presence and absence
BT_all_presence<-BT_all[BT_all$species == "BT_presence",]
BT_all_absence<- BT_all[BT_all$species == "BT_absence",]
CC_all_presence<-CC_all[CC_all$species == "CC_presence",]
CC_all_absence<-CC_all[CC_all$species == "CC_absence",]
CH_all_presence<-CH_all[CH_all$species == "CH_presence",]
CH_all_absence<-CH_all[CH_all$species == "CH_absence", ]
WW_all_presence<-WW_all[WW_all$species == "WW_presence",]
WW_all_absence<-WW_all[WW_all$species == "WW_absence",]

BT_Landsat_presence<-BT_Landsat[BT_Landsat$species == "BT_presence",]
BT_Landsat_absence<- BT_Landsat[BT_Landsat$species == "BT_absence",]
CC_Landsat_presence<-CC_Landsat[CC_Landsat$species == "CC_presence",]
CC_Landsat_absence<-CC_Landsat[CC_Landsat$species == "CC_absence",]
CH_Landsat_presence<-CH_Landsat[CH_Landsat$species == "CH_presence",]
CH_Landsat_absence<-CH_Landsat[CH_Landsat$species == "CH_absence", ]
WW_Landsat_presence<-WW_Landsat[WW_Landsat$species == "WW_presence",]
WW_Landsat_absence<-WW_Landsat[WW_Landsat$species == "WW_absence",]

BT_ALS_presence<-BT_ALS[BT_ALS$species == "BT_presence",]
BT_ALS_absence<- BT_ALS[BT_ALS$species == "BT_absence",]
CC_ALS_presence<-CC_ALS[CC_ALS$species == "CC_presence",]
CC_ALS_absence<-CC_ALS[CC_ALS$species == "CC_absence",]
CH_ALS_presence<-CH_ALS[CH_ALS$species == "CH_presence",]
CH_ALS_absence<-CH_ALS[CH_ALS$species == "CH_absence", ]
WW_ALS_presence<-WW_ALS[WW_ALS$species == "WW_presence",]
WW_ALS_absence<-WW_ALS[WW_ALS$species == "WW_absence",]

#remove to balance

#need to remove 361 BT absences of 790
set.seed(2024); remove_BT_Landsat_absence <- sample(nrow(BT_Landsat_absence), 0.5431 *nrow(BT_Landsat_absence), replace = FALSE)
BT_Landsat_absence <- BT_Landsat_absence[remove_BT_Landsat_absence,]
set.seed(2024); remove_BT_ALS_absence <- sample(nrow(BT_ALS_absence), 0.5431 *nrow(BT_ALS_absence), replace = FALSE)
BT_ALS_absence <- BT_ALS_absence[remove_BT_ALS_absence,]
set.seed(2024); remove_BT_all_absence <- sample(nrow(BT_all_absence), 0.5431 *nrow(BT_all_absence), replace = FALSE)
BT_all_absence <- BT_all_absence[remove_BT_all_absence,]

#need to remove 919 CC absences 
set.seed(2024); remove_CC_Landsat_absence <- sample(nrow(CC_Landsat_absence), 0.1062 *nrow(CC_Landsat_absence), replace = FALSE)
CC_Landsat_absence <- CC_Landsat_absence[remove_CC_Landsat_absence,]
set.seed(2024); remove_CC_ALS_absence <- sample(nrow(CC_ALS_absence), 0.1062 *nrow(CC_ALS_absence), replace = FALSE)
CC_ALS_absence <- CC_ALS_absence[remove_CC_ALS_absence,]
set.seed(2024); remove_CC_all_absence <- sample(nrow(CC_all_absence), 0.1062 *nrow(CC_all_absence), replace = FALSE)
CC_all_absence <- CC_all_absence[remove_CC_all_absence,]

#need to remove 360 CH absences
set.seed(2024); remove_CH_Landsat_absence <- sample(nrow(CH_Landsat_absence), 0.5365 *nrow(CH_Landsat_absence), replace = FALSE)
CH_Landsat_absence <- CH_Landsat_absence[remove_CH_Landsat_absence,]
set.seed(2024); remove_CH_ALS_absence <- sample(nrow(CH_ALS_absence), 0.5365 *nrow(CH_ALS_absence), replace = FALSE)
CH_ALS_absence <- CH_ALS_absence[remove_CH_ALS_absence,]
set.seed(2024); remove_CH_all_absence <- sample(nrow(CH_all_absence), 0.5365 *nrow(CH_all_absence), replace = FALSE)
CH_all_absence <- CH_all_absence[remove_CH_all_absence,]

#need to remove 446 WW absences
set.seed(2024); remove_WW_Landsat_absence <- sample(nrow(WW_Landsat_absence), 0.3657 *nrow(WW_Landsat_absence), replace = FALSE)
WW_Landsat_absence <- WW_Landsat_absence[remove_WW_Landsat_absence,]
set.seed(2024); remove_WW_ALS_absence <- sample(nrow(WW_ALS_absence), 0.3657 *nrow(WW_ALS_absence), replace = FALSE)
WW_ALS_absence <- WW_ALS_absence[remove_WW_ALS_absence,]
set.seed(2024); remove_WW_all_absence <- sample(nrow(WW_all_absence), 0.3657 *nrow(WW_all_absence), replace = FALSE)
WW_all_absence <- WW_all_absence[remove_WW_all_absence,]

#re-merge the balanced datasets
BT_Landsat_balancedlist <- list(BT_Landsat_presence,BT_Landsat_absence)
BT_Landsat_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), BT_Landsat_balancedlist)
BT_Landsat_balanced
BT_ALS_balancedlist <- list(BT_ALS_presence,BT_ALS_absence)
BT_ALS_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), BT_ALS_balancedlist)
BT_ALS_balanced
BT_all_balancedlist <- list(BT_all_presence,BT_all_absence)
BT_all_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), BT_all_balancedlist)
BT_all_balanced

CC_Landsat_balancedlist <- list(CC_Landsat_presence,CC_Landsat_absence)
CC_Landsat_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), CC_Landsat_balancedlist)
CC_Landsat_balanced
CC_ALS_balancedlist <- list(CC_ALS_presence,CC_ALS_absence)
CC_ALS_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), CC_ALS_balancedlist)
CC_ALS_balanced
CC_all_balancedlist <- list(CC_all_presence,CC_all_absence)
CC_all_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), CC_all_balancedlist)
CC_all_balanced

CH_Landsat_balancedlist <- list(CH_Landsat_presence,CH_Landsat_absence)
CH_Landsat_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), CH_Landsat_balancedlist)
CH_Landsat_balanced
CH_ALS_balancedlist <- list(CH_ALS_presence,CH_ALS_absence)
CH_ALS_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), CH_ALS_balancedlist)
CH_ALS_balanced
CH_all_balancedlist <- list(CH_all_presence,CH_all_absence)
CH_all_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), CH_all_balancedlist)
CH_all_balanced

WW_Landsat_balancedlist <- list(WW_Landsat_presence,WW_Landsat_absence)
WW_Landsat_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), WW_Landsat_balancedlist)
WW_Landsat_balanced
WW_ALS_balancedlist <- list(WW_ALS_presence,WW_ALS_absence)
WW_ALS_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), WW_ALS_balancedlist)
WW_ALS_balanced
WW_all_balancedlist <- list(WW_all_presence,WW_all_absence)
WW_all_balanced <-Reduce(function(x,y) merge(x,y, all=TRUE), WW_all_balancedlist)
WW_all_balanced

# #write balanced
# write.csv(BT_Landsat_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ BT_Landsat_balanced.csv")
# write.csv(BT_ALS_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ BT_ALS_balanced.csv")
# write.csv(BT_all_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ BT_all_balanced.csv")
# write.csv(CC_Landsat_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ CC_Landsat_balanced.csv")
# write.csv(CC_ALS_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ CC_ALS_balanced.csv")
# write.csv(CC_all_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ CC_all_balanced.csv")
# write.csv(CH_Landsat_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ CH_Landsat_balanced.csv")
# write.csv(CH_ALS_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ CH_ALS_balanced.csv")
# write.csv(CH_all_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ CH_all_balanced.csv")
# write.csv(WW_Landsat_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ WW_Landsat_balanced.csv")
# write.csv(WW_ALS_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ WW_ALS_balanced.csv")
# write.csv(WW_all_balanced, file="D:/cambs/R_CH3_ALSspec/plotmetrics/ WW_all_balanced.csv")

####read in and start here####

#need to deal with NAs to make this work

BT_Landsat_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/BT_Landsat_balanced.csv")
BT_ALS_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/BT_ALS_balanced.csv")
BT_all_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/BT_all_balanced.csv")
CC_Landsat_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/CC_Landsat_balanced.csv")
CC_ALS_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/CC_ALS_balanced.csv")
CC_all_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/CC_all_balanced.csv")
CH_Landsat_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/CH_Landsat_balanced.csv")
CH_ALS_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/CH_ALS_balanced.csv")
CH_all_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/CH_all_balanced.csv")
WW_Landsat_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/WW_Landsat_balanced.csv")
WW_ALS_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/WW_ALS_balanced.csv")
WW_all_balanced<-read.csv("D:/cambs/R_CH3_ALSspec/plotmetrics/all_balanced_naremoved_metrics/WW_all_balanced.csv")

#make species a factor
BT_Landsat_balanced$species = as.factor(BT_Landsat_balanced$species)
BT_ALS_balanced$species = as.factor(BT_ALS_balanced$species)
BT_all_balanced$species = as.factor(BT_all_balanced$species)
CC_Landsat_balanced$species = as.factor(CC_Landsat_balanced$species)
CC_ALS_balanced$species = as.factor(CC_ALS_balanced$species)
CC_all_balanced$species = as.factor(CC_all_balanced$species)
CH_Landsat_balanced$species = as.factor(CH_Landsat_balanced$species)
CH_ALS_balanced$species = as.factor(CH_ALS_balanced$species)
CH_all_balanced$species = as.factor(CH_all_balanced$species)
WW_Landsat_balanced$species = as.factor(WW_Landsat_balanced$species)
WW_ALS_balanced$species = as.factor(WW_ALS_balanced$species)
WW_all_balanced$species = as.factor(WW_all_balanced$species)

#set up training and validation 70:30
set.seed(2024); BT_Landsat_train <- sample(nrow(BT_Landsat_balanced), 0.7*nrow(BT_Landsat_balanced), replace = FALSE)
BT_Landsat_valid <- BT_Landsat_balanced[-BT_Landsat_train,]
BT_Landsat_train <- BT_Landsat_balanced[BT_Landsat_train,]
set.seed(2024); BT_ALS_train <- sample(nrow(BT_ALS_balanced), 0.7*nrow(BT_ALS_balanced), replace = FALSE)
BT_ALS_valid <- BT_ALS_balanced[-BT_ALS_train,]
BT_ALS_train <- BT_ALS_balanced[BT_ALS_train,]
set.seed(2024); BT_all_train <- sample(nrow(BT_all_balanced), 0.7*nrow(BT_all_balanced), replace = FALSE)
BT_all_valid <- BT_all_balanced[-BT_all_train,]
BT_all_train <- BT_all_balanced[BT_all_train,]

set.seed(2024); CC_Landsat_train <- sample(nrow(CC_Landsat_balanced), 0.7*nrow(CC_Landsat_balanced), replace = FALSE)
CC_Landsat_valid <- CC_Landsat_balanced[-CC_Landsat_train,]
CC_Landsat_train <- CC_Landsat_balanced[CC_Landsat_train,]
set.seed(2024); CC_ALS_train <- sample(nrow(CC_ALS_balanced), 0.7*nrow(CC_ALS_balanced), replace = FALSE)
CC_ALS_valid <- CC_ALS_balanced[-CC_ALS_train,]
CC_ALS_train <- CC_ALS_balanced[CC_ALS_train,]
set.seed(2024); CC_all_train <- sample(nrow(CC_all_balanced), 0.7*nrow(CC_all_balanced), replace = FALSE)
CC_all_valid <- CC_all_balanced[-CC_all_train,]
CC_all_train <- CC_all_balanced[CC_all_train,]

set.seed(2024); CH_Landsat_train <- sample(nrow(CH_Landsat_balanced), 0.7*nrow(CH_Landsat_balanced), replace = FALSE)
CH_Landsat_valid <- CH_Landsat_balanced[-CH_Landsat_train,]
CH_Landsat_train <- CH_Landsat_balanced[CH_Landsat_train,]
set.seed(2024); CH_ALS_train <- sample(nrow(CH_ALS_balanced), 0.7*nrow(CH_ALS_balanced), replace = FALSE)
CH_ALS_valid <- CH_ALS_balanced[-CH_ALS_train,]
CH_ALS_train <- CH_ALS_balanced[CH_ALS_train,]
set.seed(2024); CH_all_train <- sample(nrow(CH_all_balanced), 0.7*nrow(CH_all_balanced), replace = FALSE)
CH_all_valid <- CH_all_balanced[-CH_all_train,]
CH_all_train <- CH_all_balanced[CH_all_train,]

set.seed(2024); WW_Landsat_train <- sample(nrow(WW_Landsat_balanced), 0.7*nrow(WW_Landsat_balanced), replace = FALSE)
WW_Landsat_valid <- WW_Landsat_balanced[-WW_Landsat_train,]
WW_Landsat_train <- WW_Landsat_balanced[WW_Landsat_train,]
set.seed(2024); WW_ALS_train <- sample(nrow(WW_ALS_balanced), 0.7*nrow(WW_ALS_balanced), replace = FALSE)
WW_ALS_valid <- WW_ALS_balanced[-WW_ALS_train,]
WW_ALS_train <- WW_ALS_balanced[WW_ALS_train,]
set.seed(2024); WW_all_train <- sample(nrow(WW_all_balanced), 0.7*nrow(WW_all_balanced), replace = FALSE)
WW_all_valid <- WW_all_balanced[-WW_all_train,]
WW_all_train <- WW_all_balanced[WW_all_train,]

####RF####
####Landsat only####
#BT#
set.seed(2024); rf_BT_Landsat <- randomForest(species ~ 
                                blue+green+red+nir+swir1+swir2+
                                NDVI+NBR+brightness+wetness+greenness, 
                              data = BT_Landsat_train, importance = TRUE)
rf_BT_Landsat

#importance
varImpPlot(rf_BT_Landsat, n.var=11)
write.csv(importance(rf_BT_Landsat), 'D:/cambs/R_CH3_ALSspec/sdm/rf_BT_Landsat_importance.csv')

#model validation using 30% of data
valid_BT_Landsat <- predict(rf_BT_Landsat, BT_Landsat_valid, type = "class")
mean(valid_BT_Landsat == BT_Landsat_valid$species)                    

#CC#
set.seed(2024); rf_CC_Landsat <- randomForest(species ~ 
                                                blue+green+red+nir+swir1+swir2+
                                                NDVI+NBR+brightness+wetness+greenness, 
                                              data = CC_Landsat_train, importance = TRUE)
rf_CC_Landsat

#importance
varImpPlot(rf_CC_Landsat, n.var=11)
write.csv(importance(rf_CC_Landsat), 'D:/cambs/R_CH3_ALSspec/sdm/rf_CC_Landsat_importance.csv')

#model validation using 30% of data
valid_CC_Landsat <- predict(rf_CC_Landsat, CC_Landsat_valid, type = "class")
mean(valid_CC_Landsat == CC_Landsat_valid $species)

#CH#
set.seed(2024); rf_CH_Landsat <- randomForest(species ~ 
                                                blue+green+red+nir+swir1+swir2+
                                                NDVI+NBR+brightness+wetness+greenness, 
                                              data = CH_Landsat_train, importance = TRUE)
rf_CH_Landsat

#importance
varImpPlot(rf_CH_Landsat, n.var=11)
write.csv(importance(rf_CH_Landsat), 'D:/cambs/R_CH3_ALSspec/sdm/rf_CH_Landsat_importance.csv')

#model validation using 30% of data
valid_CH_Landsat <- predict(rf_CH_Landsat, CH_Landsat_valid, type = "class")
mean(valid_CH_Landsat == CH_Landsat_valid $species)

#WW#
set.seed(2024); rf_WW_Landsat <- randomForest(species ~ 
                                                blue+green+red+nir+swir1+swir2+
                                                NDVI+NBR+brightness+wetness+greenness, 
                                              data = WW_Landsat_train, importance = TRUE)
rf_WW_Landsat

#importance
varImpPlot(rf_WW_Landsat, n.var=11)
write.csv(importance(rf_WW_Landsat), 'D:/cambs/R_CH3_ALSspec/sdm/rf_WW_Landsat_importance.csv')

#model validation using 30% of data
valid_WW_Landsat <- predict(rf_WW_Landsat, WW_Landsat_valid, type = "class")
mean(valid_WW_Landsat == WW_Landsat_valid $species)

####ALS only####
#BT#
set.seed(2024); rf_BT_ALS <- randomForest(species ~ 
                                            zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = BT_ALS_train, importance = TRUE, na.action = na.roughfix)
rf_BT_ALS

#importance
varImpPlot(rf_BT_ALS, n.var=7)
write.csv(importance(rf_BT_ALS), 'D:/cambs/R_CH3_ALSspec/sdm/rf_BT_ALS_importance.csv')

#model validation using 30% of data
valid_BT_ALS <- predict(rf_BT_ALS, BT_ALS_valid, type = "class")
mean(valid_BT_ALS == BT_ALS_valid $species)                    

#CC#
set.seed(2024); rf_CC_ALS <- randomForest(species ~ 
                                            zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = CC_ALS_train, importance = TRUE, na.action = na.roughfix)
rf_CC_ALS

#importance
varImpPlot(rf_CC_ALS, n.var=7)
write.csv(importance(rf_CC_ALS), 'D:/cambs/R_CH3_ALSspec/sdm/rf_CC_ALS_importance.csv')

#model validation using 30% of data
valid_CC_ALS <- predict(rf_CC_ALS, CC_ALS_valid, type = "class")
mean(valid_CC_ALS == CC_ALS_valid$ species)

#CH#
set.seed(2024); rf_CH_ALS <- randomForest(species ~ 
                                            zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = CH_ALS_train, importance = TRUE, na.action = na.roughfix)
rf_CH_ALS

#importance
varImpPlot(rf_CH_ALS, n.var=7)
write.csv(importance(rf_CH_ALS), 'D:/cambs/R_CH3_ALSspec/sdm/rf_CH_ALS_importance.csv')

#model validation using 30% of data
valid_CH_ALS <- predict(rf_CH_ALS, CH_ALS_valid, type = "class")
mean(valid_CH_ALS == CH_ALS_valid $species)

#WW#
set.seed(2024); rf_WW_ALS <- randomForest(species ~ 
                                            zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = WW_ALS_train, importance = TRUE, na.action = na.roughfix)
rf_WW_ALS

#importance
varImpPlot(rf_WW_ALS, n.var=7)
write.csv(importance(rf_WW_ALS), 'D:/cambs/R_CH3_ALSspec/sdm/rf_WW_ALS_importance.csv')

#model validation using 30% of data
valid_WW_ALS <- predict(rf_WW_ALS, WW_ALS_valid, type = "class")
mean(valid_WW_ALS == WW_ALS_valid $species)

####fused####
#BT#
set.seed(2024); rf_BT_all <- randomForest(species ~ 
                                            blue+green+red+nir+swir1+swir2+
                                            NDVI+NBR+brightness+wetness+greenness+zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = BT_all_train, importance = TRUE, na.action = na.roughfix)
rf_BT_all

#importance
varImpPlot(rf_BT_all, n.var=18)
write.csv(importance(rf_BT_all), 'D:/cambs/R_CH3_ALSspec/sdm/rf_BT_all_importance.csv')

#model validation using 30% of data
valid_BT_all <- predict(rf_BT_all, BT_all_valid, type = "class")
mean(valid_BT_all == BT_all_valid $species)                    

#CC#
set.seed(2024); rf_CC_all <- randomForest(species ~ 
                                            blue+green+red+nir+swir1+swir2+
                                            NDVI+NBR+brightness+wetness+greenness+zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = CC_all_train, importance = TRUE, na.action = na.roughfix)
rf_CC_all

#importance
varImpPlot(rf_CC_all, n.var=18)
write.csv(importance(rf_CC_all), 'D:/cambs/R_CH3_ALSspec/sdm/rf_CC_all_importance.csv')

#model validation using 30% of data
valid_CC_all <- predict(rf_CC_all, CC_all_valid, type = "class")
mean(valid_CC_all == CC_all_valid $species)                    

#CH#
set.seed(2024); rf_CH_all <- randomForest(species ~ 
                                            blue+green+red+nir+swir1+swir2+
                                            NDVI+NBR+brightness+wetness+greenness+zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = CH_all_train, importance = TRUE, na.action = na.roughfix)
rf_CH_all

#importance
varImpPlot(rf_CH_all, n.var=18)
write.csv(importance(rf_CH_all), 'D:/cambs/R_CH3_ALSspec/sdm/rf_CH_all_importance.csv')

#model validation using 30% of data
valid_CH_all <- predict(rf_CH_all, CH_all_valid, type = "class")
mean(valid_CH_all == CH_all_valid $species)                    

#WW#
set.seed(2024); rf_WW_all <- randomForest(species ~ 
                                            blue+green+red+nir+swir1+swir2+
                                            NDVI+NBR+brightness+wetness+greenness+zmax+zmean+zsd+entropy+fhd+cc+crr, 
                                          data = WW_all_train, importance = TRUE, na.action = na.roughfix)
rf_WW_all

#importance
varImpPlot(rf_WW_all, n.var=18)
write.csv(importance(rf_WW_all), 'D:/cambs/R_CH3_ALSspec/sdm/rf_WW_all_importance.csv')

#model validation using 30% of data
valid_WW_all <- predict(rf_WW_all, WW_all_valid, type = "class")
mean(valid_WW_all == WW_all_valid$species)                    

