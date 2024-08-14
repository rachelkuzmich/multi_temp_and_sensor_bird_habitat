library(dplyr)
library(terra)
library(RStoolbox)
library(satellite)
library(landsat)
library(terra)
library(lidR)
library(sf)
library(randomForest)

#goal is to extract variables at bird sampling plots

####bring in bird presence data (sampling plots)####

#BT
BT_pres_2000_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2000.shp")
BT_pres_2001_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2001.shp")
BT_pres_2002_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2002.shp")

#no data collection in 2000 BT_pres_2000_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2000.shp")
BT_pres_2001_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2001.shp")
BT_pres_2002_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2002.shp")

BT_pres_2005_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2005.shp")
BT_pres_2006_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2006.shp")
BT_pres_2007_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2007.shp")

BT_pres_2005_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2005.shp")
BT_pres_2006_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2006.shp")
BT_pres_2007_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2007.shp")

BT_pres_2012_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2012.shp")
BT_pres_2013_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2013.shp")
BT_pres_2014_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2014.shp")

BT_pres_2012_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2012.shp")
BT_pres_2013_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2013.shp")
BT_pres_2014_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2014.shp")

BT_pres_2015_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2015.shp")
BT_pres_2016_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2016.shp")
BT_pres_2017_WI <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessI/BT2017.shp")

BT_pres_2015_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2015.shp")
BT_pres_2016_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2016.shp")
BT_pres_2017_WII <- st_read("D:/cambs/bird_data/presencepolygons/BT_data/WildernessII/BT2017.shp")

#CC
CC_pres_2000_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2000.shp")
CC_pres_2001_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2001.shp")
CC_pres_2002_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2002.shp")

#no data collection in 2000 CC_pres_2000_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2000.shp")
#not observed CC_pres_2001_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2001.shp")
CC_pres_2002_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2002.shp")

CC_pres_2005_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2005.shp")
CC_pres_2006_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2006.shp")
CC_pres_2007_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2007.shp")

CC_pres_2005_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2005.shp")
CC_pres_2006_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2006.shp")
CC_pres_2007_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2007.shp")

CC_pres_2012_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2012.shp")
CC_pres_2013_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2013.shp")
CC_pres_2014_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2014.shp")

CC_pres_2012_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2012.shp")
CC_pres_2013_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2013.shp")
CC_pres_2014_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2014.shp")

CC_pres_2015_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2015.shp")
CC_pres_2016_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2016.shp")
CC_pres_2017_WI <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessI/CC2017.shp")

CC_pres_2015_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2015.shp")
CC_pres_2016_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2016.shp")
CC_pres_2017_WII <- st_read("D:/cambs/bird_data/presencepolygons/CC_data/WildernessII/CC2017.shp")

#CH
CH_pres_2000_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2000.shp")
CH_pres_2001_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2001.shp")
CH_pres_2002_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2002.shp")

#no data collection in 2000 CH_pres_2000_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2000.shp")
CH_pres_2001_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2001.shp")
CH_pres_2002_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2002.shp")

CH_pres_2005_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2005.shp")
CH_pres_2006_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2006.shp")
CH_pres_2007_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2007.shp")

CH_pres_2005_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2005.shp")
CH_pres_2006_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2006.shp")
CH_pres_2007_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2007.shp")

CH_pres_2012_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2012.shp")
CH_pres_2013_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2013.shp")
CH_pres_2014_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2014.shp")

CH_pres_2012_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2012.shp")
CH_pres_2013_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2013.shp")
CH_pres_2014_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2014.shp")

CH_pres_2015_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2015.shp")
CH_pres_2016_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2016.shp")
CH_pres_2017_WI <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessI/CH2017.shp")

CH_pres_2015_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2015.shp")
CH_pres_2016_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2016.shp")
CH_pres_2017_WII <- st_read("D:/cambs/bird_data/presencepolygons/CH_data/WildernessII/CH2017.shp")

#WW
WW_pres_2000_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2000.shp")
WW_pres_2001_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2001.shp")
WW_pres_2002_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2002.shp")

#no data collection in 2000 WW_pres_2000_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2000.shp")
WW_pres_2001_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2001.shp")
WW_pres_2002_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2002.shp")

WW_pres_2005_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2005.shp")
WW_pres_2006_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2006.shp")
WW_pres_2007_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2007.shp")

WW_pres_2005_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2005.shp")
WW_pres_2006_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2006.shp")
WW_pres_2007_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2007.shp")

#not observed WW_pres_2012_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2012.shp")
WW_pres_2013_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2013.shp")
WW_pres_2014_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2014.shp")

WW_pres_2012_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2012.shp")
WW_pres_2013_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2013.shp")
WW_pres_2014_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2014.shp")

WW_pres_2015_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2015.shp")
#not observed WW_pres_2016_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2016.shp")
#not observed WW_pres_2017_WI <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessI/WW2017.shp")

WW_pres_2015_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2015.shp")
WW_pres_2016_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2016.shp")
WW_pres_2017_WII <- st_read("D:/cambs/bird_data/presencepolygons/WW_data/WildernessII/WW2017.shp")


####bring in bird absence data (sampling plots)####
#BT
BT_abs_2000_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2000.shp")
BT_abs_2001_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2001.shp")
BT_abs_2002_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2002.shp")

#no data collection in 2000 BT_abs_2000_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2000.shp")
BT_abs_2001_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2001.shp")
BT_abs_2002_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2002.shp")

BT_abs_2005_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2005.shp")
BT_abs_2006_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2006.shp")
BT_abs_2007_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2007.shp")

BT_abs_2005_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2005.shp")
BT_abs_2006_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2006.shp")
BT_abs_2007_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2007.shp")

BT_abs_2012_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2012.shp")
BT_abs_2013_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2013.shp")
BT_abs_2014_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2014.shp")

BT_abs_2012_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2012.shp")
BT_abs_2013_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2013.shp")
BT_abs_2014_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2014.shp")

BT_abs_2015_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2015.shp")
BT_abs_2016_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2016.shp")
BT_abs_2017_WI <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessI_2017.shp")

BT_abs_2015_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2015.shp")
BT_abs_2016_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2016.shp")
BT_abs_2017_WII <- st_read("D:/cambs/bird_data/absencepolygons/BT_absences/BT_WildernessII_2017.shp")

#CC
CC_abs_2000_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2000.shp")
CC_abs_2001_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2001.shp")
CC_abs_2002_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2002.shp")

#no data collection in 2000 CC_abs_2000_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2000.shp")
#not observed CC_abs_2001_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2001.shp")
CC_abs_2002_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2002.shp")

CC_abs_2005_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2005.shp")
CC_abs_2006_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2006.shp")
CC_abs_2007_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2007.shp")

CC_abs_2005_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2005.shp")
CC_abs_2006_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2006.shp")
CC_abs_2007_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2007.shp")

CC_abs_2012_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2012.shp")
CC_abs_2013_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2013.shp")
CC_abs_2014_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2014.shp")

CC_abs_2012_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2012.shp")
CC_abs_2013_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2013.shp")
CC_abs_2014_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2014.shp")

CC_abs_2015_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2015.shp")
CC_abs_2016_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2016.shp")
CC_abs_2017_WI <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessI_2017.shp")

CC_abs_2015_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2015.shp")
CC_abs_2016_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2016.shp")
CC_abs_2017_WII <- st_read("D:/cambs/bird_data/absencepolygons/CC_absences/CC_WildernessII_2017.shp")

#CH
CH_abs_2000_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2000.shp")
CH_abs_2001_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2001.shp")
CH_abs_2002_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2002.shp")

#no data collection in 2000 CH_abs_2000_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2000.shp")
CH_abs_2001_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2001.shp")
CH_abs_2002_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2002.shp")

CH_abs_2005_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2005.shp")
CH_abs_2006_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2006.shp")
CH_abs_2007_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2007.shp")

CH_abs_2005_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2005.shp")
CH_abs_2006_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2006.shp")
CH_abs_2007_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2007.shp")

CH_abs_2012_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2012.shp")
CH_abs_2013_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2013.shp")
CH_abs_2014_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2014.shp")

CH_abs_2012_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2012.shp")
CH_abs_2013_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2013.shp")
CH_abs_2014_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2014.shp")

CH_abs_2015_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2015.shp")
CH_abs_2016_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2016.shp")
CH_abs_2017_WI <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessI_2017.shp")

CH_abs_2015_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2015.shp")
CH_abs_2016_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2016.shp")
CH_abs_2017_WII <- st_read("D:/cambs/bird_data/absencepolygons/CH_absences/CH_WildernessII_2017.shp")

#WW
WW_abs_2000_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2000.shp")
WW_abs_2001_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2001.shp")
WW_abs_2002_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2002.shp")

#no data collection in 2000 WW_abs_2000_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2000.shp")
WW_abs_2001_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2001.shp")
WW_abs_2002_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2002.shp")

WW_abs_2005_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2005.shp")
WW_abs_2006_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2006.shp")
WW_abs_2007_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2007.shp")

WW_abs_2005_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2005.shp")
WW_abs_2006_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2006.shp")
WW_abs_2007_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2007.shp")

#not observed WW_abs_2012_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2012.shp")
WW_abs_2013_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2013.shp")
WW_abs_2014_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2014.shp")

WW_abs_2012_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2012.shp")
WW_abs_2013_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2013.shp")
WW_abs_2014_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2014.shp")

WW_abs_2015_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2015.shp")
#not observed WW_abs_2016_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2016.shp")
#not observed WW_abs_2017_WI <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessI_2017.shp")

WW_abs_2015_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2015.shp")
WW_abs_2016_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2016.shp")
WW_abs_2017_WII <- st_read("D:/cambs/bird_data/absencepolygons/WW_absences/WW_WildernessII_2017.shp")

#absence data does not have a CRS, need to assign it
#BT
BT_abs_2000_WI  <- BT_abs_2000_WI %>% st_set_crs(27700)
BT_abs_2001_WI  <- BT_abs_2001_WI %>% st_set_crs(27700)
BT_abs_2002_WI  <- BT_abs_2002_WI %>% st_set_crs(27700)

#no data BT_abs_2000_WII  <- BT_abs_2000_WII %>% st_set_crs(27700)
BT_abs_2001_WII  <- BT_abs_2001_WII %>% st_set_crs(27700)
BT_abs_2002_WII  <- BT_abs_2002_WII %>% st_set_crs(27700)

BT_abs_2005_WI  <- BT_abs_2005_WI %>% st_set_crs(27700)
BT_abs_2006_WI  <- BT_abs_2006_WI %>% st_set_crs(27700)
BT_abs_2007_WI  <- BT_abs_2007_WI %>% st_set_crs(27700)

BT_abs_2005_WII  <- BT_abs_2005_WII %>% st_set_crs(27700)
BT_abs_2006_WII  <- BT_abs_2006_WII %>% st_set_crs(27700)
BT_abs_2007_WII  <- BT_abs_2007_WII %>% st_set_crs(27700)

BT_abs_2012_WI  <- BT_abs_2012_WI %>% st_set_crs(27700)
BT_abs_2013_WI  <- BT_abs_2013_WI %>% st_set_crs(27700)
BT_abs_2014_WI  <- BT_abs_2014_WI %>% st_set_crs(27700)

BT_abs_2012_WII  <- BT_abs_2012_WII %>% st_set_crs(27700)
BT_abs_2013_WII  <- BT_abs_2013_WII %>% st_set_crs(27700)
BT_abs_2014_WII  <- BT_abs_2014_WII %>% st_set_crs(27700)

BT_abs_2015_WI  <- BT_abs_2015_WI %>% st_set_crs(27700)
BT_abs_2016_WI  <- BT_abs_2016_WI %>% st_set_crs(27700)
BT_abs_2017_WI  <- BT_abs_2017_WI %>% st_set_crs(27700)

BT_abs_2015_WII  <- BT_abs_2015_WII %>% st_set_crs(27700)
BT_abs_2016_WII  <- BT_abs_2016_WII %>% st_set_crs(27700)
BT_abs_2017_WII  <- BT_abs_2017_WII %>% st_set_crs(27700)

#CC
CC_abs_2000_WI  <- CC_abs_2000_WI %>% st_set_crs(27700)
CC_abs_2001_WI  <- CC_abs_2001_WI %>% st_set_crs(27700)
CC_abs_2002_WI  <- CC_abs_2002_WI %>% st_set_crs(27700)

#no data CC_abs_2000_WII  <- CC_abs_2000_WII %>% st_set_crs(27700)
#not observed CC_abs_2001_WII  <- CC_abs_2001_WII %>% st_set_crs(27700)
CC_abs_2002_WII  <- CC_abs_2002_WII %>% st_set_crs(27700)

CC_abs_2005_WI  <- CC_abs_2005_WI %>% st_set_crs(27700)
CC_abs_2006_WI  <- CC_abs_2006_WI %>% st_set_crs(27700)
CC_abs_2007_WI  <- CC_abs_2007_WI %>% st_set_crs(27700)

CC_abs_2005_WII  <- CC_abs_2005_WII %>% st_set_crs(27700)
CC_abs_2006_WII  <- CC_abs_2006_WII %>% st_set_crs(27700)
CC_abs_2007_WII  <- CC_abs_2007_WII %>% st_set_crs(27700)

CC_abs_2012_WI  <- CC_abs_2012_WI %>% st_set_crs(27700)
CC_abs_2013_WI  <- CC_abs_2013_WI %>% st_set_crs(27700)
CC_abs_2014_WI  <- CC_abs_2014_WI %>% st_set_crs(27700)

CC_abs_2012_WII  <- CC_abs_2012_WII %>% st_set_crs(27700)
CC_abs_2013_WII  <- CC_abs_2013_WII %>% st_set_crs(27700)
CC_abs_2014_WII  <- CC_abs_2014_WII %>% st_set_crs(27700)

CC_abs_2015_WI  <- CC_abs_2015_WI %>% st_set_crs(27700)
CC_abs_2016_WI  <- CC_abs_2016_WI %>% st_set_crs(27700)
CC_abs_2017_WI  <- CC_abs_2017_WI %>% st_set_crs(27700)

CC_abs_2015_WII  <- CC_abs_2015_WII %>% st_set_crs(27700)
CC_abs_2016_WII  <- CC_abs_2016_WII %>% st_set_crs(27700)
CC_abs_2017_WII  <- CC_abs_2017_WII %>% st_set_crs(27700)

#CH
CH_abs_2000_WI  <- CH_abs_2000_WI %>% st_set_crs(27700)
CH_abs_2001_WI  <- CH_abs_2001_WI %>% st_set_crs(27700)
CH_abs_2002_WI  <- CH_abs_2002_WI %>% st_set_crs(27700)

#no data CH_abs_2000_WII  <- CH_abs_2000_WII %>% st_set_crs(27700)
CH_abs_2001_WII  <- CH_abs_2001_WII %>% st_set_crs(27700)
CH_abs_2002_WII  <- CH_abs_2002_WII %>% st_set_crs(27700)

CH_abs_2005_WI  <- CH_abs_2005_WI %>% st_set_crs(27700)
CH_abs_2006_WI  <- CH_abs_2006_WI %>% st_set_crs(27700)
CH_abs_2007_WI  <- CH_abs_2007_WI %>% st_set_crs(27700)

CH_abs_2005_WII  <- CH_abs_2005_WII %>% st_set_crs(27700)
CH_abs_2006_WII  <- CH_abs_2006_WII %>% st_set_crs(27700)
CH_abs_2007_WII  <- CH_abs_2007_WII %>% st_set_crs(27700)

CH_abs_2012_WI  <- CH_abs_2012_WI %>% st_set_crs(27700)
CH_abs_2013_WI  <- CH_abs_2013_WI %>% st_set_crs(27700)
CH_abs_2014_WI  <- CH_abs_2014_WI %>% st_set_crs(27700)

CH_abs_2012_WII  <- CH_abs_2012_WII %>% st_set_crs(27700)
CH_abs_2013_WII  <- CH_abs_2013_WII %>% st_set_crs(27700)
CH_abs_2014_WII  <- CH_abs_2014_WII %>% st_set_crs(27700)

CH_abs_2015_WI  <- CH_abs_2015_WI %>% st_set_crs(27700)
CH_abs_2016_WI  <- CH_abs_2016_WI %>% st_set_crs(27700)
CH_abs_2017_WI  <- CH_abs_2017_WI %>% st_set_crs(27700)

CH_abs_2015_WII  <- CH_abs_2015_WII %>% st_set_crs(27700)
CH_abs_2016_WII  <- CH_abs_2016_WII %>% st_set_crs(27700)
CH_abs_2017_WII  <- CH_abs_2017_WII %>% st_set_crs(27700)

#WW
WW_abs_2000_WI  <- WW_abs_2000_WI %>% st_set_crs(27700)
WW_abs_2001_WI  <- WW_abs_2001_WI %>% st_set_crs(27700)
WW_abs_2002_WI  <- WW_abs_2002_WI %>% st_set_crs(27700)

#no data WW_abs_2000_WII  <- WW_abs_2000_WII %>% st_set_crs(27700)
WW_abs_2001_WII  <- WW_abs_2001_WII %>% st_set_crs(27700)
WW_abs_2002_WII  <- WW_abs_2002_WII %>% st_set_crs(27700)

WW_abs_2005_WI  <- WW_abs_2005_WI %>% st_set_crs(27700)
WW_abs_2006_WI  <- WW_abs_2006_WI %>% st_set_crs(27700)
WW_abs_2007_WI  <- WW_abs_2007_WI %>% st_set_crs(27700)

WW_abs_2005_WII  <- WW_abs_2005_WII %>% st_set_crs(27700)
WW_abs_2006_WII  <- WW_abs_2006_WII %>% st_set_crs(27700)
WW_abs_2007_WII  <- WW_abs_2007_WII %>% st_set_crs(27700)

#not observed WW_abs_2012_WI  <- WW_abs_2012_WI %>% st_set_crs(27700)
WW_abs_2013_WI  <- WW_abs_2013_WI %>% st_set_crs(27700)
WW_abs_2014_WI  <- WW_abs_2014_WI %>% st_set_crs(27700)

WW_abs_2012_WII  <- WW_abs_2012_WII %>% st_set_crs(27700)
WW_abs_2013_WII  <- WW_abs_2013_WII %>% st_set_crs(27700)
WW_abs_2014_WII  <- WW_abs_2014_WII %>% st_set_crs(27700)

WW_abs_2015_WI  <- WW_abs_2015_WI %>% st_set_crs(27700)
#not observed WW_abs_2016_WI  <- WW_abs_2016_WI %>% st_set_crs(27700)
#not observed WW_abs_2017_WI  <- WW_abs_2017_WI %>% st_set_crs(27700)

WW_abs_2015_WII  <- WW_abs_2015_WII %>% st_set_crs(27700)
WW_abs_2016_WII  <- WW_abs_2016_WII %>% st_set_crs(27700)
WW_abs_2017_WII  <- WW_abs_2017_WII %>% st_set_crs(27700)

####bring in ALS data####
normALS2000<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2000.las")
normALS2005<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2005.las")
normALS2012<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2012.las")
normALS2015<-readLAS("D:/cambs/R_CH3_ALSspec/ALS_norm_woods/norm_ALS2015.las")

#plot and check
plot(normALS2000, color = "Z", bg = "white", axis = TRUE, legend = TRUE)
plot(normALS2005, color = "Z", bg = "white", axis = TRUE, legend = TRUE)
plot(normALS2012, color = "Z", bg = "white", axis = TRUE, legend = TRUE)
plot(normALS2015, color = "Z", bg = "white", axis = TRUE, legend = TRUE) #still some spikes

las_check(normALS2000)
las_check(normALS2005)
las_check(normALS2012)
las_check(normALS2015)

####extract from ALS####
#https://github.com/atkinsjeff/lidar_scaling_analysis/blob/main/R/02_lidar_processing_script.R

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

#calculate metrics as a data frame

####PRESENCE####
#####Wilderness I####
####BT####

#BT presence data from 2000 at Wilderness I with 2000 LAS
BTpres2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_pres_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2000_WI_ALS2000<-BTpres2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2000_WI_ALS2000<-BTpres2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTpres2000_WI_ALS2000<-BTpres2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
BTpres2000_WI_ALS2000<-BTpres2000_WI_ALS2000 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2000_WI_ALS2000<-BTpres2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2000_WI_ALS2000<-select(BTpres2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2000_WI_ALS2000.csv")

#BT presence data from 2001 at Wilderness I with 2000 LAS
BTpres2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_pres_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2001_WI_ALS2000<-BTpres2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2001_WI_ALS2000<-BTpres2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTpres2001_WI_ALS2000<-BTpres2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
BTpres2001_WI_ALS2000<-BTpres2001_WI_ALS2000 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2001_WI_ALS2000<-BTpres2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2001_WI_ALS2000<-select(BTpres2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2001_WI_ALS2000.csv")

#BT presence data from 2002 at Wilderness I with 2000 LAS
BTpres2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_pres_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2002_WI_ALS2000<-BTpres2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2002_WI_ALS2000<-BTpres2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTpres2002_WI_ALS2000<-BTpres2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
BTpres2002_WI_ALS2000<-BTpres2002_WI_ALS2000 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2002_WI_ALS2000<-BTpres2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2002_WI_ALS2000<-select(BTpres2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2002_WI_ALS2000.csv")

#BT presence data from 2005 at Wilderness I with 2005 LAS
BTpres2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_pres_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2005_WI_ALS2005<-BTpres2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2005_WI_ALS2005<-BTpres2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTpres2005_WI_ALS2005<-BTpres2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
BTpres2005_WI_ALS2005<-BTpres2005_WI_ALS2005 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2005_WI_ALS2005<-BTpres2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2005_WI_ALS2005<-select(BTpres2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2005_WI_ALS2005.csv")

#BT presence data from 2006 at Wilderness I with 2005 LAS
BTpres2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_pres_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2006_WI_ALS2005<-BTpres2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2006_WI_ALS2005<-BTpres2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTpres2006_WI_ALS2005<-BTpres2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
BTpres2006_WI_ALS2005<-BTpres2006_WI_ALS2005 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2006_WI_ALS2005<-BTpres2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2006_WI_ALS2005<-select(BTpres2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2006_WI_ALS2005.csv")

#BT presence data from 2007 at Wilderness I with 2005 LAS
BTpres2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_pres_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2007_WI_ALS2005<-BTpres2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2007_WI_ALS2005<-BTpres2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTpres2007_WI_ALS2005<-BTpres2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
BTpres2007_WI_ALS2005<-BTpres2007_WI_ALS2005 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2007_WI_ALS2005<-BTpres2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2007_WI_ALS2005<-select(BTpres2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2007_WI_ALS2005.csv")

#BT presence data from 2012 at Wilderness I with 2012 LAS
BTpres2012_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_pres_2012_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2012_WI_ALS2012<-BTpres2012_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2012_WI_ALS2012<-BTpres2012_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTpres2012_WI_ALS2012<-BTpres2012_WI_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
BTpres2012_WI_ALS2012<-BTpres2012_WI_ALS2012 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2012_WI_ALS2012<-BTpres2012_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2012_WI_ALS2012<-select(BTpres2012_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2012_WI_ALS2012.csv")

#BT presence data from 2013 at Wilderness I with 2012 LAS
BTpres2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_pres_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2013_WI_ALS2012<-BTpres2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2013_WI_ALS2012<-BTpres2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTpres2013_WI_ALS2012<-BTpres2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
BTpres2013_WI_ALS2012<-BTpres2013_WI_ALS2012 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2013_WI_ALS2012<-BTpres2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2013_WI_ALS2012<-select(BTpres2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2013_WI_ALS2012.csv")

#BT presence data from 2014 at Wilderness I with 2012 LAS
BTpres2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_pres_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2014_WI_ALS2012<-BTpres2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2014_WI_ALS2012<-BTpres2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTpres2014_WI_ALS2012<-BTpres2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
BTpres2014_WI_ALS2012<-BTpres2014_WI_ALS2012 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2014_WI_ALS2012<-BTpres2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2014_WI_ALS2012<-select(BTpres2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2014_WI_ALS2012.csv")

#BT presence data from 2015 at Wilderness I with 2015 LAS
BTpres2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_pres_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2015_WI_ALS2015<-BTpres2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2015_WI_ALS2015<-BTpres2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTpres2015_WI_ALS2015<-BTpres2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
BTpres2015_WI_ALS2015<-BTpres2015_WI_ALS2015 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2015_WI_ALS2015<-BTpres2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2015_WI_ALS2015<-select(BTpres2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2015_WI_ALS2015.csv")

#BT presence data from 2016 at Wilderness I with 2015 LAS
BTpres2016_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_pres_2016_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2016_WI_ALS2015<-BTpres2016_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2016_WI_ALS2015<-BTpres2016_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTpres2016_WI_ALS2015<-BTpres2016_WI_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
BTpres2016_WI_ALS2015<-BTpres2016_WI_ALS2015 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2016_WI_ALS2015<-BTpres2016_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2016_WI_ALS2015<-select(BTpres2016_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2016_WI_ALS2015.csv")

#BT presence data from 2017 at Wilderness I with 2015 LAS
BTpres2017_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_pres_2017_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2017_WI_ALS2015<-BTpres2017_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTpres2017_WI_ALS2015<-BTpres2017_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTpres2017_WI_ALS2015<-BTpres2017_WI_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
BTpres2017_WI_ALS2015<-BTpres2017_WI_ALS2015 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2017_WI_ALS2015<-BTpres2017_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2017_WI_ALS2015<-select(BTpres2017_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2017_WI_ALS2015.csv")

####CC####

#CC presence data from 2000 at Wilderness I with 2000 LAS
CCpres2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_pres_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2000_WI_ALS2000<-CCpres2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2000_WI_ALS2000<-CCpres2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCpres2000_WI_ALS2000<-CCpres2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
CCpres2000_WI_ALS2000<-CCpres2000_WI_ALS2000 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2000_WI_ALS2000<-CCpres2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2000_WI_ALS2000<-select(CCpres2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2000_WI_ALS2000.csv")

#CC presence data from 2001 at Wilderness I with 2000 LAS
CCpres2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_pres_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2001_WI_ALS2000<-CCpres2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2001_WI_ALS2000<-CCpres2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCpres2001_WI_ALS2000<-CCpres2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
CCpres2001_WI_ALS2000<-CCpres2001_WI_ALS2000 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2001_WI_ALS2000<-CCpres2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2001_WI_ALS2000<-select(CCpres2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2001_WI_ALS2000.csv")

#CC presence data from 2002 at Wilderness I with 2000 LAS
CCpres2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_pres_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2002_WI_ALS2000<-CCpres2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2002_WI_ALS2000<-CCpres2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCpres2002_WI_ALS2000<-CCpres2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CCpres2002_WI_ALS2000<-CCpres2002_WI_ALS2000 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2002_WI_ALS2000<-CCpres2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2002_WI_ALS2000<-select(CCpres2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2002_WI_ALS2000.csv")

#CC presence data from 2005 at Wilderness I with 2005 LAS
CCpres2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_pres_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2005_WI_ALS2005<-CCpres2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2005_WI_ALS2005<-CCpres2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCpres2005_WI_ALS2005<-CCpres2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CCpres2005_WI_ALS2005<-CCpres2005_WI_ALS2005 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2005_WI_ALS2005<-CCpres2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2005_WI_ALS2005<-select(CCpres2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2005_WI_ALS2005.csv")

#CC presence data from 2006 at Wilderness I with 2005 LAS
CCpres2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_pres_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2006_WI_ALS2005<-CCpres2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2006_WI_ALS2005<-CCpres2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCpres2006_WI_ALS2005<-CCpres2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CCpres2006_WI_ALS2005<-CCpres2006_WI_ALS2005 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2006_WI_ALS2005<-CCpres2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2006_WI_ALS2005<-select(CCpres2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2006_WI_ALS2005.csv")

#CC presence data from 2007 at Wilderness I with 2005 LAS
CCpres2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_pres_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2007_WI_ALS2005<-CCpres2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2007_WI_ALS2005<-CCpres2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCpres2007_WI_ALS2005<-CCpres2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CCpres2007_WI_ALS2005<-CCpres2007_WI_ALS2005 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2007_WI_ALS2005<-CCpres2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2007_WI_ALS2005<-select(CCpres2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2007_WI_ALS2005.csv")

#CC presence data from 2012 at Wilderness I with 2012 LAS
CCpres2012_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_pres_2012_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2012_WI_ALS2012<-CCpres2012_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2012_WI_ALS2012<-CCpres2012_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCpres2012_WI_ALS2012<-CCpres2012_WI_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CCpres2012_WI_ALS2012<-CCpres2012_WI_ALS2012 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2012_WI_ALS2012<-CCpres2012_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2012_WI_ALS2012<-select(CCpres2012_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2012_WI_ALS2012.csv")

#CC presence data from 2013 at Wilderness I with 2012 LAS
CCpres2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_pres_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2013_WI_ALS2012<-CCpres2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2013_WI_ALS2012<-CCpres2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCpres2013_WI_ALS2012<-CCpres2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CCpres2013_WI_ALS2012<-CCpres2013_WI_ALS2012 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2013_WI_ALS2012<-CCpres2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2013_WI_ALS2012<-select(CCpres2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2013_WI_ALS2012.csv")

#CC presence data from 2014 at Wilderness I with 2012 LAS
CCpres2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_pres_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2014_WI_ALS2012<-CCpres2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2014_WI_ALS2012<-CCpres2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCpres2014_WI_ALS2012<-CCpres2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CCpres2014_WI_ALS2012<-CCpres2014_WI_ALS2012 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2014_WI_ALS2012<-CCpres2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2014_WI_ALS2012<-select(CCpres2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2014_WI_ALS2012.csv")

#CC presence data from 2015 at Wilderness I with 2015 LAS
CCpres2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_pres_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2015_WI_ALS2015<-CCpres2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2015_WI_ALS2015<-CCpres2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCpres2015_WI_ALS2015<-CCpres2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CCpres2015_WI_ALS2015<-CCpres2015_WI_ALS2015 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2015_WI_ALS2015<-CCpres2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2015_WI_ALS2015<-select(CCpres2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2015_WI_ALS2015.csv")

#CC presence data from 2016 at Wilderness I with 2015 LAS
CCpres2016_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_pres_2016_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2016_WI_ALS2015<-CCpres2016_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2016_WI_ALS2015<-CCpres2016_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCpres2016_WI_ALS2015<-CCpres2016_WI_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CCpres2016_WI_ALS2015<-CCpres2016_WI_ALS2015 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2016_WI_ALS2015<-CCpres2016_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2016_WI_ALS2015<-select(CCpres2016_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2016_WI_ALS2015.csv")

#CC presence data from 2017 at Wilderness I with 2015 LAS
CCpres2017_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_pres_2017_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2017_WI_ALS2015<-CCpres2017_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCpres2017_WI_ALS2015<-CCpres2017_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCpres2017_WI_ALS2015<-CCpres2017_WI_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CCpres2017_WI_ALS2015<-CCpres2017_WI_ALS2015 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2017_WI_ALS2015<-CCpres2017_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2017_WI_ALS2015<-select(CCpres2017_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2017_WI_ALS2015.csv")

####CH####

#CH presence data from 2000 at Wilderness I with 2000 LAS
CHpres2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_pres_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2000_WI_ALS2000<-CHpres2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2000_WI_ALS2000<-CHpres2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHpres2000_WI_ALS2000<-CHpres2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
CHpres2000_WI_ALS2000<-CHpres2000_WI_ALS2000 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2000_WI_ALS2000<-CHpres2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2000_WI_ALS2000<-select(CHpres2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2000_WI_ALS2000.csv")

#CH presence data from 2001 at Wilderness I with 2000 LAS
CHpres2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_pres_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2001_WI_ALS2000<-CHpres2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2001_WI_ALS2000<-CHpres2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHpres2001_WI_ALS2000<-CHpres2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
CHpres2001_WI_ALS2000<-CHpres2001_WI_ALS2000 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2001_WI_ALS2000<-CHpres2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2001_WI_ALS2000<-select(CHpres2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2001_WI_ALS2000.csv")

#CH presence data from 2002 at Wilderness I with 2000 LAS
CHpres2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_pres_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2002_WI_ALS2000<-CHpres2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2002_WI_ALS2000<-CHpres2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHpres2002_WI_ALS2000<-CHpres2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CHpres2002_WI_ALS2000<-CHpres2002_WI_ALS2000 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2002_WI_ALS2000<-CHpres2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2002_WI_ALS2000<-select(CHpres2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2002_WI_ALS2000.csv")

#CH presence data from 2005 at Wilderness I with 2005 LAS
CHpres2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_pres_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2005_WI_ALS2005<-CHpres2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2005_WI_ALS2005<-CHpres2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHpres2005_WI_ALS2005<-CHpres2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CHpres2005_WI_ALS2005<-CHpres2005_WI_ALS2005 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2005_WI_ALS2005<-CHpres2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2005_WI_ALS2005<-select(CHpres2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2005_WI_ALS2005.csv")

#CH presence data from 2006 at Wilderness I with 2005 LAS
CHpres2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_pres_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2006_WI_ALS2005<-CHpres2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2006_WI_ALS2005<-CHpres2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHpres2006_WI_ALS2005<-CHpres2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CHpres2006_WI_ALS2005<-CHpres2006_WI_ALS2005 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2006_WI_ALS2005<-CHpres2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2006_WI_ALS2005<-select(CHpres2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2006_WI_ALS2005.csv")

#CH presence data from 2007 at Wilderness I with 2005 LAS
CHpres2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_pres_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2007_WI_ALS2005<-CHpres2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2007_WI_ALS2005<-CHpres2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHpres2007_WI_ALS2005<-CHpres2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CHpres2007_WI_ALS2005<-CHpres2007_WI_ALS2005 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2007_WI_ALS2005<-CHpres2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2007_WI_ALS2005<-select(CHpres2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2007_WI_ALS2005.csv")

#CH presence data from 2012 at Wilderness I with 2012 LAS
CHpres2012_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_pres_2012_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2012_WI_ALS2012<-CHpres2012_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2012_WI_ALS2012<-CHpres2012_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHpres2012_WI_ALS2012<-CHpres2012_WI_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CHpres2012_WI_ALS2012<-CHpres2012_WI_ALS2012 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2012_WI_ALS2012<-CHpres2012_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2012_WI_ALS2012<-select(CHpres2012_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2012_WI_ALS2012.csv")

#CH presence data from 2013 at Wilderness I with 2012 LAS
CHpres2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_pres_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2013_WI_ALS2012<-CHpres2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2013_WI_ALS2012<-CHpres2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHpres2013_WI_ALS2012<-CHpres2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CHpres2013_WI_ALS2012<-CHpres2013_WI_ALS2012 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2013_WI_ALS2012<-CHpres2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2013_WI_ALS2012<-select(CHpres2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2013_WI_ALS2012.csv")

#CH presence data from 2014 at Wilderness I with 2012 LAS
CHpres2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_pres_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2014_WI_ALS2012<-CHpres2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2014_WI_ALS2012<-CHpres2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHpres2014_WI_ALS2012<-CHpres2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CHpres2014_WI_ALS2012<-CHpres2014_WI_ALS2012 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2014_WI_ALS2012<-CHpres2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2014_WI_ALS2012<-select(CHpres2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2014_WI_ALS2012.csv")

#CH presence data from 2015 at Wilderness I with 2015 LAS
CHpres2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_pres_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2015_WI_ALS2015<-CHpres2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2015_WI_ALS2015<-CHpres2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHpres2015_WI_ALS2015<-CHpres2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CHpres2015_WI_ALS2015<-CHpres2015_WI_ALS2015 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2015_WI_ALS2015<-CHpres2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2015_WI_ALS2015<-select(CHpres2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2015_WI_ALS2015.csv")

#CH presence data from 2016 at Wilderness I with 2015 LAS
CHpres2016_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_pres_2016_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2016_WI_ALS2015<-CHpres2016_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2016_WI_ALS2015<-CHpres2016_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHpres2016_WI_ALS2015<-CHpres2016_WI_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CHpres2016_WI_ALS2015<-CHpres2016_WI_ALS2015 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2016_WI_ALS2015<-CHpres2016_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2016_WI_ALS2015<-select(CHpres2016_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2016_WI_ALS2015.csv")

#CH presence data from 2017 at Wilderness I with 2015 LAS
CHpres2017_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_pres_2017_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2017_WI_ALS2015<-CHpres2017_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHpres2017_WI_ALS2015<-CHpres2017_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHpres2017_WI_ALS2015<-CHpres2017_WI_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CHpres2017_WI_ALS2015<-CHpres2017_WI_ALS2015 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2017_WI_ALS2015<-CHpres2017_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2017_WI_ALS2015<-select(CHpres2017_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2017_WI_ALS2015.csv")

####WW####

#WW presence data from 2000 at Wilderness I with 2000 LAS
WWpres2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_pres_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2000_WI_ALS2000<-WWpres2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2000_WI_ALS2000<-WWpres2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWpres2000_WI_ALS2000<-WWpres2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
WWpres2000_WI_ALS2000<-WWpres2000_WI_ALS2000 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2000_WI_ALS2000<-WWpres2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2000_WI_ALS2000<-select(WWpres2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2000_WI_ALS2000.csv")

#WW presence data from 2001 at Wilderness I with 2000 LAS
WWpres2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_pres_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2001_WI_ALS2000<-WWpres2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2001_WI_ALS2000<-WWpres2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWpres2001_WI_ALS2000<-WWpres2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
WWpres2001_WI_ALS2000<-WWpres2001_WI_ALS2000 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2001_WI_ALS2000<-WWpres2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2001_WI_ALS2000<-select(WWpres2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2001_WI_ALS2000.csv")

#WW presence data from 2002 at Wilderness I with 2000 LAS
WWpres2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_pres_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2002_WI_ALS2000<-WWpres2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2002_WI_ALS2000<-WWpres2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWpres2002_WI_ALS2000<-WWpres2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
WWpres2002_WI_ALS2000<-WWpres2002_WI_ALS2000 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2002_WI_ALS2000<-WWpres2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2002_WI_ALS2000<-select(WWpres2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2002_WI_ALS2000.csv")

#WW presence data from 2005 at Wilderness I with 2005 LAS
WWpres2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_pres_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2005_WI_ALS2005<-WWpres2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2005_WI_ALS2005<-WWpres2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWpres2005_WI_ALS2005<-WWpres2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
WWpres2005_WI_ALS2005<-WWpres2005_WI_ALS2005 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2005_WI_ALS2005<-WWpres2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2005_WI_ALS2005<-select(WWpres2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2005_WI_ALS2005.csv")

#WW presence data from 2006 at Wilderness I with 2005 LAS
WWpres2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_pres_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2006_WI_ALS2005<-WWpres2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2006_WI_ALS2005<-WWpres2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWpres2006_WI_ALS2005<-WWpres2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
WWpres2006_WI_ALS2005<-WWpres2006_WI_ALS2005 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2006_WI_ALS2005<-WWpres2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2006_WI_ALS2005<-select(WWpres2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2006_WI_ALS2005.csv")

#WW presence data from 2007 at Wilderness I with 2005 LAS
WWpres2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_pres_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2007_WI_ALS2005<-WWpres2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2007_WI_ALS2005<-WWpres2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWpres2007_WI_ALS2005<-WWpres2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
WWpres2007_WI_ALS2005<-WWpres2007_WI_ALS2005 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2007_WI_ALS2005<-WWpres2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2007_WI_ALS2005<-select(WWpres2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2007_WI_ALS2005.csv")

#WW presence data from 2012 at Wilderness I with 2012 LAS
#no data 
# WWpres2012_WI_ALS2012 <- 
# as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_pres_2012_WI))
# #add four columns: site, ALS year, bird survey year, bird species
# WWpres2012_WI_ALS2012<-WWpres2012_WI_ALS2012 %>%
# mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
# WWpres2012_WI_ALS2012<-WWpres2012_WI_ALS2012 %>%
# mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
# WWpres2012_WI_ALS2012<-WWpres2012_WI_ALS2012 %>%
# mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
# WWpres2012_WI_ALS2012<-WWpres2012_WI_ALS2012 %>%
# mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
# WWpres2012_WI_ALS2012<-WWpres2012_WI_ALS2012 %>% 
# mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWpres2012_WI_ALS2012<-select(WWpres2012_WI_ALS2012, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWpres2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2012_WI_ALS2012.csv")

#WW presence data from 2013 at Wilderness I with 2012 LAS
WWpres2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_pres_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2013_WI_ALS2012<-WWpres2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2013_WI_ALS2012<-WWpres2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWpres2013_WI_ALS2012<-WWpres2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
WWpres2013_WI_ALS2012<-WWpres2013_WI_ALS2012 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2013_WI_ALS2012<-WWpres2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2013_WI_ALS2012<-select(WWpres2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2013_WI_ALS2012.csv")

#WW presence data from 2014 at Wilderness I with 2012 LAS
WWpres2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_pres_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2014_WI_ALS2012<-WWpres2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2014_WI_ALS2012<-WWpres2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWpres2014_WI_ALS2012<-WWpres2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
WWpres2014_WI_ALS2012<-WWpres2014_WI_ALS2012 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2014_WI_ALS2012<-WWpres2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2014_WI_ALS2012<-select(WWpres2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2014_WI_ALS2012.csv")

#WW presence data from 2015 at Wilderness I with 2015 LAS
WWpres2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_pres_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2015_WI_ALS2015<-WWpres2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWpres2015_WI_ALS2015<-WWpres2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWpres2015_WI_ALS2015<-WWpres2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
WWpres2015_WI_ALS2015<-WWpres2015_WI_ALS2015 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2015_WI_ALS2015<-WWpres2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2015_WI_ALS2015<-select(WWpres2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2015_WI_ALS2015.csv")

#WW presence data from 2016 at Wilderness I with 2015 LAS
#no data
# WWpres2016_WI_ALS2015 <- 
#   as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_pres_2016_WI))
# #add four columns: site, ALS year, bird survey year, bird species
# WWpres2016_WI_ALS2015<-WWpres2016_WI_ALS2015 %>%
#   mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
# WWpres2016_WI_ALS2015<-WWpres2016_WI_ALS2015 %>%
#   mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
# WWpres2016_WI_ALS2015<-WWpres2016_WI_ALS2015 %>%
#   mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
# WWpres2016_WI_ALS2015<-WWpres2016_WI_ALS2015 %>%
#   mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
# WWpres2016_WI_ALS2015<-WWpres2016_WI_ALS2015 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWpres2016_WI_ALS2015<-select(WWpres2016_WI_ALS2015, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWpres2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2016_WI_ALS2015.csv")

#WW presence data from 2017 at Wilderness I with 2015 LAS
#no data
# WWpres2017_WI_ALS2015 <-
#   as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_pres_2017_WI))
# #add four columns: site, ALS year, bird survey year, bird species
# WWpres2017_WI_ALS2015<-WWpres2017_WI_ALS2015 %>%
#   mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
# WWpres2017_WI_ALS2015<-WWpres2017_WI_ALS2015 %>%
#   mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
# WWpres2017_WI_ALS2015<-WWpres2017_WI_ALS2015 %>%
#   mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
# WWpres2017_WI_ALS2015<-WWpres2017_WI_ALS2015 %>%
#   mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
# WWpres2017_WI_ALS2015<-WWpres2017_WI_ALS2015 %>%
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWpres2017_WI_ALS2015<-select(WWpres2017_WI_ALS2015, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWpres2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2017_WI_ALS2015.csv")

####PRESENCE####
#####Wilderness II####
####BT####

#BT presence data from 2000 at Wilderness II with 2000 LAS
#no data
# BTpres2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_pres_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# BTpres2000_WII_ALS2000<-BTpres2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# BTpres2000_WII_ALS2000<-BTpres2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# BTpres2000_WII_ALS2000<-BTpres2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# BTpres2000_WII_ALS2000<-BTpres2000_WII_ALS2000 %>%
#   mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
# BTpres2000_WII_ALS2000<-BTpres2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# BTpres2000_WII_ALS2000<-select(BTpres2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(BTpres2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2000_WII_ALS2000.csv")

#BT presence data from 2001 at Wilderness II with 2000 LAS
BTpres2001_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_pres_2001_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2001_WII_ALS2000<-BTpres2001_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2001_WII_ALS2000<-BTpres2001_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTpres2001_WII_ALS2000<-BTpres2001_WII_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
BTpres2001_WII_ALS2000<-BTpres2001_WII_ALS2000 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2001_WII_ALS2000<-BTpres2001_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2001_WII_ALS2000<-select(BTpres2001_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2001_WII_ALS2000.csv")

#BT presence data from 2002 at Wilderness II with 2000 LAS
BTpres2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_pres_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2002_WII_ALS2000<-BTpres2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2002_WII_ALS2000<-BTpres2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTpres2002_WII_ALS2000<-BTpres2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
BTpres2002_WII_ALS2000<-BTpres2002_WII_ALS2000 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2002_WII_ALS2000<-BTpres2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2002_WII_ALS2000<-select(BTpres2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2002_WII_ALS2000.csv")

#BT presence data from 2005 at Wilderness II with 2005 LAS
BTpres2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_pres_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2005_WII_ALS2005<-BTpres2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2005_WII_ALS2005<-BTpres2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTpres2005_WII_ALS2005<-BTpres2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
BTpres2005_WII_ALS2005<-BTpres2005_WII_ALS2005 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2005_WII_ALS2005<-BTpres2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2005_WII_ALS2005<-select(BTpres2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2005_WII_ALS2005.csv")

#BT presence data from 2006 at Wilderness II with 2005 LAS
BTpres2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_pres_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2006_WII_ALS2005<-BTpres2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2006_WII_ALS2005<-BTpres2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTpres2006_WII_ALS2005<-BTpres2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
BTpres2006_WII_ALS2005<-BTpres2006_WII_ALS2005 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2006_WII_ALS2005<-BTpres2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2006_WII_ALS2005<-select(BTpres2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2006_WII_ALS2005.csv")

#BT presence data from 2007 at Wilderness II with 2005 LAS
BTpres2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_pres_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2007_WII_ALS2005<-BTpres2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2007_WII_ALS2005<-BTpres2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTpres2007_WII_ALS2005<-BTpres2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
BTpres2007_WII_ALS2005<-BTpres2007_WII_ALS2005 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2007_WII_ALS2005<-BTpres2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2007_WII_ALS2005<-select(BTpres2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2007_WII_ALS2005.csv")

#BT presence data from 2012 at Wilderness II with 2012 LAS
BTpres2012_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_pres_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2012_WII_ALS2012<-BTpres2012_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2012_WII_ALS2012<-BTpres2012_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTpres2012_WII_ALS2012<-BTpres2012_WII_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
BTpres2012_WII_ALS2012<-BTpres2012_WII_ALS2012 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2012_WII_ALS2012<-BTpres2012_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2012_WII_ALS2012<-select(BTpres2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2012_WII_ALS2012.csv")

#BT presence data from 2013 at Wilderness II with 2012 LAS
BTpres2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_pres_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2013_WII_ALS2012<-BTpres2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2013_WII_ALS2012<-BTpres2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTpres2013_WII_ALS2012<-BTpres2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
BTpres2013_WII_ALS2012<-BTpres2013_WII_ALS2012 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2013_WII_ALS2012<-BTpres2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2013_WII_ALS2012<-select(BTpres2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2013_WII_ALS2012.csv")

#BT presence data from 2014 at Wilderness II with 2012 LAS
BTpres2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_pres_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2014_WII_ALS2012<-BTpres2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2014_WII_ALS2012<-BTpres2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTpres2014_WII_ALS2012<-BTpres2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
BTpres2014_WII_ALS2012<-BTpres2014_WII_ALS2012 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2014_WII_ALS2012<-BTpres2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2014_WII_ALS2012<-select(BTpres2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2014_WII_ALS2012.csv")

#BT presence data from 2015 at Wilderness II with 2015 LAS
BTpres2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_pres_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2015_WII_ALS2015<-BTpres2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2015_WII_ALS2015<-BTpres2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTpres2015_WII_ALS2015<-BTpres2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
BTpres2015_WII_ALS2015<-BTpres2015_WII_ALS2015 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2015_WII_ALS2015<-BTpres2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2015_WII_ALS2015<-select(BTpres2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2015_WII_ALS2015.csv")

#BT presence data from 2016 at Wilderness II with 2015 LAS
BTpres2016_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_pres_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2016_WII_ALS2015<-BTpres2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2016_WII_ALS2015<-BTpres2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTpres2016_WII_ALS2015<-BTpres2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
BTpres2016_WII_ALS2015<-BTpres2016_WII_ALS2015 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2016_WII_ALS2015<-BTpres2016_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2016_WII_ALS2015<-select(BTpres2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2016_WII_ALS2015.csv")

#BT presence data from 2017 at Wilderness II with 2015 LAS
BTpres2017_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_pres_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTpres2017_WII_ALS2015<-BTpres2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTpres2017_WII_ALS2015<-BTpres2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTpres2017_WII_ALS2015<-BTpres2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
BTpres2017_WII_ALS2015<-BTpres2017_WII_ALS2015 %>%
  mutate(species = "BT_presence")%>% select(species, everything())#add column for bird species
BTpres2017_WII_ALS2015<-BTpres2017_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTpres2017_WII_ALS2015<-select(BTpres2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTpres2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTpres2017_WII_ALS2015.csv")

####CC####

#CC presence data from 2000 at Wilderness II with 2000 LAS
#no data
# CCpres2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_pres_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# CCpres2000_WII_ALS2000<-CCpres2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# CCpres2000_WII_ALS2000<-CCpres2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# CCpres2000_WII_ALS2000<-CCpres2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# CCpres2000_WII_ALS2000<-CCpres2000_WII_ALS2000 %>%
#   mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
# CCpres2000_WII_ALS2000<-CCpres2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# CCpres2000_WII_ALS2000<-select(CCpres2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(CCpres2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2000_WII_ALS2000.csv")

#CC presence data from 2001 at Wilderness II with 2000 LAS
#no data
# CCpres2001_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_pres_2001_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# CCpres2001_WII_ALS2000<-CCpres2001_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# CCpres2001_WII_ALS2000<-CCpres2001_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# CCpres2001_WII_ALS2000<-CCpres2001_WII_ALS2000 %>%
#   mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
# CCpres2001_WII_ALS2000<-CCpres2001_WII_ALS2000 %>%
#   mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
# CCpres2001_WII_ALS2000<-CCpres2001_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# CCpres2001_WII_ALS2000<-select(CCpres2001_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(CCpres2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2001_WII_ALS2000.csv")

#CC presence data from 2002 at Wilderness II with 2000 LAS
CCpres2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_pres_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2002_WII_ALS2000<-CCpres2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2002_WII_ALS2000<-CCpres2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCpres2002_WII_ALS2000<-CCpres2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CCpres2002_WII_ALS2000<-CCpres2002_WII_ALS2000 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2002_WII_ALS2000<-CCpres2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2002_WII_ALS2000<-select(CCpres2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2002_WII_ALS2000.csv")

#CC presence data from 2005 at Wilderness II with 2005 LAS
CCpres2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_pres_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2005_WII_ALS2005<-CCpres2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2005_WII_ALS2005<-CCpres2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCpres2005_WII_ALS2005<-CCpres2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CCpres2005_WII_ALS2005<-CCpres2005_WII_ALS2005 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2005_WII_ALS2005<-CCpres2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2005_WII_ALS2005<-select(CCpres2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2005_WII_ALS2005.csv")

#CC presence data from 2006 at Wilderness II with 2005 LAS
CCpres2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_pres_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2006_WII_ALS2005<-CCpres2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2006_WII_ALS2005<-CCpres2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCpres2006_WII_ALS2005<-CCpres2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CCpres2006_WII_ALS2005<-CCpres2006_WII_ALS2005 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2006_WII_ALS2005<-CCpres2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2006_WII_ALS2005<-select(CCpres2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2006_WII_ALS2005.csv")

#CC presence data from 2007 at Wilderness II with 2005 LAS
CCpres2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_pres_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2007_WII_ALS2005<-CCpres2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2007_WII_ALS2005<-CCpres2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCpres2007_WII_ALS2005<-CCpres2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CCpres2007_WII_ALS2005<-CCpres2007_WII_ALS2005 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2007_WII_ALS2005<-CCpres2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2007_WII_ALS2005<-select(CCpres2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2007_WII_ALS2005.csv")

#CC presence data from 2012 at Wilderness II with 2012 LAS
CCpres2012_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_pres_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2012_WII_ALS2012<-CCpres2012_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2012_WII_ALS2012<-CCpres2012_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCpres2012_WII_ALS2012<-CCpres2012_WII_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CCpres2012_WII_ALS2012<-CCpres2012_WII_ALS2012 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2012_WII_ALS2012<-CCpres2012_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2012_WII_ALS2012<-select(CCpres2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2012_WII_ALS2012.csv")

#CC presence data from 2013 at Wilderness II with 2012 LAS
CCpres2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_pres_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2013_WII_ALS2012<-CCpres2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2013_WII_ALS2012<-CCpres2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCpres2013_WII_ALS2012<-CCpres2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CCpres2013_WII_ALS2012<-CCpres2013_WII_ALS2012 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2013_WII_ALS2012<-CCpres2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2013_WII_ALS2012<-select(CCpres2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2013_WII_ALS2012.csv")

#CC presence data from 2014 at Wilderness II with 2012 LAS
CCpres2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_pres_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2014_WII_ALS2012<-CCpres2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2014_WII_ALS2012<-CCpres2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCpres2014_WII_ALS2012<-CCpres2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CCpres2014_WII_ALS2012<-CCpres2014_WII_ALS2012 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2014_WII_ALS2012<-CCpres2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2014_WII_ALS2012<-select(CCpres2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2014_WII_ALS2012.csv")

#CC presence data from 2015 at Wilderness II with 2015 LAS
CCpres2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_pres_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2015_WII_ALS2015<-CCpres2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2015_WII_ALS2015<-CCpres2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCpres2015_WII_ALS2015<-CCpres2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CCpres2015_WII_ALS2015<-CCpres2015_WII_ALS2015 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2015_WII_ALS2015<-CCpres2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2015_WII_ALS2015<-select(CCpres2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2015_WII_ALS2015.csv")

#CC presence data from 2016 at Wilderness II with 2015 LAS
CCpres2016_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_pres_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2016_WII_ALS2015<-CCpres2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2016_WII_ALS2015<-CCpres2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCpres2016_WII_ALS2015<-CCpres2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CCpres2016_WII_ALS2015<-CCpres2016_WII_ALS2015 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2016_WII_ALS2015<-CCpres2016_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2016_WII_ALS2015<-select(CCpres2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2016_WII_ALS2015.csv")

#CC presence data from 2017 at Wilderness II with 2015 LAS
CCpres2017_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_pres_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCpres2017_WII_ALS2015<-CCpres2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCpres2017_WII_ALS2015<-CCpres2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCpres2017_WII_ALS2015<-CCpres2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CCpres2017_WII_ALS2015<-CCpres2017_WII_ALS2015 %>%
  mutate(species = "CC_presence")%>% select(species, everything())#add column for bird species
CCpres2017_WII_ALS2015<-CCpres2017_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCpres2017_WII_ALS2015<-select(CCpres2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCpres2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCpres2017_WII_ALS2015.csv")

####CH####

#CH presence data from 2000 at Wilderness II with 2000 LAS
#no data
# CHpres2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_pres_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# CHpres2000_WII_ALS2000<-CHpres2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# CHpres2000_WII_ALS2000<-CHpres2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# CHpres2000_WII_ALS2000<-CHpres2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# CHpres2000_WII_ALS2000<-CHpres2000_WII_ALS2000 %>%
#   mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
# CHpres2000_WII_ALS2000<-CHpres2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# CHpres2000_WII_ALS2000<-select(CHpres2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(CHpres2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2000_WII_ALS2000.csv")

#CH presence data from 2001 at Wilderness II with 2000 LAS
CHpres2001_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_pres_2001_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2001_WII_ALS2000<-CHpres2001_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2001_WII_ALS2000<-CHpres2001_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHpres2001_WII_ALS2000<-CHpres2001_WII_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
CHpres2001_WII_ALS2000<-CHpres2001_WII_ALS2000 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2001_WII_ALS2000<-CHpres2001_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2001_WII_ALS2000<-select(CHpres2001_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2001_WII_ALS2000.csv")

#CH presence data from 2002 at Wilderness II with 2000 LAS
CHpres2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_pres_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2002_WII_ALS2000<-CHpres2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2002_WII_ALS2000<-CHpres2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHpres2002_WII_ALS2000<-CHpres2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CHpres2002_WII_ALS2000<-CHpres2002_WII_ALS2000 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2002_WII_ALS2000<-CHpres2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2002_WII_ALS2000<-select(CHpres2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2002_WII_ALS2000.csv")

#CH presence data from 2005 at Wilderness II with 2005 LAS
CHpres2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_pres_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2005_WII_ALS2005<-CHpres2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2005_WII_ALS2005<-CHpres2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHpres2005_WII_ALS2005<-CHpres2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CHpres2005_WII_ALS2005<-CHpres2005_WII_ALS2005 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2005_WII_ALS2005<-CHpres2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2005_WII_ALS2005<-select(CHpres2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2005_WII_ALS2005.csv")

#CH presence data from 2006 at Wilderness II with 2005 LAS
CHpres2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_pres_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2006_WII_ALS2005<-CHpres2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2006_WII_ALS2005<-CHpres2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHpres2006_WII_ALS2005<-CHpres2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CHpres2006_WII_ALS2005<-CHpres2006_WII_ALS2005 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2006_WII_ALS2005<-CHpres2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2006_WII_ALS2005<-select(CHpres2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2006_WII_ALS2005.csv")

#CH presence data from 2007 at Wilderness II with 2005 LAS
CHpres2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_pres_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2007_WII_ALS2005<-CHpres2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2007_WII_ALS2005<-CHpres2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHpres2007_WII_ALS2005<-CHpres2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CHpres2007_WII_ALS2005<-CHpres2007_WII_ALS2005 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2007_WII_ALS2005<-CHpres2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2007_WII_ALS2005<-select(CHpres2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2007_WII_ALS2005.csv")

#CH presence data from 2012 at Wilderness II with 2012 LAS
CHpres2012_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_pres_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2012_WII_ALS2012<-CHpres2012_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2012_WII_ALS2012<-CHpres2012_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHpres2012_WII_ALS2012<-CHpres2012_WII_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CHpres2012_WII_ALS2012<-CHpres2012_WII_ALS2012 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2012_WII_ALS2012<-CHpres2012_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2012_WII_ALS2012<-select(CHpres2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2012_WII_ALS2012.csv")

#CH presence data from 2013 at Wilderness II with 2012 LAS
CHpres2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_pres_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2013_WII_ALS2012<-CHpres2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2013_WII_ALS2012<-CHpres2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHpres2013_WII_ALS2012<-CHpres2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CHpres2013_WII_ALS2012<-CHpres2013_WII_ALS2012 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2013_WII_ALS2012<-CHpres2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2013_WII_ALS2012<-select(CHpres2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2013_WII_ALS2012.csv")

#CH presence data from 2014 at Wilderness II with 2012 LAS
CHpres2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_pres_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2014_WII_ALS2012<-CHpres2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2014_WII_ALS2012<-CHpres2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHpres2014_WII_ALS2012<-CHpres2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CHpres2014_WII_ALS2012<-CHpres2014_WII_ALS2012 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2014_WII_ALS2012<-CHpres2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2014_WII_ALS2012<-select(CHpres2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2014_WII_ALS2012.csv")

#CH presence data from 2015 at Wilderness II with 2015 LAS
CHpres2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_pres_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2015_WII_ALS2015<-CHpres2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2015_WII_ALS2015<-CHpres2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHpres2015_WII_ALS2015<-CHpres2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CHpres2015_WII_ALS2015<-CHpres2015_WII_ALS2015 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2015_WII_ALS2015<-CHpres2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2015_WII_ALS2015<-select(CHpres2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2015_WII_ALS2015.csv")

#CH presence data from 2016 at Wilderness II with 2015 LAS
CHpres2016_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_pres_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2016_WII_ALS2015<-CHpres2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2016_WII_ALS2015<-CHpres2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHpres2016_WII_ALS2015<-CHpres2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CHpres2016_WII_ALS2015<-CHpres2016_WII_ALS2015 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2016_WII_ALS2015<-CHpres2016_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2016_WII_ALS2015<-select(CHpres2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2016_WII_ALS2015.csv")

#CH presence data from 2017 at Wilderness II with 2015 LAS
CHpres2017_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_pres_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHpres2017_WII_ALS2015<-CHpres2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHpres2017_WII_ALS2015<-CHpres2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHpres2017_WII_ALS2015<-CHpres2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CHpres2017_WII_ALS2015<-CHpres2017_WII_ALS2015 %>%
  mutate(species = "CH_presence")%>% select(species, everything())#add column for bird species
CHpres2017_WII_ALS2015<-CHpres2017_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHpres2017_WII_ALS2015<-select(CHpres2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHpres2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHpres2017_WII_ALS2015.csv")

####WW####

#WW presence data from 2000 at Wilderness II with 2000 LAS
#no data
# WWpres2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_pres_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# WWpres2000_WII_ALS2000<-WWpres2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# WWpres2000_WII_ALS2000<-WWpres2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# WWpres2000_WII_ALS2000<-WWpres2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# WWpres2000_WII_ALS2000<-WWpres2000_WII_ALS2000 %>%
#   mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
# WWpres2000_WII_ALS2000<-WWpres2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWpres2000_WII_ALS2000<-select(WWpres2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWpres2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2000_WII_ALS2000.csv")

#WW presence data from 2001 at Wilderness II with 2000 LAS
WWpres2001_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_pres_2001_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2001_WII_ALS2000<-WWpres2001_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2001_WII_ALS2000<-WWpres2001_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWpres2001_WII_ALS2000<-WWpres2001_WII_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
WWpres2001_WII_ALS2000<-WWpres2001_WII_ALS2000 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2001_WII_ALS2000<-WWpres2001_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2001_WII_ALS2000<-select(WWpres2001_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2001_WII_ALS2000.csv")

#WW presence data from 2002 at Wilderness II with 2000 LAS
WWpres2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_pres_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2002_WII_ALS2000<-WWpres2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2002_WII_ALS2000<-WWpres2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWpres2002_WII_ALS2000<-WWpres2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
WWpres2002_WII_ALS2000<-WWpres2002_WII_ALS2000 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2002_WII_ALS2000<-WWpres2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2002_WII_ALS2000<-select(WWpres2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2002_WII_ALS2000.csv")

#WW presence data from 2005 at Wilderness II with 2005 LAS
WWpres2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_pres_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2005_WII_ALS2005<-WWpres2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2005_WII_ALS2005<-WWpres2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWpres2005_WII_ALS2005<-WWpres2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
WWpres2005_WII_ALS2005<-WWpres2005_WII_ALS2005 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2005_WII_ALS2005<-WWpres2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2005_WII_ALS2005<-select(WWpres2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2005_WII_ALS2005.csv")

#WW presence data from 2006 at Wilderness II with 2005 LAS
WWpres2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_pres_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2006_WII_ALS2005<-WWpres2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2006_WII_ALS2005<-WWpres2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWpres2006_WII_ALS2005<-WWpres2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
WWpres2006_WII_ALS2005<-WWpres2006_WII_ALS2005 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2006_WII_ALS2005<-WWpres2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2006_WII_ALS2005<-select(WWpres2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2006_WII_ALS2005.csv")

#WW presence data from 2007 at Wilderness II with 2005 LAS
WWpres2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_pres_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2007_WII_ALS2005<-WWpres2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2007_WII_ALS2005<-WWpres2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWpres2007_WII_ALS2005<-WWpres2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
WWpres2007_WII_ALS2005<-WWpres2007_WII_ALS2005 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2007_WII_ALS2005<-WWpres2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2007_WII_ALS2005<-select(WWpres2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2007_WII_ALS2005.csv")

#WW presence data from 2012 at Wilderness II with 2012 LAS
#no data 
# WWpres2012_WII_ALS2012 <- 
# as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_pres_2012_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# WWpres2012_WII_ALS2012<-WWpres2012_WII_ALS2012 %>%
# mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# WWpres2012_WII_ALS2012<-WWpres2012_WII_ALS2012 %>%
# mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
# WWpres2012_WII_ALS2012<-WWpres2012_WII_ALS2012 %>%
# mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
# WWpres2012_WII_ALS2012<-WWpres2012_WII_ALS2012 %>%
# mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
# WWpres2012_WII_ALS2012<-WWpres2012_WII_ALS2012 %>% 
# mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWpres2012_WII_ALS2012<-select(WWpres2012_WII_ALS2012, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWpres2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2012_WII_ALS2012.csv")

#WW presence data from 2013 at Wilderness II with 2012 LAS
WWpres2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_pres_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2013_WII_ALS2012<-WWpres2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2013_WII_ALS2012<-WWpres2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWpres2013_WII_ALS2012<-WWpres2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
WWpres2013_WII_ALS2012<-WWpres2013_WII_ALS2012 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2013_WII_ALS2012<-WWpres2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2013_WII_ALS2012<-select(WWpres2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2013_WII_ALS2012.csv")

#WW presence data from 2014 at Wilderness II with 2012 LAS
WWpres2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_pres_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2014_WII_ALS2012<-WWpres2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2014_WII_ALS2012<-WWpres2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWpres2014_WII_ALS2012<-WWpres2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
WWpres2014_WII_ALS2012<-WWpres2014_WII_ALS2012 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2014_WII_ALS2012<-WWpres2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2014_WII_ALS2012<-select(WWpres2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2014_WII_ALS2012.csv")

#WW presence data from 2015 at Wilderness II with 2015 LAS
WWpres2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_pres_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2015_WII_ALS2015<-WWpres2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2015_WII_ALS2015<-WWpres2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWpres2015_WII_ALS2015<-WWpres2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
WWpres2015_WII_ALS2015<-WWpres2015_WII_ALS2015 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2015_WII_ALS2015<-WWpres2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2015_WII_ALS2015<-select(WWpres2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2015_WII_ALS2015.csv")

#WW presence data from 2016 at Wilderness II with 2015 LAS
WWpres2016_WII_ALS2015 <-
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_pres_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2016_WII_ALS2015<-WWpres2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2016_WII_ALS2015<-WWpres2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWpres2016_WII_ALS2015<-WWpres2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
WWpres2016_WII_ALS2015<-WWpres2016_WII_ALS2015 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2016_WII_ALS2015<-WWpres2016_WII_ALS2015 %>%
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2016_WII_ALS2015<-select(WWpres2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2016_WII_ALS2015.csv")

#WW presence data from 2017 at Wilderness II with 2015 LAS
WWpres2017_WII_ALS2015 <-
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_pres_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWpres2017_WII_ALS2015<-WWpres2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWpres2017_WII_ALS2015<-WWpres2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWpres2017_WII_ALS2015<-WWpres2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
WWpres2017_WII_ALS2015<-WWpres2017_WII_ALS2015 %>%
  mutate(species = "WW_presence")%>% select(species, everything())#add column for bird species
WWpres2017_WII_ALS2015<-WWpres2017_WII_ALS2015 %>%
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWpres2017_WII_ALS2015<-select(WWpres2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWpres2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWpres2017_WII_ALS2015.csv")

####ABSENCE####
####Wilderness I####
#BT absence data from 2000 at Wilderness I with 2000 LAS
BTabs2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_abs_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2000_WI_ALS2000<-BTabs2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2000_WI_ALS2000<-BTabs2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTabs2000_WI_ALS2000<-BTabs2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
BTabs2000_WI_ALS2000<-BTabs2000_WI_ALS2000 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2000_WI_ALS2000<-BTabs2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2000_WI_ALS2000<-select(BTabs2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2000_WI_ALS2000.csv")

#BT absence data from 2001 at Wilderness I with 2000 LAS
BTabs2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_abs_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2001_WI_ALS2000<-BTabs2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2001_WI_ALS2000<-BTabs2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTabs2001_WI_ALS2000<-BTabs2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
BTabs2001_WI_ALS2000<-BTabs2001_WI_ALS2000 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2001_WI_ALS2000<-BTabs2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2001_WI_ALS2000<-select(BTabs2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2001_WI_ALS2000.csv")

#BT absence data from 2002 at Wilderness I with 2000 LAS
BTabs2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_abs_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2002_WI_ALS2000<-BTabs2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2002_WI_ALS2000<-BTabs2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTabs2002_WI_ALS2000<-BTabs2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
BTabs2002_WI_ALS2000<-BTabs2002_WI_ALS2000 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2002_WI_ALS2000<-BTabs2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2002_WI_ALS2000<-select(BTabs2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2002_WI_ALS2000.csv")

#BT absence data from 2005 at Wilderness I with 2005 LAS
BTabs2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_abs_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2005_WI_ALS2005<-BTabs2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2005_WI_ALS2005<-BTabs2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTabs2005_WI_ALS2005<-BTabs2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
BTabs2005_WI_ALS2005<-BTabs2005_WI_ALS2005 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2005_WI_ALS2005<-BTabs2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2005_WI_ALS2005<-select(BTabs2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2005_WI_ALS2005.csv")

#BT absence data from 2006 at Wilderness I with 2005 LAS
BTabs2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_abs_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2006_WI_ALS2005<-BTabs2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2006_WI_ALS2005<-BTabs2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTabs2006_WI_ALS2005<-BTabs2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
BTabs2006_WI_ALS2005<-BTabs2006_WI_ALS2005 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2006_WI_ALS2005<-BTabs2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2006_WI_ALS2005<-select(BTabs2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2006_WI_ALS2005.csv")

#BT absence data from 2007 at Wilderness I with 2005 LAS
BTabs2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_abs_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2007_WI_ALS2005<-BTabs2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2007_WI_ALS2005<-BTabs2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTabs2007_WI_ALS2005<-BTabs2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
BTabs2007_WI_ALS2005<-BTabs2007_WI_ALS2005 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2007_WI_ALS2005<-BTabs2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2007_WI_ALS2005<-select(BTabs2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2007_WI_ALS2005.csv")

#BT absence data from 2012 at Wilderness I with 2012 LAS
BTabs2012_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_abs_2012_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2012_WI_ALS2012<-BTabs2012_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2012_WI_ALS2012<-BTabs2012_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTabs2012_WI_ALS2012<-BTabs2012_WI_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
BTabs2012_WI_ALS2012<-BTabs2012_WI_ALS2012 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2012_WI_ALS2012<-BTabs2012_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2012_WI_ALS2012<-select(BTabs2012_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2012_WI_ALS2012.csv")

#BT absence data from 2013 at Wilderness I with 2012 LAS
BTabs2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_abs_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2013_WI_ALS2012<-BTabs2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2013_WI_ALS2012<-BTabs2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTabs2013_WI_ALS2012<-BTabs2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
BTabs2013_WI_ALS2012<-BTabs2013_WI_ALS2012 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2013_WI_ALS2012<-BTabs2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2013_WI_ALS2012<-select(BTabs2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2013_WI_ALS2012.csv")

#BT absence data from 2014 at Wilderness I with 2012 LAS
BTabs2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_abs_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2014_WI_ALS2012<-BTabs2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2014_WI_ALS2012<-BTabs2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTabs2014_WI_ALS2012<-BTabs2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
BTabs2014_WI_ALS2012<-BTabs2014_WI_ALS2012 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2014_WI_ALS2012<-BTabs2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2014_WI_ALS2012<-select(BTabs2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2014_WI_ALS2012.csv")

#BT absence data from 2015 at Wilderness I with 2015 LAS
BTabs2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_abs_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2015_WI_ALS2015<-BTabs2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2015_WI_ALS2015<-BTabs2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTabs2015_WI_ALS2015<-BTabs2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
BTabs2015_WI_ALS2015<-BTabs2015_WI_ALS2015 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2015_WI_ALS2015<-BTabs2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2015_WI_ALS2015<-select(BTabs2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2015_WI_ALS2015.csv")

#BT absence data from 2016 at Wilderness I with 2015 LAS
BTabs2016_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_abs_2016_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2016_WI_ALS2015<-BTabs2016_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2016_WI_ALS2015<-BTabs2016_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTabs2016_WI_ALS2015<-BTabs2016_WI_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
BTabs2016_WI_ALS2015<-BTabs2016_WI_ALS2015 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2016_WI_ALS2015<-BTabs2016_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2016_WI_ALS2015<-select(BTabs2016_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2016_WI_ALS2015.csv")

#BT absence data from 2017 at Wilderness I with 2015 LAS
BTabs2017_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_abs_2017_WI))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2017_WI_ALS2015<-BTabs2017_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
BTabs2017_WI_ALS2015<-BTabs2017_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTabs2017_WI_ALS2015<-BTabs2017_WI_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
BTabs2017_WI_ALS2015<-BTabs2017_WI_ALS2015 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2017_WI_ALS2015<-BTabs2017_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2017_WI_ALS2015<-select(BTabs2017_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2017_WI_ALS2015.csv")

####CC####

#CC absence data from 2000 at Wilderness I with 2000 LAS
CCabs2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_abs_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2000_WI_ALS2000<-CCabs2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2000_WI_ALS2000<-CCabs2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCabs2000_WI_ALS2000<-CCabs2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
CCabs2000_WI_ALS2000<-CCabs2000_WI_ALS2000 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2000_WI_ALS2000<-CCabs2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2000_WI_ALS2000<-select(CCabs2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2000_WI_ALS2000.csv")

#CC absence data from 2001 at Wilderness I with 2000 LAS
CCabs2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_abs_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2001_WI_ALS2000<-CCabs2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2001_WI_ALS2000<-CCabs2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCabs2001_WI_ALS2000<-CCabs2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
CCabs2001_WI_ALS2000<-CCabs2001_WI_ALS2000 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2001_WI_ALS2000<-CCabs2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2001_WI_ALS2000<-select(CCabs2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2001_WI_ALS2000.csv")

#CC absence data from 2002 at Wilderness I with 2000 LAS
CCabs2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_abs_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2002_WI_ALS2000<-CCabs2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2002_WI_ALS2000<-CCabs2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCabs2002_WI_ALS2000<-CCabs2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CCabs2002_WI_ALS2000<-CCabs2002_WI_ALS2000 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2002_WI_ALS2000<-CCabs2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2002_WI_ALS2000<-select(CCabs2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2002_WI_ALS2000.csv")

#CC absence data from 2005 at Wilderness I with 2005 LAS
CCabs2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_abs_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2005_WI_ALS2005<-CCabs2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2005_WI_ALS2005<-CCabs2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCabs2005_WI_ALS2005<-CCabs2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CCabs2005_WI_ALS2005<-CCabs2005_WI_ALS2005 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2005_WI_ALS2005<-CCabs2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2005_WI_ALS2005<-select(CCabs2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2005_WI_ALS2005.csv")

#CC absence data from 2006 at Wilderness I with 2005 LAS
CCabs2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_abs_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2006_WI_ALS2005<-CCabs2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2006_WI_ALS2005<-CCabs2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCabs2006_WI_ALS2005<-CCabs2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CCabs2006_WI_ALS2005<-CCabs2006_WI_ALS2005 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2006_WI_ALS2005<-CCabs2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2006_WI_ALS2005<-select(CCabs2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2006_WI_ALS2005.csv")

#CC absence data from 2007 at Wilderness I with 2005 LAS
CCabs2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_abs_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2007_WI_ALS2005<-CCabs2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2007_WI_ALS2005<-CCabs2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCabs2007_WI_ALS2005<-CCabs2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CCabs2007_WI_ALS2005<-CCabs2007_WI_ALS2005 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2007_WI_ALS2005<-CCabs2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2007_WI_ALS2005<-select(CCabs2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2007_WI_ALS2005.csv")

#CC absence data from 2012 at Wilderness I with 2012 LAS
CCabs2012_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_abs_2012_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2012_WI_ALS2012<-CCabs2012_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2012_WI_ALS2012<-CCabs2012_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCabs2012_WI_ALS2012<-CCabs2012_WI_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CCabs2012_WI_ALS2012<-CCabs2012_WI_ALS2012 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2012_WI_ALS2012<-CCabs2012_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2012_WI_ALS2012<-select(CCabs2012_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2012_WI_ALS2012.csv")

#CC absence data from 2013 at Wilderness I with 2012 LAS
CCabs2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_abs_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2013_WI_ALS2012<-CCabs2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2013_WI_ALS2012<-CCabs2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCabs2013_WI_ALS2012<-CCabs2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CCabs2013_WI_ALS2012<-CCabs2013_WI_ALS2012 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2013_WI_ALS2012<-CCabs2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2013_WI_ALS2012<-select(CCabs2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2013_WI_ALS2012.csv")

#CC absence data from 2014 at Wilderness I with 2012 LAS
CCabs2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_abs_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2014_WI_ALS2012<-CCabs2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2014_WI_ALS2012<-CCabs2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCabs2014_WI_ALS2012<-CCabs2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CCabs2014_WI_ALS2012<-CCabs2014_WI_ALS2012 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2014_WI_ALS2012<-CCabs2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2014_WI_ALS2012<-select(CCabs2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2014_WI_ALS2012.csv")

#CC absence data from 2015 at Wilderness I with 2015 LAS
CCabs2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_abs_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2015_WI_ALS2015<-CCabs2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2015_WI_ALS2015<-CCabs2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCabs2015_WI_ALS2015<-CCabs2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CCabs2015_WI_ALS2015<-CCabs2015_WI_ALS2015 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2015_WI_ALS2015<-CCabs2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2015_WI_ALS2015<-select(CCabs2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2015_WI_ALS2015.csv")

#CC absence data from 2016 at Wilderness I with 2015 LAS
CCabs2016_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_abs_2016_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2016_WI_ALS2015<-CCabs2016_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2016_WI_ALS2015<-CCabs2016_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCabs2016_WI_ALS2015<-CCabs2016_WI_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CCabs2016_WI_ALS2015<-CCabs2016_WI_ALS2015 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2016_WI_ALS2015<-CCabs2016_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2016_WI_ALS2015<-select(CCabs2016_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2016_WI_ALS2015.csv")

#CC absence data from 2017 at Wilderness I with 2015 LAS
CCabs2017_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_abs_2017_WI))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2017_WI_ALS2015<-CCabs2017_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CCabs2017_WI_ALS2015<-CCabs2017_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCabs2017_WI_ALS2015<-CCabs2017_WI_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CCabs2017_WI_ALS2015<-CCabs2017_WI_ALS2015 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2017_WI_ALS2015<-CCabs2017_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2017_WI_ALS2015<-select(CCabs2017_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2017_WI_ALS2015.csv")

####CH####

#CH absence data from 2000 at Wilderness I with 2000 LAS
CHabs2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_abs_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2000_WI_ALS2000<-CHabs2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2000_WI_ALS2000<-CHabs2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHabs2000_WI_ALS2000<-CHabs2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
CHabs2000_WI_ALS2000<-CHabs2000_WI_ALS2000 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2000_WI_ALS2000<-CHabs2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2000_WI_ALS2000<-select(CHabs2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2000_WI_ALS2000.csv")

#CH absence data from 2001 at Wilderness I with 2000 LAS
CHabs2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_abs_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2001_WI_ALS2000<-CHabs2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2001_WI_ALS2000<-CHabs2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHabs2001_WI_ALS2000<-CHabs2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
CHabs2001_WI_ALS2000<-CHabs2001_WI_ALS2000 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2001_WI_ALS2000<-CHabs2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2001_WI_ALS2000<-select(CHabs2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2001_WI_ALS2000.csv")

#CH absence data from 2002 at Wilderness I with 2000 LAS
CHabs2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_abs_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2002_WI_ALS2000<-CHabs2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2002_WI_ALS2000<-CHabs2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHabs2002_WI_ALS2000<-CHabs2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CHabs2002_WI_ALS2000<-CHabs2002_WI_ALS2000 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2002_WI_ALS2000<-CHabs2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2002_WI_ALS2000<-select(CHabs2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2002_WI_ALS2000.csv")

#CH absence data from 2005 at Wilderness I with 2005 LAS
CHabs2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_abs_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2005_WI_ALS2005<-CHabs2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2005_WI_ALS2005<-CHabs2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHabs2005_WI_ALS2005<-CHabs2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CHabs2005_WI_ALS2005<-CHabs2005_WI_ALS2005 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2005_WI_ALS2005<-CHabs2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2005_WI_ALS2005<-select(CHabs2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2005_WI_ALS2005.csv")

#CH absence data from 2006 at Wilderness I with 2005 LAS
CHabs2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_abs_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2006_WI_ALS2005<-CHabs2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2006_WI_ALS2005<-CHabs2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHabs2006_WI_ALS2005<-CHabs2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CHabs2006_WI_ALS2005<-CHabs2006_WI_ALS2005 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2006_WI_ALS2005<-CHabs2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2006_WI_ALS2005<-select(CHabs2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2006_WI_ALS2005.csv")

#CH absence data from 2007 at Wilderness I with 2005 LAS
CHabs2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_abs_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2007_WI_ALS2005<-CHabs2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2007_WI_ALS2005<-CHabs2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHabs2007_WI_ALS2005<-CHabs2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CHabs2007_WI_ALS2005<-CHabs2007_WI_ALS2005 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2007_WI_ALS2005<-CHabs2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2007_WI_ALS2005<-select(CHabs2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2007_WI_ALS2005.csv")

#CH absence data from 2012 at Wilderness I with 2012 LAS
CHabs2012_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_abs_2012_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2012_WI_ALS2012<-CHabs2012_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2012_WI_ALS2012<-CHabs2012_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHabs2012_WI_ALS2012<-CHabs2012_WI_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CHabs2012_WI_ALS2012<-CHabs2012_WI_ALS2012 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2012_WI_ALS2012<-CHabs2012_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2012_WI_ALS2012<-select(CHabs2012_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2012_WI_ALS2012.csv")

#CH absence data from 2013 at Wilderness I with 2012 LAS
CHabs2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_abs_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2013_WI_ALS2012<-CHabs2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2013_WI_ALS2012<-CHabs2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHabs2013_WI_ALS2012<-CHabs2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CHabs2013_WI_ALS2012<-CHabs2013_WI_ALS2012 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2013_WI_ALS2012<-CHabs2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2013_WI_ALS2012<-select(CHabs2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2013_WI_ALS2012.csv")

#CH absence data from 2014 at Wilderness I with 2012 LAS
CHabs2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_abs_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2014_WI_ALS2012<-CHabs2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2014_WI_ALS2012<-CHabs2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHabs2014_WI_ALS2012<-CHabs2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CHabs2014_WI_ALS2012<-CHabs2014_WI_ALS2012 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2014_WI_ALS2012<-CHabs2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2014_WI_ALS2012<-select(CHabs2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2014_WI_ALS2012.csv")

#CH absence data from 2015 at Wilderness I with 2015 LAS
CHabs2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_abs_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2015_WI_ALS2015<-CHabs2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2015_WI_ALS2015<-CHabs2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHabs2015_WI_ALS2015<-CHabs2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CHabs2015_WI_ALS2015<-CHabs2015_WI_ALS2015 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2015_WI_ALS2015<-CHabs2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2015_WI_ALS2015<-select(CHabs2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2015_WI_ALS2015.csv")

#CH absence data from 2016 at Wilderness I with 2015 LAS
CHabs2016_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_abs_2016_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2016_WI_ALS2015<-CHabs2016_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2016_WI_ALS2015<-CHabs2016_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHabs2016_WI_ALS2015<-CHabs2016_WI_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CHabs2016_WI_ALS2015<-CHabs2016_WI_ALS2015 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2016_WI_ALS2015<-CHabs2016_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2016_WI_ALS2015<-select(CHabs2016_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2016_WI_ALS2015.csv")

#CH absence data from 2017 at Wilderness I with 2015 LAS
CHabs2017_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_abs_2017_WI))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2017_WI_ALS2015<-CHabs2017_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
CHabs2017_WI_ALS2015<-CHabs2017_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHabs2017_WI_ALS2015<-CHabs2017_WI_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CHabs2017_WI_ALS2015<-CHabs2017_WI_ALS2015 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2017_WI_ALS2015<-CHabs2017_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2017_WI_ALS2015<-select(CHabs2017_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2017_WI_ALS2015.csv")

####WW####

#WW absence data from 2000 at Wilderness I with 2000 LAS
WWabs2000_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_abs_2000_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2000_WI_ALS2000<-WWabs2000_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2000_WI_ALS2000<-WWabs2000_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWabs2000_WI_ALS2000<-WWabs2000_WI_ALS2000 %>%
  mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
WWabs2000_WI_ALS2000<-WWabs2000_WI_ALS2000 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2000_WI_ALS2000<-WWabs2000_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2000_WI_ALS2000<-select(WWabs2000_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2000_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2000_WI_ALS2000.csv")

#WW absence data from 2001 at Wilderness I with 2000 LAS
WWabs2001_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_abs_2001_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2001_WI_ALS2000<-WWabs2001_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2001_WI_ALS2000<-WWabs2001_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWabs2001_WI_ALS2000<-WWabs2001_WI_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
WWabs2001_WI_ALS2000<-WWabs2001_WI_ALS2000 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2001_WI_ALS2000<-WWabs2001_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2001_WI_ALS2000<-select(WWabs2001_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2001_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2001_WI_ALS2000.csv")

#WW absence data from 2002 at Wilderness I with 2000 LAS
WWabs2002_WI_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_abs_2002_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2002_WI_ALS2000<-WWabs2002_WI_ALS2000 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2002_WI_ALS2000<-WWabs2002_WI_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWabs2002_WI_ALS2000<-WWabs2002_WI_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
WWabs2002_WI_ALS2000<-WWabs2002_WI_ALS2000 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2002_WI_ALS2000<-WWabs2002_WI_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2002_WI_ALS2000<-select(WWabs2002_WI_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2002_WI_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2002_WI_ALS2000.csv")

#WW absence data from 2005 at Wilderness I with 2005 LAS
WWabs2005_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_abs_2005_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2005_WI_ALS2005<-WWabs2005_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2005_WI_ALS2005<-WWabs2005_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWabs2005_WI_ALS2005<-WWabs2005_WI_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
WWabs2005_WI_ALS2005<-WWabs2005_WI_ALS2005 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2005_WI_ALS2005<-WWabs2005_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2005_WI_ALS2005<-select(WWabs2005_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2005_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2005_WI_ALS2005.csv")

#WW absence data from 2006 at Wilderness I with 2005 LAS
WWabs2006_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_abs_2006_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2006_WI_ALS2005<-WWabs2006_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2006_WI_ALS2005<-WWabs2006_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWabs2006_WI_ALS2005<-WWabs2006_WI_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
WWabs2006_WI_ALS2005<-WWabs2006_WI_ALS2005 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2006_WI_ALS2005<-WWabs2006_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2006_WI_ALS2005<-select(WWabs2006_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2006_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2006_WI_ALS2005.csv")

#WW absence data from 2007 at Wilderness I with 2005 LAS
WWabs2007_WI_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_abs_2007_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2007_WI_ALS2005<-WWabs2007_WI_ALS2005 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2007_WI_ALS2005<-WWabs2007_WI_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWabs2007_WI_ALS2005<-WWabs2007_WI_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
WWabs2007_WI_ALS2005<-WWabs2007_WI_ALS2005 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2007_WI_ALS2005<-WWabs2007_WI_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2007_WI_ALS2005<-select(WWabs2007_WI_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2007_WI_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2007_WI_ALS2005.csv")

#WW absence data from 2012 at Wilderness I with 2012 LAS
#no data 
# WWabs2012_WI_ALS2012 <- 
#  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_abs_2012_WI))
# #add four columns: site, ALS year, bird survey year, bird species
# WWabs2012_WI_ALS2012<-WWabs2012_WI_ALS2012 %>%
# mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
# WWabs2012_WI_ALS2012<-WWabs2012_WI_ALS2012 %>%
# mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
# WWabs2012_WI_ALS2012<-WWabs2012_WI_ALS2012 %>%
# mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
# WWabs2012_WI_ALS2012<-WWabs2012_WI_ALS2012 %>%
# mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
# WWabs2012_WI_ALS2012<-WWabs2012_WI_ALS2012 %>% 
# mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWabs2012_WI_ALS2012<-select(WWabs2012_WI_ALS2012, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWabs2012_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2012_WI_ALS2012.csv")

#WW absence data from 2013 at Wilderness I with 2012 LAS
WWabs2013_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_abs_2013_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2013_WI_ALS2012<-WWabs2013_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2013_WI_ALS2012<-WWabs2013_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWabs2013_WI_ALS2012<-WWabs2013_WI_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
WWabs2013_WI_ALS2012<-WWabs2013_WI_ALS2012 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2013_WI_ALS2012<-WWabs2013_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2013_WI_ALS2012<-select(WWabs2013_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2013_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2013_WI_ALS2012.csv")

#WW absence data from 2014 at Wilderness I with 2012 LAS
WWabs2014_WI_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_abs_2014_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2014_WI_ALS2012<-WWabs2014_WI_ALS2012 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2014_WI_ALS2012<-WWabs2014_WI_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWabs2014_WI_ALS2012<-WWabs2014_WI_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
WWabs2014_WI_ALS2012<-WWabs2014_WI_ALS2012 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2014_WI_ALS2012<-WWabs2014_WI_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2014_WI_ALS2012<-select(WWabs2014_WI_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2014_WI_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2014_WI_ALS2012.csv")

#WW absence data from 2015 at Wilderness I with 2015 LAS
WWabs2015_WI_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_abs_2015_WI))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2015_WI_ALS2015<-WWabs2015_WI_ALS2015 %>%
  mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
WWabs2015_WI_ALS2015<-WWabs2015_WI_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWabs2015_WI_ALS2015<-WWabs2015_WI_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
WWabs2015_WI_ALS2015<-WWabs2015_WI_ALS2015 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2015_WI_ALS2015<-WWabs2015_WI_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2015_WI_ALS2015<-select(WWabs2015_WI_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2015_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2015_WI_ALS2015.csv")

#WW absence data from 2016 at Wilderness I with 2015 LAS
#no data
# WWabs2016_WI_ALS2015 <- 
#  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_abs_2016_WI))
# #add four columns: site, ALS year, bird survey year, bird species
# WWabs2016_WI_ALS2015<-WWabs2016_WI_ALS2015 %>%
#   mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
# WWabs2016_WI_ALS2015<-WWabs2016_WI_ALS2015 %>%
#   mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
# WWabs2016_WI_ALS2015<-WWabs2016_WI_ALS2015 %>%
#   mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
# WWabs2016_WI_ALS2015<-WWabs2016_WI_ALS2015 %>%
#   mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
# WWabs2016_WI_ALS2015<-WWabs2016_WI_ALS2015 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWabs2016_WI_ALS2015<-select(WWabs2016_WI_ALS2015, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWabs2016_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2016_WI_ALS2015.csv")

#WW absence data from 2017 at Wilderness I with 2015 LAS
#no data
# WWabs2017_WI_ALS2015 <-
#  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_abs_2017_WI))
# #add four columns: site, ALS year, bird survey year, bird species
# WWabs2017_WI_ALS2015<-WWabs2017_WI_ALS2015 %>%
#   mutate(site = "Wilderness I")%>% select(site, everything())#add column for site
# WWabs2017_WI_ALS2015<-WWabs2017_WI_ALS2015 %>%
#   mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
# WWabs2017_WI_ALS2015<-WWabs2017_WI_ALS2015 %>%
#   mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
# WWabs2017_WI_ALS2015<-WWabs2017_WI_ALS2015 %>%
#   mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
# WWabs2017_WI_ALS2015<-WWabs2017_WI_ALS2015 %>%
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWabs2017_WI_ALS2015<-select(WWabs2017_WI_ALS2015, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWabs2017_WI_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2017_WI_ALS2015.csv")

####ABSENCE####
#####Wilderness II####
####BT####

#BT absence data from 2000 at Wilderness II with 2000 LAS
#no data
# BTabs2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_abs_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# BTabs2000_WII_ALS2000<-BTabs2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# BTabs2000_WII_ALS2000<-BTabs2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# BTabs2000_WII_ALS2000<-BTabs2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# BTabs2000_WII_ALS2000<-BTabs2000_WII_ALS2000 %>%
#   mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
# BTabs2000_WII_ALS2000<-BTabs2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# BTabs2000_WII_ALS2000<-select(BTabs2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(BTabs2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2000_WII_ALS2000.csv")

#BT absence data from 2001 at Wilderness II with 2000 LAS
BTabs2001_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_abs_2001_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2001_WII_ALS2000<-BTabs2001_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2001_WII_ALS2000<-BTabs2001_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTabs2001_WII_ALS2000<-BTabs2001_WII_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
BTabs2001_WII_ALS2000<-BTabs2001_WII_ALS2000 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2001_WII_ALS2000<-BTabs2001_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2001_WII_ALS2000<-select(BTabs2001_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2001_WII_ALS2000.csv")

#BT absence data from 2002 at Wilderness II with 2000 LAS
BTabs2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), BT_abs_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2002_WII_ALS2000<-BTabs2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2002_WII_ALS2000<-BTabs2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
BTabs2002_WII_ALS2000<-BTabs2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
BTabs2002_WII_ALS2000<-BTabs2002_WII_ALS2000 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2002_WII_ALS2000<-BTabs2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2002_WII_ALS2000<-select(BTabs2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2002_WII_ALS2000.csv")

#BT absence data from 2005 at Wilderness II with 2005 LAS
BTabs2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_abs_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2005_WII_ALS2005<-BTabs2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2005_WII_ALS2005<-BTabs2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTabs2005_WII_ALS2005<-BTabs2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
BTabs2005_WII_ALS2005<-BTabs2005_WII_ALS2005 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2005_WII_ALS2005<-BTabs2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2005_WII_ALS2005<-select(BTabs2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2005_WII_ALS2005.csv")

#BT absence data from 2006 at Wilderness II with 2005 LAS
BTabs2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_abs_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2006_WII_ALS2005<-BTabs2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2006_WII_ALS2005<-BTabs2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTabs2006_WII_ALS2005<-BTabs2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
BTabs2006_WII_ALS2005<-BTabs2006_WII_ALS2005 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2006_WII_ALS2005<-BTabs2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2006_WII_ALS2005<-select(BTabs2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2006_WII_ALS2005.csv")

#BT absence data from 2007 at Wilderness II with 2005 LAS
BTabs2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), BT_abs_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2007_WII_ALS2005<-BTabs2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2007_WII_ALS2005<-BTabs2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
BTabs2007_WII_ALS2005<-BTabs2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
BTabs2007_WII_ALS2005<-BTabs2007_WII_ALS2005 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2007_WII_ALS2005<-BTabs2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2007_WII_ALS2005<-select(BTabs2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2007_WII_ALS2005.csv")

#BT absence data from 2012 at Wilderness II with 2012 LAS
BTabs2012_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_abs_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2012_WII_ALS2012<-BTabs2012_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2012_WII_ALS2012<-BTabs2012_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTabs2012_WII_ALS2012<-BTabs2012_WII_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
BTabs2012_WII_ALS2012<-BTabs2012_WII_ALS2012 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2012_WII_ALS2012<-BTabs2012_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2012_WII_ALS2012<-select(BTabs2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2012_WII_ALS2012.csv")

#BT absence data from 2013 at Wilderness II with 2012 LAS
BTabs2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_abs_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2013_WII_ALS2012<-BTabs2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2013_WII_ALS2012<-BTabs2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTabs2013_WII_ALS2012<-BTabs2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
BTabs2013_WII_ALS2012<-BTabs2013_WII_ALS2012 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2013_WII_ALS2012<-BTabs2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2013_WII_ALS2012<-select(BTabs2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2013_WII_ALS2012.csv")

#BT absence data from 2014 at Wilderness II with 2012 LAS
BTabs2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), BT_abs_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2014_WII_ALS2012<-BTabs2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2014_WII_ALS2012<-BTabs2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
BTabs2014_WII_ALS2012<-BTabs2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
BTabs2014_WII_ALS2012<-BTabs2014_WII_ALS2012 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2014_WII_ALS2012<-BTabs2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2014_WII_ALS2012<-select(BTabs2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2014_WII_ALS2012.csv")

#BT absence data from 2015 at Wilderness II with 2015 LAS
BTabs2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_abs_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2015_WII_ALS2015<-BTabs2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2015_WII_ALS2015<-BTabs2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTabs2015_WII_ALS2015<-BTabs2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
BTabs2015_WII_ALS2015<-BTabs2015_WII_ALS2015 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2015_WII_ALS2015<-BTabs2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2015_WII_ALS2015<-select(BTabs2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2015_WII_ALS2015.csv")

#BT absence data from 2016 at Wilderness II with 2015 LAS
BTabs2016_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_abs_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2016_WII_ALS2015<-BTabs2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2016_WII_ALS2015<-BTabs2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTabs2016_WII_ALS2015<-BTabs2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
BTabs2016_WII_ALS2015<-BTabs2016_WII_ALS2015 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2016_WII_ALS2015<-BTabs2016_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2016_WII_ALS2015<-select(BTabs2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2016_WII_ALS2015.csv")

#BT absence data from 2017 at Wilderness II with 2015 LAS
BTabs2017_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), BT_abs_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
BTabs2017_WII_ALS2015<-BTabs2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
BTabs2017_WII_ALS2015<-BTabs2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
BTabs2017_WII_ALS2015<-BTabs2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
BTabs2017_WII_ALS2015<-BTabs2017_WII_ALS2015 %>%
  mutate(species = "BT_absence")%>% select(species, everything())#add column for bird species
BTabs2017_WII_ALS2015<-BTabs2017_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
BTabs2017_WII_ALS2015<-select(BTabs2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(BTabs2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/BTabs2017_WII_ALS2015.csv")

####CC####

#CC absence data from 2000 at Wilderness II with 2000 LAS
#no data
# CCabs2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_abs_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# CCabs2000_WII_ALS2000<-CCabs2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# CCabs2000_WII_ALS2000<-CCabs2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# CCabs2000_WII_ALS2000<-CCabs2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# CCabs2000_WII_ALS2000<-CCabs2000_WII_ALS2000 %>%
#   mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
# CCabs2000_WII_ALS2000<-CCabs2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# CCabs2000_WII_ALS2000<-select(CCabs2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(CCabs2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2000_WII_ALS2000.csv")

#CC absence data from 2001 at Wilderness II with 2000 LAS
#no data
# CCabs2001_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_abs_2001_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# CCabs2001_WII_ALS2000<-CCabs2001_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# CCabs2001_WII_ALS2000<-CCabs2001_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# CCabs2001_WII_ALS2000<-CCabs2001_WII_ALS2000 %>%
#   mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
# CCabs2001_WII_ALS2000<-CCabs2001_WII_ALS2000 %>%
#   mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
# CCabs2001_WII_ALS2000<-CCabs2001_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# CCabs2001_WII_ALS2000<-select(CCabs2001_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(CCabs2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2001_WII_ALS2000.csv")

#CC absence data from 2002 at Wilderness II with 2000 LAS
CCabs2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CC_abs_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2002_WII_ALS2000<-CCabs2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2002_WII_ALS2000<-CCabs2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CCabs2002_WII_ALS2000<-CCabs2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CCabs2002_WII_ALS2000<-CCabs2002_WII_ALS2000 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2002_WII_ALS2000<-CCabs2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2002_WII_ALS2000<-select(CCabs2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2002_WII_ALS2000.csv")

#CC absence data from 2005 at Wilderness II with 2005 LAS
CCabs2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_abs_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2005_WII_ALS2005<-CCabs2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2005_WII_ALS2005<-CCabs2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCabs2005_WII_ALS2005<-CCabs2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CCabs2005_WII_ALS2005<-CCabs2005_WII_ALS2005 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2005_WII_ALS2005<-CCabs2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2005_WII_ALS2005<-select(CCabs2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2005_WII_ALS2005.csv")

#CC absence data from 2006 at Wilderness II with 2005 LAS
CCabs2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_abs_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2006_WII_ALS2005<-CCabs2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2006_WII_ALS2005<-CCabs2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCabs2006_WII_ALS2005<-CCabs2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CCabs2006_WII_ALS2005<-CCabs2006_WII_ALS2005 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2006_WII_ALS2005<-CCabs2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2006_WII_ALS2005<-select(CCabs2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2006_WII_ALS2005.csv")

#CC absence data from 2007 at Wilderness II with 2005 LAS
CCabs2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CC_abs_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2007_WII_ALS2005<-CCabs2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2007_WII_ALS2005<-CCabs2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CCabs2007_WII_ALS2005<-CCabs2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CCabs2007_WII_ALS2005<-CCabs2007_WII_ALS2005 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2007_WII_ALS2005<-CCabs2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2007_WII_ALS2005<-select(CCabs2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2007_WII_ALS2005.csv")

#CC absence data from 2012 at Wilderness II with 2012 LAS
CCabs2012_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_abs_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2012_WII_ALS2012<-CCabs2012_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2012_WII_ALS2012<-CCabs2012_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCabs2012_WII_ALS2012<-CCabs2012_WII_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CCabs2012_WII_ALS2012<-CCabs2012_WII_ALS2012 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2012_WII_ALS2012<-CCabs2012_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2012_WII_ALS2012<-select(CCabs2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2012_WII_ALS2012.csv")

#CC absence data from 2013 at Wilderness II with 2012 LAS
CCabs2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_abs_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2013_WII_ALS2012<-CCabs2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2013_WII_ALS2012<-CCabs2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCabs2013_WII_ALS2012<-CCabs2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CCabs2013_WII_ALS2012<-CCabs2013_WII_ALS2012 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2013_WII_ALS2012<-CCabs2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2013_WII_ALS2012<-select(CCabs2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2013_WII_ALS2012.csv")

#CC absence data from 2014 at Wilderness II with 2012 LAS
CCabs2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CC_abs_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2014_WII_ALS2012<-CCabs2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2014_WII_ALS2012<-CCabs2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CCabs2014_WII_ALS2012<-CCabs2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CCabs2014_WII_ALS2012<-CCabs2014_WII_ALS2012 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2014_WII_ALS2012<-CCabs2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2014_WII_ALS2012<-select(CCabs2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2014_WII_ALS2012.csv")

#CC absence data from 2015 at Wilderness II with 2015 LAS
CCabs2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_abs_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2015_WII_ALS2015<-CCabs2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2015_WII_ALS2015<-CCabs2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCabs2015_WII_ALS2015<-CCabs2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CCabs2015_WII_ALS2015<-CCabs2015_WII_ALS2015 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2015_WII_ALS2015<-CCabs2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2015_WII_ALS2015<-select(CCabs2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2015_WII_ALS2015.csv")

#CC absence data from 2016 at Wilderness II with 2015 LAS
CCabs2016_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_abs_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2016_WII_ALS2015<-CCabs2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2016_WII_ALS2015<-CCabs2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCabs2016_WII_ALS2015<-CCabs2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CCabs2016_WII_ALS2015<-CCabs2016_WII_ALS2015 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2016_WII_ALS2015<-CCabs2016_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2016_WII_ALS2015<-select(CCabs2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2016_WII_ALS2015.csv")

#CC absence data from 2017 at Wilderness II with 2015 LAS
CCabs2017_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CC_abs_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
CCabs2017_WII_ALS2015<-CCabs2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CCabs2017_WII_ALS2015<-CCabs2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CCabs2017_WII_ALS2015<-CCabs2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CCabs2017_WII_ALS2015<-CCabs2017_WII_ALS2015 %>%
  mutate(species = "CC_absence")%>% select(species, everything())#add column for bird species
CCabs2017_WII_ALS2015<-CCabs2017_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CCabs2017_WII_ALS2015<-select(CCabs2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CCabs2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CCabs2017_WII_ALS2015.csv")

####CH####

#CH absence data from 2000 at Wilderness II with 2000 LAS
#no data
# CHabs2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_abs_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# CHabs2000_WII_ALS2000<-CHabs2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# CHabs2000_WII_ALS2000<-CHabs2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# CHabs2000_WII_ALS2000<-CHabs2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# CHabs2000_WII_ALS2000<-CHabs2000_WII_ALS2000 %>%
#   mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
# CHabs2000_WII_ALS2000<-CHabs2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# CHabs2000_WII_ALS2000<-select(CHabs2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(CHabs2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2000_WII_ALS2000.csv")

#CH absence data from 2001 at Wilderness II with 2000 LAS
CHabs2001_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_abs_2001_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2001_WII_ALS2000<-CHabs2001_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2001_WII_ALS2000<-CHabs2001_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHabs2001_WII_ALS2000<-CHabs2001_WII_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
CHabs2001_WII_ALS2000<-CHabs2001_WII_ALS2000 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2001_WII_ALS2000<-CHabs2001_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2001_WII_ALS2000<-select(CHabs2001_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2001_WII_ALS2000.csv")

#CH absence data from 2002 at Wilderness II with 2000 LAS
CHabs2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), CH_abs_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2002_WII_ALS2000<-CHabs2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2002_WII_ALS2000<-CHabs2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
CHabs2002_WII_ALS2000<-CHabs2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
CHabs2002_WII_ALS2000<-CHabs2002_WII_ALS2000 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2002_WII_ALS2000<-CHabs2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2002_WII_ALS2000<-select(CHabs2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2002_WII_ALS2000.csv")

#CH absence data from 2005 at Wilderness II with 2005 LAS
CHabs2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_abs_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2005_WII_ALS2005<-CHabs2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2005_WII_ALS2005<-CHabs2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHabs2005_WII_ALS2005<-CHabs2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
CHabs2005_WII_ALS2005<-CHabs2005_WII_ALS2005 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2005_WII_ALS2005<-CHabs2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2005_WII_ALS2005<-select(CHabs2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2005_WII_ALS2005.csv")

#CH absence data from 2006 at Wilderness II with 2005 LAS
CHabs2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_abs_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2006_WII_ALS2005<-CHabs2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2006_WII_ALS2005<-CHabs2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHabs2006_WII_ALS2005<-CHabs2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
CHabs2006_WII_ALS2005<-CHabs2006_WII_ALS2005 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2006_WII_ALS2005<-CHabs2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2006_WII_ALS2005<-select(CHabs2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2006_WII_ALS2005.csv")

#CH absence data from 2007 at Wilderness II with 2005 LAS
CHabs2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), CH_abs_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2007_WII_ALS2005<-CHabs2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2007_WII_ALS2005<-CHabs2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
CHabs2007_WII_ALS2005<-CHabs2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
CHabs2007_WII_ALS2005<-CHabs2007_WII_ALS2005 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2007_WII_ALS2005<-CHabs2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2007_WII_ALS2005<-select(CHabs2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2007_WII_ALS2005.csv")

#CH absence data from 2012 at Wilderness II with 2012 LAS
CHabs2012_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_abs_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2012_WII_ALS2012<-CHabs2012_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2012_WII_ALS2012<-CHabs2012_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHabs2012_WII_ALS2012<-CHabs2012_WII_ALS2012 %>%
  mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
CHabs2012_WII_ALS2012<-CHabs2012_WII_ALS2012 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2012_WII_ALS2012<-CHabs2012_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2012_WII_ALS2012<-select(CHabs2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2012_WII_ALS2012.csv")

#CH absence data from 2013 at Wilderness II with 2012 LAS
CHabs2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_abs_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2013_WII_ALS2012<-CHabs2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2013_WII_ALS2012<-CHabs2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHabs2013_WII_ALS2012<-CHabs2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
CHabs2013_WII_ALS2012<-CHabs2013_WII_ALS2012 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2013_WII_ALS2012<-CHabs2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2013_WII_ALS2012<-select(CHabs2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2013_WII_ALS2012.csv")

#CH absence data from 2014 at Wilderness II with 2012 LAS
CHabs2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), CH_abs_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2014_WII_ALS2012<-CHabs2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2014_WII_ALS2012<-CHabs2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
CHabs2014_WII_ALS2012<-CHabs2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
CHabs2014_WII_ALS2012<-CHabs2014_WII_ALS2012 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2014_WII_ALS2012<-CHabs2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2014_WII_ALS2012<-select(CHabs2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2014_WII_ALS2012.csv")

#CH absence data from 2015 at Wilderness II with 2015 LAS
CHabs2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_abs_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2015_WII_ALS2015<-CHabs2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2015_WII_ALS2015<-CHabs2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHabs2015_WII_ALS2015<-CHabs2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
CHabs2015_WII_ALS2015<-CHabs2015_WII_ALS2015 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2015_WII_ALS2015<-CHabs2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2015_WII_ALS2015<-select(CHabs2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2015_WII_ALS2015.csv")

#CH absence data from 2016 at Wilderness II with 2015 LAS
CHabs2016_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_abs_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2016_WII_ALS2015<-CHabs2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2016_WII_ALS2015<-CHabs2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHabs2016_WII_ALS2015<-CHabs2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
CHabs2016_WII_ALS2015<-CHabs2016_WII_ALS2015 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2016_WII_ALS2015<-CHabs2016_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2016_WII_ALS2015<-select(CHabs2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2016_WII_ALS2015.csv")

#CH absence data from 2017 at Wilderness II with 2015 LAS
CHabs2017_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), CH_abs_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
CHabs2017_WII_ALS2015<-CHabs2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
CHabs2017_WII_ALS2015<-CHabs2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
CHabs2017_WII_ALS2015<-CHabs2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
CHabs2017_WII_ALS2015<-CHabs2017_WII_ALS2015 %>%
  mutate(species = "CH_absence")%>% select(species, everything())#add column for bird species
CHabs2017_WII_ALS2015<-CHabs2017_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
CHabs2017_WII_ALS2015<-select(CHabs2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(CHabs2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/CHabs2017_WII_ALS2015.csv")

####WW####

#WW absence data from 2000 at Wilderness II with 2000 LAS
#no data
# WWabs2000_WII_ALS2000 <- 
#   as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_abs_2000_WII))
# #add four columns: site, ALS year, bird survey year, bird species
# WWabs2000_WII_ALS2000<-WWabs2000_WII_ALS2000 %>%
#   mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
# WWabs2000_WII_ALS2000<-WWabs2000_WII_ALS2000 %>%
#   mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
# WWabs2000_WII_ALS2000<-WWabs2000_WII_ALS2000 %>%
#   mutate(bird_year = "2000")%>% select(bird_year, everything())#add column for bird survey year
# WWabs2000_WII_ALS2000<-WWabs2000_WII_ALS2000 %>%
#   mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
# WWabs2000_WII_ALS2000<-WWabs2000_WII_ALS2000 %>% 
#   mutate(ID = row_number()) %>% select(ID, everything())#add plot number
# WWabs2000_WII_ALS2000<-select(WWabs2000_WII_ALS2000, -c(geometry)) #remove geometry column
# #write it
# write.csv(WWabs2000_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2000_WII_ALS2000.csv")

#WW absence data from 2001 at Wilderness II with 2000 LAS
WWabs2001_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_abs_2001_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2001_WII_ALS2000<-WWabs2001_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2001_WII_ALS2000<-WWabs2001_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWabs2001_WII_ALS2000<-WWabs2001_WII_ALS2000 %>%
  mutate(bird_year = "2001")%>% select(bird_year, everything())#add column for bird survey year
WWabs2001_WII_ALS2000<-WWabs2001_WII_ALS2000 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2001_WII_ALS2000<-WWabs2001_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2001_WII_ALS2000<-select(WWabs2001_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2001_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2001_WII_ALS2000.csv")

#WW absence data from 2002 at Wilderness II with 2000 LAS
WWabs2002_WII_ALS2000 <- 
  as.data.frame(polygon_metrics(normALS2000, func = ~metrics(Z,ReturnNumber), WW_abs_2002_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2002_WII_ALS2000<-WWabs2002_WII_ALS2000 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2002_WII_ALS2000<-WWabs2002_WII_ALS2000 %>%
  mutate(ALS_year = "2000")%>% select(ALS_year, everything())#add column for ALS year
WWabs2002_WII_ALS2000<-WWabs2002_WII_ALS2000 %>%
  mutate(bird_year = "2002")%>% select(bird_year, everything())#add column for bird survey year
WWabs2002_WII_ALS2000<-WWabs2002_WII_ALS2000 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2002_WII_ALS2000<-WWabs2002_WII_ALS2000 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2002_WII_ALS2000<-select(WWabs2002_WII_ALS2000, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2002_WII_ALS2000, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2002_WII_ALS2000.csv")

#WW absence data from 2005 at Wilderness II with 2005 LAS
WWabs2005_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_abs_2005_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2005_WII_ALS2005<-WWabs2005_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2005_WII_ALS2005<-WWabs2005_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWabs2005_WII_ALS2005<-WWabs2005_WII_ALS2005 %>%
  mutate(bird_year = "2005")%>% select(bird_year, everything())#add column for bird survey year
WWabs2005_WII_ALS2005<-WWabs2005_WII_ALS2005 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2005_WII_ALS2005<-WWabs2005_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2005_WII_ALS2005<-select(WWabs2005_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2005_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2005_WII_ALS2005.csv")

#WW absence data from 2006 at Wilderness II with 2005 LAS
WWabs2006_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_abs_2006_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2006_WII_ALS2005<-WWabs2006_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2006_WII_ALS2005<-WWabs2006_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWabs2006_WII_ALS2005<-WWabs2006_WII_ALS2005 %>%
  mutate(bird_year = "2006")%>% select(bird_year, everything())#add column for bird survey year
WWabs2006_WII_ALS2005<-WWabs2006_WII_ALS2005 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2006_WII_ALS2005<-WWabs2006_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2006_WII_ALS2005<-select(WWabs2006_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2006_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2006_WII_ALS2005.csv")

#WW absence data from 2007 at Wilderness II with 2005 LAS
WWabs2007_WII_ALS2005 <- 
  as.data.frame(polygon_metrics(normALS2005, func = ~metrics(Z,ReturnNumber), WW_abs_2007_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2007_WII_ALS2005<-WWabs2007_WII_ALS2005 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2007_WII_ALS2005<-WWabs2007_WII_ALS2005 %>%
  mutate(ALS_year = "2005")%>% select(ALS_year, everything())#add column for ALS year
WWabs2007_WII_ALS2005<-WWabs2007_WII_ALS2005 %>%
  mutate(bird_year = "2007")%>% select(bird_year, everything())#add column for bird survey year
WWabs2007_WII_ALS2005<-WWabs2007_WII_ALS2005 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2007_WII_ALS2005<-WWabs2007_WII_ALS2005 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2007_WII_ALS2005<-select(WWabs2007_WII_ALS2005, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2007_WII_ALS2005, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2007_WII_ALS2005.csv")

#WW absence data from 2012 at Wilderness II with 2012 LAS
WWabs2012_WII_ALS2012 <- 
 as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_abs_2012_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2012_WII_ALS2012<-WWabs2012_WII_ALS2012 %>%
mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2012_WII_ALS2012<-WWabs2012_WII_ALS2012 %>%
mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWabs2012_WII_ALS2012<-WWabs2012_WII_ALS2012 %>%
mutate(bird_year = "2012")%>% select(bird_year, everything())#add column for bird survey year
WWabs2012_WII_ALS2012<-WWabs2012_WII_ALS2012 %>%
mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2012_WII_ALS2012<-WWabs2012_WII_ALS2012 %>%
mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2012_WII_ALS2012<-select(WWabs2012_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2012_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2012_WII_ALS2012.csv")

#WW absence data from 2013 at Wilderness II with 2012 LAS
WWabs2013_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_abs_2013_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2013_WII_ALS2012<-WWabs2013_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2013_WII_ALS2012<-WWabs2013_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWabs2013_WII_ALS2012<-WWabs2013_WII_ALS2012 %>%
  mutate(bird_year = "2013")%>% select(bird_year, everything())#add column for bird survey year
WWabs2013_WII_ALS2012<-WWabs2013_WII_ALS2012 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2013_WII_ALS2012<-WWabs2013_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2013_WII_ALS2012<-select(WWabs2013_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2013_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2013_WII_ALS2012.csv")

#WW absence data from 2014 at Wilderness II with 2012 LAS
WWabs2014_WII_ALS2012 <- 
  as.data.frame(polygon_metrics(normALS2012, func = ~metrics(Z,ReturnNumber), WW_abs_2014_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2014_WII_ALS2012<-WWabs2014_WII_ALS2012 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2014_WII_ALS2012<-WWabs2014_WII_ALS2012 %>%
  mutate(ALS_year = "2012")%>% select(ALS_year, everything())#add column for ALS year
WWabs2014_WII_ALS2012<-WWabs2014_WII_ALS2012 %>%
  mutate(bird_year = "2014")%>% select(bird_year, everything())#add column for bird survey year
WWabs2014_WII_ALS2012<-WWabs2014_WII_ALS2012 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2014_WII_ALS2012<-WWabs2014_WII_ALS2012 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2014_WII_ALS2012<-select(WWabs2014_WII_ALS2012, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2014_WII_ALS2012, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2014_WII_ALS2012.csv")

#WW absence data from 2015 at Wilderness II with 2015 LAS
WWabs2015_WII_ALS2015 <- 
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_abs_2015_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2015_WII_ALS2015<-WWabs2015_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2015_WII_ALS2015<-WWabs2015_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWabs2015_WII_ALS2015<-WWabs2015_WII_ALS2015 %>%
  mutate(bird_year = "2015")%>% select(bird_year, everything())#add column for bird survey year
WWabs2015_WII_ALS2015<-WWabs2015_WII_ALS2015 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2015_WII_ALS2015<-WWabs2015_WII_ALS2015 %>% 
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2015_WII_ALS2015<-select(WWabs2015_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2015_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2015_WII_ALS2015.csv")

#WW absence data from 2016 at Wilderness II with 2015 LAS
WWabs2016_WII_ALS2015 <-
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_abs_2016_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2016_WII_ALS2015<-WWabs2016_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2016_WII_ALS2015<-WWabs2016_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWabs2016_WII_ALS2015<-WWabs2016_WII_ALS2015 %>%
  mutate(bird_year = "2016")%>% select(bird_year, everything())#add column for bird survey year
WWabs2016_WII_ALS2015<-WWabs2016_WII_ALS2015 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2016_WII_ALS2015<-WWabs2016_WII_ALS2015 %>%
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2016_WII_ALS2015<-select(WWabs2016_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2016_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2016_WII_ALS2015.csv")

#WW absence data from 2017 at Wilderness II with 2015 LAS
WWabs2017_WII_ALS2015 <-
  as.data.frame(polygon_metrics(normALS2015, func = ~metrics(Z,ReturnNumber), WW_abs_2017_WII))
#add four columns: site, ALS year, bird survey year, bird species
WWabs2017_WII_ALS2015<-WWabs2017_WII_ALS2015 %>%
  mutate(site = "Wilderness II")%>% select(site, everything())#add column for site
WWabs2017_WII_ALS2015<-WWabs2017_WII_ALS2015 %>%
  mutate(ALS_year = "2015")%>% select(ALS_year, everything())#add column for ALS year
WWabs2017_WII_ALS2015<-WWabs2017_WII_ALS2015 %>%
  mutate(bird_year = "2017")%>% select(bird_year, everything())#add column for bird survey year
WWabs2017_WII_ALS2015<-WWabs2017_WII_ALS2015 %>%
  mutate(species = "WW_absence")%>% select(species, everything())#add column for bird species
WWabs2017_WII_ALS2015<-WWabs2017_WII_ALS2015 %>%
  mutate(ID = row_number()) %>% select(ID, everything())#add plot number
WWabs2017_WII_ALS2015<-select(WWabs2017_WII_ALS2015, -c(geometry)) #remove geometry column
#write it
write.csv(WWabs2017_WII_ALS2015, file="D:/cambs/plotmetrics/ALS_metrics/WWabs2017_WII_ALS2015.csv")


#clean everything up and then bring in the bird data again
####bring in landsat data####

#spectral data
L5_2000_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B1_blue_toa.TIF")
L5_2000_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B2_green_toa.TIF")
L5_2000_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B3_red_toa.TIF")
L5_2000_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B4_nir_toa.TIF")
L5_2000_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B5_swir1_toa.TIF")
L5_2000_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52000_L5B7_swir2_toa.TIF")

L5_2005_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B1_blue_toa.TIF")
L5_2005_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B2_green_toa.TIF")
L5_2005_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B3_red_toa.TIF")
L5_2005_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B4_nir_toa.TIF")
L5_2005_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B5_swir1_toa.TIF")
L5_2005_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L52005_L5B7_swir2_toa.TIF")

L8_2013_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B2_blue_toa.TIF")
L8_2013_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B3_green_toa.TIF")
L8_2013_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B4_red_toa.TIF")
L8_2013_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B5_nir_toa.TIF")
L8_2013_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B6_swir1_toa.TIF")
L8_2013_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82013_L8B7_swir2_toa.TIF")

L8_2015_blue <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B2_blue_toa.TIF")
L8_2015_green <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B3_green_toa.TIF")
L8_2015_red <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B4_red_toa.TIF")
L8_2015_nir <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B5_nir_toa.TIF")
L8_2015_swir1 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B6_swir1_toa.TIF")
L8_2015_swir2 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_reflectance/L82015_L8B7_swir2_toa.TIF")

#ndvi
NDVI2000 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2000.TIF")
NDVI2005 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2005.TIF")
NDVI2013 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2013.TIF")
NDVI2015 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NDVI/NDVI2015.TIF")

#nbr
NBR2000 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2000.TIF")
NBR2005 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2005.TIF")
NBR2013 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2013.TIF")
NBR2015 <- rast("D:/cambs/R_CH3_ALSspec/Landsat_NBR/NBR2015.TIF")

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

#fix the names
names(L5_2000_blue) <- ("blue"); L5_2000_blue #rename
names(L5_2000_green) <- ("green"); L5_2000_green
names(L5_2000_red) <- ("red"); L5_2000_red
names(L5_2000_nir) <- ("nir"); L5_2000_nir
names(L5_2000_swir1) <- ("swir1"); L5_2000_swir1
names(L5_2000_swir2) <- ("swir2"); L5_2000_swir2
names(L5_2005_blue) <- ("blue"); L5_2005_blue #rename
names(L5_2005_green) <- ("green"); L5_2005_green
names(L5_2005_red) <- ("red"); L5_2005_red
names(L5_2005_nir) <- ("nir"); L5_2005_nir
names(L5_2005_swir1) <- ("swir1"); L5_2005_swir1
names(L5_2005_swir2) <- ("swir2"); L5_2005_swir2
names(L8_2013_blue) <- ("blue"); L8_2013_blue #rename
names(L8_2013_green) <- ("green"); L8_2013_green	
names(L8_2013_red) <- ("red"); L8_2013_red
names(L8_2013_nir) <- ("nir"); L8_2013_nir
names(L8_2013_swir1) <- ("swir1"); L8_2013_swir1
names(L8_2013_swir2) <- ("swir2"); L8_2013_swir2
names(L8_2015_blue) <- ("blue"); L8_2015_blue #rename
names(L8_2015_green) <- ("green"); L8_2015_green
names(L8_2015_red) <- ("red"); L8_2015_red
names(L8_2015_nir) <- ("nir"); L8_2015_nir
names(L8_2015_swir1) <- ("swir1"); L8_2015_swir1
names(L8_2015_swir2) <- ("swir2"); L8_2015_swir2
names(NDVI2000) <- ("NDVI")
names(NDVI2005) <- ("NDVI")
names(NDVI2013) <- ("NDVI")
names(NDVI2015) <- ("NDVI")
names(NBR2000) <- ("NBR")
names(NBR2005) <- ("NBR")
names(NBR2013) <- ("NBR")
names(NBR2015) <- ("NBR")


####extract from Landsat####
####PRESENCE####
###Wilderness I####

####BT####
#BT presence data from 2000 at Wilderness I with 2000 Landsat
BTpres2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2000_WI, fun=mean, weights=TRUE))
BTpres2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2000_WI_Landsat2000list<- list(BTpres2000_WI_Landsat2000_blue, BTpres2000_WI_Landsat2000_green, BTpres2000_WI_Landsat2000_red, BTpres2000_WI_Landsat2000_nir, BTpres2000_WI_Landsat2000_swir1, BTpres2000_WI_Landsat2000_swir2, BTpres2000_WI_Landsat2000_NDVI, BTpres2000_WI_Landsat2000_NBR, BTpres2000_WI_Landsat2000_TCT_brightness, BTpres2000_WI_Landsat2000_TCT_greenness, BTpres2000_WI_Landsat2000_TCT_wetness)
BTpres2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2000_WI_Landsat2000list)
BTpres2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2000_WI_Landsat2000<-BTpres2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2000_WI_Landsat2000<-BTpres2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2000_WI_Landsat2000<-BTpres2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2000_WI_Landsat2000<-BTpres2000_WI_Landsat2000 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2000_WI_Landsat2000<-BTpres2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2000_WI_landsat2000.csv")

#BT presence data from 2001 at Wilderness I with 2000 Landsat
BTpres2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2001_WI, fun=mean, weights=TRUE))
BTpres2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2001_WI_Landsat2000list<- list(BTpres2001_WI_Landsat2000_blue, BTpres2001_WI_Landsat2000_green, BTpres2001_WI_Landsat2000_red, BTpres2001_WI_Landsat2000_nir, BTpres2001_WI_Landsat2000_swir1, BTpres2001_WI_Landsat2000_swir2, BTpres2001_WI_Landsat2000_NDVI, BTpres2001_WI_Landsat2000_NBR, BTpres2001_WI_Landsat2000_TCT_brightness, BTpres2001_WI_Landsat2000_TCT_greenness, BTpres2001_WI_Landsat2000_TCT_wetness)
BTpres2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2001_WI_Landsat2000list)
BTpres2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2001_WI_Landsat2000<-BTpres2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2001_WI_Landsat2000<-BTpres2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2001_WI_Landsat2000<-BTpres2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2001_WI_Landsat2000<-BTpres2001_WI_Landsat2000 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2001_WI_Landsat2000<-BTpres2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2001_WI_landsat2000.csv")

#BT presence data from 2002 at Wilderness I with 2000 Landsat
BTpres2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2002_WI, fun=mean, weights=TRUE))
BTpres2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2002_WI_Landsat2000list<- list(BTpres2002_WI_Landsat2000_blue, BTpres2002_WI_Landsat2000_green, BTpres2002_WI_Landsat2000_red, BTpres2002_WI_Landsat2000_nir, BTpres2002_WI_Landsat2000_swir1, BTpres2002_WI_Landsat2000_swir2, BTpres2002_WI_Landsat2000_NDVI, BTpres2002_WI_Landsat2000_NBR, BTpres2002_WI_Landsat2000_TCT_brightness, BTpres2002_WI_Landsat2000_TCT_greenness, BTpres2002_WI_Landsat2000_TCT_wetness)
BTpres2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2002_WI_Landsat2000list)
BTpres2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2002_WI_Landsat2000<-BTpres2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2002_WI_Landsat2000<-BTpres2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2002_WI_Landsat2000<-BTpres2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2002_WI_Landsat2000<-BTpres2002_WI_Landsat2000 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2002_WI_Landsat2000<-BTpres2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2002_WI_landsat2000.csv")

#BT presence data from 2005 at Wilderness I with 2005 Landsat
BTpres2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2005_WI, fun=mean, weights=TRUE))
BTpres2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2005_WI_Landsat2005list<- list(BTpres2005_WI_Landsat2005_blue, BTpres2005_WI_Landsat2005_green, BTpres2005_WI_Landsat2005_red, BTpres2005_WI_Landsat2005_nir, BTpres2005_WI_Landsat2005_swir1, BTpres2005_WI_Landsat2005_swir2, BTpres2005_WI_Landsat2005_NDVI, BTpres2005_WI_Landsat2005_NBR, BTpres2005_WI_Landsat2005_TCT_brightness, BTpres2005_WI_Landsat2005_TCT_greenness, BTpres2005_WI_Landsat2005_TCT_wetness)
BTpres2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2005_WI_Landsat2005list)
BTpres2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2005_WI_Landsat2005<-BTpres2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2005_WI_Landsat2005<-BTpres2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2005_WI_Landsat2005<-BTpres2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2005_WI_Landsat2005<-BTpres2005_WI_Landsat2005 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2005_WI_Landsat2005<-BTpres2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2005_WI_Landsat2005.csv")

#BT presence data from 2006 at Wilderness I with 2005 Landsat
BTpres2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2006_WI, fun=mean, weights=TRUE))
BTpres2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2006_WI_Landsat2005list<- list(BTpres2006_WI_Landsat2005_blue, BTpres2006_WI_Landsat2005_green, BTpres2006_WI_Landsat2005_red, BTpres2006_WI_Landsat2005_nir, BTpres2006_WI_Landsat2005_swir1, BTpres2006_WI_Landsat2005_swir2, BTpres2006_WI_Landsat2005_NDVI, BTpres2006_WI_Landsat2005_NBR, BTpres2006_WI_Landsat2005_TCT_brightness, BTpres2006_WI_Landsat2005_TCT_greenness, BTpres2006_WI_Landsat2005_TCT_wetness)
BTpres2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2006_WI_Landsat2005list)
BTpres2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2006_WI_Landsat2005<-BTpres2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2006_WI_Landsat2005<-BTpres2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2006_WI_Landsat2005<-BTpres2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2006_WI_Landsat2005<-BTpres2006_WI_Landsat2005 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2006_WI_Landsat2005<-BTpres2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2006_WI_Landsat2005.csv")

#BT presence data from 2007 at Wilderness I with 2005 Landsat
BTpres2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2007_WI, fun=mean, weights=TRUE))
BTpres2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2007_WI_Landsat2005list<- list(BTpres2007_WI_Landsat2005_blue, BTpres2007_WI_Landsat2005_green, BTpres2007_WI_Landsat2005_red, BTpres2007_WI_Landsat2005_nir, BTpres2007_WI_Landsat2005_swir1, BTpres2007_WI_Landsat2005_swir2, BTpres2007_WI_Landsat2005_NDVI, BTpres2007_WI_Landsat2005_NBR, BTpres2007_WI_Landsat2005_TCT_brightness, BTpres2007_WI_Landsat2005_TCT_greenness, BTpres2007_WI_Landsat2005_TCT_wetness)
BTpres2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2007_WI_Landsat2005list)
BTpres2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2007_WI_Landsat2005<-BTpres2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2007_WI_Landsat2005<-BTpres2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2007_WI_Landsat2005<-BTpres2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2007_WI_Landsat2005<-BTpres2007_WI_Landsat2005 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2007_WI_Landsat2005<-BTpres2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2007_WI_Landsat2005.csv")

#BT presence data from 2012 at Wilderness I with 2013 Landsat
BTpres2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2012_WI, fun=mean, weights=TRUE))
BTpres2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2012_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2012_WI_Landsat2013list<- list(BTpres2012_WI_Landsat2013_blue, BTpres2012_WI_Landsat2013_green, BTpres2012_WI_Landsat2013_red, BTpres2012_WI_Landsat2013_nir, BTpres2012_WI_Landsat2013_swir1, BTpres2012_WI_Landsat2013_swir2, BTpres2012_WI_Landsat2013_NDVI, BTpres2012_WI_Landsat2013_NBR, BTpres2012_WI_Landsat2013_TCT_brightness, BTpres2012_WI_Landsat2013_TCT_greenness, BTpres2012_WI_Landsat2013_TCT_wetness)
BTpres2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2012_WI_Landsat2013list)
BTpres2012_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2012_WI_Landsat2013<-BTpres2012_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2012_WI_Landsat2013<-BTpres2012_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2012_WI_Landsat2013<-BTpres2012_WI_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2012_WI_Landsat2013<-BTpres2012_WI_Landsat2013 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2012_WI_Landsat2013<-BTpres2012_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2012_WI_Landsat2013.csv")

#BT presence data from 2013 at Wilderness I with 2013 Landsat
BTpres2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2013_WI, fun=mean, weights=TRUE))
BTpres2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2013_WI_Landsat2013list<- list(BTpres2013_WI_Landsat2013_blue, BTpres2013_WI_Landsat2013_green, BTpres2013_WI_Landsat2013_red, BTpres2013_WI_Landsat2013_nir, BTpres2013_WI_Landsat2013_swir1, BTpres2013_WI_Landsat2013_swir2, BTpres2013_WI_Landsat2013_NDVI, BTpres2013_WI_Landsat2013_NBR, BTpres2013_WI_Landsat2013_TCT_brightness, BTpres2013_WI_Landsat2013_TCT_greenness, BTpres2013_WI_Landsat2013_TCT_wetness)
BTpres2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2013_WI_Landsat2013list)
BTpres2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2013_WI_Landsat2013<-BTpres2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2013_WI_Landsat2013<-BTpres2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2013_WI_Landsat2013<-BTpres2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2013_WI_Landsat2013<-BTpres2013_WI_Landsat2013 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2013_WI_Landsat2013<-BTpres2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2013_WI_Landsat2013.csv")

#BT presence data from 2014 at Wilderness I with 2013 Landsat
BTpres2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2014_WI, fun=mean, weights=TRUE))
BTpres2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2014_WI_Landsat2013list<- list(BTpres2014_WI_Landsat2013_blue, BTpres2014_WI_Landsat2013_green, BTpres2014_WI_Landsat2013_red, BTpres2014_WI_Landsat2013_nir, BTpres2014_WI_Landsat2013_swir1, BTpres2014_WI_Landsat2013_swir2, BTpres2014_WI_Landsat2013_NDVI, BTpres2014_WI_Landsat2013_NBR, BTpres2014_WI_Landsat2013_TCT_brightness, BTpres2014_WI_Landsat2013_TCT_greenness, BTpres2014_WI_Landsat2013_TCT_wetness)
BTpres2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2014_WI_Landsat2013list)
BTpres2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2014_WI_Landsat2013<-BTpres2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2014_WI_Landsat2013<-BTpres2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2014_WI_Landsat2013<-BTpres2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2014_WI_Landsat2013<-BTpres2014_WI_Landsat2013 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2014_WI_Landsat2013<-BTpres2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2014_WI_Landsat2013.csv")

#BT presence data from 2015 at Wilderness I with 2015 Landsat
BTpres2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_pres_2015_WI, fun=mean, weights=TRUE))
BTpres2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_pres_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2015_WI_Landsat2015list<- list(BTpres2015_WI_Landsat2015_blue, BTpres2015_WI_Landsat2015_green, BTpres2015_WI_Landsat2015_red, BTpres2015_WI_Landsat2015_nir, BTpres2015_WI_Landsat2015_swir1, BTpres2015_WI_Landsat2015_swir2, BTpres2015_WI_Landsat2015_NDVI, BTpres2015_WI_Landsat2015_NBR, BTpres2015_WI_Landsat2015_TCT_brightness, BTpres2015_WI_Landsat2015_TCT_greenness, BTpres2015_WI_Landsat2015_TCT_wetness)
BTpres2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2015_WI_Landsat2015list)
BTpres2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2015_WI_Landsat2015<-BTpres2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2015_WI_Landsat2015<-BTpres2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2015_WI_Landsat2015<-BTpres2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2015_WI_Landsat2015<-BTpres2015_WI_Landsat2015 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2015_WI_Landsat2015<-BTpres2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2015_WI_Landsat2015.csv")

#BT presence data from 2016 at Wilderness I with 2015 Landsat
BTpres2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_pres_2016_WI, fun=mean, weights=TRUE))
BTpres2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_pres_2016_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2016_WI_Landsat2015list<- list(BTpres2016_WI_Landsat2015_blue, BTpres2016_WI_Landsat2015_green, BTpres2016_WI_Landsat2015_red, BTpres2016_WI_Landsat2015_nir, BTpres2016_WI_Landsat2015_swir1, BTpres2016_WI_Landsat2015_swir2, BTpres2016_WI_Landsat2015_NDVI, BTpres2016_WI_Landsat2015_NBR, BTpres2016_WI_Landsat2015_TCT_brightness, BTpres2016_WI_Landsat2015_TCT_greenness, BTpres2016_WI_Landsat2015_TCT_wetness)
BTpres2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2016_WI_Landsat2015list)
BTpres2016_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2016_WI_Landsat2015<-BTpres2016_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2016_WI_Landsat2015<-BTpres2016_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2016_WI_Landsat2015<-BTpres2016_WI_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2016_WI_Landsat2015<-BTpres2016_WI_Landsat2015 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2016_WI_Landsat2015<-BTpres2016_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2016_WI_Landsat2015.csv")

#BT presence data from 2017 at Wilderness I with 2015 Landsat
BTpres2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_pres_2017_WI, fun=mean, weights=TRUE))
BTpres2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_pres_2017_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2017_WI_Landsat2015list<- list(BTpres2017_WI_Landsat2015_blue, BTpres2017_WI_Landsat2015_green, BTpres2017_WI_Landsat2015_red, BTpres2017_WI_Landsat2015_nir, BTpres2017_WI_Landsat2015_swir1, BTpres2017_WI_Landsat2015_swir2, BTpres2017_WI_Landsat2015_NDVI, BTpres2017_WI_Landsat2015_NBR, BTpres2017_WI_Landsat2015_TCT_brightness, BTpres2017_WI_Landsat2015_TCT_greenness, BTpres2017_WI_Landsat2015_TCT_wetness)
BTpres2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2017_WI_Landsat2015list)
BTpres2017_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2017_WI_Landsat2015<-BTpres2017_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTpres2017_WI_Landsat2015<-BTpres2017_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2017_WI_Landsat2015<-BTpres2017_WI_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2017_WI_Landsat2015<-BTpres2017_WI_Landsat2015 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2017_WI_Landsat2015<-BTpres2017_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2017_WI_Landsat2015.csv")

####CC####
#CC presence data from 2000 at Wilderness I with 2000 Landsat
CCpres2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2000_WI, fun=mean, weights=TRUE))
CCpres2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2000_WI_Landsat2000list<- list(CCpres2000_WI_Landsat2000_blue, CCpres2000_WI_Landsat2000_green, CCpres2000_WI_Landsat2000_red, CCpres2000_WI_Landsat2000_nir, CCpres2000_WI_Landsat2000_swir1, CCpres2000_WI_Landsat2000_swir2, CCpres2000_WI_Landsat2000_NDVI, CCpres2000_WI_Landsat2000_NBR, CCpres2000_WI_Landsat2000_TCT_brightness, CCpres2000_WI_Landsat2000_TCT_greenness, CCpres2000_WI_Landsat2000_TCT_wetness)
CCpres2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2000_WI_Landsat2000list)
CCpres2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2000_WI_Landsat2000<-CCpres2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2000_WI_Landsat2000<-CCpres2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2000_WI_Landsat2000<-CCpres2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2000_WI_Landsat2000<-CCpres2000_WI_Landsat2000 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2000_WI_Landsat2000<-CCpres2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2000_WI_landsat2000.csv")

#CC presence data from 2001 at Wilderness I with 2000 Landsat
CCpres2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2001_WI, fun=mean, weights=TRUE))
CCpres2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2001_WI_Landsat2000list<- list(CCpres2001_WI_Landsat2000_blue, CCpres2001_WI_Landsat2000_green, CCpres2001_WI_Landsat2000_red, CCpres2001_WI_Landsat2000_nir, CCpres2001_WI_Landsat2000_swir1, CCpres2001_WI_Landsat2000_swir2, CCpres2001_WI_Landsat2000_NDVI, CCpres2001_WI_Landsat2000_NBR, CCpres2001_WI_Landsat2000_TCT_brightness, CCpres2001_WI_Landsat2000_TCT_greenness, CCpres2001_WI_Landsat2000_TCT_wetness)
CCpres2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2001_WI_Landsat2000list)
CCpres2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2001_WI_Landsat2000<-CCpres2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2001_WI_Landsat2000<-CCpres2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2001_WI_Landsat2000<-CCpres2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2001_WI_Landsat2000<-CCpres2001_WI_Landsat2000 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2001_WI_Landsat2000<-CCpres2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2001_WI_landsat2000.csv")

#CC presence data from 2002 at Wilderness I with 2000 Landsat
CCpres2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2002_WI, fun=mean, weights=TRUE))
CCpres2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2002_WI_Landsat2000list<- list(CCpres2002_WI_Landsat2000_blue, CCpres2002_WI_Landsat2000_green, CCpres2002_WI_Landsat2000_red, CCpres2002_WI_Landsat2000_nir, CCpres2002_WI_Landsat2000_swir1, CCpres2002_WI_Landsat2000_swir2, CCpres2002_WI_Landsat2000_NDVI, CCpres2002_WI_Landsat2000_NBR, CCpres2002_WI_Landsat2000_TCT_brightness, CCpres2002_WI_Landsat2000_TCT_greenness, CCpres2002_WI_Landsat2000_TCT_wetness)
CCpres2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2002_WI_Landsat2000list)
CCpres2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2002_WI_Landsat2000<-CCpres2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2002_WI_Landsat2000<-CCpres2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2002_WI_Landsat2000<-CCpres2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2002_WI_Landsat2000<-CCpres2002_WI_Landsat2000 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2002_WI_Landsat2000<-CCpres2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2002_WI_landsat2000.csv")

#CC presence data from 2005 at Wilderness I with 2005 Landsat
CCpres2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2005_WI, fun=mean, weights=TRUE))
CCpres2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2005_WI_Landsat2005list<- list(CCpres2005_WI_Landsat2005_blue, CCpres2005_WI_Landsat2005_green, CCpres2005_WI_Landsat2005_red, CCpres2005_WI_Landsat2005_nir, CCpres2005_WI_Landsat2005_swir1, CCpres2005_WI_Landsat2005_swir2, CCpres2005_WI_Landsat2005_NDVI, CCpres2005_WI_Landsat2005_NBR, CCpres2005_WI_Landsat2005_TCT_brightness, CCpres2005_WI_Landsat2005_TCT_greenness, CCpres2005_WI_Landsat2005_TCT_wetness)
CCpres2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2005_WI_Landsat2005list)
CCpres2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2005_WI_Landsat2005<-CCpres2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2005_WI_Landsat2005<-CCpres2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2005_WI_Landsat2005<-CCpres2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2005_WI_Landsat2005<-CCpres2005_WI_Landsat2005 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2005_WI_Landsat2005<-CCpres2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2005_WI_Landsat2005.csv")

#CC presence data from 2006 at Wilderness I with 2005 Landsat
CCpres2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2006_WI, fun=mean, weights=TRUE))
CCpres2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2006_WI_Landsat2005list<- list(CCpres2006_WI_Landsat2005_blue, CCpres2006_WI_Landsat2005_green, CCpres2006_WI_Landsat2005_red, CCpres2006_WI_Landsat2005_nir, CCpres2006_WI_Landsat2005_swir1, CCpres2006_WI_Landsat2005_swir2, CCpres2006_WI_Landsat2005_NDVI, CCpres2006_WI_Landsat2005_NBR, CCpres2006_WI_Landsat2005_TCT_brightness, CCpres2006_WI_Landsat2005_TCT_greenness, CCpres2006_WI_Landsat2005_TCT_wetness)
CCpres2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2006_WI_Landsat2005list)
CCpres2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2006_WI_Landsat2005<-CCpres2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2006_WI_Landsat2005<-CCpres2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2006_WI_Landsat2005<-CCpres2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2006_WI_Landsat2005<-CCpres2006_WI_Landsat2005 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2006_WI_Landsat2005<-CCpres2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2006_WI_Landsat2005.csv")

#CC presence data from 2007 at Wilderness I with 2005 Landsat
CCpres2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2007_WI, fun=mean, weights=TRUE))
CCpres2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2007_WI_Landsat2005list<- list(CCpres2007_WI_Landsat2005_blue, CCpres2007_WI_Landsat2005_green, CCpres2007_WI_Landsat2005_red, CCpres2007_WI_Landsat2005_nir, CCpres2007_WI_Landsat2005_swir1, CCpres2007_WI_Landsat2005_swir2, CCpres2007_WI_Landsat2005_NDVI, CCpres2007_WI_Landsat2005_NBR, CCpres2007_WI_Landsat2005_TCT_brightness, CCpres2007_WI_Landsat2005_TCT_greenness, CCpres2007_WI_Landsat2005_TCT_wetness)
CCpres2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2007_WI_Landsat2005list)
CCpres2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2007_WI_Landsat2005<-CCpres2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2007_WI_Landsat2005<-CCpres2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2007_WI_Landsat2005<-CCpres2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2007_WI_Landsat2005<-CCpres2007_WI_Landsat2005 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2007_WI_Landsat2005<-CCpres2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2007_WI_Landsat2005.csv")

#CC presence data from 2012 at Wilderness I with 2013 Landsat
CCpres2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2012_WI, fun=mean, weights=TRUE))
CCpres2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2012_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2012_WI_Landsat2013list<- list(CCpres2012_WI_Landsat2013_blue, CCpres2012_WI_Landsat2013_green, CCpres2012_WI_Landsat2013_red, CCpres2012_WI_Landsat2013_nir, CCpres2012_WI_Landsat2013_swir1, CCpres2012_WI_Landsat2013_swir2, CCpres2012_WI_Landsat2013_NDVI, CCpres2012_WI_Landsat2013_NBR, CCpres2012_WI_Landsat2013_TCT_brightness, CCpres2012_WI_Landsat2013_TCT_greenness, CCpres2012_WI_Landsat2013_TCT_wetness)
CCpres2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2012_WI_Landsat2013list)
CCpres2012_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2012_WI_Landsat2013<-CCpres2012_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2012_WI_Landsat2013<-CCpres2012_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2012_WI_Landsat2013<-CCpres2012_WI_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2012_WI_Landsat2013<-CCpres2012_WI_Landsat2013 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2012_WI_Landsat2013<-CCpres2012_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2012_WI_Landsat2013.csv")

#CC presence data from 2013 at Wilderness I with 2013 Landsat
CCpres2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2013_WI, fun=mean, weights=TRUE))
CCpres2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2013_WI_Landsat2013list<- list(CCpres2013_WI_Landsat2013_blue, CCpres2013_WI_Landsat2013_green, CCpres2013_WI_Landsat2013_red, CCpres2013_WI_Landsat2013_nir, CCpres2013_WI_Landsat2013_swir1, CCpres2013_WI_Landsat2013_swir2, CCpres2013_WI_Landsat2013_NDVI, CCpres2013_WI_Landsat2013_NBR, CCpres2013_WI_Landsat2013_TCT_brightness, CCpres2013_WI_Landsat2013_TCT_greenness, CCpres2013_WI_Landsat2013_TCT_wetness)
CCpres2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2013_WI_Landsat2013list)
CCpres2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2013_WI_Landsat2013<-CCpres2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2013_WI_Landsat2013<-CCpres2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2013_WI_Landsat2013<-CCpres2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2013_WI_Landsat2013<-CCpres2013_WI_Landsat2013 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2013_WI_Landsat2013<-CCpres2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2013_WI_Landsat2013.csv")

#CC presence data from 2014 at Wilderness I with 2013 Landsat
CCpres2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2014_WI, fun=mean, weights=TRUE))
CCpres2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2014_WI_Landsat2013list<- list(CCpres2014_WI_Landsat2013_blue, CCpres2014_WI_Landsat2013_green, CCpres2014_WI_Landsat2013_red, CCpres2014_WI_Landsat2013_nir, CCpres2014_WI_Landsat2013_swir1, CCpres2014_WI_Landsat2013_swir2, CCpres2014_WI_Landsat2013_NDVI, CCpres2014_WI_Landsat2013_NBR, CCpres2014_WI_Landsat2013_TCT_brightness, CCpres2014_WI_Landsat2013_TCT_greenness, CCpres2014_WI_Landsat2013_TCT_wetness)
CCpres2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2014_WI_Landsat2013list)
CCpres2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2014_WI_Landsat2013<-CCpres2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2014_WI_Landsat2013<-CCpres2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2014_WI_Landsat2013<-CCpres2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2014_WI_Landsat2013<-CCpres2014_WI_Landsat2013 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2014_WI_Landsat2013<-CCpres2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2014_WI_Landsat2013.csv")

#CC presence data from 2015 at Wilderness I with 2015 Landsat
CCpres2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_pres_2015_WI, fun=mean, weights=TRUE))
CCpres2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_pres_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2015_WI_Landsat2015list<- list(CCpres2015_WI_Landsat2015_blue, CCpres2015_WI_Landsat2015_green, CCpres2015_WI_Landsat2015_red, CCpres2015_WI_Landsat2015_nir, CCpres2015_WI_Landsat2015_swir1, CCpres2015_WI_Landsat2015_swir2, CCpres2015_WI_Landsat2015_NDVI, CCpres2015_WI_Landsat2015_NBR, CCpres2015_WI_Landsat2015_TCT_brightness, CCpres2015_WI_Landsat2015_TCT_greenness, CCpres2015_WI_Landsat2015_TCT_wetness)
CCpres2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2015_WI_Landsat2015list)
CCpres2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2015_WI_Landsat2015<-CCpres2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2015_WI_Landsat2015<-CCpres2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2015_WI_Landsat2015<-CCpres2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2015_WI_Landsat2015<-CCpres2015_WI_Landsat2015 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2015_WI_Landsat2015<-CCpres2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2015_WI_Landsat2015.csv")

#CC presence data from 2016 at Wilderness I with 2015 Landsat
CCpres2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_pres_2016_WI, fun=mean, weights=TRUE))
CCpres2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_pres_2016_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2016_WI_Landsat2015list<- list(CCpres2016_WI_Landsat2015_blue, CCpres2016_WI_Landsat2015_green, CCpres2016_WI_Landsat2015_red, CCpres2016_WI_Landsat2015_nir, CCpres2016_WI_Landsat2015_swir1, CCpres2016_WI_Landsat2015_swir2, CCpres2016_WI_Landsat2015_NDVI, CCpres2016_WI_Landsat2015_NBR, CCpres2016_WI_Landsat2015_TCT_brightness, CCpres2016_WI_Landsat2015_TCT_greenness, CCpres2016_WI_Landsat2015_TCT_wetness)
CCpres2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2016_WI_Landsat2015list)
CCpres2016_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2016_WI_Landsat2015<-CCpres2016_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2016_WI_Landsat2015<-CCpres2016_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2016_WI_Landsat2015<-CCpres2016_WI_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2016_WI_Landsat2015<-CCpres2016_WI_Landsat2015 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2016_WI_Landsat2015<-CCpres2016_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2016_WI_Landsat2015.csv")

#CC presence data from 2017 at Wilderness I with 2015 Landsat
CCpres2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_pres_2017_WI, fun=mean, weights=TRUE))
CCpres2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_pres_2017_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2017_WI_Landsat2015list<- list(CCpres2017_WI_Landsat2015_blue, CCpres2017_WI_Landsat2015_green, CCpres2017_WI_Landsat2015_red, CCpres2017_WI_Landsat2015_nir, CCpres2017_WI_Landsat2015_swir1, CCpres2017_WI_Landsat2015_swir2, CCpres2017_WI_Landsat2015_NDVI, CCpres2017_WI_Landsat2015_NBR, CCpres2017_WI_Landsat2015_TCT_brightness, CCpres2017_WI_Landsat2015_TCT_greenness, CCpres2017_WI_Landsat2015_TCT_wetness)
CCpres2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2017_WI_Landsat2015list)
CCpres2017_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2017_WI_Landsat2015<-CCpres2017_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCpres2017_WI_Landsat2015<-CCpres2017_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2017_WI_Landsat2015<-CCpres2017_WI_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2017_WI_Landsat2015<-CCpres2017_WI_Landsat2015 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2017_WI_Landsat2015<-CCpres2017_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2017_WI_Landsat2015.csv")

####CH####
#CH presence data from 2000 at Wilderness I with 2000 Landsat
CHpres2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2000_WI, fun=mean, weights=TRUE))
CHpres2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2000_WI_Landsat2000list<- list(CHpres2000_WI_Landsat2000_blue, CHpres2000_WI_Landsat2000_green, CHpres2000_WI_Landsat2000_red, CHpres2000_WI_Landsat2000_nir, CHpres2000_WI_Landsat2000_swir1, CHpres2000_WI_Landsat2000_swir2, CHpres2000_WI_Landsat2000_NDVI, CHpres2000_WI_Landsat2000_NBR, CHpres2000_WI_Landsat2000_TCT_brightness, CHpres2000_WI_Landsat2000_TCT_greenness, CHpres2000_WI_Landsat2000_TCT_wetness)
CHpres2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2000_WI_Landsat2000list)
CHpres2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2000_WI_Landsat2000<-CHpres2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2000_WI_Landsat2000<-CHpres2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2000_WI_Landsat2000<-CHpres2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2000_WI_Landsat2000<-CHpres2000_WI_Landsat2000 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2000_WI_Landsat2000<-CHpres2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2000_WI_landsat2000.csv")

#CH presence data from 2001 at Wilderness I with 2000 Landsat
CHpres2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2001_WI, fun=mean, weights=TRUE))
CHpres2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2001_WI_Landsat2000list<- list(CHpres2001_WI_Landsat2000_blue, CHpres2001_WI_Landsat2000_green, CHpres2001_WI_Landsat2000_red, CHpres2001_WI_Landsat2000_nir, CHpres2001_WI_Landsat2000_swir1, CHpres2001_WI_Landsat2000_swir2, CHpres2001_WI_Landsat2000_NDVI, CHpres2001_WI_Landsat2000_NBR, CHpres2001_WI_Landsat2000_TCT_brightness, CHpres2001_WI_Landsat2000_TCT_greenness, CHpres2001_WI_Landsat2000_TCT_wetness)
CHpres2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2001_WI_Landsat2000list)
CHpres2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2001_WI_Landsat2000<-CHpres2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2001_WI_Landsat2000<-CHpres2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2001_WI_Landsat2000<-CHpres2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2001_WI_Landsat2000<-CHpres2001_WI_Landsat2000 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2001_WI_Landsat2000<-CHpres2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2001_WI_landsat2000.csv")

#CH presence data from 2002 at Wilderness I with 2000 Landsat
CHpres2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2002_WI, fun=mean, weights=TRUE))
CHpres2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2002_WI_Landsat2000list<- list(CHpres2002_WI_Landsat2000_blue, CHpres2002_WI_Landsat2000_green, CHpres2002_WI_Landsat2000_red, CHpres2002_WI_Landsat2000_nir, CHpres2002_WI_Landsat2000_swir1, CHpres2002_WI_Landsat2000_swir2, CHpres2002_WI_Landsat2000_NDVI, CHpres2002_WI_Landsat2000_NBR, CHpres2002_WI_Landsat2000_TCT_brightness, CHpres2002_WI_Landsat2000_TCT_greenness, CHpres2002_WI_Landsat2000_TCT_wetness)
CHpres2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2002_WI_Landsat2000list)
CHpres2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2002_WI_Landsat2000<-CHpres2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2002_WI_Landsat2000<-CHpres2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2002_WI_Landsat2000<-CHpres2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2002_WI_Landsat2000<-CHpres2002_WI_Landsat2000 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2002_WI_Landsat2000<-CHpres2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2002_WI_landsat2000.csv")

#CH presence data from 2005 at Wilderness I with 2005 Landsat
CHpres2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2005_WI, fun=mean, weights=TRUE))
CHpres2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2005_WI_Landsat2005list<- list(CHpres2005_WI_Landsat2005_blue, CHpres2005_WI_Landsat2005_green, CHpres2005_WI_Landsat2005_red, CHpres2005_WI_Landsat2005_nir, CHpres2005_WI_Landsat2005_swir1, CHpres2005_WI_Landsat2005_swir2, CHpres2005_WI_Landsat2005_NDVI, CHpres2005_WI_Landsat2005_NBR, CHpres2005_WI_Landsat2005_TCT_brightness, CHpres2005_WI_Landsat2005_TCT_greenness, CHpres2005_WI_Landsat2005_TCT_wetness)
CHpres2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2005_WI_Landsat2005list)
CHpres2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2005_WI_Landsat2005<-CHpres2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2005_WI_Landsat2005<-CHpres2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2005_WI_Landsat2005<-CHpres2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2005_WI_Landsat2005<-CHpres2005_WI_Landsat2005 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2005_WI_Landsat2005<-CHpres2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2005_WI_Landsat2005.csv")

#CH presence data from 2006 at Wilderness I with 2005 Landsat
CHpres2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2006_WI, fun=mean, weights=TRUE))
CHpres2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2006_WI_Landsat2005list<- list(CHpres2006_WI_Landsat2005_blue, CHpres2006_WI_Landsat2005_green, CHpres2006_WI_Landsat2005_red, CHpres2006_WI_Landsat2005_nir, CHpres2006_WI_Landsat2005_swir1, CHpres2006_WI_Landsat2005_swir2, CHpres2006_WI_Landsat2005_NDVI, CHpres2006_WI_Landsat2005_NBR, CHpres2006_WI_Landsat2005_TCT_brightness, CHpres2006_WI_Landsat2005_TCT_greenness, CHpres2006_WI_Landsat2005_TCT_wetness)
CHpres2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2006_WI_Landsat2005list)
CHpres2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2006_WI_Landsat2005<-CHpres2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2006_WI_Landsat2005<-CHpres2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2006_WI_Landsat2005<-CHpres2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2006_WI_Landsat2005<-CHpres2006_WI_Landsat2005 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2006_WI_Landsat2005<-CHpres2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2006_WI_Landsat2005.csv")

#CH presence data from 2007 at Wilderness I with 2005 Landsat
CHpres2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2007_WI, fun=mean, weights=TRUE))
CHpres2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2007_WI_Landsat2005list<- list(CHpres2007_WI_Landsat2005_blue, CHpres2007_WI_Landsat2005_green, CHpres2007_WI_Landsat2005_red, CHpres2007_WI_Landsat2005_nir, CHpres2007_WI_Landsat2005_swir1, CHpres2007_WI_Landsat2005_swir2, CHpres2007_WI_Landsat2005_NDVI, CHpres2007_WI_Landsat2005_NBR, CHpres2007_WI_Landsat2005_TCT_brightness, CHpres2007_WI_Landsat2005_TCT_greenness, CHpres2007_WI_Landsat2005_TCT_wetness)
CHpres2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2007_WI_Landsat2005list)
CHpres2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2007_WI_Landsat2005<-CHpres2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2007_WI_Landsat2005<-CHpres2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2007_WI_Landsat2005<-CHpres2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2007_WI_Landsat2005<-CHpres2007_WI_Landsat2005 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2007_WI_Landsat2005<-CHpres2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2007_WI_Landsat2005.csv")

#CH presence data from 2012 at Wilderness I with 2013 Landsat
CHpres2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2012_WI, fun=mean, weights=TRUE))
CHpres2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2012_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2012_WI_Landsat2013list<- list(CHpres2012_WI_Landsat2013_blue, CHpres2012_WI_Landsat2013_green, CHpres2012_WI_Landsat2013_red, CHpres2012_WI_Landsat2013_nir, CHpres2012_WI_Landsat2013_swir1, CHpres2012_WI_Landsat2013_swir2, CHpres2012_WI_Landsat2013_NDVI, CHpres2012_WI_Landsat2013_NBR, CHpres2012_WI_Landsat2013_TCT_brightness, CHpres2012_WI_Landsat2013_TCT_greenness, CHpres2012_WI_Landsat2013_TCT_wetness)
CHpres2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2012_WI_Landsat2013list)
CHpres2012_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2012_WI_Landsat2013<-CHpres2012_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2012_WI_Landsat2013<-CHpres2012_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2012_WI_Landsat2013<-CHpres2012_WI_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2012_WI_Landsat2013<-CHpres2012_WI_Landsat2013 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2012_WI_Landsat2013<-CHpres2012_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2012_WI_Landsat2013.csv")

#CH presence data from 2013 at Wilderness I with 2013 Landsat
CHpres2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2013_WI, fun=mean, weights=TRUE))
CHpres2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2013_WI_Landsat2013list<- list(CHpres2013_WI_Landsat2013_blue, CHpres2013_WI_Landsat2013_green, CHpres2013_WI_Landsat2013_red, CHpres2013_WI_Landsat2013_nir, CHpres2013_WI_Landsat2013_swir1, CHpres2013_WI_Landsat2013_swir2, CHpres2013_WI_Landsat2013_NDVI, CHpres2013_WI_Landsat2013_NBR, CHpres2013_WI_Landsat2013_TCT_brightness, CHpres2013_WI_Landsat2013_TCT_greenness, CHpres2013_WI_Landsat2013_TCT_wetness)
CHpres2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2013_WI_Landsat2013list)
CHpres2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2013_WI_Landsat2013<-CHpres2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2013_WI_Landsat2013<-CHpres2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2013_WI_Landsat2013<-CHpres2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2013_WI_Landsat2013<-CHpres2013_WI_Landsat2013 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2013_WI_Landsat2013<-CHpres2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2013_WI_Landsat2013.csv")

#CH presence data from 2014 at Wilderness I with 2013 Landsat
CHpres2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2014_WI, fun=mean, weights=TRUE))
CHpres2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2014_WI_Landsat2013list<- list(CHpres2014_WI_Landsat2013_blue, CHpres2014_WI_Landsat2013_green, CHpres2014_WI_Landsat2013_red, CHpres2014_WI_Landsat2013_nir, CHpres2014_WI_Landsat2013_swir1, CHpres2014_WI_Landsat2013_swir2, CHpres2014_WI_Landsat2013_NDVI, CHpres2014_WI_Landsat2013_NBR, CHpres2014_WI_Landsat2013_TCT_brightness, CHpres2014_WI_Landsat2013_TCT_greenness, CHpres2014_WI_Landsat2013_TCT_wetness)
CHpres2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2014_WI_Landsat2013list)
CHpres2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2014_WI_Landsat2013<-CHpres2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2014_WI_Landsat2013<-CHpres2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2014_WI_Landsat2013<-CHpres2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2014_WI_Landsat2013<-CHpres2014_WI_Landsat2013 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2014_WI_Landsat2013<-CHpres2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2014_WI_Landsat2013.csv")

#CH presence data from 2015 at Wilderness I with 2015 Landsat
CHpres2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_pres_2015_WI, fun=mean, weights=TRUE))
CHpres2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_pres_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2015_WI_Landsat2015list<- list(CHpres2015_WI_Landsat2015_blue, CHpres2015_WI_Landsat2015_green, CHpres2015_WI_Landsat2015_red, CHpres2015_WI_Landsat2015_nir, CHpres2015_WI_Landsat2015_swir1, CHpres2015_WI_Landsat2015_swir2, CHpres2015_WI_Landsat2015_NDVI, CHpres2015_WI_Landsat2015_NBR, CHpres2015_WI_Landsat2015_TCT_brightness, CHpres2015_WI_Landsat2015_TCT_greenness, CHpres2015_WI_Landsat2015_TCT_wetness)
CHpres2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2015_WI_Landsat2015list)
CHpres2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2015_WI_Landsat2015<-CHpres2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2015_WI_Landsat2015<-CHpres2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2015_WI_Landsat2015<-CHpres2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2015_WI_Landsat2015<-CHpres2015_WI_Landsat2015 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2015_WI_Landsat2015<-CHpres2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2015_WI_Landsat2015.csv")

#CH presence data from 2016 at Wilderness I with 2015 Landsat
CHpres2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_pres_2016_WI, fun=mean, weights=TRUE))
CHpres2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_pres_2016_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2016_WI_Landsat2015list<- list(CHpres2016_WI_Landsat2015_blue, CHpres2016_WI_Landsat2015_green, CHpres2016_WI_Landsat2015_red, CHpres2016_WI_Landsat2015_nir, CHpres2016_WI_Landsat2015_swir1, CHpres2016_WI_Landsat2015_swir2, CHpres2016_WI_Landsat2015_NDVI, CHpres2016_WI_Landsat2015_NBR, CHpres2016_WI_Landsat2015_TCT_brightness, CHpres2016_WI_Landsat2015_TCT_greenness, CHpres2016_WI_Landsat2015_TCT_wetness)
CHpres2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2016_WI_Landsat2015list)
CHpres2016_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2016_WI_Landsat2015<-CHpres2016_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2016_WI_Landsat2015<-CHpres2016_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2016_WI_Landsat2015<-CHpres2016_WI_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2016_WI_Landsat2015<-CHpres2016_WI_Landsat2015 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2016_WI_Landsat2015<-CHpres2016_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2016_WI_Landsat2015.csv")

#CH presence data from 2017 at Wilderness I with 2015 Landsat
CHpres2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_pres_2017_WI, fun=mean, weights=TRUE))
CHpres2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_pres_2017_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2017_WI_Landsat2015list<- list(CHpres2017_WI_Landsat2015_blue, CHpres2017_WI_Landsat2015_green, CHpres2017_WI_Landsat2015_red, CHpres2017_WI_Landsat2015_nir, CHpres2017_WI_Landsat2015_swir1, CHpres2017_WI_Landsat2015_swir2, CHpres2017_WI_Landsat2015_NDVI, CHpres2017_WI_Landsat2015_NBR, CHpres2017_WI_Landsat2015_TCT_brightness, CHpres2017_WI_Landsat2015_TCT_greenness, CHpres2017_WI_Landsat2015_TCT_wetness)
CHpres2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2017_WI_Landsat2015list)
CHpres2017_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2017_WI_Landsat2015<-CHpres2017_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHpres2017_WI_Landsat2015<-CHpres2017_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2017_WI_Landsat2015<-CHpres2017_WI_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2017_WI_Landsat2015<-CHpres2017_WI_Landsat2015 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2017_WI_Landsat2015<-CHpres2017_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2017_WI_Landsat2015.csv")

####WW####
#WW presence data from 2000 at Wilderness I with 2000 Landsat
WWpres2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2000_WI, fun=mean, weights=TRUE))
WWpres2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2000_WI_Landsat2000list<- list(WWpres2000_WI_Landsat2000_blue, WWpres2000_WI_Landsat2000_green, WWpres2000_WI_Landsat2000_red, WWpres2000_WI_Landsat2000_nir, WWpres2000_WI_Landsat2000_swir1, WWpres2000_WI_Landsat2000_swir2, WWpres2000_WI_Landsat2000_NDVI, WWpres2000_WI_Landsat2000_NBR, WWpres2000_WI_Landsat2000_TCT_brightness, WWpres2000_WI_Landsat2000_TCT_greenness, WWpres2000_WI_Landsat2000_TCT_wetness)
WWpres2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2000_WI_Landsat2000list)
WWpres2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2000_WI_Landsat2000<-WWpres2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2000_WI_Landsat2000<-WWpres2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2000_WI_Landsat2000<-WWpres2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2000_WI_Landsat2000<-WWpres2000_WI_Landsat2000 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2000_WI_Landsat2000<-WWpres2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2000_WI_landsat2000.csv")

#WW presence data from 2001 at Wilderness I with 2000 Landsat
WWpres2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2001_WI, fun=mean, weights=TRUE))
WWpres2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2001_WI_Landsat2000list<- list(WWpres2001_WI_Landsat2000_blue, WWpres2001_WI_Landsat2000_green, WWpres2001_WI_Landsat2000_red, WWpres2001_WI_Landsat2000_nir, WWpres2001_WI_Landsat2000_swir1, WWpres2001_WI_Landsat2000_swir2, WWpres2001_WI_Landsat2000_NDVI, WWpres2001_WI_Landsat2000_NBR, WWpres2001_WI_Landsat2000_TCT_brightness, WWpres2001_WI_Landsat2000_TCT_greenness, WWpres2001_WI_Landsat2000_TCT_wetness)
WWpres2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2001_WI_Landsat2000list)
WWpres2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2001_WI_Landsat2000<-WWpres2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2001_WI_Landsat2000<-WWpres2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2001_WI_Landsat2000<-WWpres2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2001_WI_Landsat2000<-WWpres2001_WI_Landsat2000 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2001_WI_Landsat2000<-WWpres2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2001_WI_landsat2000.csv")

#WW presence data from 2002 at Wilderness I with 2000 Landsat
WWpres2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2002_WI, fun=mean, weights=TRUE))
WWpres2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2002_WI_Landsat2000list<- list(WWpres2002_WI_Landsat2000_blue, WWpres2002_WI_Landsat2000_green, WWpres2002_WI_Landsat2000_red, WWpres2002_WI_Landsat2000_nir, WWpres2002_WI_Landsat2000_swir1, WWpres2002_WI_Landsat2000_swir2, WWpres2002_WI_Landsat2000_NDVI, WWpres2002_WI_Landsat2000_NBR, WWpres2002_WI_Landsat2000_TCT_brightness, WWpres2002_WI_Landsat2000_TCT_greenness, WWpres2002_WI_Landsat2000_TCT_wetness)
WWpres2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2002_WI_Landsat2000list)
WWpres2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2002_WI_Landsat2000<-WWpres2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2002_WI_Landsat2000<-WWpres2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2002_WI_Landsat2000<-WWpres2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2002_WI_Landsat2000<-WWpres2002_WI_Landsat2000 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2002_WI_Landsat2000<-WWpres2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2002_WI_landsat2000.csv")

#WW presence data from 2005 at Wilderness I with 2005 Landsat
WWpres2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2005_WI, fun=mean, weights=TRUE))
WWpres2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2005_WI_Landsat2005list<- list(WWpres2005_WI_Landsat2005_blue, WWpres2005_WI_Landsat2005_green, WWpres2005_WI_Landsat2005_red, WWpres2005_WI_Landsat2005_nir, WWpres2005_WI_Landsat2005_swir1, WWpres2005_WI_Landsat2005_swir2, WWpres2005_WI_Landsat2005_NDVI, WWpres2005_WI_Landsat2005_NBR, WWpres2005_WI_Landsat2005_TCT_brightness, WWpres2005_WI_Landsat2005_TCT_greenness, WWpres2005_WI_Landsat2005_TCT_wetness)
WWpres2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2005_WI_Landsat2005list)
WWpres2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2005_WI_Landsat2005<-WWpres2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2005_WI_Landsat2005<-WWpres2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2005_WI_Landsat2005<-WWpres2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2005_WI_Landsat2005<-WWpres2005_WI_Landsat2005 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2005_WI_Landsat2005<-WWpres2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2005_WI_Landsat2005.csv")

#WW presence data from 2006 at Wilderness I with 2005 Landsat
WWpres2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2006_WI, fun=mean, weights=TRUE))
WWpres2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2006_WI_Landsat2005list<- list(WWpres2006_WI_Landsat2005_blue, WWpres2006_WI_Landsat2005_green, WWpres2006_WI_Landsat2005_red, WWpres2006_WI_Landsat2005_nir, WWpres2006_WI_Landsat2005_swir1, WWpres2006_WI_Landsat2005_swir2, WWpres2006_WI_Landsat2005_NDVI, WWpres2006_WI_Landsat2005_NBR, WWpres2006_WI_Landsat2005_TCT_brightness, WWpres2006_WI_Landsat2005_TCT_greenness, WWpres2006_WI_Landsat2005_TCT_wetness)
WWpres2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2006_WI_Landsat2005list)
WWpres2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2006_WI_Landsat2005<-WWpres2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2006_WI_Landsat2005<-WWpres2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2006_WI_Landsat2005<-WWpres2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2006_WI_Landsat2005<-WWpres2006_WI_Landsat2005 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2006_WI_Landsat2005<-WWpres2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2006_WI_Landsat2005.csv")

#WW presence data from 2007 at Wilderness I with 2005 Landsat
WWpres2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2007_WI, fun=mean, weights=TRUE))
WWpres2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2007_WI_Landsat2005list<- list(WWpres2007_WI_Landsat2005_blue, WWpres2007_WI_Landsat2005_green, WWpres2007_WI_Landsat2005_red, WWpres2007_WI_Landsat2005_nir, WWpres2007_WI_Landsat2005_swir1, WWpres2007_WI_Landsat2005_swir2, WWpres2007_WI_Landsat2005_NDVI, WWpres2007_WI_Landsat2005_NBR, WWpres2007_WI_Landsat2005_TCT_brightness, WWpres2007_WI_Landsat2005_TCT_greenness, WWpres2007_WI_Landsat2005_TCT_wetness)
WWpres2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2007_WI_Landsat2005list)
WWpres2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2007_WI_Landsat2005<-WWpres2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2007_WI_Landsat2005<-WWpres2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2007_WI_Landsat2005<-WWpres2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2007_WI_Landsat2005<-WWpres2007_WI_Landsat2005 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2007_WI_Landsat2005<-WWpres2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2007_WI_Landsat2005.csv")

#WW presence data from 2012 at Wilderness I with 2013 Landsat
#no data 
# WWpres2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2012_WI, fun=mean, weights=TRUE))
# WWpres2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2012_WI, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWpres2012_WI_Landsat2013list<- list(WWpres2012_WI_Landsat2013_blue, WWpres2012_WI_Landsat2013_green, WWpres2012_WI_Landsat2013_red, WWpres2012_WI_Landsat2013_nir, WWpres2012_WI_Landsat2013_swir1, WWpres2012_WI_Landsat2013_swir2, WWpres2012_WI_Landsat2013_NDVI, WWpres2012_WI_Landsat2013_NBR, WWpres2012_WI_Landsat2013_TCT_brightness, WWpres2012_WI_Landsat2013_TCT_greenness, WWpres2012_WI_Landsat2013_TCT_wetness)
# WWpres2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2012_WI_Landsat2013list)
# WWpres2012_WI_Landsat2013
# #add four columns: site, Landsat year, bird survey year, bird species
# WWpres2012_WI_Landsat2013<-WWpres2012_WI_Landsat2013 %>%
#   mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
# WWpres2012_WI_Landsat2013<-WWpres2012_WI_Landsat2013 %>%
#   mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWpres2012_WI_Landsat2013<-WWpres2012_WI_Landsat2013 %>%
#   mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWpres2012_WI_Landsat2013<-WWpres2012_WI_Landsat2013 %>%
#   mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
# WWpres2012_WI_Landsat2013<-WWpres2012_WI_Landsat2013 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWpres2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2012_WI_Landsat2013.csv")

#WW presence data from 2013 at Wilderness I with 2013 Landsat
WWpres2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2013_WI, fun=mean, weights=TRUE))
WWpres2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2013_WI_Landsat2013list<- list(WWpres2013_WI_Landsat2013_blue, WWpres2013_WI_Landsat2013_green, WWpres2013_WI_Landsat2013_red, WWpres2013_WI_Landsat2013_nir, WWpres2013_WI_Landsat2013_swir1, WWpres2013_WI_Landsat2013_swir2, WWpres2013_WI_Landsat2013_NDVI, WWpres2013_WI_Landsat2013_NBR, WWpres2013_WI_Landsat2013_TCT_brightness, WWpres2013_WI_Landsat2013_TCT_greenness, WWpres2013_WI_Landsat2013_TCT_wetness)
WWpres2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2013_WI_Landsat2013list)
WWpres2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2013_WI_Landsat2013<-WWpres2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2013_WI_Landsat2013<-WWpres2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2013_WI_Landsat2013<-WWpres2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2013_WI_Landsat2013<-WWpres2013_WI_Landsat2013 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2013_WI_Landsat2013<-WWpres2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2013_WI_Landsat2013.csv")

#WW presence data from 2014 at Wilderness I with 2013 Landsat
WWpres2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2014_WI, fun=mean, weights=TRUE))
WWpres2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2014_WI_Landsat2013list<- list(WWpres2014_WI_Landsat2013_blue, WWpres2014_WI_Landsat2013_green, WWpres2014_WI_Landsat2013_red, WWpres2014_WI_Landsat2013_nir, WWpres2014_WI_Landsat2013_swir1, WWpres2014_WI_Landsat2013_swir2, WWpres2014_WI_Landsat2013_NDVI, WWpres2014_WI_Landsat2013_NBR, WWpres2014_WI_Landsat2013_TCT_brightness, WWpres2014_WI_Landsat2013_TCT_greenness, WWpres2014_WI_Landsat2013_TCT_wetness)
WWpres2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2014_WI_Landsat2013list)
WWpres2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2014_WI_Landsat2013<-WWpres2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2014_WI_Landsat2013<-WWpres2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2014_WI_Landsat2013<-WWpres2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2014_WI_Landsat2013<-WWpres2014_WI_Landsat2013 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2014_WI_Landsat2013<-WWpres2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2014_WI_Landsat2013.csv")

#WW presence data from 2015 at Wilderness I with 2015 Landsat
WWpres2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_pres_2015_WI, fun=mean, weights=TRUE))
WWpres2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_pres_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2015_WI_Landsat2015list<- list(WWpres2015_WI_Landsat2015_blue, WWpres2015_WI_Landsat2015_green, WWpres2015_WI_Landsat2015_red, WWpres2015_WI_Landsat2015_nir, WWpres2015_WI_Landsat2015_swir1, WWpres2015_WI_Landsat2015_swir2, WWpres2015_WI_Landsat2015_NDVI, WWpres2015_WI_Landsat2015_NBR, WWpres2015_WI_Landsat2015_TCT_brightness, WWpres2015_WI_Landsat2015_TCT_greenness, WWpres2015_WI_Landsat2015_TCT_wetness)
WWpres2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2015_WI_Landsat2015list)
WWpres2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2015_WI_Landsat2015<-WWpres2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWpres2015_WI_Landsat2015<-WWpres2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2015_WI_Landsat2015<-WWpres2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2015_WI_Landsat2015<-WWpres2015_WI_Landsat2015 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2015_WI_Landsat2015<-WWpres2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2015_WI_Landsat2015.csv")

#WW presence data from 2016 at Wilderness I with 2015 Landsat
#no data
# WWpres2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_pres_2016_WI, fun=mean, weights=TRUE))
# WWpres2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_pres_2016_WI, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWpres2016_WI_Landsat2015list<- list(WWpres2016_WI_Landsat2015_blue, WWpres2016_WI_Landsat2015_green, WWpres2016_WI_Landsat2015_red, WWpres2016_WI_Landsat2015_nir, WWpres2016_WI_Landsat2015_swir1, WWpres2016_WI_Landsat2015_swir2, WWpres2016_WI_Landsat2015_NDVI, WWpres2016_WI_Landsat2015_NBR, WWpres2016_WI_Landsat2015_TCT_brightness, WWpres2016_WI_Landsat2015_TCT_greenness, WWpres2016_WI_Landsat2015_TCT_wetness)
# WWpres2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2016_WI_Landsat2015list)
# WWpres2016_WI_Landsat2015
# #add four columns: site, Landsat year, bird survey year, bird species
# WWpres2016_WI_Landsat2015<-WWpres2016_WI_Landsat2015 %>%
#   mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
# WWpres2016_WI_Landsat2015<-WWpres2016_WI_Landsat2015 %>%
#   mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWpres2016_WI_Landsat2015<-WWpres2016_WI_Landsat2015 %>%
#   mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWpres2016_WI_Landsat2015<-WWpres2016_WI_Landsat2015 %>%
#   mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
# WWpres2016_WI_Landsat2015<-WWpres2016_WI_Landsat2015 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWpres2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2016_WI_Landsat2015.csv")

#WW presence data from 2017 at Wilderness I with 2015 Landsat
#no data
# WWpres2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_pres_2017_WI, fun=mean, weights=TRUE))
# WWpres2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_pres_2017_WI, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWpres2017_WI_Landsat2015list<- list(WWpres2017_WI_Landsat2015_blue, WWpres2017_WI_Landsat2015_green, WWpres2017_WI_Landsat2015_red, WWpres2017_WI_Landsat2015_nir, WWpres2017_WI_Landsat2015_swir1, WWpres2017_WI_Landsat2015_swir2, WWpres2017_WI_Landsat2015_NDVI, WWpres2017_WI_Landsat2015_NBR, WWpres2017_WI_Landsat2015_TCT_brightness, WWpres2017_WI_Landsat2015_TCT_greenness, WWpres2017_WI_Landsat2015_TCT_wetness)
# WWpres2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2017_WI_Landsat2015list)
# WWpres2017_WI_Landsat2015
# #add four columns: site, Landsat year, bird survey year, bird species
# WWpres2017_WI_Landsat2015<-WWpres2017_WI_Landsat2015 %>%
#   mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
# WWpres2017_WI_Landsat2015<-WWpres2017_WI_Landsat2015 %>%
#   mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWpres2017_WI_Landsat2015<-WWpres2017_WI_Landsat2015 %>%
#   mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWpres2017_WI_Landsat2015<-WWpres2017_WI_Landsat2015 %>%
#   mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
# WWpres2017_WI_Landsat2015<-WWpres2017_WI_Landsat2015 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWpres2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2017_WI_Landsat2015.csv")

###Wilderness II####

####BT####
#BT presence data from 2000 at Wilderness II with 2000 Landsat
#no data 
# BTpres2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2000_WII, fun=mean, weights=TRUE))
# BTpres2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# BTpres2000_WII_Landsat2000list<- list(BTpres2000_WII_Landsat2000_blue, BTpres2000_WII_Landsat2000_green, BTpres2000_WII_Landsat2000_red, BTpres2000_WII_Landsat2000_nir, BTpres2000_WII_Landsat2000_swir1, BTpres2000_WII_Landsat2000_swir2, BTpres2000_WII_Landsat2000_NDVI, BTpres2000_WII_Landsat2000_NBR, BTpres2000_WII_Landsat2000_TCT_brightness, BTpres2000_WII_Landsat2000_TCT_greenness, BTpres2000_WII_Landsat2000_TCT_wetness)
# BTpres2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2000_WII_Landsat2000list)
# BTpres2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# BTpres2000_WII_Landsat2000<-BTpres2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# BTpres2000_WII_Landsat2000<-BTpres2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# BTpres2000_WII_Landsat2000<-BTpres2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# BTpres2000_WII_Landsat2000<-BTpres2000_WII_Landsat2000 %>%
#   mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
# BTpres2000_WII_Landsat2000<-BTpres2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(BTpres2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2000_WII_landsat2000.csv")

#BT presence data from 2001 at Wilderness II with 2000 Landsat
BTpres2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2001_WII, fun=mean, weights=TRUE))
BTpres2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2001_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2001_WII_Landsat2000list<- list(BTpres2001_WII_Landsat2000_blue, BTpres2001_WII_Landsat2000_green, BTpres2001_WII_Landsat2000_red, BTpres2001_WII_Landsat2000_nir, BTpres2001_WII_Landsat2000_swir1, BTpres2001_WII_Landsat2000_swir2, BTpres2001_WII_Landsat2000_NDVI, BTpres2001_WII_Landsat2000_NBR, BTpres2001_WII_Landsat2000_TCT_brightness, BTpres2001_WII_Landsat2000_TCT_greenness, BTpres2001_WII_Landsat2000_TCT_wetness)
BTpres2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2001_WII_Landsat2000list)
BTpres2001_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2001_WII_Landsat2000<-BTpres2001_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2001_WII_Landsat2000<-BTpres2001_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2001_WII_Landsat2000<-BTpres2001_WII_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2001_WII_Landsat2000<-BTpres2001_WII_Landsat2000 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2001_WII_Landsat2000<-BTpres2001_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2001_WII_landsat2000.csv")

#BT presence data from 2002 at Wilderness II with 2000 Landsat
BTpres2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2002_WII, fun=mean, weights=TRUE))
BTpres2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2002_WII_Landsat2000list<- list(BTpres2002_WII_Landsat2000_blue, BTpres2002_WII_Landsat2000_green, BTpres2002_WII_Landsat2000_red, BTpres2002_WII_Landsat2000_nir, BTpres2002_WII_Landsat2000_swir1, BTpres2002_WII_Landsat2000_swir2, BTpres2002_WII_Landsat2000_NDVI, BTpres2002_WII_Landsat2000_NBR, BTpres2002_WII_Landsat2000_TCT_brightness, BTpres2002_WII_Landsat2000_TCT_greenness, BTpres2002_WII_Landsat2000_TCT_wetness)
BTpres2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2002_WII_Landsat2000list)
BTpres2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2002_WII_Landsat2000<-BTpres2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2002_WII_Landsat2000<-BTpres2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2002_WII_Landsat2000<-BTpres2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2002_WII_Landsat2000<-BTpres2002_WII_Landsat2000 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2002_WII_Landsat2000<-BTpres2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2002_WII_landsat2000.csv")

#BT presence data from 2005 at Wilderness II with 2005 Landsat
BTpres2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2005_WII, fun=mean, weights=TRUE))
BTpres2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2005_WII_Landsat2005list<- list(BTpres2005_WII_Landsat2005_blue, BTpres2005_WII_Landsat2005_green, BTpres2005_WII_Landsat2005_red, BTpres2005_WII_Landsat2005_nir, BTpres2005_WII_Landsat2005_swir1, BTpres2005_WII_Landsat2005_swir2, BTpres2005_WII_Landsat2005_NDVI, BTpres2005_WII_Landsat2005_NBR, BTpres2005_WII_Landsat2005_TCT_brightness, BTpres2005_WII_Landsat2005_TCT_greenness, BTpres2005_WII_Landsat2005_TCT_wetness)
BTpres2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2005_WII_Landsat2005list)
BTpres2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2005_WII_Landsat2005<-BTpres2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2005_WII_Landsat2005<-BTpres2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2005_WII_Landsat2005<-BTpres2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2005_WII_Landsat2005<-BTpres2005_WII_Landsat2005 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2005_WII_Landsat2005<-BTpres2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2005_WII_Landsat2005.csv")

#BT presence data from 2006 at Wilderness II with 2005 Landsat
BTpres2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2006_WII, fun=mean, weights=TRUE))
BTpres2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2006_WII_Landsat2005list<- list(BTpres2006_WII_Landsat2005_blue, BTpres2006_WII_Landsat2005_green, BTpres2006_WII_Landsat2005_red, BTpres2006_WII_Landsat2005_nir, BTpres2006_WII_Landsat2005_swir1, BTpres2006_WII_Landsat2005_swir2, BTpres2006_WII_Landsat2005_NDVI, BTpres2006_WII_Landsat2005_NBR, BTpres2006_WII_Landsat2005_TCT_brightness, BTpres2006_WII_Landsat2005_TCT_greenness, BTpres2006_WII_Landsat2005_TCT_wetness)
BTpres2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2006_WII_Landsat2005list)
BTpres2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2006_WII_Landsat2005<-BTpres2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2006_WII_Landsat2005<-BTpres2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2006_WII_Landsat2005<-BTpres2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2006_WII_Landsat2005<-BTpres2006_WII_Landsat2005 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2006_WII_Landsat2005<-BTpres2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2006_WII_Landsat2005.csv")

#BT presence data from 2007 at Wilderness II with 2005 Landsat
BTpres2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2007_WII, fun=mean, weights=TRUE))
BTpres2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2007_WII_Landsat2005list<- list(BTpres2007_WII_Landsat2005_blue, BTpres2007_WII_Landsat2005_green, BTpres2007_WII_Landsat2005_red, BTpres2007_WII_Landsat2005_nir, BTpres2007_WII_Landsat2005_swir1, BTpres2007_WII_Landsat2005_swir2, BTpres2007_WII_Landsat2005_NDVI, BTpres2007_WII_Landsat2005_NBR, BTpres2007_WII_Landsat2005_TCT_brightness, BTpres2007_WII_Landsat2005_TCT_greenness, BTpres2007_WII_Landsat2005_TCT_wetness)
BTpres2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2007_WII_Landsat2005list)
BTpres2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2007_WII_Landsat2005<-BTpres2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2007_WII_Landsat2005<-BTpres2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2007_WII_Landsat2005<-BTpres2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2007_WII_Landsat2005<-BTpres2007_WII_Landsat2005 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2007_WII_Landsat2005<-BTpres2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2007_WII_Landsat2005.csv")

#BT presence data from 2012 at Wilderness II with 2013 Landsat
BTpres2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2012_WII, fun=mean, weights=TRUE))
BTpres2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2012_WII_Landsat2013list<- list(BTpres2012_WII_Landsat2013_blue, BTpres2012_WII_Landsat2013_green, BTpres2012_WII_Landsat2013_red, BTpres2012_WII_Landsat2013_nir, BTpres2012_WII_Landsat2013_swir1, BTpres2012_WII_Landsat2013_swir2, BTpres2012_WII_Landsat2013_NDVI, BTpres2012_WII_Landsat2013_NBR, BTpres2012_WII_Landsat2013_TCT_brightness, BTpres2012_WII_Landsat2013_TCT_greenness, BTpres2012_WII_Landsat2013_TCT_wetness)
BTpres2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2012_WII_Landsat2013list)
BTpres2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2012_WII_Landsat2013<-BTpres2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2012_WII_Landsat2013<-BTpres2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2012_WII_Landsat2013<-BTpres2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2012_WII_Landsat2013<-BTpres2012_WII_Landsat2013 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2012_WII_Landsat2013<-BTpres2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2012_WII_Landsat2013.csv")

#BT presence data from 2013 at Wilderness II with 2013 Landsat
BTpres2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2013_WII, fun=mean, weights=TRUE))
BTpres2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2013_WII_Landsat2013list<- list(BTpres2013_WII_Landsat2013_blue, BTpres2013_WII_Landsat2013_green, BTpres2013_WII_Landsat2013_red, BTpres2013_WII_Landsat2013_nir, BTpres2013_WII_Landsat2013_swir1, BTpres2013_WII_Landsat2013_swir2, BTpres2013_WII_Landsat2013_NDVI, BTpres2013_WII_Landsat2013_NBR, BTpres2013_WII_Landsat2013_TCT_brightness, BTpres2013_WII_Landsat2013_TCT_greenness, BTpres2013_WII_Landsat2013_TCT_wetness)
BTpres2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2013_WII_Landsat2013list)
BTpres2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2013_WII_Landsat2013<-BTpres2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2013_WII_Landsat2013<-BTpres2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2013_WII_Landsat2013<-BTpres2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2013_WII_Landsat2013<-BTpres2013_WII_Landsat2013 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2013_WII_Landsat2013<-BTpres2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2013_WII_Landsat2013.csv")

#BT presence data from 2014 at Wilderness II with 2013 Landsat
BTpres2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_pres_2014_WII, fun=mean, weights=TRUE))
BTpres2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_pres_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2014_WII_Landsat2013list<- list(BTpres2014_WII_Landsat2013_blue, BTpres2014_WII_Landsat2013_green, BTpres2014_WII_Landsat2013_red, BTpres2014_WII_Landsat2013_nir, BTpres2014_WII_Landsat2013_swir1, BTpres2014_WII_Landsat2013_swir2, BTpres2014_WII_Landsat2013_NDVI, BTpres2014_WII_Landsat2013_NBR, BTpres2014_WII_Landsat2013_TCT_brightness, BTpres2014_WII_Landsat2013_TCT_greenness, BTpres2014_WII_Landsat2013_TCT_wetness)
BTpres2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2014_WII_Landsat2013list)
BTpres2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2014_WII_Landsat2013<-BTpres2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2014_WII_Landsat2013<-BTpres2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2014_WII_Landsat2013<-BTpres2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2014_WII_Landsat2013<-BTpres2014_WII_Landsat2013 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2014_WII_Landsat2013<-BTpres2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2014_WII_Landsat2013.csv")

#BT presence data from 2015 at Wilderness II with 2015 Landsat
BTpres2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_pres_2015_WII, fun=mean, weights=TRUE))
BTpres2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_pres_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2015_WII_Landsat2015list<- list(BTpres2015_WII_Landsat2015_blue, BTpres2015_WII_Landsat2015_green, BTpres2015_WII_Landsat2015_red, BTpres2015_WII_Landsat2015_nir, BTpres2015_WII_Landsat2015_swir1, BTpres2015_WII_Landsat2015_swir2, BTpres2015_WII_Landsat2015_NDVI, BTpres2015_WII_Landsat2015_NBR, BTpres2015_WII_Landsat2015_TCT_brightness, BTpres2015_WII_Landsat2015_TCT_greenness, BTpres2015_WII_Landsat2015_TCT_wetness)
BTpres2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2015_WII_Landsat2015list)
BTpres2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2015_WII_Landsat2015<-BTpres2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2015_WII_Landsat2015<-BTpres2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2015_WII_Landsat2015<-BTpres2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2015_WII_Landsat2015<-BTpres2015_WII_Landsat2015 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2015_WII_Landsat2015<-BTpres2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2015_WII_Landsat2015.csv")

#BT presence data from 2016 at Wilderness II with 2015 Landsat
BTpres2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_pres_2016_WII, fun=mean, weights=TRUE))
BTpres2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_pres_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2016_WII_Landsat2015list<- list(BTpres2016_WII_Landsat2015_blue, BTpres2016_WII_Landsat2015_green, BTpres2016_WII_Landsat2015_red, BTpres2016_WII_Landsat2015_nir, BTpres2016_WII_Landsat2015_swir1, BTpres2016_WII_Landsat2015_swir2, BTpres2016_WII_Landsat2015_NDVI, BTpres2016_WII_Landsat2015_NBR, BTpres2016_WII_Landsat2015_TCT_brightness, BTpres2016_WII_Landsat2015_TCT_greenness, BTpres2016_WII_Landsat2015_TCT_wetness)
BTpres2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2016_WII_Landsat2015list)
BTpres2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2016_WII_Landsat2015<-BTpres2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2016_WII_Landsat2015<-BTpres2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2016_WII_Landsat2015<-BTpres2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2016_WII_Landsat2015<-BTpres2016_WII_Landsat2015 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2016_WII_Landsat2015<-BTpres2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2016_WII_Landsat2015.csv")

#BT presence data from 2017 at Wilderness II with 2015 Landsat
BTpres2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_pres_2017_WII, fun=mean, weights=TRUE))
BTpres2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_pres_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTpres2017_WII_Landsat2015list<- list(BTpres2017_WII_Landsat2015_blue, BTpres2017_WII_Landsat2015_green, BTpres2017_WII_Landsat2015_red, BTpres2017_WII_Landsat2015_nir, BTpres2017_WII_Landsat2015_swir1, BTpres2017_WII_Landsat2015_swir2, BTpres2017_WII_Landsat2015_NDVI, BTpres2017_WII_Landsat2015_NBR, BTpres2017_WII_Landsat2015_TCT_brightness, BTpres2017_WII_Landsat2015_TCT_greenness, BTpres2017_WII_Landsat2015_TCT_wetness)
BTpres2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTpres2017_WII_Landsat2015list)
BTpres2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTpres2017_WII_Landsat2015<-BTpres2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTpres2017_WII_Landsat2015<-BTpres2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTpres2017_WII_Landsat2015<-BTpres2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTpres2017_WII_Landsat2015<-BTpres2017_WII_Landsat2015 %>%
  mutate(species = "BT_presence")%>% dplyr::select(species, everything())#add column for bird species
BTpres2017_WII_Landsat2015<-BTpres2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTpres2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTpres2017_WII_Landsat2015.csv")

####CC####
#CC presence data from 2000 at Wilderness II with 2000 Landsat
#no data
# CCpres2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2000_WII, fun=mean, weights=TRUE))
# CCpres2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# CCpres2000_WII_Landsat2000list<- list(CCpres2000_WII_Landsat2000_blue, CCpres2000_WII_Landsat2000_green, CCpres2000_WII_Landsat2000_red, CCpres2000_WII_Landsat2000_nir, CCpres2000_WII_Landsat2000_swir1, CCpres2000_WII_Landsat2000_swir2, CCpres2000_WII_Landsat2000_NDVI, CCpres2000_WII_Landsat2000_NBR, CCpres2000_WII_Landsat2000_TCT_brightness, CCpres2000_WII_Landsat2000_TCT_greenness, CCpres2000_WII_Landsat2000_TCT_wetness)
# CCpres2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2000_WII_Landsat2000list)
# CCpres2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# CCpres2000_WII_Landsat2000<-CCpres2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# CCpres2000_WII_Landsat2000<-CCpres2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# CCpres2000_WII_Landsat2000<-CCpres2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# CCpres2000_WII_Landsat2000<-CCpres2000_WII_Landsat2000 %>%
#   mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
# CCpres2000_WII_Landsat2000<-CCpres2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(CCpres2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2000_WII_landsat2000.csv")

#CC presence data from 2001 at Wilderness II with 2000 Landsat
#no data
# CCpres2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2001_WII, fun=mean, weights=TRUE))
# CCpres2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2001_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# CCpres2001_WII_Landsat2000list<- list(CCpres2001_WII_Landsat2000_blue, CCpres2001_WII_Landsat2000_green, CCpres2001_WII_Landsat2000_red, CCpres2001_WII_Landsat2000_nir, CCpres2001_WII_Landsat2000_swir1, CCpres2001_WII_Landsat2000_swir2, CCpres2001_WII_Landsat2000_NDVI, CCpres2001_WII_Landsat2000_NBR, CCpres2001_WII_Landsat2000_TCT_brightness, CCpres2001_WII_Landsat2000_TCT_greenness, CCpres2001_WII_Landsat2000_TCT_wetness)
# CCpres2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2001_WII_Landsat2000list)
# CCpres2001_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# CCpres2001_WII_Landsat2000<-CCpres2001_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# CCpres2001_WII_Landsat2000<-CCpres2001_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# CCpres2001_WII_Landsat2000<-CCpres2001_WII_Landsat2000 %>%
#   mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# CCpres2001_WII_Landsat2000<-CCpres2001_WII_Landsat2000 %>%
#   mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
# CCpres2001_WII_Landsat2000<-CCpres2001_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(CCpres2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2001_WII_landsat2000.csv")

#CC presence data from 2002 at Wilderness II with 2000 Landsat
CCpres2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2002_WII, fun=mean, weights=TRUE))
CCpres2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2002_WII_Landsat2000list<- list(CCpres2002_WII_Landsat2000_blue, CCpres2002_WII_Landsat2000_green, CCpres2002_WII_Landsat2000_red, CCpres2002_WII_Landsat2000_nir, CCpres2002_WII_Landsat2000_swir1, CCpres2002_WII_Landsat2000_swir2, CCpres2002_WII_Landsat2000_NDVI, CCpres2002_WII_Landsat2000_NBR, CCpres2002_WII_Landsat2000_TCT_brightness, CCpres2002_WII_Landsat2000_TCT_greenness, CCpres2002_WII_Landsat2000_TCT_wetness)
CCpres2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2002_WII_Landsat2000list)
CCpres2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2002_WII_Landsat2000<-CCpres2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2002_WII_Landsat2000<-CCpres2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2002_WII_Landsat2000<-CCpres2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2002_WII_Landsat2000<-CCpres2002_WII_Landsat2000 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2002_WII_Landsat2000<-CCpres2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2002_WII_landsat2000.csv")

#CC presence data from 2005 at Wilderness II with 2005 Landsat
CCpres2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2005_WII, fun=mean, weights=TRUE))
CCpres2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2005_WII_Landsat2005list<- list(CCpres2005_WII_Landsat2005_blue, CCpres2005_WII_Landsat2005_green, CCpres2005_WII_Landsat2005_red, CCpres2005_WII_Landsat2005_nir, CCpres2005_WII_Landsat2005_swir1, CCpres2005_WII_Landsat2005_swir2, CCpres2005_WII_Landsat2005_NDVI, CCpres2005_WII_Landsat2005_NBR, CCpres2005_WII_Landsat2005_TCT_brightness, CCpres2005_WII_Landsat2005_TCT_greenness, CCpres2005_WII_Landsat2005_TCT_wetness)
CCpres2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2005_WII_Landsat2005list)
CCpres2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2005_WII_Landsat2005<-CCpres2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2005_WII_Landsat2005<-CCpres2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2005_WII_Landsat2005<-CCpres2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2005_WII_Landsat2005<-CCpres2005_WII_Landsat2005 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2005_WII_Landsat2005<-CCpres2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2005_WII_Landsat2005.csv")

#CC presence data from 2006 at Wilderness II with 2005 Landsat
CCpres2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2006_WII, fun=mean, weights=TRUE))
CCpres2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2006_WII_Landsat2005list<- list(CCpres2006_WII_Landsat2005_blue, CCpres2006_WII_Landsat2005_green, CCpres2006_WII_Landsat2005_red, CCpres2006_WII_Landsat2005_nir, CCpres2006_WII_Landsat2005_swir1, CCpres2006_WII_Landsat2005_swir2, CCpres2006_WII_Landsat2005_NDVI, CCpres2006_WII_Landsat2005_NBR, CCpres2006_WII_Landsat2005_TCT_brightness, CCpres2006_WII_Landsat2005_TCT_greenness, CCpres2006_WII_Landsat2005_TCT_wetness)
CCpres2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2006_WII_Landsat2005list)
CCpres2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2006_WII_Landsat2005<-CCpres2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2006_WII_Landsat2005<-CCpres2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2006_WII_Landsat2005<-CCpres2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2006_WII_Landsat2005<-CCpres2006_WII_Landsat2005 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2006_WII_Landsat2005<-CCpres2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2006_WII_Landsat2005.csv")

#CC presence data from 2007 at Wilderness II with 2005 Landsat
CCpres2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2007_WII, fun=mean, weights=TRUE))
CCpres2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2007_WII_Landsat2005list<- list(CCpres2007_WII_Landsat2005_blue, CCpres2007_WII_Landsat2005_green, CCpres2007_WII_Landsat2005_red, CCpres2007_WII_Landsat2005_nir, CCpres2007_WII_Landsat2005_swir1, CCpres2007_WII_Landsat2005_swir2, CCpres2007_WII_Landsat2005_NDVI, CCpres2007_WII_Landsat2005_NBR, CCpres2007_WII_Landsat2005_TCT_brightness, CCpres2007_WII_Landsat2005_TCT_greenness, CCpres2007_WII_Landsat2005_TCT_wetness)
CCpres2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2007_WII_Landsat2005list)
CCpres2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2007_WII_Landsat2005<-CCpres2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2007_WII_Landsat2005<-CCpres2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2007_WII_Landsat2005<-CCpres2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2007_WII_Landsat2005<-CCpres2007_WII_Landsat2005 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2007_WII_Landsat2005<-CCpres2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2007_WII_Landsat2005.csv")

#CC presence data from 2012 at Wilderness II with 2013 Landsat
CCpres2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2012_WII, fun=mean, weights=TRUE))
CCpres2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2012_WII_Landsat2013list<- list(CCpres2012_WII_Landsat2013_blue, CCpres2012_WII_Landsat2013_green, CCpres2012_WII_Landsat2013_red, CCpres2012_WII_Landsat2013_nir, CCpres2012_WII_Landsat2013_swir1, CCpres2012_WII_Landsat2013_swir2, CCpres2012_WII_Landsat2013_NDVI, CCpres2012_WII_Landsat2013_NBR, CCpres2012_WII_Landsat2013_TCT_brightness, CCpres2012_WII_Landsat2013_TCT_greenness, CCpres2012_WII_Landsat2013_TCT_wetness)
CCpres2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2012_WII_Landsat2013list)
CCpres2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2012_WII_Landsat2013<-CCpres2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2012_WII_Landsat2013<-CCpres2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2012_WII_Landsat2013<-CCpres2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2012_WII_Landsat2013<-CCpres2012_WII_Landsat2013 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2012_WII_Landsat2013<-CCpres2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2012_WII_Landsat2013.csv")

#CC presence data from 2013 at Wilderness II with 2013 Landsat
CCpres2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2013_WII, fun=mean, weights=TRUE))
CCpres2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2013_WII_Landsat2013list<- list(CCpres2013_WII_Landsat2013_blue, CCpres2013_WII_Landsat2013_green, CCpres2013_WII_Landsat2013_red, CCpres2013_WII_Landsat2013_nir, CCpres2013_WII_Landsat2013_swir1, CCpres2013_WII_Landsat2013_swir2, CCpres2013_WII_Landsat2013_NDVI, CCpres2013_WII_Landsat2013_NBR, CCpres2013_WII_Landsat2013_TCT_brightness, CCpres2013_WII_Landsat2013_TCT_greenness, CCpres2013_WII_Landsat2013_TCT_wetness)
CCpres2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2013_WII_Landsat2013list)
CCpres2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2013_WII_Landsat2013<-CCpres2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2013_WII_Landsat2013<-CCpres2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2013_WII_Landsat2013<-CCpres2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2013_WII_Landsat2013<-CCpres2013_WII_Landsat2013 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2013_WII_Landsat2013<-CCpres2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2013_WII_Landsat2013.csv")

#CC presence data from 2014 at Wilderness II with 2013 Landsat
CCpres2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_pres_2014_WII, fun=mean, weights=TRUE))
CCpres2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_pres_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2014_WII_Landsat2013list<- list(CCpres2014_WII_Landsat2013_blue, CCpres2014_WII_Landsat2013_green, CCpres2014_WII_Landsat2013_red, CCpres2014_WII_Landsat2013_nir, CCpres2014_WII_Landsat2013_swir1, CCpres2014_WII_Landsat2013_swir2, CCpres2014_WII_Landsat2013_NDVI, CCpres2014_WII_Landsat2013_NBR, CCpres2014_WII_Landsat2013_TCT_brightness, CCpres2014_WII_Landsat2013_TCT_greenness, CCpres2014_WII_Landsat2013_TCT_wetness)
CCpres2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2014_WII_Landsat2013list)
CCpres2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2014_WII_Landsat2013<-CCpres2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2014_WII_Landsat2013<-CCpres2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2014_WII_Landsat2013<-CCpres2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2014_WII_Landsat2013<-CCpres2014_WII_Landsat2013 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2014_WII_Landsat2013<-CCpres2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2014_WII_Landsat2013.csv")

#CC presence data from 2015 at Wilderness II with 2015 Landsat
CCpres2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_pres_2015_WII, fun=mean, weights=TRUE))
CCpres2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_pres_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2015_WII_Landsat2015list<- list(CCpres2015_WII_Landsat2015_blue, CCpres2015_WII_Landsat2015_green, CCpres2015_WII_Landsat2015_red, CCpres2015_WII_Landsat2015_nir, CCpres2015_WII_Landsat2015_swir1, CCpres2015_WII_Landsat2015_swir2, CCpres2015_WII_Landsat2015_NDVI, CCpres2015_WII_Landsat2015_NBR, CCpres2015_WII_Landsat2015_TCT_brightness, CCpres2015_WII_Landsat2015_TCT_greenness, CCpres2015_WII_Landsat2015_TCT_wetness)
CCpres2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2015_WII_Landsat2015list)
CCpres2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2015_WII_Landsat2015<-CCpres2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2015_WII_Landsat2015<-CCpres2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2015_WII_Landsat2015<-CCpres2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2015_WII_Landsat2015<-CCpres2015_WII_Landsat2015 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2015_WII_Landsat2015<-CCpres2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2015_WII_Landsat2015.csv")

#CC presence data from 2016 at Wilderness II with 2015 Landsat
CCpres2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_pres_2016_WII, fun=mean, weights=TRUE))
CCpres2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_pres_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2016_WII_Landsat2015list<- list(CCpres2016_WII_Landsat2015_blue, CCpres2016_WII_Landsat2015_green, CCpres2016_WII_Landsat2015_red, CCpres2016_WII_Landsat2015_nir, CCpres2016_WII_Landsat2015_swir1, CCpres2016_WII_Landsat2015_swir2, CCpres2016_WII_Landsat2015_NDVI, CCpres2016_WII_Landsat2015_NBR, CCpres2016_WII_Landsat2015_TCT_brightness, CCpres2016_WII_Landsat2015_TCT_greenness, CCpres2016_WII_Landsat2015_TCT_wetness)
CCpres2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2016_WII_Landsat2015list)
CCpres2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2016_WII_Landsat2015<-CCpres2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2016_WII_Landsat2015<-CCpres2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2016_WII_Landsat2015<-CCpres2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2016_WII_Landsat2015<-CCpres2016_WII_Landsat2015 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2016_WII_Landsat2015<-CCpres2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2016_WII_Landsat2015.csv")

#CC presence data from 2017 at Wilderness II with 2015 Landsat
CCpres2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_pres_2017_WII, fun=mean, weights=TRUE))
CCpres2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_pres_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCpres2017_WII_Landsat2015list<- list(CCpres2017_WII_Landsat2015_blue, CCpres2017_WII_Landsat2015_green, CCpres2017_WII_Landsat2015_red, CCpres2017_WII_Landsat2015_nir, CCpres2017_WII_Landsat2015_swir1, CCpres2017_WII_Landsat2015_swir2, CCpres2017_WII_Landsat2015_NDVI, CCpres2017_WII_Landsat2015_NBR, CCpres2017_WII_Landsat2015_TCT_brightness, CCpres2017_WII_Landsat2015_TCT_greenness, CCpres2017_WII_Landsat2015_TCT_wetness)
CCpres2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCpres2017_WII_Landsat2015list)
CCpres2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCpres2017_WII_Landsat2015<-CCpres2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCpres2017_WII_Landsat2015<-CCpres2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCpres2017_WII_Landsat2015<-CCpres2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCpres2017_WII_Landsat2015<-CCpres2017_WII_Landsat2015 %>%
  mutate(species = "CC_presence")%>% dplyr::select(species, everything())#add column for bird species
CCpres2017_WII_Landsat2015<-CCpres2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCpres2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCpres2017_WII_Landsat2015.csv")

####CH####
#CH presence data from 2000 at Wilderness II with 2000 Landsat
#no data 
# CHpres2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2000_WII, fun=mean, weights=TRUE))
# CHpres2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# CHpres2000_WII_Landsat2000list<- list(CHpres2000_WII_Landsat2000_blue, CHpres2000_WII_Landsat2000_green, CHpres2000_WII_Landsat2000_red, CHpres2000_WII_Landsat2000_nir, CHpres2000_WII_Landsat2000_swir1, CHpres2000_WII_Landsat2000_swir2, CHpres2000_WII_Landsat2000_NDVI, CHpres2000_WII_Landsat2000_NBR, CHpres2000_WII_Landsat2000_TCT_brightness, CHpres2000_WII_Landsat2000_TCT_greenness, CHpres2000_WII_Landsat2000_TCT_wetness)
# CHpres2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2000_WII_Landsat2000list)
# CHpres2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# CHpres2000_WII_Landsat2000<-CHpres2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# CHpres2000_WII_Landsat2000<-CHpres2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# CHpres2000_WII_Landsat2000<-CHpres2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# CHpres2000_WII_Landsat2000<-CHpres2000_WII_Landsat2000 %>%
#   mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
# CHpres2000_WII_Landsat2000<-CHpres2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(CHpres2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2000_WII_landsat2000.csv")

#CH presence data from 2001 at Wilderness II with 2000 Landsat
CHpres2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2001_WII, fun=mean, weights=TRUE))
CHpres2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2001_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2001_WII_Landsat2000list<- list(CHpres2001_WII_Landsat2000_blue, CHpres2001_WII_Landsat2000_green, CHpres2001_WII_Landsat2000_red, CHpres2001_WII_Landsat2000_nir, CHpres2001_WII_Landsat2000_swir1, CHpres2001_WII_Landsat2000_swir2, CHpres2001_WII_Landsat2000_NDVI, CHpres2001_WII_Landsat2000_NBR, CHpres2001_WII_Landsat2000_TCT_brightness, CHpres2001_WII_Landsat2000_TCT_greenness, CHpres2001_WII_Landsat2000_TCT_wetness)
CHpres2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2001_WII_Landsat2000list)
CHpres2001_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2001_WII_Landsat2000<-CHpres2001_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2001_WII_Landsat2000<-CHpres2001_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2001_WII_Landsat2000<-CHpres2001_WII_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2001_WII_Landsat2000<-CHpres2001_WII_Landsat2000 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2001_WII_Landsat2000<-CHpres2001_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2001_WII_landsat2000.csv")

#CH presence data from 2002 at Wilderness II with 2000 Landsat
CHpres2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2002_WII, fun=mean, weights=TRUE))
CHpres2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2002_WII_Landsat2000list<- list(CHpres2002_WII_Landsat2000_blue, CHpres2002_WII_Landsat2000_green, CHpres2002_WII_Landsat2000_red, CHpres2002_WII_Landsat2000_nir, CHpres2002_WII_Landsat2000_swir1, CHpres2002_WII_Landsat2000_swir2, CHpres2002_WII_Landsat2000_NDVI, CHpres2002_WII_Landsat2000_NBR, CHpres2002_WII_Landsat2000_TCT_brightness, CHpres2002_WII_Landsat2000_TCT_greenness, CHpres2002_WII_Landsat2000_TCT_wetness)
CHpres2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2002_WII_Landsat2000list)
CHpres2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2002_WII_Landsat2000<-CHpres2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2002_WII_Landsat2000<-CHpres2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2002_WII_Landsat2000<-CHpres2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2002_WII_Landsat2000<-CHpres2002_WII_Landsat2000 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2002_WII_Landsat2000<-CHpres2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2002_WII_landsat2000.csv")

#CH presence data from 2005 at Wilderness II with 2005 Landsat
CHpres2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2005_WII, fun=mean, weights=TRUE))
CHpres2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2005_WII_Landsat2005list<- list(CHpres2005_WII_Landsat2005_blue, CHpres2005_WII_Landsat2005_green, CHpres2005_WII_Landsat2005_red, CHpres2005_WII_Landsat2005_nir, CHpres2005_WII_Landsat2005_swir1, CHpres2005_WII_Landsat2005_swir2, CHpres2005_WII_Landsat2005_NDVI, CHpres2005_WII_Landsat2005_NBR, CHpres2005_WII_Landsat2005_TCT_brightness, CHpres2005_WII_Landsat2005_TCT_greenness, CHpres2005_WII_Landsat2005_TCT_wetness)
CHpres2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2005_WII_Landsat2005list)
CHpres2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2005_WII_Landsat2005<-CHpres2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2005_WII_Landsat2005<-CHpres2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2005_WII_Landsat2005<-CHpres2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2005_WII_Landsat2005<-CHpres2005_WII_Landsat2005 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2005_WII_Landsat2005<-CHpres2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2005_WII_Landsat2005.csv")

#CH presence data from 2006 at Wilderness II with 2005 Landsat
CHpres2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2006_WII, fun=mean, weights=TRUE))
CHpres2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2006_WII_Landsat2005list<- list(CHpres2006_WII_Landsat2005_blue, CHpres2006_WII_Landsat2005_green, CHpres2006_WII_Landsat2005_red, CHpres2006_WII_Landsat2005_nir, CHpres2006_WII_Landsat2005_swir1, CHpres2006_WII_Landsat2005_swir2, CHpres2006_WII_Landsat2005_NDVI, CHpres2006_WII_Landsat2005_NBR, CHpres2006_WII_Landsat2005_TCT_brightness, CHpres2006_WII_Landsat2005_TCT_greenness, CHpres2006_WII_Landsat2005_TCT_wetness)
CHpres2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2006_WII_Landsat2005list)
CHpres2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2006_WII_Landsat2005<-CHpres2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2006_WII_Landsat2005<-CHpres2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2006_WII_Landsat2005<-CHpres2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2006_WII_Landsat2005<-CHpres2006_WII_Landsat2005 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2006_WII_Landsat2005<-CHpres2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2006_WII_Landsat2005.csv")

#CH presence data from 2007 at Wilderness II with 2005 Landsat
CHpres2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2007_WII, fun=mean, weights=TRUE))
CHpres2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2007_WII_Landsat2005list<- list(CHpres2007_WII_Landsat2005_blue, CHpres2007_WII_Landsat2005_green, CHpres2007_WII_Landsat2005_red, CHpres2007_WII_Landsat2005_nir, CHpres2007_WII_Landsat2005_swir1, CHpres2007_WII_Landsat2005_swir2, CHpres2007_WII_Landsat2005_NDVI, CHpres2007_WII_Landsat2005_NBR, CHpres2007_WII_Landsat2005_TCT_brightness, CHpres2007_WII_Landsat2005_TCT_greenness, CHpres2007_WII_Landsat2005_TCT_wetness)
CHpres2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2007_WII_Landsat2005list)
CHpres2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2007_WII_Landsat2005<-CHpres2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2007_WII_Landsat2005<-CHpres2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2007_WII_Landsat2005<-CHpres2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2007_WII_Landsat2005<-CHpres2007_WII_Landsat2005 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2007_WII_Landsat2005<-CHpres2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2007_WII_Landsat2005.csv")

#CH presence data from 2012 at Wilderness II with 2013 Landsat
CHpres2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2012_WII, fun=mean, weights=TRUE))
CHpres2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2012_WII_Landsat2013list<- list(CHpres2012_WII_Landsat2013_blue, CHpres2012_WII_Landsat2013_green, CHpres2012_WII_Landsat2013_red, CHpres2012_WII_Landsat2013_nir, CHpres2012_WII_Landsat2013_swir1, CHpres2012_WII_Landsat2013_swir2, CHpres2012_WII_Landsat2013_NDVI, CHpres2012_WII_Landsat2013_NBR, CHpres2012_WII_Landsat2013_TCT_brightness, CHpres2012_WII_Landsat2013_TCT_greenness, CHpres2012_WII_Landsat2013_TCT_wetness)
CHpres2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2012_WII_Landsat2013list)
CHpres2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2012_WII_Landsat2013<-CHpres2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2012_WII_Landsat2013<-CHpres2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2012_WII_Landsat2013<-CHpres2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2012_WII_Landsat2013<-CHpres2012_WII_Landsat2013 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2012_WII_Landsat2013<-CHpres2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2012_WII_Landsat2013.csv")

#CH presence data from 2013 at Wilderness II with 2013 Landsat
CHpres2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2013_WII, fun=mean, weights=TRUE))
CHpres2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2013_WII_Landsat2013list<- list(CHpres2013_WII_Landsat2013_blue, CHpres2013_WII_Landsat2013_green, CHpres2013_WII_Landsat2013_red, CHpres2013_WII_Landsat2013_nir, CHpres2013_WII_Landsat2013_swir1, CHpres2013_WII_Landsat2013_swir2, CHpres2013_WII_Landsat2013_NDVI, CHpres2013_WII_Landsat2013_NBR, CHpres2013_WII_Landsat2013_TCT_brightness, CHpres2013_WII_Landsat2013_TCT_greenness, CHpres2013_WII_Landsat2013_TCT_wetness)
CHpres2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2013_WII_Landsat2013list)
CHpres2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2013_WII_Landsat2013<-CHpres2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2013_WII_Landsat2013<-CHpres2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2013_WII_Landsat2013<-CHpres2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2013_WII_Landsat2013<-CHpres2013_WII_Landsat2013 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2013_WII_Landsat2013<-CHpres2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2013_WII_Landsat2013.csv")

#CH presence data from 2014 at Wilderness II with 2013 Landsat
CHpres2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_pres_2014_WII, fun=mean, weights=TRUE))
CHpres2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_pres_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2014_WII_Landsat2013list<- list(CHpres2014_WII_Landsat2013_blue, CHpres2014_WII_Landsat2013_green, CHpres2014_WII_Landsat2013_red, CHpres2014_WII_Landsat2013_nir, CHpres2014_WII_Landsat2013_swir1, CHpres2014_WII_Landsat2013_swir2, CHpres2014_WII_Landsat2013_NDVI, CHpres2014_WII_Landsat2013_NBR, CHpres2014_WII_Landsat2013_TCT_brightness, CHpres2014_WII_Landsat2013_TCT_greenness, CHpres2014_WII_Landsat2013_TCT_wetness)
CHpres2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2014_WII_Landsat2013list)
CHpres2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2014_WII_Landsat2013<-CHpres2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2014_WII_Landsat2013<-CHpres2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2014_WII_Landsat2013<-CHpres2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2014_WII_Landsat2013<-CHpres2014_WII_Landsat2013 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2014_WII_Landsat2013<-CHpres2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2014_WII_Landsat2013.csv")

#CH presence data from 2015 at Wilderness II with 2015 Landsat
CHpres2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_pres_2015_WII, fun=mean, weights=TRUE))
CHpres2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_pres_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2015_WII_Landsat2015list<- list(CHpres2015_WII_Landsat2015_blue, CHpres2015_WII_Landsat2015_green, CHpres2015_WII_Landsat2015_red, CHpres2015_WII_Landsat2015_nir, CHpres2015_WII_Landsat2015_swir1, CHpres2015_WII_Landsat2015_swir2, CHpres2015_WII_Landsat2015_NDVI, CHpres2015_WII_Landsat2015_NBR, CHpres2015_WII_Landsat2015_TCT_brightness, CHpres2015_WII_Landsat2015_TCT_greenness, CHpres2015_WII_Landsat2015_TCT_wetness)
CHpres2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2015_WII_Landsat2015list)
CHpres2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2015_WII_Landsat2015<-CHpres2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2015_WII_Landsat2015<-CHpres2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2015_WII_Landsat2015<-CHpres2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2015_WII_Landsat2015<-CHpres2015_WII_Landsat2015 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2015_WII_Landsat2015<-CHpres2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2015_WII_Landsat2015.csv")

#CH presence data from 2016 at Wilderness II with 2015 Landsat
CHpres2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_pres_2016_WII, fun=mean, weights=TRUE))
CHpres2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_pres_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2016_WII_Landsat2015list<- list(CHpres2016_WII_Landsat2015_blue, CHpres2016_WII_Landsat2015_green, CHpres2016_WII_Landsat2015_red, CHpres2016_WII_Landsat2015_nir, CHpres2016_WII_Landsat2015_swir1, CHpres2016_WII_Landsat2015_swir2, CHpres2016_WII_Landsat2015_NDVI, CHpres2016_WII_Landsat2015_NBR, CHpres2016_WII_Landsat2015_TCT_brightness, CHpres2016_WII_Landsat2015_TCT_greenness, CHpres2016_WII_Landsat2015_TCT_wetness)
CHpres2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2016_WII_Landsat2015list)
CHpres2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2016_WII_Landsat2015<-CHpres2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2016_WII_Landsat2015<-CHpres2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2016_WII_Landsat2015<-CHpres2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2016_WII_Landsat2015<-CHpres2016_WII_Landsat2015 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2016_WII_Landsat2015<-CHpres2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2016_WII_Landsat2015.csv")

#CH presence data from 2017 at Wilderness II with 2015 Landsat
CHpres2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_pres_2017_WII, fun=mean, weights=TRUE))
CHpres2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_pres_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHpres2017_WII_Landsat2015list<- list(CHpres2017_WII_Landsat2015_blue, CHpres2017_WII_Landsat2015_green, CHpres2017_WII_Landsat2015_red, CHpres2017_WII_Landsat2015_nir, CHpres2017_WII_Landsat2015_swir1, CHpres2017_WII_Landsat2015_swir2, CHpres2017_WII_Landsat2015_NDVI, CHpres2017_WII_Landsat2015_NBR, CHpres2017_WII_Landsat2015_TCT_brightness, CHpres2017_WII_Landsat2015_TCT_greenness, CHpres2017_WII_Landsat2015_TCT_wetness)
CHpres2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHpres2017_WII_Landsat2015list)
CHpres2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHpres2017_WII_Landsat2015<-CHpres2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHpres2017_WII_Landsat2015<-CHpres2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHpres2017_WII_Landsat2015<-CHpres2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHpres2017_WII_Landsat2015<-CHpres2017_WII_Landsat2015 %>%
  mutate(species = "CH_presence")%>% dplyr::select(species, everything())#add column for bird species
CHpres2017_WII_Landsat2015<-CHpres2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHpres2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHpres2017_WII_Landsat2015.csv")

####WW####
#WW presence data from 2000 at Wilderness II with 2000 Landsat
#no data
# WWpres2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2000_WII, fun=mean, weights=TRUE))
# WWpres2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWpres2000_WII_Landsat2000list<- list(WWpres2000_WII_Landsat2000_blue, WWpres2000_WII_Landsat2000_green, WWpres2000_WII_Landsat2000_red, WWpres2000_WII_Landsat2000_nir, WWpres2000_WII_Landsat2000_swir1, WWpres2000_WII_Landsat2000_swir2, WWpres2000_WII_Landsat2000_NDVI, WWpres2000_WII_Landsat2000_NBR, WWpres2000_WII_Landsat2000_TCT_brightness, WWpres2000_WII_Landsat2000_TCT_greenness, WWpres2000_WII_Landsat2000_TCT_wetness)
# WWpres2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2000_WII_Landsat2000list)
# WWpres2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# WWpres2000_WII_Landsat2000<-WWpres2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# WWpres2000_WII_Landsat2000<-WWpres2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWpres2000_WII_Landsat2000<-WWpres2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWpres2000_WII_Landsat2000<-WWpres2000_WII_Landsat2000 %>%
#   mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
# WWpres2000_WII_Landsat2000<-WWpres2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWpres2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2000_WII_landsat2000.csv")

#WW presence data from 2001 at Wilderness II with 2000 Landsat
WWpres2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2001_WII, fun=mean, weights=TRUE))
WWpres2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2001_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2001_WII_Landsat2000list<- list(WWpres2001_WII_Landsat2000_blue, WWpres2001_WII_Landsat2000_green, WWpres2001_WII_Landsat2000_red, WWpres2001_WII_Landsat2000_nir, WWpres2001_WII_Landsat2000_swir1, WWpres2001_WII_Landsat2000_swir2, WWpres2001_WII_Landsat2000_NDVI, WWpres2001_WII_Landsat2000_NBR, WWpres2001_WII_Landsat2000_TCT_brightness, WWpres2001_WII_Landsat2000_TCT_greenness, WWpres2001_WII_Landsat2000_TCT_wetness)
WWpres2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2001_WII_Landsat2000list)
WWpres2001_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2001_WII_Landsat2000<-WWpres2001_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2001_WII_Landsat2000<-WWpres2001_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2001_WII_Landsat2000<-WWpres2001_WII_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2001_WII_Landsat2000<-WWpres2001_WII_Landsat2000 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2001_WII_Landsat2000<-WWpres2001_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2001_WII_landsat2000.csv")

#WW presence data from 2002 at Wilderness II with 2000 Landsat
WWpres2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2002_WII, fun=mean, weights=TRUE))
WWpres2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2002_WII_Landsat2000list<- list(WWpres2002_WII_Landsat2000_blue, WWpres2002_WII_Landsat2000_green, WWpres2002_WII_Landsat2000_red, WWpres2002_WII_Landsat2000_nir, WWpres2002_WII_Landsat2000_swir1, WWpres2002_WII_Landsat2000_swir2, WWpres2002_WII_Landsat2000_NDVI, WWpres2002_WII_Landsat2000_NBR, WWpres2002_WII_Landsat2000_TCT_brightness, WWpres2002_WII_Landsat2000_TCT_greenness, WWpres2002_WII_Landsat2000_TCT_wetness)
WWpres2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2002_WII_Landsat2000list)
WWpres2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2002_WII_Landsat2000<-WWpres2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2002_WII_Landsat2000<-WWpres2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2002_WII_Landsat2000<-WWpres2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2002_WII_Landsat2000<-WWpres2002_WII_Landsat2000 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2002_WII_Landsat2000<-WWpres2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2002_WII_landsat2000.csv")

#WW presence data from 2005 at Wilderness II with 2005 Landsat
WWpres2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2005_WII, fun=mean, weights=TRUE))
WWpres2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2005_WII_Landsat2005list<- list(WWpres2005_WII_Landsat2005_blue, WWpres2005_WII_Landsat2005_green, WWpres2005_WII_Landsat2005_red, WWpres2005_WII_Landsat2005_nir, WWpres2005_WII_Landsat2005_swir1, WWpres2005_WII_Landsat2005_swir2, WWpres2005_WII_Landsat2005_NDVI, WWpres2005_WII_Landsat2005_NBR, WWpres2005_WII_Landsat2005_TCT_brightness, WWpres2005_WII_Landsat2005_TCT_greenness, WWpres2005_WII_Landsat2005_TCT_wetness)
WWpres2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2005_WII_Landsat2005list)
WWpres2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2005_WII_Landsat2005<-WWpres2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2005_WII_Landsat2005<-WWpres2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2005_WII_Landsat2005<-WWpres2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2005_WII_Landsat2005<-WWpres2005_WII_Landsat2005 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2005_WII_Landsat2005<-WWpres2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2005_WII_Landsat2005.csv")

#WW presence data from 2006 at Wilderness II with 2005 Landsat
WWpres2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2006_WII, fun=mean, weights=TRUE))
WWpres2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2006_WII_Landsat2005list<- list(WWpres2006_WII_Landsat2005_blue, WWpres2006_WII_Landsat2005_green, WWpres2006_WII_Landsat2005_red, WWpres2006_WII_Landsat2005_nir, WWpres2006_WII_Landsat2005_swir1, WWpres2006_WII_Landsat2005_swir2, WWpres2006_WII_Landsat2005_NDVI, WWpres2006_WII_Landsat2005_NBR, WWpres2006_WII_Landsat2005_TCT_brightness, WWpres2006_WII_Landsat2005_TCT_greenness, WWpres2006_WII_Landsat2005_TCT_wetness)
WWpres2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2006_WII_Landsat2005list)
WWpres2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2006_WII_Landsat2005<-WWpres2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2006_WII_Landsat2005<-WWpres2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2006_WII_Landsat2005<-WWpres2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2006_WII_Landsat2005<-WWpres2006_WII_Landsat2005 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2006_WII_Landsat2005<-WWpres2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2006_WII_Landsat2005.csv")

#WW presence data from 2007 at Wilderness II with 2005 Landsat
WWpres2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2007_WII, fun=mean, weights=TRUE))
WWpres2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2007_WII_Landsat2005list<- list(WWpres2007_WII_Landsat2005_blue, WWpres2007_WII_Landsat2005_green, WWpres2007_WII_Landsat2005_red, WWpres2007_WII_Landsat2005_nir, WWpres2007_WII_Landsat2005_swir1, WWpres2007_WII_Landsat2005_swir2, WWpres2007_WII_Landsat2005_NDVI, WWpres2007_WII_Landsat2005_NBR, WWpres2007_WII_Landsat2005_TCT_brightness, WWpres2007_WII_Landsat2005_TCT_greenness, WWpres2007_WII_Landsat2005_TCT_wetness)
WWpres2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2007_WII_Landsat2005list)
WWpres2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2007_WII_Landsat2005<-WWpres2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2007_WII_Landsat2005<-WWpres2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2007_WII_Landsat2005<-WWpres2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2007_WII_Landsat2005<-WWpres2007_WII_Landsat2005 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2007_WII_Landsat2005<-WWpres2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2007_WII_Landsat2005.csv")

#WW presence data from 2012 at Wilderness II with 2013 Landsat
WWpres2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2012_WII, fun=mean, weights=TRUE))
WWpres2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2012_WII_Landsat2013list<- list(WWpres2012_WII_Landsat2013_blue, WWpres2012_WII_Landsat2013_green, WWpres2012_WII_Landsat2013_red, WWpres2012_WII_Landsat2013_nir, WWpres2012_WII_Landsat2013_swir1, WWpres2012_WII_Landsat2013_swir2, WWpres2012_WII_Landsat2013_NDVI, WWpres2012_WII_Landsat2013_NBR, WWpres2012_WII_Landsat2013_TCT_brightness, WWpres2012_WII_Landsat2013_TCT_greenness, WWpres2012_WII_Landsat2013_TCT_wetness)
WWpres2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2012_WII_Landsat2013list)
WWpres2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2012_WII_Landsat2013<-WWpres2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2012_WII_Landsat2013<-WWpres2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2012_WII_Landsat2013<-WWpres2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2012_WII_Landsat2013<-WWpres2012_WII_Landsat2013 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2012_WII_Landsat2013<-WWpres2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2012_WII_Landsat2013.csv")

#WW presence data from 2013 at Wilderness II with 2013 Landsat
WWpres2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2013_WII, fun=mean, weights=TRUE))
WWpres2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2013_WII_Landsat2013list<- list(WWpres2013_WII_Landsat2013_blue, WWpres2013_WII_Landsat2013_green, WWpres2013_WII_Landsat2013_red, WWpres2013_WII_Landsat2013_nir, WWpres2013_WII_Landsat2013_swir1, WWpres2013_WII_Landsat2013_swir2, WWpres2013_WII_Landsat2013_NDVI, WWpres2013_WII_Landsat2013_NBR, WWpres2013_WII_Landsat2013_TCT_brightness, WWpres2013_WII_Landsat2013_TCT_greenness, WWpres2013_WII_Landsat2013_TCT_wetness)
WWpres2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2013_WII_Landsat2013list)
WWpres2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2013_WII_Landsat2013<-WWpres2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2013_WII_Landsat2013<-WWpres2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2013_WII_Landsat2013<-WWpres2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2013_WII_Landsat2013<-WWpres2013_WII_Landsat2013 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2013_WII_Landsat2013<-WWpres2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2013_WII_Landsat2013.csv")

#WW presence data from 2014 at Wilderness II with 2013 Landsat
WWpres2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_pres_2014_WII, fun=mean, weights=TRUE))
WWpres2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_pres_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2014_WII_Landsat2013list<- list(WWpres2014_WII_Landsat2013_blue, WWpres2014_WII_Landsat2013_green, WWpres2014_WII_Landsat2013_red, WWpres2014_WII_Landsat2013_nir, WWpres2014_WII_Landsat2013_swir1, WWpres2014_WII_Landsat2013_swir2, WWpres2014_WII_Landsat2013_NDVI, WWpres2014_WII_Landsat2013_NBR, WWpres2014_WII_Landsat2013_TCT_brightness, WWpres2014_WII_Landsat2013_TCT_greenness, WWpres2014_WII_Landsat2013_TCT_wetness)
WWpres2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2014_WII_Landsat2013list)
WWpres2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2014_WII_Landsat2013<-WWpres2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2014_WII_Landsat2013<-WWpres2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2014_WII_Landsat2013<-WWpres2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2014_WII_Landsat2013<-WWpres2014_WII_Landsat2013 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2014_WII_Landsat2013<-WWpres2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2014_WII_Landsat2013.csv")

#WW presence data from 2015 at Wilderness II with 2015 Landsat
WWpres2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_pres_2015_WII, fun=mean, weights=TRUE))
WWpres2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_pres_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2015_WII_Landsat2015list<- list(WWpres2015_WII_Landsat2015_blue, WWpres2015_WII_Landsat2015_green, WWpres2015_WII_Landsat2015_red, WWpres2015_WII_Landsat2015_nir, WWpres2015_WII_Landsat2015_swir1, WWpres2015_WII_Landsat2015_swir2, WWpres2015_WII_Landsat2015_NDVI, WWpres2015_WII_Landsat2015_NBR, WWpres2015_WII_Landsat2015_TCT_brightness, WWpres2015_WII_Landsat2015_TCT_greenness, WWpres2015_WII_Landsat2015_TCT_wetness)
WWpres2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2015_WII_Landsat2015list)
WWpres2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2015_WII_Landsat2015<-WWpres2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2015_WII_Landsat2015<-WWpres2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2015_WII_Landsat2015<-WWpres2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2015_WII_Landsat2015<-WWpres2015_WII_Landsat2015 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2015_WII_Landsat2015<-WWpres2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2015_WII_Landsat2015.csv")

#WW presence data from 2016 at Wilderness II with 2015 Landsat
WWpres2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_pres_2016_WII, fun=mean, weights=TRUE))
WWpres2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_pres_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2016_WII_Landsat2015list<- list(WWpres2016_WII_Landsat2015_blue, WWpres2016_WII_Landsat2015_green, WWpres2016_WII_Landsat2015_red, WWpres2016_WII_Landsat2015_nir, WWpres2016_WII_Landsat2015_swir1, WWpres2016_WII_Landsat2015_swir2, WWpres2016_WII_Landsat2015_NDVI, WWpres2016_WII_Landsat2015_NBR, WWpres2016_WII_Landsat2015_TCT_brightness, WWpres2016_WII_Landsat2015_TCT_greenness, WWpres2016_WII_Landsat2015_TCT_wetness)
WWpres2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2016_WII_Landsat2015list)
WWpres2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2016_WII_Landsat2015<-WWpres2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2016_WII_Landsat2015<-WWpres2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2016_WII_Landsat2015<-WWpres2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2016_WII_Landsat2015<-WWpres2016_WII_Landsat2015 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2016_WII_Landsat2015<-WWpres2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2016_WII_Landsat2015.csv")

#WW presence data from 2017 at Wilderness II with 2015 Landsat
WWpres2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_pres_2017_WII, fun=mean, weights=TRUE))
WWpres2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_pres_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWpres2017_WII_Landsat2015list<- list(WWpres2017_WII_Landsat2015_blue, WWpres2017_WII_Landsat2015_green, WWpres2017_WII_Landsat2015_red, WWpres2017_WII_Landsat2015_nir, WWpres2017_WII_Landsat2015_swir1, WWpres2017_WII_Landsat2015_swir2, WWpres2017_WII_Landsat2015_NDVI, WWpres2017_WII_Landsat2015_NBR, WWpres2017_WII_Landsat2015_TCT_brightness, WWpres2017_WII_Landsat2015_TCT_greenness, WWpres2017_WII_Landsat2015_TCT_wetness)
WWpres2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWpres2017_WII_Landsat2015list)
WWpres2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWpres2017_WII_Landsat2015<-WWpres2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWpres2017_WII_Landsat2015<-WWpres2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWpres2017_WII_Landsat2015<-WWpres2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWpres2017_WII_Landsat2015<-WWpres2017_WII_Landsat2015 %>%
  mutate(species = "WW_presence")%>% dplyr::select(species, everything())#add column for bird species
WWpres2017_WII_Landsat2015<-WWpres2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWpres2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWpres2017_WII_Landsat2015.csv")

####ABSENCE####
###Wilderness I####

####BT####
#BT absence data from 2000 at Wilderness I with 2000 Landsat
BTabs2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2000_WI, fun=mean, weights=TRUE))
BTabs2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2000_WI_Landsat2000list<- list(BTabs2000_WI_Landsat2000_blue, BTabs2000_WI_Landsat2000_green, BTabs2000_WI_Landsat2000_red, BTabs2000_WI_Landsat2000_nir, BTabs2000_WI_Landsat2000_swir1, BTabs2000_WI_Landsat2000_swir2, BTabs2000_WI_Landsat2000_NDVI, BTabs2000_WI_Landsat2000_NBR, BTabs2000_WI_Landsat2000_TCT_brightness, BTabs2000_WI_Landsat2000_TCT_greenness, BTabs2000_WI_Landsat2000_TCT_wetness)
BTabs2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2000_WI_Landsat2000list)
BTabs2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2000_WI_Landsat2000<-BTabs2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2000_WI_Landsat2000<-BTabs2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2000_WI_Landsat2000<-BTabs2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2000_WI_Landsat2000<-BTabs2000_WI_Landsat2000 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2000_WI_Landsat2000<-BTabs2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2000_WI_landsat2000.csv")

#BT absence data from 2001 at Wilderness I with 2000 Landsat
BTabs2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2001_WI, fun=mean, weights=TRUE))
BTabs2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2001_WI_Landsat2000list<- list(BTabs2001_WI_Landsat2000_blue, BTabs2001_WI_Landsat2000_green, BTabs2001_WI_Landsat2000_red, BTabs2001_WI_Landsat2000_nir, BTabs2001_WI_Landsat2000_swir1, BTabs2001_WI_Landsat2000_swir2, BTabs2001_WI_Landsat2000_NDVI, BTabs2001_WI_Landsat2000_NBR, BTabs2001_WI_Landsat2000_TCT_brightness, BTabs2001_WI_Landsat2000_TCT_greenness, BTabs2001_WI_Landsat2000_TCT_wetness)
BTabs2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2001_WI_Landsat2000list)
BTabs2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2001_WI_Landsat2000<-BTabs2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2001_WI_Landsat2000<-BTabs2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2001_WI_Landsat2000<-BTabs2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2001_WI_Landsat2000<-BTabs2001_WI_Landsat2000 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2001_WI_Landsat2000<-BTabs2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2001_WI_landsat2000.csv")

#BT absence data from 2002 at Wilderness I with 2000 Landsat
BTabs2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2002_WI, fun=mean, weights=TRUE))
BTabs2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2002_WI_Landsat2000list<- list(BTabs2002_WI_Landsat2000_blue, BTabs2002_WI_Landsat2000_green, BTabs2002_WI_Landsat2000_red, BTabs2002_WI_Landsat2000_nir, BTabs2002_WI_Landsat2000_swir1, BTabs2002_WI_Landsat2000_swir2, BTabs2002_WI_Landsat2000_NDVI, BTabs2002_WI_Landsat2000_NBR, BTabs2002_WI_Landsat2000_TCT_brightness, BTabs2002_WI_Landsat2000_TCT_greenness, BTabs2002_WI_Landsat2000_TCT_wetness)
BTabs2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2002_WI_Landsat2000list)
BTabs2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2002_WI_Landsat2000<-BTabs2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2002_WI_Landsat2000<-BTabs2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2002_WI_Landsat2000<-BTabs2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2002_WI_Landsat2000<-BTabs2002_WI_Landsat2000 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2002_WI_Landsat2000<-BTabs2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2002_WI_landsat2000.csv")

#BT absence data from 2005 at Wilderness I with 2005 Landsat
BTabs2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2005_WI, fun=mean, weights=TRUE))
BTabs2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2005_WI_Landsat2005list<- list(BTabs2005_WI_Landsat2005_blue, BTabs2005_WI_Landsat2005_green, BTabs2005_WI_Landsat2005_red, BTabs2005_WI_Landsat2005_nir, BTabs2005_WI_Landsat2005_swir1, BTabs2005_WI_Landsat2005_swir2, BTabs2005_WI_Landsat2005_NDVI, BTabs2005_WI_Landsat2005_NBR, BTabs2005_WI_Landsat2005_TCT_brightness, BTabs2005_WI_Landsat2005_TCT_greenness, BTabs2005_WI_Landsat2005_TCT_wetness)
BTabs2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2005_WI_Landsat2005list)
BTabs2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2005_WI_Landsat2005<-BTabs2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2005_WI_Landsat2005<-BTabs2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2005_WI_Landsat2005<-BTabs2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2005_WI_Landsat2005<-BTabs2005_WI_Landsat2005 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2005_WI_Landsat2005<-BTabs2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2005_WI_Landsat2005.csv")

#BT absence data from 2006 at Wilderness I with 2005 Landsat
BTabs2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2006_WI, fun=mean, weights=TRUE))
BTabs2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2006_WI_Landsat2005list<- list(BTabs2006_WI_Landsat2005_blue, BTabs2006_WI_Landsat2005_green, BTabs2006_WI_Landsat2005_red, BTabs2006_WI_Landsat2005_nir, BTabs2006_WI_Landsat2005_swir1, BTabs2006_WI_Landsat2005_swir2, BTabs2006_WI_Landsat2005_NDVI, BTabs2006_WI_Landsat2005_NBR, BTabs2006_WI_Landsat2005_TCT_brightness, BTabs2006_WI_Landsat2005_TCT_greenness, BTabs2006_WI_Landsat2005_TCT_wetness)
BTabs2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2006_WI_Landsat2005list)
BTabs2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2006_WI_Landsat2005<-BTabs2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2006_WI_Landsat2005<-BTabs2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2006_WI_Landsat2005<-BTabs2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2006_WI_Landsat2005<-BTabs2006_WI_Landsat2005 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2006_WI_Landsat2005<-BTabs2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2006_WI_Landsat2005.csv")

#BT absence data from 2007 at Wilderness I with 2005 Landsat
BTabs2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2007_WI, fun=mean, weights=TRUE))
BTabs2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2007_WI_Landsat2005list<- list(BTabs2007_WI_Landsat2005_blue, BTabs2007_WI_Landsat2005_green, BTabs2007_WI_Landsat2005_red, BTabs2007_WI_Landsat2005_nir, BTabs2007_WI_Landsat2005_swir1, BTabs2007_WI_Landsat2005_swir2, BTabs2007_WI_Landsat2005_NDVI, BTabs2007_WI_Landsat2005_NBR, BTabs2007_WI_Landsat2005_TCT_brightness, BTabs2007_WI_Landsat2005_TCT_greenness, BTabs2007_WI_Landsat2005_TCT_wetness)
BTabs2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2007_WI_Landsat2005list)
BTabs2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2007_WI_Landsat2005<-BTabs2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2007_WI_Landsat2005<-BTabs2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2007_WI_Landsat2005<-BTabs2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2007_WI_Landsat2005<-BTabs2007_WI_Landsat2005 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2007_WI_Landsat2005<-BTabs2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2007_WI_Landsat2005.csv")

#BT absence data from 2012 at Wilderness I with 2013 Landsat
BTabs2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2012_WI, fun=mean, weights=TRUE))
BTabs2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2012_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2012_WI_Landsat2013list<- list(BTabs2012_WI_Landsat2013_blue, BTabs2012_WI_Landsat2013_green, BTabs2012_WI_Landsat2013_red, BTabs2012_WI_Landsat2013_nir, BTabs2012_WI_Landsat2013_swir1, BTabs2012_WI_Landsat2013_swir2, BTabs2012_WI_Landsat2013_NDVI, BTabs2012_WI_Landsat2013_NBR, BTabs2012_WI_Landsat2013_TCT_brightness, BTabs2012_WI_Landsat2013_TCT_greenness, BTabs2012_WI_Landsat2013_TCT_wetness)
BTabs2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2012_WI_Landsat2013list)
BTabs2012_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2012_WI_Landsat2013<-BTabs2012_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2012_WI_Landsat2013<-BTabs2012_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2012_WI_Landsat2013<-BTabs2012_WI_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2012_WI_Landsat2013<-BTabs2012_WI_Landsat2013 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2012_WI_Landsat2013<-BTabs2012_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2012_WI_Landsat2013.csv")

#BT absence data from 2013 at Wilderness I with 2013 Landsat
BTabs2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2013_WI, fun=mean, weights=TRUE))
BTabs2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2013_WI_Landsat2013list<- list(BTabs2013_WI_Landsat2013_blue, BTabs2013_WI_Landsat2013_green, BTabs2013_WI_Landsat2013_red, BTabs2013_WI_Landsat2013_nir, BTabs2013_WI_Landsat2013_swir1, BTabs2013_WI_Landsat2013_swir2, BTabs2013_WI_Landsat2013_NDVI, BTabs2013_WI_Landsat2013_NBR, BTabs2013_WI_Landsat2013_TCT_brightness, BTabs2013_WI_Landsat2013_TCT_greenness, BTabs2013_WI_Landsat2013_TCT_wetness)
BTabs2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2013_WI_Landsat2013list)
BTabs2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2013_WI_Landsat2013<-BTabs2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2013_WI_Landsat2013<-BTabs2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2013_WI_Landsat2013<-BTabs2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2013_WI_Landsat2013<-BTabs2013_WI_Landsat2013 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2013_WI_Landsat2013<-BTabs2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2013_WI_Landsat2013.csv")

#BT absence data from 2014 at Wilderness I with 2013 Landsat
BTabs2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2014_WI, fun=mean, weights=TRUE))
BTabs2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2014_WI_Landsat2013list<- list(BTabs2014_WI_Landsat2013_blue, BTabs2014_WI_Landsat2013_green, BTabs2014_WI_Landsat2013_red, BTabs2014_WI_Landsat2013_nir, BTabs2014_WI_Landsat2013_swir1, BTabs2014_WI_Landsat2013_swir2, BTabs2014_WI_Landsat2013_NDVI, BTabs2014_WI_Landsat2013_NBR, BTabs2014_WI_Landsat2013_TCT_brightness, BTabs2014_WI_Landsat2013_TCT_greenness, BTabs2014_WI_Landsat2013_TCT_wetness)
BTabs2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2014_WI_Landsat2013list)
BTabs2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2014_WI_Landsat2013<-BTabs2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2014_WI_Landsat2013<-BTabs2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2014_WI_Landsat2013<-BTabs2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2014_WI_Landsat2013<-BTabs2014_WI_Landsat2013 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2014_WI_Landsat2013<-BTabs2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2014_WI_Landsat2013.csv")

#BT absence data from 2015 at Wilderness I with 2015 Landsat
BTabs2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_abs_2015_WI, fun=mean, weights=TRUE))
BTabs2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_abs_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2015_WI_Landsat2015list<- list(BTabs2015_WI_Landsat2015_blue, BTabs2015_WI_Landsat2015_green, BTabs2015_WI_Landsat2015_red, BTabs2015_WI_Landsat2015_nir, BTabs2015_WI_Landsat2015_swir1, BTabs2015_WI_Landsat2015_swir2, BTabs2015_WI_Landsat2015_NDVI, BTabs2015_WI_Landsat2015_NBR, BTabs2015_WI_Landsat2015_TCT_brightness, BTabs2015_WI_Landsat2015_TCT_greenness, BTabs2015_WI_Landsat2015_TCT_wetness)
BTabs2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2015_WI_Landsat2015list)
BTabs2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2015_WI_Landsat2015<-BTabs2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2015_WI_Landsat2015<-BTabs2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2015_WI_Landsat2015<-BTabs2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2015_WI_Landsat2015<-BTabs2015_WI_Landsat2015 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2015_WI_Landsat2015<-BTabs2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2015_WI_Landsat2015.csv")

#BT absence data from 2016 at Wilderness I with 2015 Landsat
BTabs2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_abs_2016_WI, fun=mean, weights=TRUE))
BTabs2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_abs_2016_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2016_WI_Landsat2015list<- list(BTabs2016_WI_Landsat2015_blue, BTabs2016_WI_Landsat2015_green, BTabs2016_WI_Landsat2015_red, BTabs2016_WI_Landsat2015_nir, BTabs2016_WI_Landsat2015_swir1, BTabs2016_WI_Landsat2015_swir2, BTabs2016_WI_Landsat2015_NDVI, BTabs2016_WI_Landsat2015_NBR, BTabs2016_WI_Landsat2015_TCT_brightness, BTabs2016_WI_Landsat2015_TCT_greenness, BTabs2016_WI_Landsat2015_TCT_wetness)
BTabs2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2016_WI_Landsat2015list)
BTabs2016_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2016_WI_Landsat2015<-BTabs2016_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2016_WI_Landsat2015<-BTabs2016_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2016_WI_Landsat2015<-BTabs2016_WI_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2016_WI_Landsat2015<-BTabs2016_WI_Landsat2015 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2016_WI_Landsat2015<-BTabs2016_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2016_WI_Landsat2015.csv")

#BT absence data from 2017 at Wilderness I with 2015 Landsat
BTabs2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_abs_2017_WI, fun=mean, weights=TRUE))
BTabs2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_abs_2017_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2017_WI_Landsat2015list<- list(BTabs2017_WI_Landsat2015_blue, BTabs2017_WI_Landsat2015_green, BTabs2017_WI_Landsat2015_red, BTabs2017_WI_Landsat2015_nir, BTabs2017_WI_Landsat2015_swir1, BTabs2017_WI_Landsat2015_swir2, BTabs2017_WI_Landsat2015_NDVI, BTabs2017_WI_Landsat2015_NBR, BTabs2017_WI_Landsat2015_TCT_brightness, BTabs2017_WI_Landsat2015_TCT_greenness, BTabs2017_WI_Landsat2015_TCT_wetness)
BTabs2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2017_WI_Landsat2015list)
BTabs2017_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2017_WI_Landsat2015<-BTabs2017_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
BTabs2017_WI_Landsat2015<-BTabs2017_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2017_WI_Landsat2015<-BTabs2017_WI_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2017_WI_Landsat2015<-BTabs2017_WI_Landsat2015 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2017_WI_Landsat2015<-BTabs2017_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2017_WI_Landsat2015.csv")

####CC####
#CC absence data from 2000 at Wilderness I with 2000 Landsat
CCabs2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2000_WI, fun=mean, weights=TRUE))
CCabs2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2000_WI_Landsat2000list<- list(CCabs2000_WI_Landsat2000_blue, CCabs2000_WI_Landsat2000_green, CCabs2000_WI_Landsat2000_red, CCabs2000_WI_Landsat2000_nir, CCabs2000_WI_Landsat2000_swir1, CCabs2000_WI_Landsat2000_swir2, CCabs2000_WI_Landsat2000_NDVI, CCabs2000_WI_Landsat2000_NBR, CCabs2000_WI_Landsat2000_TCT_brightness, CCabs2000_WI_Landsat2000_TCT_greenness, CCabs2000_WI_Landsat2000_TCT_wetness)
CCabs2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2000_WI_Landsat2000list)
CCabs2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2000_WI_Landsat2000<-CCabs2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2000_WI_Landsat2000<-CCabs2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2000_WI_Landsat2000<-CCabs2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2000_WI_Landsat2000<-CCabs2000_WI_Landsat2000 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2000_WI_Landsat2000<-CCabs2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2000_WI_landsat2000.csv")

#CC absence data from 2001 at Wilderness I with 2000 Landsat
CCabs2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2001_WI, fun=mean, weights=TRUE))
CCabs2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2001_WI_Landsat2000list<- list(CCabs2001_WI_Landsat2000_blue, CCabs2001_WI_Landsat2000_green, CCabs2001_WI_Landsat2000_red, CCabs2001_WI_Landsat2000_nir, CCabs2001_WI_Landsat2000_swir1, CCabs2001_WI_Landsat2000_swir2, CCabs2001_WI_Landsat2000_NDVI, CCabs2001_WI_Landsat2000_NBR, CCabs2001_WI_Landsat2000_TCT_brightness, CCabs2001_WI_Landsat2000_TCT_greenness, CCabs2001_WI_Landsat2000_TCT_wetness)
CCabs2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2001_WI_Landsat2000list)
CCabs2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2001_WI_Landsat2000<-CCabs2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2001_WI_Landsat2000<-CCabs2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2001_WI_Landsat2000<-CCabs2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2001_WI_Landsat2000<-CCabs2001_WI_Landsat2000 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2001_WI_Landsat2000<-CCabs2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2001_WI_landsat2000.csv")

#CC absence data from 2002 at Wilderness I with 2000 Landsat
CCabs2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2002_WI, fun=mean, weights=TRUE))
CCabs2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2002_WI_Landsat2000list<- list(CCabs2002_WI_Landsat2000_blue, CCabs2002_WI_Landsat2000_green, CCabs2002_WI_Landsat2000_red, CCabs2002_WI_Landsat2000_nir, CCabs2002_WI_Landsat2000_swir1, CCabs2002_WI_Landsat2000_swir2, CCabs2002_WI_Landsat2000_NDVI, CCabs2002_WI_Landsat2000_NBR, CCabs2002_WI_Landsat2000_TCT_brightness, CCabs2002_WI_Landsat2000_TCT_greenness, CCabs2002_WI_Landsat2000_TCT_wetness)
CCabs2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2002_WI_Landsat2000list)
CCabs2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2002_WI_Landsat2000<-CCabs2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2002_WI_Landsat2000<-CCabs2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2002_WI_Landsat2000<-CCabs2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2002_WI_Landsat2000<-CCabs2002_WI_Landsat2000 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2002_WI_Landsat2000<-CCabs2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2002_WI_landsat2000.csv")

#CC absence data from 2005 at Wilderness I with 2005 Landsat
CCabs2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2005_WI, fun=mean, weights=TRUE))
CCabs2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2005_WI_Landsat2005list<- list(CCabs2005_WI_Landsat2005_blue, CCabs2005_WI_Landsat2005_green, CCabs2005_WI_Landsat2005_red, CCabs2005_WI_Landsat2005_nir, CCabs2005_WI_Landsat2005_swir1, CCabs2005_WI_Landsat2005_swir2, CCabs2005_WI_Landsat2005_NDVI, CCabs2005_WI_Landsat2005_NBR, CCabs2005_WI_Landsat2005_TCT_brightness, CCabs2005_WI_Landsat2005_TCT_greenness, CCabs2005_WI_Landsat2005_TCT_wetness)
CCabs2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2005_WI_Landsat2005list)
CCabs2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2005_WI_Landsat2005<-CCabs2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2005_WI_Landsat2005<-CCabs2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2005_WI_Landsat2005<-CCabs2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2005_WI_Landsat2005<-CCabs2005_WI_Landsat2005 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2005_WI_Landsat2005<-CCabs2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2005_WI_Landsat2005.csv")

#CC absence data from 2006 at Wilderness I with 2005 Landsat
CCabs2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2006_WI, fun=mean, weights=TRUE))
CCabs2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2006_WI_Landsat2005list<- list(CCabs2006_WI_Landsat2005_blue, CCabs2006_WI_Landsat2005_green, CCabs2006_WI_Landsat2005_red, CCabs2006_WI_Landsat2005_nir, CCabs2006_WI_Landsat2005_swir1, CCabs2006_WI_Landsat2005_swir2, CCabs2006_WI_Landsat2005_NDVI, CCabs2006_WI_Landsat2005_NBR, CCabs2006_WI_Landsat2005_TCT_brightness, CCabs2006_WI_Landsat2005_TCT_greenness, CCabs2006_WI_Landsat2005_TCT_wetness)
CCabs2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2006_WI_Landsat2005list)
CCabs2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2006_WI_Landsat2005<-CCabs2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2006_WI_Landsat2005<-CCabs2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2006_WI_Landsat2005<-CCabs2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2006_WI_Landsat2005<-CCabs2006_WI_Landsat2005 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2006_WI_Landsat2005<-CCabs2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2006_WI_Landsat2005.csv")

#CC absence data from 2007 at Wilderness I with 2005 Landsat
CCabs2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2007_WI, fun=mean, weights=TRUE))
CCabs2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2007_WI_Landsat2005list<- list(CCabs2007_WI_Landsat2005_blue, CCabs2007_WI_Landsat2005_green, CCabs2007_WI_Landsat2005_red, CCabs2007_WI_Landsat2005_nir, CCabs2007_WI_Landsat2005_swir1, CCabs2007_WI_Landsat2005_swir2, CCabs2007_WI_Landsat2005_NDVI, CCabs2007_WI_Landsat2005_NBR, CCabs2007_WI_Landsat2005_TCT_brightness, CCabs2007_WI_Landsat2005_TCT_greenness, CCabs2007_WI_Landsat2005_TCT_wetness)
CCabs2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2007_WI_Landsat2005list)
CCabs2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2007_WI_Landsat2005<-CCabs2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2007_WI_Landsat2005<-CCabs2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2007_WI_Landsat2005<-CCabs2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2007_WI_Landsat2005<-CCabs2007_WI_Landsat2005 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2007_WI_Landsat2005<-CCabs2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2007_WI_Landsat2005.csv")

#CC absence data from 2012 at Wilderness I with 2013 Landsat
CCabs2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2012_WI, fun=mean, weights=TRUE))
CCabs2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2012_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2012_WI_Landsat2013list<- list(CCabs2012_WI_Landsat2013_blue, CCabs2012_WI_Landsat2013_green, CCabs2012_WI_Landsat2013_red, CCabs2012_WI_Landsat2013_nir, CCabs2012_WI_Landsat2013_swir1, CCabs2012_WI_Landsat2013_swir2, CCabs2012_WI_Landsat2013_NDVI, CCabs2012_WI_Landsat2013_NBR, CCabs2012_WI_Landsat2013_TCT_brightness, CCabs2012_WI_Landsat2013_TCT_greenness, CCabs2012_WI_Landsat2013_TCT_wetness)
CCabs2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2012_WI_Landsat2013list)
CCabs2012_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2012_WI_Landsat2013<-CCabs2012_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2012_WI_Landsat2013<-CCabs2012_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2012_WI_Landsat2013<-CCabs2012_WI_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2012_WI_Landsat2013<-CCabs2012_WI_Landsat2013 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2012_WI_Landsat2013<-CCabs2012_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2012_WI_Landsat2013.csv")

#CC absence data from 2013 at Wilderness I with 2013 Landsat
CCabs2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2013_WI, fun=mean, weights=TRUE))
CCabs2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2013_WI_Landsat2013list<- list(CCabs2013_WI_Landsat2013_blue, CCabs2013_WI_Landsat2013_green, CCabs2013_WI_Landsat2013_red, CCabs2013_WI_Landsat2013_nir, CCabs2013_WI_Landsat2013_swir1, CCabs2013_WI_Landsat2013_swir2, CCabs2013_WI_Landsat2013_NDVI, CCabs2013_WI_Landsat2013_NBR, CCabs2013_WI_Landsat2013_TCT_brightness, CCabs2013_WI_Landsat2013_TCT_greenness, CCabs2013_WI_Landsat2013_TCT_wetness)
CCabs2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2013_WI_Landsat2013list)
CCabs2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2013_WI_Landsat2013<-CCabs2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2013_WI_Landsat2013<-CCabs2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2013_WI_Landsat2013<-CCabs2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2013_WI_Landsat2013<-CCabs2013_WI_Landsat2013 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2013_WI_Landsat2013<-CCabs2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2013_WI_Landsat2013.csv")

#CC absence data from 2014 at Wilderness I with 2013 Landsat
CCabs2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2014_WI, fun=mean, weights=TRUE))
CCabs2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2014_WI_Landsat2013list<- list(CCabs2014_WI_Landsat2013_blue, CCabs2014_WI_Landsat2013_green, CCabs2014_WI_Landsat2013_red, CCabs2014_WI_Landsat2013_nir, CCabs2014_WI_Landsat2013_swir1, CCabs2014_WI_Landsat2013_swir2, CCabs2014_WI_Landsat2013_NDVI, CCabs2014_WI_Landsat2013_NBR, CCabs2014_WI_Landsat2013_TCT_brightness, CCabs2014_WI_Landsat2013_TCT_greenness, CCabs2014_WI_Landsat2013_TCT_wetness)
CCabs2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2014_WI_Landsat2013list)
CCabs2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2014_WI_Landsat2013<-CCabs2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2014_WI_Landsat2013<-CCabs2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2014_WI_Landsat2013<-CCabs2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2014_WI_Landsat2013<-CCabs2014_WI_Landsat2013 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2014_WI_Landsat2013<-CCabs2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2014_WI_Landsat2013.csv")

#CC absence data from 2015 at Wilderness I with 2015 Landsat
CCabs2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_abs_2015_WI, fun=mean, weights=TRUE))
CCabs2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_abs_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2015_WI_Landsat2015list<- list(CCabs2015_WI_Landsat2015_blue, CCabs2015_WI_Landsat2015_green, CCabs2015_WI_Landsat2015_red, CCabs2015_WI_Landsat2015_nir, CCabs2015_WI_Landsat2015_swir1, CCabs2015_WI_Landsat2015_swir2, CCabs2015_WI_Landsat2015_NDVI, CCabs2015_WI_Landsat2015_NBR, CCabs2015_WI_Landsat2015_TCT_brightness, CCabs2015_WI_Landsat2015_TCT_greenness, CCabs2015_WI_Landsat2015_TCT_wetness)
CCabs2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2015_WI_Landsat2015list)
CCabs2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2015_WI_Landsat2015<-CCabs2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2015_WI_Landsat2015<-CCabs2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2015_WI_Landsat2015<-CCabs2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2015_WI_Landsat2015<-CCabs2015_WI_Landsat2015 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2015_WI_Landsat2015<-CCabs2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2015_WI_Landsat2015.csv")

#CC absence data from 2016 at Wilderness I with 2015 Landsat
CCabs2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_abs_2016_WI, fun=mean, weights=TRUE))
CCabs2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_abs_2016_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2016_WI_Landsat2015list<- list(CCabs2016_WI_Landsat2015_blue, CCabs2016_WI_Landsat2015_green, CCabs2016_WI_Landsat2015_red, CCabs2016_WI_Landsat2015_nir, CCabs2016_WI_Landsat2015_swir1, CCabs2016_WI_Landsat2015_swir2, CCabs2016_WI_Landsat2015_NDVI, CCabs2016_WI_Landsat2015_NBR, CCabs2016_WI_Landsat2015_TCT_brightness, CCabs2016_WI_Landsat2015_TCT_greenness, CCabs2016_WI_Landsat2015_TCT_wetness)
CCabs2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2016_WI_Landsat2015list)
CCabs2016_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2016_WI_Landsat2015<-CCabs2016_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2016_WI_Landsat2015<-CCabs2016_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2016_WI_Landsat2015<-CCabs2016_WI_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2016_WI_Landsat2015<-CCabs2016_WI_Landsat2015 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2016_WI_Landsat2015<-CCabs2016_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2016_WI_Landsat2015.csv")

#CC absence data from 2017 at Wilderness I with 2015 Landsat
CCabs2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_abs_2017_WI, fun=mean, weights=TRUE))
CCabs2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_abs_2017_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2017_WI_Landsat2015list<- list(CCabs2017_WI_Landsat2015_blue, CCabs2017_WI_Landsat2015_green, CCabs2017_WI_Landsat2015_red, CCabs2017_WI_Landsat2015_nir, CCabs2017_WI_Landsat2015_swir1, CCabs2017_WI_Landsat2015_swir2, CCabs2017_WI_Landsat2015_NDVI, CCabs2017_WI_Landsat2015_NBR, CCabs2017_WI_Landsat2015_TCT_brightness, CCabs2017_WI_Landsat2015_TCT_greenness, CCabs2017_WI_Landsat2015_TCT_wetness)
CCabs2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2017_WI_Landsat2015list)
CCabs2017_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2017_WI_Landsat2015<-CCabs2017_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CCabs2017_WI_Landsat2015<-CCabs2017_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2017_WI_Landsat2015<-CCabs2017_WI_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2017_WI_Landsat2015<-CCabs2017_WI_Landsat2015 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2017_WI_Landsat2015<-CCabs2017_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2017_WI_Landsat2015.csv")

####CH####
#CH absence data from 2000 at Wilderness I with 2000 Landsat
CHabs2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2000_WI, fun=mean, weights=TRUE))
CHabs2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2000_WI_Landsat2000list<- list(CHabs2000_WI_Landsat2000_blue, CHabs2000_WI_Landsat2000_green, CHabs2000_WI_Landsat2000_red, CHabs2000_WI_Landsat2000_nir, CHabs2000_WI_Landsat2000_swir1, CHabs2000_WI_Landsat2000_swir2, CHabs2000_WI_Landsat2000_NDVI, CHabs2000_WI_Landsat2000_NBR, CHabs2000_WI_Landsat2000_TCT_brightness, CHabs2000_WI_Landsat2000_TCT_greenness, CHabs2000_WI_Landsat2000_TCT_wetness)
CHabs2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2000_WI_Landsat2000list)
CHabs2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2000_WI_Landsat2000<-CHabs2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2000_WI_Landsat2000<-CHabs2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2000_WI_Landsat2000<-CHabs2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2000_WI_Landsat2000<-CHabs2000_WI_Landsat2000 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2000_WI_Landsat2000<-CHabs2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2000_WI_landsat2000.csv")

#CH absence data from 2001 at Wilderness I with 2000 Landsat
CHabs2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2001_WI, fun=mean, weights=TRUE))
CHabs2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2001_WI_Landsat2000list<- list(CHabs2001_WI_Landsat2000_blue, CHabs2001_WI_Landsat2000_green, CHabs2001_WI_Landsat2000_red, CHabs2001_WI_Landsat2000_nir, CHabs2001_WI_Landsat2000_swir1, CHabs2001_WI_Landsat2000_swir2, CHabs2001_WI_Landsat2000_NDVI, CHabs2001_WI_Landsat2000_NBR, CHabs2001_WI_Landsat2000_TCT_brightness, CHabs2001_WI_Landsat2000_TCT_greenness, CHabs2001_WI_Landsat2000_TCT_wetness)
CHabs2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2001_WI_Landsat2000list)
CHabs2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2001_WI_Landsat2000<-CHabs2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2001_WI_Landsat2000<-CHabs2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2001_WI_Landsat2000<-CHabs2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2001_WI_Landsat2000<-CHabs2001_WI_Landsat2000 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2001_WI_Landsat2000<-CHabs2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2001_WI_landsat2000.csv")

#CH absence data from 2002 at Wilderness I with 2000 Landsat
CHabs2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2002_WI, fun=mean, weights=TRUE))
CHabs2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2002_WI_Landsat2000list<- list(CHabs2002_WI_Landsat2000_blue, CHabs2002_WI_Landsat2000_green, CHabs2002_WI_Landsat2000_red, CHabs2002_WI_Landsat2000_nir, CHabs2002_WI_Landsat2000_swir1, CHabs2002_WI_Landsat2000_swir2, CHabs2002_WI_Landsat2000_NDVI, CHabs2002_WI_Landsat2000_NBR, CHabs2002_WI_Landsat2000_TCT_brightness, CHabs2002_WI_Landsat2000_TCT_greenness, CHabs2002_WI_Landsat2000_TCT_wetness)
CHabs2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2002_WI_Landsat2000list)
CHabs2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2002_WI_Landsat2000<-CHabs2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2002_WI_Landsat2000<-CHabs2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2002_WI_Landsat2000<-CHabs2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2002_WI_Landsat2000<-CHabs2002_WI_Landsat2000 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2002_WI_Landsat2000<-CHabs2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2002_WI_landsat2000.csv")

#CH absence data from 2005 at Wilderness I with 2005 Landsat
CHabs2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2005_WI, fun=mean, weights=TRUE))
CHabs2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2005_WI_Landsat2005list<- list(CHabs2005_WI_Landsat2005_blue, CHabs2005_WI_Landsat2005_green, CHabs2005_WI_Landsat2005_red, CHabs2005_WI_Landsat2005_nir, CHabs2005_WI_Landsat2005_swir1, CHabs2005_WI_Landsat2005_swir2, CHabs2005_WI_Landsat2005_NDVI, CHabs2005_WI_Landsat2005_NBR, CHabs2005_WI_Landsat2005_TCT_brightness, CHabs2005_WI_Landsat2005_TCT_greenness, CHabs2005_WI_Landsat2005_TCT_wetness)
CHabs2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2005_WI_Landsat2005list)
CHabs2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2005_WI_Landsat2005<-CHabs2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2005_WI_Landsat2005<-CHabs2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2005_WI_Landsat2005<-CHabs2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2005_WI_Landsat2005<-CHabs2005_WI_Landsat2005 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2005_WI_Landsat2005<-CHabs2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2005_WI_Landsat2005.csv")

#CH absence data from 2006 at Wilderness I with 2005 Landsat
CHabs2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2006_WI, fun=mean, weights=TRUE))
CHabs2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2006_WI_Landsat2005list<- list(CHabs2006_WI_Landsat2005_blue, CHabs2006_WI_Landsat2005_green, CHabs2006_WI_Landsat2005_red, CHabs2006_WI_Landsat2005_nir, CHabs2006_WI_Landsat2005_swir1, CHabs2006_WI_Landsat2005_swir2, CHabs2006_WI_Landsat2005_NDVI, CHabs2006_WI_Landsat2005_NBR, CHabs2006_WI_Landsat2005_TCT_brightness, CHabs2006_WI_Landsat2005_TCT_greenness, CHabs2006_WI_Landsat2005_TCT_wetness)
CHabs2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2006_WI_Landsat2005list)
CHabs2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2006_WI_Landsat2005<-CHabs2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2006_WI_Landsat2005<-CHabs2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2006_WI_Landsat2005<-CHabs2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2006_WI_Landsat2005<-CHabs2006_WI_Landsat2005 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2006_WI_Landsat2005<-CHabs2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2006_WI_Landsat2005.csv")

#CH absence data from 2007 at Wilderness I with 2005 Landsat
CHabs2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2007_WI, fun=mean, weights=TRUE))
CHabs2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2007_WI_Landsat2005list<- list(CHabs2007_WI_Landsat2005_blue, CHabs2007_WI_Landsat2005_green, CHabs2007_WI_Landsat2005_red, CHabs2007_WI_Landsat2005_nir, CHabs2007_WI_Landsat2005_swir1, CHabs2007_WI_Landsat2005_swir2, CHabs2007_WI_Landsat2005_NDVI, CHabs2007_WI_Landsat2005_NBR, CHabs2007_WI_Landsat2005_TCT_brightness, CHabs2007_WI_Landsat2005_TCT_greenness, CHabs2007_WI_Landsat2005_TCT_wetness)
CHabs2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2007_WI_Landsat2005list)
CHabs2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2007_WI_Landsat2005<-CHabs2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2007_WI_Landsat2005<-CHabs2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2007_WI_Landsat2005<-CHabs2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2007_WI_Landsat2005<-CHabs2007_WI_Landsat2005 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2007_WI_Landsat2005<-CHabs2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2007_WI_Landsat2005.csv")

#CH absence data from 2012 at Wilderness I with 2013 Landsat
CHabs2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2012_WI, fun=mean, weights=TRUE))
CHabs2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2012_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2012_WI_Landsat2013list<- list(CHabs2012_WI_Landsat2013_blue, CHabs2012_WI_Landsat2013_green, CHabs2012_WI_Landsat2013_red, CHabs2012_WI_Landsat2013_nir, CHabs2012_WI_Landsat2013_swir1, CHabs2012_WI_Landsat2013_swir2, CHabs2012_WI_Landsat2013_NDVI, CHabs2012_WI_Landsat2013_NBR, CHabs2012_WI_Landsat2013_TCT_brightness, CHabs2012_WI_Landsat2013_TCT_greenness, CHabs2012_WI_Landsat2013_TCT_wetness)
CHabs2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2012_WI_Landsat2013list)
CHabs2012_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2012_WI_Landsat2013<-CHabs2012_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2012_WI_Landsat2013<-CHabs2012_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2012_WI_Landsat2013<-CHabs2012_WI_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2012_WI_Landsat2013<-CHabs2012_WI_Landsat2013 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2012_WI_Landsat2013<-CHabs2012_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2012_WI_Landsat2013.csv")

#CH absence data from 2013 at Wilderness I with 2013 Landsat
CHabs2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2013_WI, fun=mean, weights=TRUE))
CHabs2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2013_WI_Landsat2013list<- list(CHabs2013_WI_Landsat2013_blue, CHabs2013_WI_Landsat2013_green, CHabs2013_WI_Landsat2013_red, CHabs2013_WI_Landsat2013_nir, CHabs2013_WI_Landsat2013_swir1, CHabs2013_WI_Landsat2013_swir2, CHabs2013_WI_Landsat2013_NDVI, CHabs2013_WI_Landsat2013_NBR, CHabs2013_WI_Landsat2013_TCT_brightness, CHabs2013_WI_Landsat2013_TCT_greenness, CHabs2013_WI_Landsat2013_TCT_wetness)
CHabs2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2013_WI_Landsat2013list)
CHabs2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2013_WI_Landsat2013<-CHabs2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2013_WI_Landsat2013<-CHabs2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2013_WI_Landsat2013<-CHabs2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2013_WI_Landsat2013<-CHabs2013_WI_Landsat2013 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2013_WI_Landsat2013<-CHabs2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2013_WI_Landsat2013.csv")

#CH absence data from 2014 at Wilderness I with 2013 Landsat
CHabs2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2014_WI, fun=mean, weights=TRUE))
CHabs2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2014_WI_Landsat2013list<- list(CHabs2014_WI_Landsat2013_blue, CHabs2014_WI_Landsat2013_green, CHabs2014_WI_Landsat2013_red, CHabs2014_WI_Landsat2013_nir, CHabs2014_WI_Landsat2013_swir1, CHabs2014_WI_Landsat2013_swir2, CHabs2014_WI_Landsat2013_NDVI, CHabs2014_WI_Landsat2013_NBR, CHabs2014_WI_Landsat2013_TCT_brightness, CHabs2014_WI_Landsat2013_TCT_greenness, CHabs2014_WI_Landsat2013_TCT_wetness)
CHabs2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2014_WI_Landsat2013list)
CHabs2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2014_WI_Landsat2013<-CHabs2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2014_WI_Landsat2013<-CHabs2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2014_WI_Landsat2013<-CHabs2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2014_WI_Landsat2013<-CHabs2014_WI_Landsat2013 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2014_WI_Landsat2013<-CHabs2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2014_WI_Landsat2013.csv")

#CH absence data from 2015 at Wilderness I with 2015 Landsat
CHabs2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_abs_2015_WI, fun=mean, weights=TRUE))
CHabs2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_abs_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2015_WI_Landsat2015list<- list(CHabs2015_WI_Landsat2015_blue, CHabs2015_WI_Landsat2015_green, CHabs2015_WI_Landsat2015_red, CHabs2015_WI_Landsat2015_nir, CHabs2015_WI_Landsat2015_swir1, CHabs2015_WI_Landsat2015_swir2, CHabs2015_WI_Landsat2015_NDVI, CHabs2015_WI_Landsat2015_NBR, CHabs2015_WI_Landsat2015_TCT_brightness, CHabs2015_WI_Landsat2015_TCT_greenness, CHabs2015_WI_Landsat2015_TCT_wetness)
CHabs2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2015_WI_Landsat2015list)
CHabs2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2015_WI_Landsat2015<-CHabs2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2015_WI_Landsat2015<-CHabs2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2015_WI_Landsat2015<-CHabs2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2015_WI_Landsat2015<-CHabs2015_WI_Landsat2015 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2015_WI_Landsat2015<-CHabs2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2015_WI_Landsat2015.csv")

#CH absence data from 2016 at Wilderness I with 2015 Landsat
CHabs2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_abs_2016_WI, fun=mean, weights=TRUE))
CHabs2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_abs_2016_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2016_WI_Landsat2015list<- list(CHabs2016_WI_Landsat2015_blue, CHabs2016_WI_Landsat2015_green, CHabs2016_WI_Landsat2015_red, CHabs2016_WI_Landsat2015_nir, CHabs2016_WI_Landsat2015_swir1, CHabs2016_WI_Landsat2015_swir2, CHabs2016_WI_Landsat2015_NDVI, CHabs2016_WI_Landsat2015_NBR, CHabs2016_WI_Landsat2015_TCT_brightness, CHabs2016_WI_Landsat2015_TCT_greenness, CHabs2016_WI_Landsat2015_TCT_wetness)
CHabs2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2016_WI_Landsat2015list)
CHabs2016_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2016_WI_Landsat2015<-CHabs2016_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2016_WI_Landsat2015<-CHabs2016_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2016_WI_Landsat2015<-CHabs2016_WI_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2016_WI_Landsat2015<-CHabs2016_WI_Landsat2015 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2016_WI_Landsat2015<-CHabs2016_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2016_WI_Landsat2015.csv")

#CH absence data from 2017 at Wilderness I with 2015 Landsat
CHabs2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_abs_2017_WI, fun=mean, weights=TRUE))
CHabs2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_abs_2017_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2017_WI_Landsat2015list<- list(CHabs2017_WI_Landsat2015_blue, CHabs2017_WI_Landsat2015_green, CHabs2017_WI_Landsat2015_red, CHabs2017_WI_Landsat2015_nir, CHabs2017_WI_Landsat2015_swir1, CHabs2017_WI_Landsat2015_swir2, CHabs2017_WI_Landsat2015_NDVI, CHabs2017_WI_Landsat2015_NBR, CHabs2017_WI_Landsat2015_TCT_brightness, CHabs2017_WI_Landsat2015_TCT_greenness, CHabs2017_WI_Landsat2015_TCT_wetness)
CHabs2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2017_WI_Landsat2015list)
CHabs2017_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2017_WI_Landsat2015<-CHabs2017_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
CHabs2017_WI_Landsat2015<-CHabs2017_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2017_WI_Landsat2015<-CHabs2017_WI_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2017_WI_Landsat2015<-CHabs2017_WI_Landsat2015 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2017_WI_Landsat2015<-CHabs2017_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2017_WI_Landsat2015.csv")

####WW####
#WW absence data from 2000 at Wilderness I with 2000 Landsat
WWabs2000_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2000_WI, fun=mean, weights=TRUE))
WWabs2000_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2000_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2000_WI_Landsat2000list<- list(WWabs2000_WI_Landsat2000_blue, WWabs2000_WI_Landsat2000_green, WWabs2000_WI_Landsat2000_red, WWabs2000_WI_Landsat2000_nir, WWabs2000_WI_Landsat2000_swir1, WWabs2000_WI_Landsat2000_swir2, WWabs2000_WI_Landsat2000_NDVI, WWabs2000_WI_Landsat2000_NBR, WWabs2000_WI_Landsat2000_TCT_brightness, WWabs2000_WI_Landsat2000_TCT_greenness, WWabs2000_WI_Landsat2000_TCT_wetness)
WWabs2000_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2000_WI_Landsat2000list)
WWabs2000_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2000_WI_Landsat2000<-WWabs2000_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2000_WI_Landsat2000<-WWabs2000_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2000_WI_Landsat2000<-WWabs2000_WI_Landsat2000 %>%
  mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2000_WI_Landsat2000<-WWabs2000_WI_Landsat2000 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2000_WI_Landsat2000<-WWabs2000_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2000_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2000_WI_landsat2000.csv")

#WW absence data from 2001 at Wilderness I with 2000 Landsat
WWabs2001_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2001_WI, fun=mean, weights=TRUE))
WWabs2001_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2001_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2001_WI_Landsat2000list<- list(WWabs2001_WI_Landsat2000_blue, WWabs2001_WI_Landsat2000_green, WWabs2001_WI_Landsat2000_red, WWabs2001_WI_Landsat2000_nir, WWabs2001_WI_Landsat2000_swir1, WWabs2001_WI_Landsat2000_swir2, WWabs2001_WI_Landsat2000_NDVI, WWabs2001_WI_Landsat2000_NBR, WWabs2001_WI_Landsat2000_TCT_brightness, WWabs2001_WI_Landsat2000_TCT_greenness, WWabs2001_WI_Landsat2000_TCT_wetness)
WWabs2001_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2001_WI_Landsat2000list)
WWabs2001_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2001_WI_Landsat2000<-WWabs2001_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2001_WI_Landsat2000<-WWabs2001_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2001_WI_Landsat2000<-WWabs2001_WI_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2001_WI_Landsat2000<-WWabs2001_WI_Landsat2000 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2001_WI_Landsat2000<-WWabs2001_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2001_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2001_WI_landsat2000.csv")

#WW absence data from 2002 at Wilderness I with 2000 Landsat
WWabs2002_WI_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2002_WI, fun=mean, weights=TRUE))
WWabs2002_WI_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2002_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2002_WI_Landsat2000list<- list(WWabs2002_WI_Landsat2000_blue, WWabs2002_WI_Landsat2000_green, WWabs2002_WI_Landsat2000_red, WWabs2002_WI_Landsat2000_nir, WWabs2002_WI_Landsat2000_swir1, WWabs2002_WI_Landsat2000_swir2, WWabs2002_WI_Landsat2000_NDVI, WWabs2002_WI_Landsat2000_NBR, WWabs2002_WI_Landsat2000_TCT_brightness, WWabs2002_WI_Landsat2000_TCT_greenness, WWabs2002_WI_Landsat2000_TCT_wetness)
WWabs2002_WI_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2002_WI_Landsat2000list)
WWabs2002_WI_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2002_WI_Landsat2000<-WWabs2002_WI_Landsat2000 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2002_WI_Landsat2000<-WWabs2002_WI_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2002_WI_Landsat2000<-WWabs2002_WI_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2002_WI_Landsat2000<-WWabs2002_WI_Landsat2000 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2002_WI_Landsat2000<-WWabs2002_WI_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2002_WI_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2002_WI_landsat2000.csv")

#WW absence data from 2005 at Wilderness I with 2005 Landsat
WWabs2005_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2005_WI, fun=mean, weights=TRUE))
WWabs2005_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2005_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2005_WI_Landsat2005list<- list(WWabs2005_WI_Landsat2005_blue, WWabs2005_WI_Landsat2005_green, WWabs2005_WI_Landsat2005_red, WWabs2005_WI_Landsat2005_nir, WWabs2005_WI_Landsat2005_swir1, WWabs2005_WI_Landsat2005_swir2, WWabs2005_WI_Landsat2005_NDVI, WWabs2005_WI_Landsat2005_NBR, WWabs2005_WI_Landsat2005_TCT_brightness, WWabs2005_WI_Landsat2005_TCT_greenness, WWabs2005_WI_Landsat2005_TCT_wetness)
WWabs2005_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2005_WI_Landsat2005list)
WWabs2005_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2005_WI_Landsat2005<-WWabs2005_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2005_WI_Landsat2005<-WWabs2005_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2005_WI_Landsat2005<-WWabs2005_WI_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2005_WI_Landsat2005<-WWabs2005_WI_Landsat2005 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2005_WI_Landsat2005<-WWabs2005_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2005_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2005_WI_Landsat2005.csv")

#WW absence data from 2006 at Wilderness I with 2005 Landsat
WWabs2006_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2006_WI, fun=mean, weights=TRUE))
WWabs2006_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2006_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2006_WI_Landsat2005list<- list(WWabs2006_WI_Landsat2005_blue, WWabs2006_WI_Landsat2005_green, WWabs2006_WI_Landsat2005_red, WWabs2006_WI_Landsat2005_nir, WWabs2006_WI_Landsat2005_swir1, WWabs2006_WI_Landsat2005_swir2, WWabs2006_WI_Landsat2005_NDVI, WWabs2006_WI_Landsat2005_NBR, WWabs2006_WI_Landsat2005_TCT_brightness, WWabs2006_WI_Landsat2005_TCT_greenness, WWabs2006_WI_Landsat2005_TCT_wetness)
WWabs2006_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2006_WI_Landsat2005list)
WWabs2006_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2006_WI_Landsat2005<-WWabs2006_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2006_WI_Landsat2005<-WWabs2006_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2006_WI_Landsat2005<-WWabs2006_WI_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2006_WI_Landsat2005<-WWabs2006_WI_Landsat2005 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2006_WI_Landsat2005<-WWabs2006_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2006_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2006_WI_Landsat2005.csv")

#WW absence data from 2007 at Wilderness I with 2005 Landsat
WWabs2007_WI_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2007_WI, fun=mean, weights=TRUE))
WWabs2007_WI_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2007_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2007_WI_Landsat2005list<- list(WWabs2007_WI_Landsat2005_blue, WWabs2007_WI_Landsat2005_green, WWabs2007_WI_Landsat2005_red, WWabs2007_WI_Landsat2005_nir, WWabs2007_WI_Landsat2005_swir1, WWabs2007_WI_Landsat2005_swir2, WWabs2007_WI_Landsat2005_NDVI, WWabs2007_WI_Landsat2005_NBR, WWabs2007_WI_Landsat2005_TCT_brightness, WWabs2007_WI_Landsat2005_TCT_greenness, WWabs2007_WI_Landsat2005_TCT_wetness)
WWabs2007_WI_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2007_WI_Landsat2005list)
WWabs2007_WI_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2007_WI_Landsat2005<-WWabs2007_WI_Landsat2005 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2007_WI_Landsat2005<-WWabs2007_WI_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2007_WI_Landsat2005<-WWabs2007_WI_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2007_WI_Landsat2005<-WWabs2007_WI_Landsat2005 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2007_WI_Landsat2005<-WWabs2007_WI_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2007_WI_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2007_WI_Landsat2005.csv")

#WW absence data from 2012 at Wilderness I with 2013 Landsat
#no data
# WWabs2012_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2012_WI, fun=mean, weights=TRUE))
# WWabs2012_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2012_WI, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWabs2012_WI_Landsat2013list<- list(WWabs2012_WI_Landsat2013_blue, WWabs2012_WI_Landsat2013_green, WWabs2012_WI_Landsat2013_red, WWabs2012_WI_Landsat2013_nir, WWabs2012_WI_Landsat2013_swir1, WWabs2012_WI_Landsat2013_swir2, WWabs2012_WI_Landsat2013_NDVI, WWabs2012_WI_Landsat2013_NBR, WWabs2012_WI_Landsat2013_TCT_brightness, WWabs2012_WI_Landsat2013_TCT_greenness, WWabs2012_WI_Landsat2013_TCT_wetness)
# WWabs2012_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2012_WI_Landsat2013list)
# WWabs2012_WI_Landsat2013
# #add four columns: site, Landsat year, bird survey year, bird species
# WWabs2012_WI_Landsat2013<-WWabs2012_WI_Landsat2013 %>%
#   mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
# WWabs2012_WI_Landsat2013<-WWabs2012_WI_Landsat2013 %>%
#   mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWabs2012_WI_Landsat2013<-WWabs2012_WI_Landsat2013 %>%
#   mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWabs2012_WI_Landsat2013<-WWabs2012_WI_Landsat2013 %>%
#   mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
# WWabs2012_WI_Landsat2013<-WWabs2012_WI_Landsat2013 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWabs2012_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2012_WI_Landsat2013.csv")

#WW absence data from 2013 at Wilderness I with 2013 Landsat
WWabs2013_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2013_WI, fun=mean, weights=TRUE))
WWabs2013_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2013_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2013_WI_Landsat2013list<- list(WWabs2013_WI_Landsat2013_blue, WWabs2013_WI_Landsat2013_green, WWabs2013_WI_Landsat2013_red, WWabs2013_WI_Landsat2013_nir, WWabs2013_WI_Landsat2013_swir1, WWabs2013_WI_Landsat2013_swir2, WWabs2013_WI_Landsat2013_NDVI, WWabs2013_WI_Landsat2013_NBR, WWabs2013_WI_Landsat2013_TCT_brightness, WWabs2013_WI_Landsat2013_TCT_greenness, WWabs2013_WI_Landsat2013_TCT_wetness)
WWabs2013_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2013_WI_Landsat2013list)
WWabs2013_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2013_WI_Landsat2013<-WWabs2013_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2013_WI_Landsat2013<-WWabs2013_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2013_WI_Landsat2013<-WWabs2013_WI_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2013_WI_Landsat2013<-WWabs2013_WI_Landsat2013 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2013_WI_Landsat2013<-WWabs2013_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2013_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2013_WI_Landsat2013.csv")

#WW absence data from 2014 at Wilderness I with 2013 Landsat
WWabs2014_WI_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2014_WI, fun=mean, weights=TRUE))
WWabs2014_WI_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2014_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2014_WI_Landsat2013list<- list(WWabs2014_WI_Landsat2013_blue, WWabs2014_WI_Landsat2013_green, WWabs2014_WI_Landsat2013_red, WWabs2014_WI_Landsat2013_nir, WWabs2014_WI_Landsat2013_swir1, WWabs2014_WI_Landsat2013_swir2, WWabs2014_WI_Landsat2013_NDVI, WWabs2014_WI_Landsat2013_NBR, WWabs2014_WI_Landsat2013_TCT_brightness, WWabs2014_WI_Landsat2013_TCT_greenness, WWabs2014_WI_Landsat2013_TCT_wetness)
WWabs2014_WI_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2014_WI_Landsat2013list)
WWabs2014_WI_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2014_WI_Landsat2013<-WWabs2014_WI_Landsat2013 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2014_WI_Landsat2013<-WWabs2014_WI_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2014_WI_Landsat2013<-WWabs2014_WI_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2014_WI_Landsat2013<-WWabs2014_WI_Landsat2013 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2014_WI_Landsat2013<-WWabs2014_WI_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2014_WI_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2014_WI_Landsat2013.csv")

#WW absence data from 2015 at Wilderness I with 2015 Landsat
WWabs2015_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_abs_2015_WI, fun=mean, weights=TRUE))
WWabs2015_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_abs_2015_WI, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2015_WI_Landsat2015list<- list(WWabs2015_WI_Landsat2015_blue, WWabs2015_WI_Landsat2015_green, WWabs2015_WI_Landsat2015_red, WWabs2015_WI_Landsat2015_nir, WWabs2015_WI_Landsat2015_swir1, WWabs2015_WI_Landsat2015_swir2, WWabs2015_WI_Landsat2015_NDVI, WWabs2015_WI_Landsat2015_NBR, WWabs2015_WI_Landsat2015_TCT_brightness, WWabs2015_WI_Landsat2015_TCT_greenness, WWabs2015_WI_Landsat2015_TCT_wetness)
WWabs2015_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2015_WI_Landsat2015list)
WWabs2015_WI_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2015_WI_Landsat2015<-WWabs2015_WI_Landsat2015 %>%
  mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
WWabs2015_WI_Landsat2015<-WWabs2015_WI_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2015_WI_Landsat2015<-WWabs2015_WI_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2015_WI_Landsat2015<-WWabs2015_WI_Landsat2015 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2015_WI_Landsat2015<-WWabs2015_WI_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2015_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2015_WI_Landsat2015.csv")

#WW absence data from 2016 at Wilderness I with 2015 Landsat
#no data
# WWabs2016_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_abs_2016_WI, fun=mean, weights=TRUE))
# WWabs2016_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_abs_2016_WI, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWabs2016_WI_Landsat2015list<- list(WWabs2016_WI_Landsat2015_blue, WWabs2016_WI_Landsat2015_green, WWabs2016_WI_Landsat2015_red, WWabs2016_WI_Landsat2015_nir, WWabs2016_WI_Landsat2015_swir1, WWabs2016_WI_Landsat2015_swir2, WWabs2016_WI_Landsat2015_NDVI, WWabs2016_WI_Landsat2015_NBR, WWabs2016_WI_Landsat2015_TCT_brightness, WWabs2016_WI_Landsat2015_TCT_greenness, WWabs2016_WI_Landsat2015_TCT_wetness)
# WWabs2016_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2016_WI_Landsat2015list)
# WWabs2016_WI_Landsat2015
# #add four columns: site, Landsat year, bird survey year, bird species
# WWabs2016_WI_Landsat2015<-WWabs2016_WI_Landsat2015 %>%
#   mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
# WWabs2016_WI_Landsat2015<-WWabs2016_WI_Landsat2015 %>%
#   mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWabs2016_WI_Landsat2015<-WWabs2016_WI_Landsat2015 %>%
#   mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWabs2016_WI_Landsat2015<-WWabs2016_WI_Landsat2015 %>%
#   mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
# WWabs2016_WI_Landsat2015<-WWabs2016_WI_Landsat2015 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWabs2016_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2016_WI_Landsat2015.csv")

#WW absence data from 2017 at Wilderness I with 2015 Landsat
#no data
# WWabs2017_WI_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_abs_2017_WI, fun=mean, weights=TRUE))
# WWabs2017_WI_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_abs_2017_WI, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWabs2017_WI_Landsat2015list<- list(WWabs2017_WI_Landsat2015_blue, WWabs2017_WI_Landsat2015_green, WWabs2017_WI_Landsat2015_red, WWabs2017_WI_Landsat2015_nir, WWabs2017_WI_Landsat2015_swir1, WWabs2017_WI_Landsat2015_swir2, WWabs2017_WI_Landsat2015_NDVI, WWabs2017_WI_Landsat2015_NBR, WWabs2017_WI_Landsat2015_TCT_brightness, WWabs2017_WI_Landsat2015_TCT_greenness, WWabs2017_WI_Landsat2015_TCT_wetness)
# WWabs2017_WI_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2017_WI_Landsat2015list)
# WWabs2017_WI_Landsat2015
# #add four columns: site, Landsat year, bird survey year, bird species
# WWabs2017_WI_Landsat2015<-WWabs2017_WI_Landsat2015 %>%
#   mutate(site = "Wilderness I")%>% dplyr::select(site, everything())#add column for site
# WWabs2017_WI_Landsat2015<-WWabs2017_WI_Landsat2015 %>%
#   mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWabs2017_WI_Landsat2015<-WWabs2017_WI_Landsat2015 %>%
#   mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWabs2017_WI_Landsat2015<-WWabs2017_WI_Landsat2015 %>%
#   mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
# WWabs2017_WI_Landsat2015<-WWabs2017_WI_Landsat2015 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWabs2017_WI_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2017_WI_Landsat2015.csv")

###Wilderness II####

####BT####
#BT absence data from 2000 at Wilderness II with 2000 Landsat
#no data
# BTabs2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2000_WII, fun=mean, weights=TRUE))
# BTabs2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# BTabs2000_WII_Landsat2000list<- list(BTabs2000_WII_Landsat2000_blue, BTabs2000_WII_Landsat2000_green, BTabs2000_WII_Landsat2000_red, BTabs2000_WII_Landsat2000_nir, BTabs2000_WII_Landsat2000_swir1, BTabs2000_WII_Landsat2000_swir2, BTabs2000_WII_Landsat2000_NDVI, BTabs2000_WII_Landsat2000_NBR, BTabs2000_WII_Landsat2000_TCT_brightness, BTabs2000_WII_Landsat2000_TCT_greenness, BTabs2000_WII_Landsat2000_TCT_wetness)
# BTabs2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2000_WII_Landsat2000list)
# BTabs2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# BTabs2000_WII_Landsat2000<-BTabs2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# BTabs2000_WII_Landsat2000<-BTabs2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# BTabs2000_WII_Landsat2000<-BTabs2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# BTabs2000_WII_Landsat2000<-BTabs2000_WII_Landsat2000 %>%
#   mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
# BTabs2000_WII_Landsat2000<-BTabs2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(BTabs2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2000_WII_landsat2000.csv")

#BT absence data from 2001 at Wilderness II with 2000 Landsat
BTabs2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2001_WII, fun=mean, weights=TRUE))
BTabs2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2001_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2001_WII_Landsat2000list<- list(BTabs2001_WII_Landsat2000_blue, BTabs2001_WII_Landsat2000_green, BTabs2001_WII_Landsat2000_red, BTabs2001_WII_Landsat2000_nir, BTabs2001_WII_Landsat2000_swir1, BTabs2001_WII_Landsat2000_swir2, BTabs2001_WII_Landsat2000_NDVI, BTabs2001_WII_Landsat2000_NBR, BTabs2001_WII_Landsat2000_TCT_brightness, BTabs2001_WII_Landsat2000_TCT_greenness, BTabs2001_WII_Landsat2000_TCT_wetness)
BTabs2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2001_WII_Landsat2000list)
BTabs2001_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2001_WII_Landsat2000<-BTabs2001_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2001_WII_Landsat2000<-BTabs2001_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2001_WII_Landsat2000<-BTabs2001_WII_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2001_WII_Landsat2000<-BTabs2001_WII_Landsat2000 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2001_WII_Landsat2000<-BTabs2001_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2001_WII_landsat2000.csv")

#BT absence data from 2002 at Wilderness II with 2000 Landsat
BTabs2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2002_WII, fun=mean, weights=TRUE))
BTabs2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2002_WII_Landsat2000list<- list(BTabs2002_WII_Landsat2000_blue, BTabs2002_WII_Landsat2000_green, BTabs2002_WII_Landsat2000_red, BTabs2002_WII_Landsat2000_nir, BTabs2002_WII_Landsat2000_swir1, BTabs2002_WII_Landsat2000_swir2, BTabs2002_WII_Landsat2000_NDVI, BTabs2002_WII_Landsat2000_NBR, BTabs2002_WII_Landsat2000_TCT_brightness, BTabs2002_WII_Landsat2000_TCT_greenness, BTabs2002_WII_Landsat2000_TCT_wetness)
BTabs2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2002_WII_Landsat2000list)
BTabs2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2002_WII_Landsat2000<-BTabs2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2002_WII_Landsat2000<-BTabs2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2002_WII_Landsat2000<-BTabs2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2002_WII_Landsat2000<-BTabs2002_WII_Landsat2000 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2002_WII_Landsat2000<-BTabs2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2002_WII_landsat2000.csv")

#BT absence data from 2005 at Wilderness II with 2005 Landsat
BTabs2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2005_WII, fun=mean, weights=TRUE))
BTabs2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2005_WII_Landsat2005list<- list(BTabs2005_WII_Landsat2005_blue, BTabs2005_WII_Landsat2005_green, BTabs2005_WII_Landsat2005_red, BTabs2005_WII_Landsat2005_nir, BTabs2005_WII_Landsat2005_swir1, BTabs2005_WII_Landsat2005_swir2, BTabs2005_WII_Landsat2005_NDVI, BTabs2005_WII_Landsat2005_NBR, BTabs2005_WII_Landsat2005_TCT_brightness, BTabs2005_WII_Landsat2005_TCT_greenness, BTabs2005_WII_Landsat2005_TCT_wetness)
BTabs2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2005_WII_Landsat2005list)
BTabs2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2005_WII_Landsat2005<-BTabs2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2005_WII_Landsat2005<-BTabs2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2005_WII_Landsat2005<-BTabs2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2005_WII_Landsat2005<-BTabs2005_WII_Landsat2005 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2005_WII_Landsat2005<-BTabs2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2005_WII_Landsat2005.csv")

#BT absence data from 2006 at Wilderness II with 2005 Landsat
BTabs2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2006_WII, fun=mean, weights=TRUE))
BTabs2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2006_WII_Landsat2005list<- list(BTabs2006_WII_Landsat2005_blue, BTabs2006_WII_Landsat2005_green, BTabs2006_WII_Landsat2005_red, BTabs2006_WII_Landsat2005_nir, BTabs2006_WII_Landsat2005_swir1, BTabs2006_WII_Landsat2005_swir2, BTabs2006_WII_Landsat2005_NDVI, BTabs2006_WII_Landsat2005_NBR, BTabs2006_WII_Landsat2005_TCT_brightness, BTabs2006_WII_Landsat2005_TCT_greenness, BTabs2006_WII_Landsat2005_TCT_wetness)
BTabs2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2006_WII_Landsat2005list)
BTabs2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2006_WII_Landsat2005<-BTabs2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2006_WII_Landsat2005<-BTabs2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2006_WII_Landsat2005<-BTabs2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2006_WII_Landsat2005<-BTabs2006_WII_Landsat2005 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2006_WII_Landsat2005<-BTabs2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2006_WII_Landsat2005.csv")

#BT absence data from 2007 at Wilderness II with 2005 Landsat
BTabs2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2007_WII, fun=mean, weights=TRUE))
BTabs2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2007_WII_Landsat2005list<- list(BTabs2007_WII_Landsat2005_blue, BTabs2007_WII_Landsat2005_green, BTabs2007_WII_Landsat2005_red, BTabs2007_WII_Landsat2005_nir, BTabs2007_WII_Landsat2005_swir1, BTabs2007_WII_Landsat2005_swir2, BTabs2007_WII_Landsat2005_NDVI, BTabs2007_WII_Landsat2005_NBR, BTabs2007_WII_Landsat2005_TCT_brightness, BTabs2007_WII_Landsat2005_TCT_greenness, BTabs2007_WII_Landsat2005_TCT_wetness)
BTabs2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2007_WII_Landsat2005list)
BTabs2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2007_WII_Landsat2005<-BTabs2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2007_WII_Landsat2005<-BTabs2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2007_WII_Landsat2005<-BTabs2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2007_WII_Landsat2005<-BTabs2007_WII_Landsat2005 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2007_WII_Landsat2005<-BTabs2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2007_WII_Landsat2005.csv")

#BT absence data from 2012 at Wilderness II with 2013 Landsat
BTabs2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2012_WII, fun=mean, weights=TRUE))
BTabs2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2012_WII_Landsat2013list<- list(BTabs2012_WII_Landsat2013_blue, BTabs2012_WII_Landsat2013_green, BTabs2012_WII_Landsat2013_red, BTabs2012_WII_Landsat2013_nir, BTabs2012_WII_Landsat2013_swir1, BTabs2012_WII_Landsat2013_swir2, BTabs2012_WII_Landsat2013_NDVI, BTabs2012_WII_Landsat2013_NBR, BTabs2012_WII_Landsat2013_TCT_brightness, BTabs2012_WII_Landsat2013_TCT_greenness, BTabs2012_WII_Landsat2013_TCT_wetness)
BTabs2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2012_WII_Landsat2013list)
BTabs2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2012_WII_Landsat2013<-BTabs2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2012_WII_Landsat2013<-BTabs2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2012_WII_Landsat2013<-BTabs2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2012_WII_Landsat2013<-BTabs2012_WII_Landsat2013 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2012_WII_Landsat2013<-BTabs2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2012_WII_Landsat2013.csv")

#BT absence data from 2013 at Wilderness II with 2013 Landsat
BTabs2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2013_WII, fun=mean, weights=TRUE))
BTabs2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2013_WII_Landsat2013list<- list(BTabs2013_WII_Landsat2013_blue, BTabs2013_WII_Landsat2013_green, BTabs2013_WII_Landsat2013_red, BTabs2013_WII_Landsat2013_nir, BTabs2013_WII_Landsat2013_swir1, BTabs2013_WII_Landsat2013_swir2, BTabs2013_WII_Landsat2013_NDVI, BTabs2013_WII_Landsat2013_NBR, BTabs2013_WII_Landsat2013_TCT_brightness, BTabs2013_WII_Landsat2013_TCT_greenness, BTabs2013_WII_Landsat2013_TCT_wetness)
BTabs2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2013_WII_Landsat2013list)
BTabs2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2013_WII_Landsat2013<-BTabs2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2013_WII_Landsat2013<-BTabs2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2013_WII_Landsat2013<-BTabs2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2013_WII_Landsat2013<-BTabs2013_WII_Landsat2013 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2013_WII_Landsat2013<-BTabs2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2013_WII_Landsat2013.csv")

#BT absence data from 2014 at Wilderness II with 2013 Landsat
BTabs2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, BT_abs_2014_WII, fun=mean, weights=TRUE))
BTabs2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, BT_abs_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2014_WII_Landsat2013list<- list(BTabs2014_WII_Landsat2013_blue, BTabs2014_WII_Landsat2013_green, BTabs2014_WII_Landsat2013_red, BTabs2014_WII_Landsat2013_nir, BTabs2014_WII_Landsat2013_swir1, BTabs2014_WII_Landsat2013_swir2, BTabs2014_WII_Landsat2013_NDVI, BTabs2014_WII_Landsat2013_NBR, BTabs2014_WII_Landsat2013_TCT_brightness, BTabs2014_WII_Landsat2013_TCT_greenness, BTabs2014_WII_Landsat2013_TCT_wetness)
BTabs2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2014_WII_Landsat2013list)
BTabs2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2014_WII_Landsat2013<-BTabs2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2014_WII_Landsat2013<-BTabs2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2014_WII_Landsat2013<-BTabs2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2014_WII_Landsat2013<-BTabs2014_WII_Landsat2013 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2014_WII_Landsat2013<-BTabs2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2014_WII_Landsat2013.csv")

#BT absence data from 2015 at Wilderness II with 2015 Landsat
BTabs2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_abs_2015_WII, fun=mean, weights=TRUE))
BTabs2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_abs_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2015_WII_Landsat2015list<- list(BTabs2015_WII_Landsat2015_blue, BTabs2015_WII_Landsat2015_green, BTabs2015_WII_Landsat2015_red, BTabs2015_WII_Landsat2015_nir, BTabs2015_WII_Landsat2015_swir1, BTabs2015_WII_Landsat2015_swir2, BTabs2015_WII_Landsat2015_NDVI, BTabs2015_WII_Landsat2015_NBR, BTabs2015_WII_Landsat2015_TCT_brightness, BTabs2015_WII_Landsat2015_TCT_greenness, BTabs2015_WII_Landsat2015_TCT_wetness)
BTabs2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2015_WII_Landsat2015list)
BTabs2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2015_WII_Landsat2015<-BTabs2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2015_WII_Landsat2015<-BTabs2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2015_WII_Landsat2015<-BTabs2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2015_WII_Landsat2015<-BTabs2015_WII_Landsat2015 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2015_WII_Landsat2015<-BTabs2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2015_WII_Landsat2015.csv")

#BT absence data from 2016 at Wilderness II with 2015 Landsat
BTabs2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_abs_2016_WII, fun=mean, weights=TRUE))
BTabs2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_abs_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2016_WII_Landsat2015list<- list(BTabs2016_WII_Landsat2015_blue, BTabs2016_WII_Landsat2015_green, BTabs2016_WII_Landsat2015_red, BTabs2016_WII_Landsat2015_nir, BTabs2016_WII_Landsat2015_swir1, BTabs2016_WII_Landsat2015_swir2, BTabs2016_WII_Landsat2015_NDVI, BTabs2016_WII_Landsat2015_NBR, BTabs2016_WII_Landsat2015_TCT_brightness, BTabs2016_WII_Landsat2015_TCT_greenness, BTabs2016_WII_Landsat2015_TCT_wetness)
BTabs2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2016_WII_Landsat2015list)
BTabs2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2016_WII_Landsat2015<-BTabs2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2016_WII_Landsat2015<-BTabs2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2016_WII_Landsat2015<-BTabs2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2016_WII_Landsat2015<-BTabs2016_WII_Landsat2015 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2016_WII_Landsat2015<-BTabs2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2016_WII_Landsat2015.csv")

#BT absence data from 2017 at Wilderness II with 2015 Landsat
BTabs2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, BT_abs_2017_WII, fun=mean, weights=TRUE))
BTabs2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, BT_abs_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
BTabs2017_WII_Landsat2015list<- list(BTabs2017_WII_Landsat2015_blue, BTabs2017_WII_Landsat2015_green, BTabs2017_WII_Landsat2015_red, BTabs2017_WII_Landsat2015_nir, BTabs2017_WII_Landsat2015_swir1, BTabs2017_WII_Landsat2015_swir2, BTabs2017_WII_Landsat2015_NDVI, BTabs2017_WII_Landsat2015_NBR, BTabs2017_WII_Landsat2015_TCT_brightness, BTabs2017_WII_Landsat2015_TCT_greenness, BTabs2017_WII_Landsat2015_TCT_wetness)
BTabs2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), BTabs2017_WII_Landsat2015list)
BTabs2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
BTabs2017_WII_Landsat2015<-BTabs2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
BTabs2017_WII_Landsat2015<-BTabs2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
BTabs2017_WII_Landsat2015<-BTabs2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
BTabs2017_WII_Landsat2015<-BTabs2017_WII_Landsat2015 %>%
  mutate(species = "BT_absence")%>% dplyr::select(species, everything())#add column for bird species
BTabs2017_WII_Landsat2015<-BTabs2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(BTabs2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/BTabs2017_WII_Landsat2015.csv")

####CC####
#CC absence data from 2000 at Wilderness II with 2000 Landsat
#no data
# CCabs2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2000_WII, fun=mean, weights=TRUE))
# CCabs2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# CCabs2000_WII_Landsat2000list<- list(CCabs2000_WII_Landsat2000_blue, CCabs2000_WII_Landsat2000_green, CCabs2000_WII_Landsat2000_red, CCabs2000_WII_Landsat2000_nir, CCabs2000_WII_Landsat2000_swir1, CCabs2000_WII_Landsat2000_swir2, CCabs2000_WII_Landsat2000_NDVI, CCabs2000_WII_Landsat2000_NBR, CCabs2000_WII_Landsat2000_TCT_brightness, CCabs2000_WII_Landsat2000_TCT_greenness, CCabs2000_WII_Landsat2000_TCT_wetness)
# CCabs2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2000_WII_Landsat2000list)
# CCabs2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# CCabs2000_WII_Landsat2000<-CCabs2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# CCabs2000_WII_Landsat2000<-CCabs2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# CCabs2000_WII_Landsat2000<-CCabs2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# CCabs2000_WII_Landsat2000<-CCabs2000_WII_Landsat2000 %>%
#   mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
# CCabs2000_WII_Landsat2000<-CCabs2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(CCabs2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2000_WII_landsat2000.csv")

#CC absence data from 2001 at Wilderness II with 2000 Landsat
#no data
# CCabs2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2001_WII, fun=mean, weights=TRUE))
# CCabs2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2001_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# CCabs2001_WII_Landsat2000list<- list(CCabs2001_WII_Landsat2000_blue, CCabs2001_WII_Landsat2000_green, CCabs2001_WII_Landsat2000_red, CCabs2001_WII_Landsat2000_nir, CCabs2001_WII_Landsat2000_swir1, CCabs2001_WII_Landsat2000_swir2, CCabs2001_WII_Landsat2000_NDVI, CCabs2001_WII_Landsat2000_NBR, CCabs2001_WII_Landsat2000_TCT_brightness, CCabs2001_WII_Landsat2000_TCT_greenness, CCabs2001_WII_Landsat2000_TCT_wetness)
# CCabs2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2001_WII_Landsat2000list)
# CCabs2001_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# CCabs2001_WII_Landsat2000<-CCabs2001_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# CCabs2001_WII_Landsat2000<-CCabs2001_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# CCabs2001_WII_Landsat2000<-CCabs2001_WII_Landsat2000 %>%
#   mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# CCabs2001_WII_Landsat2000<-CCabs2001_WII_Landsat2000 %>%
#   mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
# CCabs2001_WII_Landsat2000<-CCabs2001_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(CCabs2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2001_WII_landsat2000.csv")

#CC absence data from 2002 at Wilderness II with 2000 Landsat
CCabs2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2002_WII, fun=mean, weights=TRUE))
CCabs2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2002_WII_Landsat2000list<- list(CCabs2002_WII_Landsat2000_blue, CCabs2002_WII_Landsat2000_green, CCabs2002_WII_Landsat2000_red, CCabs2002_WII_Landsat2000_nir, CCabs2002_WII_Landsat2000_swir1, CCabs2002_WII_Landsat2000_swir2, CCabs2002_WII_Landsat2000_NDVI, CCabs2002_WII_Landsat2000_NBR, CCabs2002_WII_Landsat2000_TCT_brightness, CCabs2002_WII_Landsat2000_TCT_greenness, CCabs2002_WII_Landsat2000_TCT_wetness)
CCabs2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2002_WII_Landsat2000list)
CCabs2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2002_WII_Landsat2000<-CCabs2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2002_WII_Landsat2000<-CCabs2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2002_WII_Landsat2000<-CCabs2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2002_WII_Landsat2000<-CCabs2002_WII_Landsat2000 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2002_WII_Landsat2000<-CCabs2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2002_WII_landsat2000.csv")

#CC absence data from 2005 at Wilderness II with 2005 Landsat
CCabs2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2005_WII, fun=mean, weights=TRUE))
CCabs2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2005_WII_Landsat2005list<- list(CCabs2005_WII_Landsat2005_blue, CCabs2005_WII_Landsat2005_green, CCabs2005_WII_Landsat2005_red, CCabs2005_WII_Landsat2005_nir, CCabs2005_WII_Landsat2005_swir1, CCabs2005_WII_Landsat2005_swir2, CCabs2005_WII_Landsat2005_NDVI, CCabs2005_WII_Landsat2005_NBR, CCabs2005_WII_Landsat2005_TCT_brightness, CCabs2005_WII_Landsat2005_TCT_greenness, CCabs2005_WII_Landsat2005_TCT_wetness)
CCabs2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2005_WII_Landsat2005list)
CCabs2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2005_WII_Landsat2005<-CCabs2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2005_WII_Landsat2005<-CCabs2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2005_WII_Landsat2005<-CCabs2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2005_WII_Landsat2005<-CCabs2005_WII_Landsat2005 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2005_WII_Landsat2005<-CCabs2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2005_WII_Landsat2005.csv")

#CC absence data from 2006 at Wilderness II with 2005 Landsat
CCabs2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2006_WII, fun=mean, weights=TRUE))
CCabs2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2006_WII_Landsat2005list<- list(CCabs2006_WII_Landsat2005_blue, CCabs2006_WII_Landsat2005_green, CCabs2006_WII_Landsat2005_red, CCabs2006_WII_Landsat2005_nir, CCabs2006_WII_Landsat2005_swir1, CCabs2006_WII_Landsat2005_swir2, CCabs2006_WII_Landsat2005_NDVI, CCabs2006_WII_Landsat2005_NBR, CCabs2006_WII_Landsat2005_TCT_brightness, CCabs2006_WII_Landsat2005_TCT_greenness, CCabs2006_WII_Landsat2005_TCT_wetness)
CCabs2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2006_WII_Landsat2005list)
CCabs2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2006_WII_Landsat2005<-CCabs2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2006_WII_Landsat2005<-CCabs2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2006_WII_Landsat2005<-CCabs2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2006_WII_Landsat2005<-CCabs2006_WII_Landsat2005 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2006_WII_Landsat2005<-CCabs2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2006_WII_Landsat2005.csv")

#CC absence data from 2007 at Wilderness II with 2005 Landsat
CCabs2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2007_WII, fun=mean, weights=TRUE))
CCabs2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2007_WII_Landsat2005list<- list(CCabs2007_WII_Landsat2005_blue, CCabs2007_WII_Landsat2005_green, CCabs2007_WII_Landsat2005_red, CCabs2007_WII_Landsat2005_nir, CCabs2007_WII_Landsat2005_swir1, CCabs2007_WII_Landsat2005_swir2, CCabs2007_WII_Landsat2005_NDVI, CCabs2007_WII_Landsat2005_NBR, CCabs2007_WII_Landsat2005_TCT_brightness, CCabs2007_WII_Landsat2005_TCT_greenness, CCabs2007_WII_Landsat2005_TCT_wetness)
CCabs2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2007_WII_Landsat2005list)
CCabs2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2007_WII_Landsat2005<-CCabs2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2007_WII_Landsat2005<-CCabs2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2007_WII_Landsat2005<-CCabs2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2007_WII_Landsat2005<-CCabs2007_WII_Landsat2005 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2007_WII_Landsat2005<-CCabs2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2007_WII_Landsat2005.csv")

#CC absence data from 2012 at Wilderness II with 2013 Landsat
CCabs2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2012_WII, fun=mean, weights=TRUE))
CCabs2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2012_WII_Landsat2013list<- list(CCabs2012_WII_Landsat2013_blue, CCabs2012_WII_Landsat2013_green, CCabs2012_WII_Landsat2013_red, CCabs2012_WII_Landsat2013_nir, CCabs2012_WII_Landsat2013_swir1, CCabs2012_WII_Landsat2013_swir2, CCabs2012_WII_Landsat2013_NDVI, CCabs2012_WII_Landsat2013_NBR, CCabs2012_WII_Landsat2013_TCT_brightness, CCabs2012_WII_Landsat2013_TCT_greenness, CCabs2012_WII_Landsat2013_TCT_wetness)
CCabs2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2012_WII_Landsat2013list)
CCabs2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2012_WII_Landsat2013<-CCabs2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2012_WII_Landsat2013<-CCabs2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2012_WII_Landsat2013<-CCabs2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2012_WII_Landsat2013<-CCabs2012_WII_Landsat2013 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2012_WII_Landsat2013<-CCabs2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2012_WII_Landsat2013.csv")

#CC absence data from 2013 at Wilderness II with 2013 Landsat
CCabs2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2013_WII, fun=mean, weights=TRUE))
CCabs2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2013_WII_Landsat2013list<- list(CCabs2013_WII_Landsat2013_blue, CCabs2013_WII_Landsat2013_green, CCabs2013_WII_Landsat2013_red, CCabs2013_WII_Landsat2013_nir, CCabs2013_WII_Landsat2013_swir1, CCabs2013_WII_Landsat2013_swir2, CCabs2013_WII_Landsat2013_NDVI, CCabs2013_WII_Landsat2013_NBR, CCabs2013_WII_Landsat2013_TCT_brightness, CCabs2013_WII_Landsat2013_TCT_greenness, CCabs2013_WII_Landsat2013_TCT_wetness)
CCabs2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2013_WII_Landsat2013list)
CCabs2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2013_WII_Landsat2013<-CCabs2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2013_WII_Landsat2013<-CCabs2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2013_WII_Landsat2013<-CCabs2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2013_WII_Landsat2013<-CCabs2013_WII_Landsat2013 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2013_WII_Landsat2013<-CCabs2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2013_WII_Landsat2013.csv")

#CC absence data from 2014 at Wilderness II with 2013 Landsat
CCabs2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CC_abs_2014_WII, fun=mean, weights=TRUE))
CCabs2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CC_abs_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2014_WII_Landsat2013list<- list(CCabs2014_WII_Landsat2013_blue, CCabs2014_WII_Landsat2013_green, CCabs2014_WII_Landsat2013_red, CCabs2014_WII_Landsat2013_nir, CCabs2014_WII_Landsat2013_swir1, CCabs2014_WII_Landsat2013_swir2, CCabs2014_WII_Landsat2013_NDVI, CCabs2014_WII_Landsat2013_NBR, CCabs2014_WII_Landsat2013_TCT_brightness, CCabs2014_WII_Landsat2013_TCT_greenness, CCabs2014_WII_Landsat2013_TCT_wetness)
CCabs2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2014_WII_Landsat2013list)
CCabs2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2014_WII_Landsat2013<-CCabs2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2014_WII_Landsat2013<-CCabs2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2014_WII_Landsat2013<-CCabs2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2014_WII_Landsat2013<-CCabs2014_WII_Landsat2013 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2014_WII_Landsat2013<-CCabs2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2014_WII_Landsat2013.csv")

#CC absence data from 2015 at Wilderness II with 2015 Landsat
CCabs2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_abs_2015_WII, fun=mean, weights=TRUE))
CCabs2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_abs_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2015_WII_Landsat2015list<- list(CCabs2015_WII_Landsat2015_blue, CCabs2015_WII_Landsat2015_green, CCabs2015_WII_Landsat2015_red, CCabs2015_WII_Landsat2015_nir, CCabs2015_WII_Landsat2015_swir1, CCabs2015_WII_Landsat2015_swir2, CCabs2015_WII_Landsat2015_NDVI, CCabs2015_WII_Landsat2015_NBR, CCabs2015_WII_Landsat2015_TCT_brightness, CCabs2015_WII_Landsat2015_TCT_greenness, CCabs2015_WII_Landsat2015_TCT_wetness)
CCabs2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2015_WII_Landsat2015list)
CCabs2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2015_WII_Landsat2015<-CCabs2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2015_WII_Landsat2015<-CCabs2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2015_WII_Landsat2015<-CCabs2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2015_WII_Landsat2015<-CCabs2015_WII_Landsat2015 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2015_WII_Landsat2015<-CCabs2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2015_WII_Landsat2015.csv")

#CC absence data from 2016 at Wilderness II with 2015 Landsat
CCabs2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_abs_2016_WII, fun=mean, weights=TRUE))
CCabs2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_abs_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2016_WII_Landsat2015list<- list(CCabs2016_WII_Landsat2015_blue, CCabs2016_WII_Landsat2015_green, CCabs2016_WII_Landsat2015_red, CCabs2016_WII_Landsat2015_nir, CCabs2016_WII_Landsat2015_swir1, CCabs2016_WII_Landsat2015_swir2, CCabs2016_WII_Landsat2015_NDVI, CCabs2016_WII_Landsat2015_NBR, CCabs2016_WII_Landsat2015_TCT_brightness, CCabs2016_WII_Landsat2015_TCT_greenness, CCabs2016_WII_Landsat2015_TCT_wetness)
CCabs2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2016_WII_Landsat2015list)
CCabs2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2016_WII_Landsat2015<-CCabs2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2016_WII_Landsat2015<-CCabs2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2016_WII_Landsat2015<-CCabs2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2016_WII_Landsat2015<-CCabs2016_WII_Landsat2015 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2016_WII_Landsat2015<-CCabs2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2016_WII_Landsat2015.csv")

#CC absence data from 2017 at Wilderness II with 2015 Landsat
CCabs2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CC_abs_2017_WII, fun=mean, weights=TRUE))
CCabs2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CC_abs_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CCabs2017_WII_Landsat2015list<- list(CCabs2017_WII_Landsat2015_blue, CCabs2017_WII_Landsat2015_green, CCabs2017_WII_Landsat2015_red, CCabs2017_WII_Landsat2015_nir, CCabs2017_WII_Landsat2015_swir1, CCabs2017_WII_Landsat2015_swir2, CCabs2017_WII_Landsat2015_NDVI, CCabs2017_WII_Landsat2015_NBR, CCabs2017_WII_Landsat2015_TCT_brightness, CCabs2017_WII_Landsat2015_TCT_greenness, CCabs2017_WII_Landsat2015_TCT_wetness)
CCabs2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CCabs2017_WII_Landsat2015list)
CCabs2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CCabs2017_WII_Landsat2015<-CCabs2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CCabs2017_WII_Landsat2015<-CCabs2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CCabs2017_WII_Landsat2015<-CCabs2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CCabs2017_WII_Landsat2015<-CCabs2017_WII_Landsat2015 %>%
  mutate(species = "CC_absence")%>% dplyr::select(species, everything())#add column for bird species
CCabs2017_WII_Landsat2015<-CCabs2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CCabs2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CCabs2017_WII_Landsat2015.csv")

####CH####
#CH absence data from 2000 at Wilderness II with 2000 Landsat
#no data
# CHabs2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2000_WII, fun=mean, weights=TRUE))
# CHabs2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# CHabs2000_WII_Landsat2000list<- list(CHabs2000_WII_Landsat2000_blue, CHabs2000_WII_Landsat2000_green, CHabs2000_WII_Landsat2000_red, CHabs2000_WII_Landsat2000_nir, CHabs2000_WII_Landsat2000_swir1, CHabs2000_WII_Landsat2000_swir2, CHabs2000_WII_Landsat2000_NDVI, CHabs2000_WII_Landsat2000_NBR, CHabs2000_WII_Landsat2000_TCT_brightness, CHabs2000_WII_Landsat2000_TCT_greenness, CHabs2000_WII_Landsat2000_TCT_wetness)
# CHabs2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2000_WII_Landsat2000list)
# CHabs2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# CHabs2000_WII_Landsat2000<-CHabs2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# CHabs2000_WII_Landsat2000<-CHabs2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# CHabs2000_WII_Landsat2000<-CHabs2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# CHabs2000_WII_Landsat2000<-CHabs2000_WII_Landsat2000 %>%
#   mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
# CHabs2000_WII_Landsat2000<-CHabs2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(CHabs2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2000_WII_landsat2000.csv")

#CH absence data from 2001 at Wilderness II with 2000 Landsat
CHabs2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2001_WII, fun=mean, weights=TRUE))
CHabs2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2001_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2001_WII_Landsat2000list<- list(CHabs2001_WII_Landsat2000_blue, CHabs2001_WII_Landsat2000_green, CHabs2001_WII_Landsat2000_red, CHabs2001_WII_Landsat2000_nir, CHabs2001_WII_Landsat2000_swir1, CHabs2001_WII_Landsat2000_swir2, CHabs2001_WII_Landsat2000_NDVI, CHabs2001_WII_Landsat2000_NBR, CHabs2001_WII_Landsat2000_TCT_brightness, CHabs2001_WII_Landsat2000_TCT_greenness, CHabs2001_WII_Landsat2000_TCT_wetness)
CHabs2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2001_WII_Landsat2000list)
CHabs2001_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2001_WII_Landsat2000<-CHabs2001_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2001_WII_Landsat2000<-CHabs2001_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2001_WII_Landsat2000<-CHabs2001_WII_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2001_WII_Landsat2000<-CHabs2001_WII_Landsat2000 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2001_WII_Landsat2000<-CHabs2001_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2001_WII_landsat2000.csv")

#CH absence data from 2002 at Wilderness II with 2000 Landsat
CHabs2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2002_WII, fun=mean, weights=TRUE))
CHabs2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2002_WII_Landsat2000list<- list(CHabs2002_WII_Landsat2000_blue, CHabs2002_WII_Landsat2000_green, CHabs2002_WII_Landsat2000_red, CHabs2002_WII_Landsat2000_nir, CHabs2002_WII_Landsat2000_swir1, CHabs2002_WII_Landsat2000_swir2, CHabs2002_WII_Landsat2000_NDVI, CHabs2002_WII_Landsat2000_NBR, CHabs2002_WII_Landsat2000_TCT_brightness, CHabs2002_WII_Landsat2000_TCT_greenness, CHabs2002_WII_Landsat2000_TCT_wetness)
CHabs2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2002_WII_Landsat2000list)
CHabs2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2002_WII_Landsat2000<-CHabs2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2002_WII_Landsat2000<-CHabs2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2002_WII_Landsat2000<-CHabs2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2002_WII_Landsat2000<-CHabs2002_WII_Landsat2000 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2002_WII_Landsat2000<-CHabs2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2002_WII_landsat2000.csv")

#CH absence data from 2005 at Wilderness II with 2005 Landsat
CHabs2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2005_WII, fun=mean, weights=TRUE))
CHabs2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2005_WII_Landsat2005list<- list(CHabs2005_WII_Landsat2005_blue, CHabs2005_WII_Landsat2005_green, CHabs2005_WII_Landsat2005_red, CHabs2005_WII_Landsat2005_nir, CHabs2005_WII_Landsat2005_swir1, CHabs2005_WII_Landsat2005_swir2, CHabs2005_WII_Landsat2005_NDVI, CHabs2005_WII_Landsat2005_NBR, CHabs2005_WII_Landsat2005_TCT_brightness, CHabs2005_WII_Landsat2005_TCT_greenness, CHabs2005_WII_Landsat2005_TCT_wetness)
CHabs2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2005_WII_Landsat2005list)
CHabs2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2005_WII_Landsat2005<-CHabs2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2005_WII_Landsat2005<-CHabs2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2005_WII_Landsat2005<-CHabs2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2005_WII_Landsat2005<-CHabs2005_WII_Landsat2005 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2005_WII_Landsat2005<-CHabs2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2005_WII_Landsat2005.csv")

#CH absence data from 2006 at Wilderness II with 2005 Landsat
CHabs2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2006_WII, fun=mean, weights=TRUE))
CHabs2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2006_WII_Landsat2005list<- list(CHabs2006_WII_Landsat2005_blue, CHabs2006_WII_Landsat2005_green, CHabs2006_WII_Landsat2005_red, CHabs2006_WII_Landsat2005_nir, CHabs2006_WII_Landsat2005_swir1, CHabs2006_WII_Landsat2005_swir2, CHabs2006_WII_Landsat2005_NDVI, CHabs2006_WII_Landsat2005_NBR, CHabs2006_WII_Landsat2005_TCT_brightness, CHabs2006_WII_Landsat2005_TCT_greenness, CHabs2006_WII_Landsat2005_TCT_wetness)
CHabs2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2006_WII_Landsat2005list)
CHabs2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2006_WII_Landsat2005<-CHabs2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2006_WII_Landsat2005<-CHabs2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2006_WII_Landsat2005<-CHabs2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2006_WII_Landsat2005<-CHabs2006_WII_Landsat2005 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2006_WII_Landsat2005<-CHabs2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2006_WII_Landsat2005.csv")

#CH absence data from 2007 at Wilderness II with 2005 Landsat
CHabs2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2007_WII, fun=mean, weights=TRUE))
CHabs2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2007_WII_Landsat2005list<- list(CHabs2007_WII_Landsat2005_blue, CHabs2007_WII_Landsat2005_green, CHabs2007_WII_Landsat2005_red, CHabs2007_WII_Landsat2005_nir, CHabs2007_WII_Landsat2005_swir1, CHabs2007_WII_Landsat2005_swir2, CHabs2007_WII_Landsat2005_NDVI, CHabs2007_WII_Landsat2005_NBR, CHabs2007_WII_Landsat2005_TCT_brightness, CHabs2007_WII_Landsat2005_TCT_greenness, CHabs2007_WII_Landsat2005_TCT_wetness)
CHabs2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2007_WII_Landsat2005list)
CHabs2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2007_WII_Landsat2005<-CHabs2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2007_WII_Landsat2005<-CHabs2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2007_WII_Landsat2005<-CHabs2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2007_WII_Landsat2005<-CHabs2007_WII_Landsat2005 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2007_WII_Landsat2005<-CHabs2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2007_WII_Landsat2005.csv")

#CH absence data from 2012 at Wilderness II with 2013 Landsat
CHabs2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2012_WII, fun=mean, weights=TRUE))
CHabs2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2012_WII_Landsat2013list<- list(CHabs2012_WII_Landsat2013_blue, CHabs2012_WII_Landsat2013_green, CHabs2012_WII_Landsat2013_red, CHabs2012_WII_Landsat2013_nir, CHabs2012_WII_Landsat2013_swir1, CHabs2012_WII_Landsat2013_swir2, CHabs2012_WII_Landsat2013_NDVI, CHabs2012_WII_Landsat2013_NBR, CHabs2012_WII_Landsat2013_TCT_brightness, CHabs2012_WII_Landsat2013_TCT_greenness, CHabs2012_WII_Landsat2013_TCT_wetness)
CHabs2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2012_WII_Landsat2013list)
CHabs2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2012_WII_Landsat2013<-CHabs2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2012_WII_Landsat2013<-CHabs2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2012_WII_Landsat2013<-CHabs2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2012_WII_Landsat2013<-CHabs2012_WII_Landsat2013 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2012_WII_Landsat2013<-CHabs2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2012_WII_Landsat2013.csv")

#CH absence data from 2013 at Wilderness II with 2013 Landsat
CHabs2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2013_WII, fun=mean, weights=TRUE))
CHabs2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2013_WII_Landsat2013list<- list(CHabs2013_WII_Landsat2013_blue, CHabs2013_WII_Landsat2013_green, CHabs2013_WII_Landsat2013_red, CHabs2013_WII_Landsat2013_nir, CHabs2013_WII_Landsat2013_swir1, CHabs2013_WII_Landsat2013_swir2, CHabs2013_WII_Landsat2013_NDVI, CHabs2013_WII_Landsat2013_NBR, CHabs2013_WII_Landsat2013_TCT_brightness, CHabs2013_WII_Landsat2013_TCT_greenness, CHabs2013_WII_Landsat2013_TCT_wetness)
CHabs2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2013_WII_Landsat2013list)
CHabs2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2013_WII_Landsat2013<-CHabs2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2013_WII_Landsat2013<-CHabs2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2013_WII_Landsat2013<-CHabs2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2013_WII_Landsat2013<-CHabs2013_WII_Landsat2013 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2013_WII_Landsat2013<-CHabs2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2013_WII_Landsat2013.csv")

#CH absence data from 2014 at Wilderness II with 2013 Landsat
CHabs2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, CH_abs_2014_WII, fun=mean, weights=TRUE))
CHabs2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, CH_abs_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2014_WII_Landsat2013list<- list(CHabs2014_WII_Landsat2013_blue, CHabs2014_WII_Landsat2013_green, CHabs2014_WII_Landsat2013_red, CHabs2014_WII_Landsat2013_nir, CHabs2014_WII_Landsat2013_swir1, CHabs2014_WII_Landsat2013_swir2, CHabs2014_WII_Landsat2013_NDVI, CHabs2014_WII_Landsat2013_NBR, CHabs2014_WII_Landsat2013_TCT_brightness, CHabs2014_WII_Landsat2013_TCT_greenness, CHabs2014_WII_Landsat2013_TCT_wetness)
CHabs2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2014_WII_Landsat2013list)
CHabs2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2014_WII_Landsat2013<-CHabs2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2014_WII_Landsat2013<-CHabs2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2014_WII_Landsat2013<-CHabs2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2014_WII_Landsat2013<-CHabs2014_WII_Landsat2013 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2014_WII_Landsat2013<-CHabs2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2014_WII_Landsat2013.csv")

#CH absence data from 2015 at Wilderness II with 2015 Landsat
CHabs2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_abs_2015_WII, fun=mean, weights=TRUE))
CHabs2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_abs_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2015_WII_Landsat2015list<- list(CHabs2015_WII_Landsat2015_blue, CHabs2015_WII_Landsat2015_green, CHabs2015_WII_Landsat2015_red, CHabs2015_WII_Landsat2015_nir, CHabs2015_WII_Landsat2015_swir1, CHabs2015_WII_Landsat2015_swir2, CHabs2015_WII_Landsat2015_NDVI, CHabs2015_WII_Landsat2015_NBR, CHabs2015_WII_Landsat2015_TCT_brightness, CHabs2015_WII_Landsat2015_TCT_greenness, CHabs2015_WII_Landsat2015_TCT_wetness)
CHabs2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2015_WII_Landsat2015list)
CHabs2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2015_WII_Landsat2015<-CHabs2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2015_WII_Landsat2015<-CHabs2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2015_WII_Landsat2015<-CHabs2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2015_WII_Landsat2015<-CHabs2015_WII_Landsat2015 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2015_WII_Landsat2015<-CHabs2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2015_WII_Landsat2015.csv")

#CH absence data from 2016 at Wilderness II with 2015 Landsat
CHabs2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_abs_2016_WII, fun=mean, weights=TRUE))
CHabs2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_abs_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2016_WII_Landsat2015list<- list(CHabs2016_WII_Landsat2015_blue, CHabs2016_WII_Landsat2015_green, CHabs2016_WII_Landsat2015_red, CHabs2016_WII_Landsat2015_nir, CHabs2016_WII_Landsat2015_swir1, CHabs2016_WII_Landsat2015_swir2, CHabs2016_WII_Landsat2015_NDVI, CHabs2016_WII_Landsat2015_NBR, CHabs2016_WII_Landsat2015_TCT_brightness, CHabs2016_WII_Landsat2015_TCT_greenness, CHabs2016_WII_Landsat2015_TCT_wetness)
CHabs2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2016_WII_Landsat2015list)
CHabs2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2016_WII_Landsat2015<-CHabs2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2016_WII_Landsat2015<-CHabs2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2016_WII_Landsat2015<-CHabs2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2016_WII_Landsat2015<-CHabs2016_WII_Landsat2015 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2016_WII_Landsat2015<-CHabs2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2016_WII_Landsat2015.csv")

#CH absence data from 2017 at Wilderness II with 2015 Landsat
CHabs2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, CH_abs_2017_WII, fun=mean, weights=TRUE))
CHabs2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, CH_abs_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
CHabs2017_WII_Landsat2015list<- list(CHabs2017_WII_Landsat2015_blue, CHabs2017_WII_Landsat2015_green, CHabs2017_WII_Landsat2015_red, CHabs2017_WII_Landsat2015_nir, CHabs2017_WII_Landsat2015_swir1, CHabs2017_WII_Landsat2015_swir2, CHabs2017_WII_Landsat2015_NDVI, CHabs2017_WII_Landsat2015_NBR, CHabs2017_WII_Landsat2015_TCT_brightness, CHabs2017_WII_Landsat2015_TCT_greenness, CHabs2017_WII_Landsat2015_TCT_wetness)
CHabs2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), CHabs2017_WII_Landsat2015list)
CHabs2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
CHabs2017_WII_Landsat2015<-CHabs2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
CHabs2017_WII_Landsat2015<-CHabs2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
CHabs2017_WII_Landsat2015<-CHabs2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
CHabs2017_WII_Landsat2015<-CHabs2017_WII_Landsat2015 %>%
  mutate(species = "CH_absence")%>% dplyr::select(species, everything())#add column for bird species
CHabs2017_WII_Landsat2015<-CHabs2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(CHabs2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/CHabs2017_WII_Landsat2015.csv")

####WW####
#WW absence data from 2000 at Wilderness II with 2000 Landsat
#no data
# WWabs2000_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2000_WII, fun=mean, weights=TRUE))
# WWabs2000_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2000_WII, fun=mean, weights=TRUE))
# 
# #combine all landsat metrics together
# ?merge
# WWabs2000_WII_Landsat2000list<- list(WWabs2000_WII_Landsat2000_blue, WWabs2000_WII_Landsat2000_green, WWabs2000_WII_Landsat2000_red, WWabs2000_WII_Landsat2000_nir, WWabs2000_WII_Landsat2000_swir1, WWabs2000_WII_Landsat2000_swir2, WWabs2000_WII_Landsat2000_NDVI, WWabs2000_WII_Landsat2000_NBR, WWabs2000_WII_Landsat2000_TCT_brightness, WWabs2000_WII_Landsat2000_TCT_greenness, WWabs2000_WII_Landsat2000_TCT_wetness)
# WWabs2000_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2000_WII_Landsat2000list)
# WWabs2000_WII_Landsat2000
# #add four columns: site, Landsat year, bird survey year, bird species
# WWabs2000_WII_Landsat2000<-WWabs2000_WII_Landsat2000 %>%
#   mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
# WWabs2000_WII_Landsat2000<-WWabs2000_WII_Landsat2000 %>%
#   mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
# WWabs2000_WII_Landsat2000<-WWabs2000_WII_Landsat2000 %>%
#   mutate(bird_year = "2000")%>% dplyr::select(bird_year, everything())#add column for bird survey year
# WWabs2000_WII_Landsat2000<-WWabs2000_WII_Landsat2000 %>%
#   mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
# WWabs2000_WII_Landsat2000<-WWabs2000_WII_Landsat2000 %>% 
#   mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
# #write it
# write.csv(WWabs2000_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2000_WII_landsat2000.csv")

#WW absence data from 2001 at Wilderness II with 2000 Landsat
WWabs2001_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2001_WII, fun=mean, weights=TRUE))
WWabs2001_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2001_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2001_WII_Landsat2000list<- list(WWabs2001_WII_Landsat2000_blue, WWabs2001_WII_Landsat2000_green, WWabs2001_WII_Landsat2000_red, WWabs2001_WII_Landsat2000_nir, WWabs2001_WII_Landsat2000_swir1, WWabs2001_WII_Landsat2000_swir2, WWabs2001_WII_Landsat2000_NDVI, WWabs2001_WII_Landsat2000_NBR, WWabs2001_WII_Landsat2000_TCT_brightness, WWabs2001_WII_Landsat2000_TCT_greenness, WWabs2001_WII_Landsat2000_TCT_wetness)
WWabs2001_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2001_WII_Landsat2000list)
WWabs2001_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2001_WII_Landsat2000<-WWabs2001_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2001_WII_Landsat2000<-WWabs2001_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2001_WII_Landsat2000<-WWabs2001_WII_Landsat2000 %>%
  mutate(bird_year = "2001")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2001_WII_Landsat2000<-WWabs2001_WII_Landsat2000 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2001_WII_Landsat2000<-WWabs2001_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2001_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2001_WII_landsat2000.csv")

#WW absence data from 2002 at Wilderness II with 2000 Landsat
WWabs2002_WII_Landsat2000_blue <- as.data.frame(extract(L5_2000_blue, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_green <- as.data.frame(extract(L5_2000_green, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_red <- as.data.frame(extract(L5_2000_red, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_nir <- as.data.frame(extract(L5_2000_nir, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_swir1 <- as.data.frame(extract(L5_2000_swir1, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_swir2 <- as.data.frame(extract(L5_2000_swir2, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_NDVI <- as.data.frame(extract(NDVI2000, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_NBR <- as.data.frame(extract(NBR2000, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2002_WII, fun=mean, weights=TRUE))
WWabs2002_WII_Landsat2000_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2002_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2002_WII_Landsat2000list<- list(WWabs2002_WII_Landsat2000_blue, WWabs2002_WII_Landsat2000_green, WWabs2002_WII_Landsat2000_red, WWabs2002_WII_Landsat2000_nir, WWabs2002_WII_Landsat2000_swir1, WWabs2002_WII_Landsat2000_swir2, WWabs2002_WII_Landsat2000_NDVI, WWabs2002_WII_Landsat2000_NBR, WWabs2002_WII_Landsat2000_TCT_brightness, WWabs2002_WII_Landsat2000_TCT_greenness, WWabs2002_WII_Landsat2000_TCT_wetness)
WWabs2002_WII_Landsat2000<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2002_WII_Landsat2000list)
WWabs2002_WII_Landsat2000
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2002_WII_Landsat2000<-WWabs2002_WII_Landsat2000 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2002_WII_Landsat2000<-WWabs2002_WII_Landsat2000 %>%
  mutate(Landsat_year = "2000")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2002_WII_Landsat2000<-WWabs2002_WII_Landsat2000 %>%
  mutate(bird_year = "2002")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2002_WII_Landsat2000<-WWabs2002_WII_Landsat2000 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2002_WII_Landsat2000<-WWabs2002_WII_Landsat2000 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2002_WII_Landsat2000, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2002_WII_landsat2000.csv")

#WW absence data from 2005 at Wilderness II with 2005 Landsat
WWabs2005_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2005_WII, fun=mean, weights=TRUE))
WWabs2005_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2005_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2005_WII_Landsat2005list<- list(WWabs2005_WII_Landsat2005_blue, WWabs2005_WII_Landsat2005_green, WWabs2005_WII_Landsat2005_red, WWabs2005_WII_Landsat2005_nir, WWabs2005_WII_Landsat2005_swir1, WWabs2005_WII_Landsat2005_swir2, WWabs2005_WII_Landsat2005_NDVI, WWabs2005_WII_Landsat2005_NBR, WWabs2005_WII_Landsat2005_TCT_brightness, WWabs2005_WII_Landsat2005_TCT_greenness, WWabs2005_WII_Landsat2005_TCT_wetness)
WWabs2005_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2005_WII_Landsat2005list)
WWabs2005_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2005_WII_Landsat2005<-WWabs2005_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2005_WII_Landsat2005<-WWabs2005_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2005_WII_Landsat2005<-WWabs2005_WII_Landsat2005 %>%
  mutate(bird_year = "2005")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2005_WII_Landsat2005<-WWabs2005_WII_Landsat2005 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2005_WII_Landsat2005<-WWabs2005_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2005_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2005_WII_Landsat2005.csv")

#WW absence data from 2006 at Wilderness II with 2005 Landsat
WWabs2006_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2006_WII, fun=mean, weights=TRUE))
WWabs2006_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2006_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2006_WII_Landsat2005list<- list(WWabs2006_WII_Landsat2005_blue, WWabs2006_WII_Landsat2005_green, WWabs2006_WII_Landsat2005_red, WWabs2006_WII_Landsat2005_nir, WWabs2006_WII_Landsat2005_swir1, WWabs2006_WII_Landsat2005_swir2, WWabs2006_WII_Landsat2005_NDVI, WWabs2006_WII_Landsat2005_NBR, WWabs2006_WII_Landsat2005_TCT_brightness, WWabs2006_WII_Landsat2005_TCT_greenness, WWabs2006_WII_Landsat2005_TCT_wetness)
WWabs2006_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2006_WII_Landsat2005list)
WWabs2006_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2006_WII_Landsat2005<-WWabs2006_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2006_WII_Landsat2005<-WWabs2006_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2006_WII_Landsat2005<-WWabs2006_WII_Landsat2005 %>%
  mutate(bird_year = "2006")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2006_WII_Landsat2005<-WWabs2006_WII_Landsat2005 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2006_WII_Landsat2005<-WWabs2006_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2006_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2006_WII_Landsat2005.csv")

#WW absence data from 2007 at Wilderness II with 2005 Landsat
WWabs2007_WII_Landsat2005_blue <- as.data.frame(extract(L5_2005_blue, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_green <- as.data.frame(extract(L5_2005_green, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_red <- as.data.frame(extract(L5_2005_red, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_nir <- as.data.frame(extract(L5_2005_nir, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_swir1 <- as.data.frame(extract(L5_2005_swir1, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_swir2 <- as.data.frame(extract(L5_2005_swir2, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_NDVI <- as.data.frame(extract(NDVI2005, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_NBR <- as.data.frame(extract(NBR2005, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2007_WII, fun=mean, weights=TRUE))
WWabs2007_WII_Landsat2005_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2007_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2007_WII_Landsat2005list<- list(WWabs2007_WII_Landsat2005_blue, WWabs2007_WII_Landsat2005_green, WWabs2007_WII_Landsat2005_red, WWabs2007_WII_Landsat2005_nir, WWabs2007_WII_Landsat2005_swir1, WWabs2007_WII_Landsat2005_swir2, WWabs2007_WII_Landsat2005_NDVI, WWabs2007_WII_Landsat2005_NBR, WWabs2007_WII_Landsat2005_TCT_brightness, WWabs2007_WII_Landsat2005_TCT_greenness, WWabs2007_WII_Landsat2005_TCT_wetness)
WWabs2007_WII_Landsat2005<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2007_WII_Landsat2005list)
WWabs2007_WII_Landsat2005
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2007_WII_Landsat2005<-WWabs2007_WII_Landsat2005 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2007_WII_Landsat2005<-WWabs2007_WII_Landsat2005 %>%
  mutate(Landsat_year = "2005")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2007_WII_Landsat2005<-WWabs2007_WII_Landsat2005 %>%
  mutate(bird_year = "2007")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2007_WII_Landsat2005<-WWabs2007_WII_Landsat2005 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2007_WII_Landsat2005<-WWabs2007_WII_Landsat2005 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2007_WII_Landsat2005, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2007_WII_Landsat2005.csv")

#WW absence data from 2012 at Wilderness II with 2013 Landsat
WWabs2012_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2012_WII, fun=mean, weights=TRUE))
WWabs2012_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2012_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2012_WII_Landsat2013list<- list(WWabs2012_WII_Landsat2013_blue, WWabs2012_WII_Landsat2013_green, WWabs2012_WII_Landsat2013_red, WWabs2012_WII_Landsat2013_nir, WWabs2012_WII_Landsat2013_swir1, WWabs2012_WII_Landsat2013_swir2, WWabs2012_WII_Landsat2013_NDVI, WWabs2012_WII_Landsat2013_NBR, WWabs2012_WII_Landsat2013_TCT_brightness, WWabs2012_WII_Landsat2013_TCT_greenness, WWabs2012_WII_Landsat2013_TCT_wetness)
WWabs2012_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2012_WII_Landsat2013list)
WWabs2012_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2012_WII_Landsat2013<-WWabs2012_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2012_WII_Landsat2013<-WWabs2012_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2012_WII_Landsat2013<-WWabs2012_WII_Landsat2013 %>%
  mutate(bird_year = "2012")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2012_WII_Landsat2013<-WWabs2012_WII_Landsat2013 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2012_WII_Landsat2013<-WWabs2012_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2012_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2012_WII_Landsat2013.csv")

#WW absence data from 2013 at Wilderness II with 2013 Landsat
WWabs2013_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2013_WII, fun=mean, weights=TRUE))
WWabs2013_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2013_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2013_WII_Landsat2013list<- list(WWabs2013_WII_Landsat2013_blue, WWabs2013_WII_Landsat2013_green, WWabs2013_WII_Landsat2013_red, WWabs2013_WII_Landsat2013_nir, WWabs2013_WII_Landsat2013_swir1, WWabs2013_WII_Landsat2013_swir2, WWabs2013_WII_Landsat2013_NDVI, WWabs2013_WII_Landsat2013_NBR, WWabs2013_WII_Landsat2013_TCT_brightness, WWabs2013_WII_Landsat2013_TCT_greenness, WWabs2013_WII_Landsat2013_TCT_wetness)
WWabs2013_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2013_WII_Landsat2013list)
WWabs2013_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2013_WII_Landsat2013<-WWabs2013_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2013_WII_Landsat2013<-WWabs2013_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2013_WII_Landsat2013<-WWabs2013_WII_Landsat2013 %>%
  mutate(bird_year = "2013")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2013_WII_Landsat2013<-WWabs2013_WII_Landsat2013 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2013_WII_Landsat2013<-WWabs2013_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2013_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2013_WII_Landsat2013.csv")

#WW absence data from 2014 at Wilderness II with 2013 Landsat
WWabs2014_WII_Landsat2013_blue <- as.data.frame(extract(L8_2013_blue, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_green <- as.data.frame(extract(L8_2013_green, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_red <- as.data.frame(extract(L8_2013_red, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_nir <- as.data.frame(extract(L8_2013_nir, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_swir1 <- as.data.frame(extract(L8_2013_swir1, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_swir2 <- as.data.frame(extract(L8_2013_swir2, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_NDVI <- as.data.frame(extract(NDVI2013, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_NBR <- as.data.frame(extract(NBR2013, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_TCT_brightness <- as.data.frame(extract(TCT2000_brightness, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_TCT_greenness <- as.data.frame(extract(TCT2000_greenness, WW_abs_2014_WII, fun=mean, weights=TRUE))
WWabs2014_WII_Landsat2013_TCT_wetness <- as.data.frame(extract(TCT2000_wetness, WW_abs_2014_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2014_WII_Landsat2013list<- list(WWabs2014_WII_Landsat2013_blue, WWabs2014_WII_Landsat2013_green, WWabs2014_WII_Landsat2013_red, WWabs2014_WII_Landsat2013_nir, WWabs2014_WII_Landsat2013_swir1, WWabs2014_WII_Landsat2013_swir2, WWabs2014_WII_Landsat2013_NDVI, WWabs2014_WII_Landsat2013_NBR, WWabs2014_WII_Landsat2013_TCT_brightness, WWabs2014_WII_Landsat2013_TCT_greenness, WWabs2014_WII_Landsat2013_TCT_wetness)
WWabs2014_WII_Landsat2013<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2014_WII_Landsat2013list)
WWabs2014_WII_Landsat2013
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2014_WII_Landsat2013<-WWabs2014_WII_Landsat2013 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2014_WII_Landsat2013<-WWabs2014_WII_Landsat2013 %>%
  mutate(Landsat_year = "2013")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2014_WII_Landsat2013<-WWabs2014_WII_Landsat2013 %>%
  mutate(bird_year = "2014")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2014_WII_Landsat2013<-WWabs2014_WII_Landsat2013 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2014_WII_Landsat2013<-WWabs2014_WII_Landsat2013 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2014_WII_Landsat2013, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2014_WII_Landsat2013.csv")

#WW absence data from 2015 at Wilderness II with 2015 Landsat
WWabs2015_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_abs_2015_WII, fun=mean, weights=TRUE))
WWabs2015_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_abs_2015_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2015_WII_Landsat2015list<- list(WWabs2015_WII_Landsat2015_blue, WWabs2015_WII_Landsat2015_green, WWabs2015_WII_Landsat2015_red, WWabs2015_WII_Landsat2015_nir, WWabs2015_WII_Landsat2015_swir1, WWabs2015_WII_Landsat2015_swir2, WWabs2015_WII_Landsat2015_NDVI, WWabs2015_WII_Landsat2015_NBR, WWabs2015_WII_Landsat2015_TCT_brightness, WWabs2015_WII_Landsat2015_TCT_greenness, WWabs2015_WII_Landsat2015_TCT_wetness)
WWabs2015_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2015_WII_Landsat2015list)
WWabs2015_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2015_WII_Landsat2015<-WWabs2015_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2015_WII_Landsat2015<-WWabs2015_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2015_WII_Landsat2015<-WWabs2015_WII_Landsat2015 %>%
  mutate(bird_year = "2015")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2015_WII_Landsat2015<-WWabs2015_WII_Landsat2015 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2015_WII_Landsat2015<-WWabs2015_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2015_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2015_WII_Landsat2015.csv")

#WW absence data from 2016 at Wilderness II with 2015 Landsat
WWabs2016_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_abs_2016_WII, fun=mean, weights=TRUE))
WWabs2016_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_abs_2016_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2016_WII_Landsat2015list<- list(WWabs2016_WII_Landsat2015_blue, WWabs2016_WII_Landsat2015_green, WWabs2016_WII_Landsat2015_red, WWabs2016_WII_Landsat2015_nir, WWabs2016_WII_Landsat2015_swir1, WWabs2016_WII_Landsat2015_swir2, WWabs2016_WII_Landsat2015_NDVI, WWabs2016_WII_Landsat2015_NBR, WWabs2016_WII_Landsat2015_TCT_brightness, WWabs2016_WII_Landsat2015_TCT_greenness, WWabs2016_WII_Landsat2015_TCT_wetness)
WWabs2016_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2016_WII_Landsat2015list)
WWabs2016_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2016_WII_Landsat2015<-WWabs2016_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2016_WII_Landsat2015<-WWabs2016_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2016_WII_Landsat2015<-WWabs2016_WII_Landsat2015 %>%
  mutate(bird_year = "2016")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2016_WII_Landsat2015<-WWabs2016_WII_Landsat2015 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2016_WII_Landsat2015<-WWabs2016_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2016_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2016_WII_Landsat2015.csv")

#WW absence data from 2017 at Wilderness II with 2015 Landsat
WWabs2017_WII_Landsat2015_blue <- as.data.frame(extract(L8_2015_blue, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_green <- as.data.frame(extract(L8_2015_green, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_red <- as.data.frame(extract(L8_2015_red, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_nir <- as.data.frame(extract(L8_2015_nir, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_swir1 <- as.data.frame(extract(L8_2015_swir1, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_swir2 <- as.data.frame(extract(L8_2015_swir2, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_NDVI <- as.data.frame(extract(NDVI2015, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_NBR <- as.data.frame(extract(NBR2015, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_TCT_brightness <- as.data.frame(extract(TCT2015_brightness, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_TCT_greenness <- as.data.frame(extract(TCT2015_greenness, WW_abs_2017_WII, fun=mean, weights=TRUE))
WWabs2017_WII_Landsat2015_TCT_wetness <- as.data.frame(extract(TCT2015_wetness, WW_abs_2017_WII, fun=mean, weights=TRUE))

#combine all landsat metrics together
?merge
WWabs2017_WII_Landsat2015list<- list(WWabs2017_WII_Landsat2015_blue, WWabs2017_WII_Landsat2015_green, WWabs2017_WII_Landsat2015_red, WWabs2017_WII_Landsat2015_nir, WWabs2017_WII_Landsat2015_swir1, WWabs2017_WII_Landsat2015_swir2, WWabs2017_WII_Landsat2015_NDVI, WWabs2017_WII_Landsat2015_NBR, WWabs2017_WII_Landsat2015_TCT_brightness, WWabs2017_WII_Landsat2015_TCT_greenness, WWabs2017_WII_Landsat2015_TCT_wetness)
WWabs2017_WII_Landsat2015<-Reduce(function(x,y) merge(x,y, all=TRUE), WWabs2017_WII_Landsat2015list)
WWabs2017_WII_Landsat2015
#add four columns: site, Landsat year, bird survey year, bird species
WWabs2017_WII_Landsat2015<-WWabs2017_WII_Landsat2015 %>%
  mutate(site = "Wilderness II")%>% dplyr::select(site, everything())#add column for site
WWabs2017_WII_Landsat2015<-WWabs2017_WII_Landsat2015 %>%
  mutate(Landsat_year = "2015")%>% dplyr::select(Landsat_year, everything())#add column for Landsat year
WWabs2017_WII_Landsat2015<-WWabs2017_WII_Landsat2015 %>%
  mutate(bird_year = "2017")%>% dplyr::select(bird_year, everything())#add column for bird survey year
WWabs2017_WII_Landsat2015<-WWabs2017_WII_Landsat2015 %>%
  mutate(species = "WW_absence")%>% dplyr::select(species, everything())#add column for bird species
WWabs2017_WII_Landsat2015<-WWabs2017_WII_Landsat2015 %>% 
  mutate(ID = row_number()) %>% dplyr::select(ID, everything())#add plot number
#write it
write.csv(WWabs2017_WII_Landsat2015, file="D:/cambs/plotmetrics/Landsat_metrics/WWabs2017_WII_Landsat2015.csv")
