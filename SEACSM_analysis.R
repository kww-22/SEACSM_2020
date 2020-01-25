# ---
# Title: Humeral Segment Energy and it Relationship to Clincal Glenohumeral Measures in Youth Baseball Pitchers
# Authors: Kyle Wasserberger, Jessica Downs, Gretchen Oliver
# 
# Sports Medicine & Movement Lab
# School of Kinesiology
# Auburn University
#
# Analysis code for abstract to be presented at 2020 Annual Meeting of the southeast chapter of American College of Sports Medicine
# Last updated 10 December, 2019.
# ---

# source('packages.R')

#Prompts user to select filepath 
# dataPath <- file.choose(new = FALSE)

# read in file and name it data_master (supports sav, excel, and csv)
# if (str_detect(dataPath,"xls")) {
#   data_master <- read_excel(dataPath)
# } else if (str_detect(dataPath,"sav")) {
#   data_master <- read_sav(dataPath)
# } else {
#   data_master <- read.csv(dataPath, 
#                                na.strings = "NA", 
#                                stringsAsFactors = FALSE)
# }

data_master <- read.csv('data_SEACSM_2020_noID.csv',
                        na.strings = "NA",
                        stringsAsFactors = FALSE)


# isolate dependent variables
HumWork.in.norm <- data_master$nHumWorkInflow
HumWork.out.norm <- data_master$nHumWorkOutflow

# isolate predictors
predictors <- data.frame(velo <- data_master$Velo,
                         IR.norm <- data_master$ISO_IR_d/(data_master$Weight*9.81), 
                         ER.norm <- data_master$ISO_ER_d/(data_master$Weight*9.81),
                         IR.rom <- data_master$ROM_IR_d,
                         ER.rom <- data_master$ROM_ER_d)

colnames(predictors) <- c('velo','IR.norm','ER.norm','IR.rom','ER.rom')


### humeral energy inflow forward regression

# create 'null' model (velo onlly)
if.mod.null <- lm(HumWork.in.norm ~ velo, data = predictors)

# set 'full' model (velo + all predictors)
if.mod.full <- lm(HumWork.in.norm ~ velo + ., data = predictors)

# forward stepwise model
if.mod.step <- step(if.mod.null, direction = 'forward', scope = formula(if.mod.full), trace = FALSE)

# model comparison of null and final stepwise model
modelCompare(if.mod.null, if.mod.step)

# get coefficiencts and confidence intervals for final stepwise model
parameters(if.mod.step, standardize = 'smart')


### humeral energy outflow forward regression

# create 'null' model (velo onlly)
of.mod.null <- lm(HumWork.out.norm ~ velo, data = predictors)

# set 'full' model (velo + all predictors)
of.mod.full <- lm(HumWork.out.norm ~ velo + ., data = predictors)

# forward stepwise model
of.mod.step <- step(of.mod.null, direction = 'forward', scope = formula(of.mod.full), trace = FALSE)

# model comparison of null and final stepwise model
modelCompare(of.mod.null, of.mod.step)

# get coefficiencts and confidence intervals for final stepwise model
parameters(of.mod.step, standardize = 'smart')
