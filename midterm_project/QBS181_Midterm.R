
library(SASxport)
DIQ_I <- read.xport("DIQ_I.XPT")
write.csv(DIQ_I,"DIQ_I.csv")

DIQ_I <- read.csv("DIQ_I.csv")
View(DIQ_I)
DIQ_I$X <- NULL
names(DIQ_I) <- c("ID", "dr_DM", "DM_age", "PreDM", "DM_health_risk", "DM_risk",
                  "Risk_FH", "Risk_Weight", "Risk_Age", "Risk_Diet", "Risk_Race",
                  "Risk_Baby", "Risk_NoPhysAct", "Risk_BP", "Risk_HSugar", "Risk_Chol",
                  "Risk_LSugar", "Risk_Hunger", "Risk_Paresth", "Risk_Vision",
                  "Risk_Fatigue", "Risk_Anyone", "Risk_Warning", "Risk_Other", "Risk_GDM",
                  "Risk_PUria", "Risk_PDipsia", "Risk_Craving", "Risk_Med", "Risk_PCOS",
                  "FSG", "Insulin", "Ins_Duration", "Measure_ByIns", "DM_Pills", "DM_dr",
                  "One_DM_dr", "One_yr_Visits", "Sugar_Check", "Measure_ByCheck",
                  "A1C", "Last_A1C", "Goal_A1C", "SBP", "DBP", "Goal_SBP", "Goal_DBP",
                  "LDL", "Goal_LDL", "Foot_Check", "Self_Foot", "Measure_ByFoot",
                  "Pupils", "Retinopathy")
str(DIQ_I)
library(dplyr)
library(stringr)

DIQ_I$dr_DM <- gsub("1", "YES", DIQ_I$dr_DM, fixed=TRUE)
DIQ_I$dr_DM <- gsub("2", "NO", DIQ_I$dr_DM, fixed=TRUE)
DIQ_I$dr_DM <- gsub("3", "BORDERLINE", DIQ_I$dr_DM, fixed=TRUE)
DIQ_I$dr_DM <- gsub("7", "REFUSED", DIQ_I$dr_DM, fixed=TRUE)
DIQ_I$dr_DM <- gsub("9", "DONT KNOW", DIQ_I$dr_DM, fixed=TRUE)
length(which(DIQ_I$dr_DM=="YES"))
length(which(DIQ_I$dr_DM=="NO"))
length(which(DIQ_I$dr_DM=="BORDERLINE"))
length(which(DIQ_I$dr_DM=="REFUSED"))
length(which(DIQ_I$dr_DM=="DONT KNOW"))
sum(is.na(DIQ_I$dr_DM))

#DM_age: separate into two columns with age ranges and with true ages

DIQ_I$PreDM <- gsub("1", "YES", DIQ_I$PreDM, fixed=TRUE)
DIQ_I$PreDM <- gsub("2", "NO", DIQ_I$PreDM, fixed=TRUE)
DIQ_I$PreDM <- gsub("7", "REFUSED", DIQ_I$PreDM, fixed=TRUE)
DIQ_I$PreDM <- gsub("9", "DONT KNOW", DIQ_I$PreDM, fixed=TRUE)
length(which(DIQ_I$PreDM=="YES"))
length(which(DIQ_I$PreDM=="NO"))
length(which(DIQ_I$PreDM=="REFUSED"))
length(which(DIQ_I$PreDM=="DONT KNOW"))
sum(is.na(DIQ_I$PreDM))

DIQ_I$DM_health_risk <- gsub("1", "YES", DIQ_I$DM_health_risk, fixed=TRUE)
DIQ_I$DM_health_risk <- gsub("2", "NO", DIQ_I$DM_health_risk, fixed=TRUE)
DIQ_I$DM_health_risk <- gsub("7", "REFUSED", DIQ_I$DM_health_risk, fixed=TRUE)
DIQ_I$DM_health_risk <- gsub("9", "DONT KNOW", DIQ_I$DM_health_risk, fixed=TRUE)
length(which(DIQ_I$DM_health_risk=="YES"))
length(which(DIQ_I$DM_health_risk=="NO"))
length(which(DIQ_I$DM_health_risk=="REFUSED"))
length(which(DIQ_I$DM_health_risk=="DONT KNOW"))
sum(is.na(DIQ_I$DM_health_risk))

DIQ_I$DM_risk <- gsub("1", "YES", DIQ_I$DM_risk, fixed=TRUE)
DIQ_I$DM_risk <- gsub("2", "NO", DIQ_I$DM_risk, fixed=TRUE)
DIQ_I$DM_risk <- gsub("7", "REFUSED", DIQ_I$DM_risk, fixed=TRUE)
DIQ_I$DM_risk <- gsub("9", "DONT KNOW", DIQ_I$DM_risk, fixed=TRUE)
length(which(DIQ_I$DM_risk=="YES"))
length(which(DIQ_I$DM_risk=="NO"))
length(which(DIQ_I$DM_risk=="REFUSED"))
length(which(DIQ_I$DM_risk=="DONT KNOW"))
sum(is.na(DIQ_I$DM_risk))

DIQ_I$Risk_FH <- gsub("10", "YES", DIQ_I$Risk_FH, fixed=TRUE)
DIQ_I$Risk_FH <- gsub("77", "REFUSED", DIQ_I$Risk_FH, fixed=TRUE)
DIQ_I$Risk_FH <- gsub("99", "DONT KNOW", DIQ_I$Risk_FH, fixed=TRUE)
length(which(DIQ_I$Risk_FH=="YES"))
length(which(DIQ_I$Risk_FH=="REFUSED"))
length(which(DIQ_I$Risk_FH=="DONT KNOW"))
sum(is.na(DIQ_I$Risk_FH))

DIQ_I$Risk_Weight <- gsub("11", "YES", DIQ_I$Risk_Weight, fixed=TRUE)
length(which(DIQ_I$Risk_Weight=="YES"))
sum(is.na(DIQ_I$Risk_Weight))

DIQ_I$Risk_Age <- gsub("12", "YES", DIQ_I$Risk_Age, fixed=TRUE)
length(which(DIQ_I$Risk_Age=="YES"))
sum(is.na(DIQ_I$Risk_Age))

DIQ_I$Risk_Diet <- gsub("13", "YES", DIQ_I$Risk_Diet, fixed=TRUE)
length(which(DIQ_I$Risk_Diet=="YES"))
sum(is.na(DIQ_I$Risk_Diet))

DIQ_I$Risk_Race <- gsub("14", "YES", DIQ_I$Risk_Race, fixed=TRUE)
length(which(DIQ_I$Risk_Race=="YES"))
sum(is.na(DIQ_I$Risk_Race))

DIQ_I$Risk_Baby <- gsub("15", "YES", DIQ_I$Risk_Baby, fixed=TRUE)
length(which(DIQ_I$Risk_Baby=="YES"))
sum(is.na(DIQ_I$Risk_Baby))

DIQ_I$Risk_NoPhysAct <- gsub("16", "YES", DIQ_I$Risk_NoPhysAct, fixed=TRUE)
length(which(DIQ_I$Risk_NoPhysAct=="YES"))
sum(is.na(DIQ_I$Risk_NoPhysAct))

DIQ_I$Risk_BP <- gsub("17", "YES", DIQ_I$Risk_BP, fixed=TRUE)
length(which(DIQ_I$Risk_BP=="YES"))
sum(is.na(DIQ_I$Risk_BP))

DIQ_I$Risk_HSugar <- gsub("18", "YES", DIQ_I$Risk_HSugar, fixed=TRUE)
length(which(DIQ_I$Risk_HSugar=="YES"))
sum(is.na(DIQ_I$Risk_HSugar))

DIQ_I$Risk_Chol <- gsub("19", "YES", DIQ_I$Risk_Chol, fixed=TRUE)
length(which(DIQ_I$Risk_Chol=="YES"))
sum(is.na(DIQ_I$Risk_Chol))

DIQ_I$Risk_LSugar <- gsub("20", "YES", DIQ_I$Risk_LSugar, fixed=TRUE)
length(which(DIQ_I$Risk_LSugar=="YES"))
sum(is.na(DIQ_I$Risk_LSugar))

DIQ_I$Risk_Hunger <- gsub("21", "YES", DIQ_I$Risk_Hunger, fixed=TRUE)
length(which(DIQ_I$Risk_Hunger=="YES"))
sum(is.na(DIQ_I$Risk_Hunger))

DIQ_I$Risk_Paresth <- gsub("22", "YES", DIQ_I$Risk_Paresth, fixed=TRUE)
length(which(DIQ_I$Risk_Paresth=="YES"))
sum(is.na(DIQ_I$Risk_Paresth))

DIQ_I$Risk_Vision <- gsub("23", "YES", DIQ_I$Risk_Vision, fixed=TRUE)
length(which(DIQ_I$Risk_Vision=="YES"))
sum(is.na(DIQ_I$Risk_Vision))

DIQ_I$Risk_Fatigue <- gsub("24", "YES", DIQ_I$Risk_Fatigue, fixed=TRUE)
length(which(DIQ_I$Risk_Fatigue=="YES"))
sum(is.na(DIQ_I$Risk_Fatigue))

DIQ_I$Risk_Anyone <- gsub("25", "YES", DIQ_I$Risk_Anyone, fixed=TRUE)
length(which(DIQ_I$Risk_Anyone=="YES"))
sum(is.na(DIQ_I$Risk_Anyone))

DIQ_I$Risk_Warning <- gsub("26", "YES", DIQ_I$Risk_Warning, fixed=TRUE)
length(which(DIQ_I$Risk_Warning=="YES"))
sum(is.na(DIQ_I$Risk_Warning))

DIQ_I$Risk_Other <- gsub("27", "YES", DIQ_I$Risk_Other, fixed=TRUE)
length(which(DIQ_I$Risk_Other=="YES"))
sum(is.na(DIQ_I$Risk_Other))

DIQ_I$Risk_GDM <- gsub("28", "YES", DIQ_I$Risk_GDM, fixed=TRUE)
length(which(DIQ_I$Risk_GDM=="YES"))
sum(is.na(DIQ_I$Risk_GDM))

DIQ_I$Risk_PUria <- gsub("29", "YES", DIQ_I$Risk_PUria, fixed=TRUE)
length(which(DIQ_I$Risk_PUria=="YES"))
sum(is.na(DIQ_I$Risk_PUria))

DIQ_I$Risk_PDipsia <- gsub("30", "YES", DIQ_I$Risk_PDipsia, fixed=TRUE)
length(which(DIQ_I$Risk_PDipsia=="YES"))
sum(is.na(DIQ_I$Risk_PDipsia))

DIQ_I$Risk_Craving <- gsub("31", "YES", DIQ_I$Risk_Craving, fixed=TRUE)
length(which(DIQ_I$Risk_Craving=="YES"))
sum(is.na(DIQ_I$Risk_Craving))

DIQ_I$Risk_Med <- gsub("32", "YES", DIQ_I$Risk_Med, fixed=TRUE)
length(which(DIQ_I$Risk_PCOS=="YES"))
sum(is.na(DIQ_I$Risk_PCOS))

DIQ_I$Risk_PCOS <- gsub("33", "YES", DIQ_I$Risk_PCOS, fixed=TRUE)
length(which(DIQ_I$Risk_PCOS=="YES"))
sum(is.na(DIQ_I$Risk_PCOS))

DIQ_I$FSG <- gsub("1", "YES", DIQ_I$FSG, fixed=TRUE)
DIQ_I$FSG <- gsub("2", "NO", DIQ_I$FSG, fixed=TRUE)
DIQ_I$FSG <- gsub("7", "REFUSED", DIQ_I$FSG, fixed=TRUE)
DIQ_I$FSG <- gsub("9", "DONT KNOW", DIQ_I$FSG, fixed=TRUE)
length(which(DIQ_I$FSG=="YES"))
length(which(DIQ_I$FSG=="NO"))
length(which(DIQ_I$FSG=="REFUSED"))
length(which(DIQ_I$FSG=="DONT KNOW"))
sum(is.na(DIQ_I$FSG))

DIQ_I$Insulin <- gsub("1", "YES", DIQ_I$Insulin, fixed=TRUE)
DIQ_I$Insulin <- gsub("2", "NO", DIQ_I$Insulin, fixed=TRUE)
DIQ_I$Insulin <- gsub("7", "REFUSED", DIQ_I$Insulin, fixed=TRUE)
DIQ_I$Insulin <- gsub("9", "DONT KNOW", DIQ_I$Insulin, fixed=TRUE)
length(which(DIQ_I$Insulin=="YES"))
length(which(DIQ_I$Insulin=="NO"))
length(which(DIQ_I$Insulin=="REFUSED"))
length(which(DIQ_I$Insulin=="DONT KNOW"))
sum(is.na(DIQ_I$Insulin))

#Ins_Duration: separate into three columns: mos, yrs, other
#Measure_ByIns

DIQ_I$DM_Pills <- gsub("1", "YES", DIQ_I$DM_Pills, fixed=TRUE)
DIQ_I$DM_Pills <- gsub("2", "NO", DIQ_I$DM_Pills, fixed=TRUE)
DIQ_I$DM_Pills <- gsub("7", "REFUSED", DIQ_I$DM_Pills, fixed=TRUE)
DIQ_I$DM_Pills <- gsub("9", "DONT KNOW", DIQ_I$DM_Pills, fixed=TRUE)
length(which(DIQ_I$DM_Pills=="YES"))
length(which(DIQ_I$DM_Pills=="NO"))
length(which(DIQ_I$DM_Pills=="REFUSED"))
length(which(DIQ_I$DM_Pills=="DONT KNOW"))
sum(is.na(DIQ_I$DM_Pills))

DIQ_I$DM_dr <- gsub("1", "<1 yr", DIQ_I$DM_dr, fixed=TRUE)
DIQ_I$DM_dr <- gsub("2", "1-2 yrs", DIQ_I$DM_dr, fixed=TRUE)
DIQ_I$DM_dr <- gsub("3", "2-5 yrs", DIQ_I$DM_dr, fixed=TRUE)
DIQ_I$DM_dr <- gsub("4", ">5 yrs", DIQ_I$DM_dr, fixed=TRUE)
DIQ_I$DM_dr <- gsub("5", "NEVER", DIQ_I$DM_dr, fixed=TRUE)
DIQ_I$DM_dr <- gsub("7", "REFUSED", DIQ_I$DM_dr, fixed=TRUE)
DIQ_I$DM_dr <- gsub("9", "DONT KNOW", DIQ_I$DM_dr, fixed=TRUE)
length(which(DIQ_I$DM_dr=="YES"))
length(which(DIQ_I$DM_dr=="NO"))
length(which(DIQ_I$DM_dr=="REFUSED"))
length(which(DIQ_I$DM_dr=="DONT KNOW"))
sum(is.na(DIQ_I$DM_dr))

DIQ_I$One_DM_dr <- gsub("1", "YES", DIQ_I$One_DM_dr, fixed=TRUE)
DIQ_I$One_DM_dr <- gsub("2", "NO", DIQ_I$One_DM_dr, fixed=TRUE)
DIQ_I$One_DM_dr <- gsub("7", "REFUSED", DIQ_I$One_DM_dr, fixed=TRUE)
DIQ_I$One_DM_dr <- gsub("9", "DONT KNOW", DIQ_I$One_DM_dr, fixed=TRUE)
length(which(DIQ_I$One_DM_dr=="YES"))
length(which(DIQ_I$One_DM_dr=="NO"))
length(which(DIQ_I$One_DM_dr=="REFUSED"))
length(which(DIQ_I$One_DM_dr=="DONT KNOW"))
sum(is.na(DIQ_I$One_DM_dr))

#One_yr_Visits: separate into two columns: numbers and other

#Sugar_Check: separate into five columns: day, week, month, year, other
#Measure_ByCheck

DIQ_I$A1C <- gsub("1", "YES", DIQ_I$A1C, fixed=TRUE)
DIQ_I$A1C <- gsub("2", "NO", DIQ_I$A1C, fixed=TRUE)
DIQ_I$A1C <- gsub("7", "REFUSED", DIQ_I$A1C, fixed=TRUE)
DIQ_I$A1C <- gsub("9", "DONT KNOW", DIQ_I$A1C, fixed=TRUE)
length(which(DIQ_I$A1C=="YES"))
length(which(DIQ_I$A1C=="NO"))
length(which(DIQ_I$A1C=="REFUSED"))
length(which(DIQ_I$A1C=="DONT KNOW"))
sum(is.na(DIQ_I$A1C))

#Last_A1C: separate into two columns: numbers and other
#Goal_A1C: separate into two columns: numbers and other
#SBP: separate into two columns: numbers and other
#DBP: separate into two columns: numbers and other
#Goal_SBP: separate into two columns: numbers and other
#Goal_DBP: separate into two columns: numbers and other
#LDL: separate into two columns: numbers and other
#Goal_LDL: separate into two columns: numbers and other
#Foot_Check: separate into two columns: numbers and other
#Self_Foot: separate into two columns: numbers and other
#Measure_ByFoot: separate into two columns: numbers and other

DIQ_I$Pupils <- gsub("1", "<1 mo", DIQ_I$Pupils, fixed=TRUE)
DIQ_I$Pupils <- gsub("2", "1-12 mos", DIQ_I$Pupils, fixed=TRUE)
DIQ_I$Pupils <- gsub("3", "13-24 mos", DIQ_I$Pupils, fixed=TRUE)
DIQ_I$Pupils <- gsub("4", ">2 yrs", DIQ_I$Pupils, fixed=TRUE)
DIQ_I$Pupils <- gsub("5", "NEVER", DIQ_I$Pupils, fixed=TRUE)
DIQ_I$Pupils <- gsub("7", "REFUSED", DIQ_I$Pupils, fixed=TRUE)
DIQ_I$Pupils <- gsub("9", "DONT KNOW", DIQ_I$Pupils, fixed=TRUE)
length(which(DIQ_I$Pupils=="<1 mo"))
length(which(DIQ_I$Pupils=="1-12 mos"))
length(which(DIQ_I$Pupils=="13-24 mos"))
length(which(DIQ_I$Pupils==">2 yrs"))
length(which(DIQ_I$Pupils=="NEVER"))
length(which(DIQ_I$Pupils=="REFUSED"))
length(which(DIQ_I$Pupils=="DONT KNOW"))
sum(is.na(DIQ_I$Pupils))

DIQ_I$Retinopathy <- gsub("1", "YES", DIQ_I$Retinopathy, fixed=TRUE)
DIQ_I$Retinopathy <- gsub("2", "NO", DIQ_I$Retinopathy, fixed=TRUE)
DIQ_I$Retinopathy <- gsub("7", "REFUSED", DIQ_I$Retinopathy, fixed=TRUE)
DIQ_I$Retinopathy <- gsub("9", "DONT KNOW", DIQ_I$Retinopathy, fixed=TRUE)
length(which(DIQ_I$Retinopathy=="YES"))
length(which(DIQ_I$Retinopathy=="NO"))
length(which(DIQ_I$Retinopathy=="REFUSED"))
length(which(DIQ_I$Retinopathy=="DONT KNOW"))
sum(is.na(DIQ_I$Retinopathy))


write.csv(DIQ_I,"DIQ_I_updated.csv")










REFUSED <- c("7", "77", "777", "7777")
DONT_KNOW <- c("9", "99", "999", "9999")
str_replace(DIQ_I$Risk_FH, REFUSED, "REFUSED")
str_replace(DIQ_I, DONT_KNOW, "DONT KNOW")

count(DIQ_I$DM_risk)

DIQ_I$Insulin <- select(DIQ_I$Insulin)
mutate()

library(sqldf)
sqldf(update DIQ_I set Risk_age = 'YES' WHERE Risk_Age = '12')

install.packages("mice")
library(mice)

#####
#DM_age
xage <- c("80", "666", "777", "999")
DIQ_I$DM_age_other <- str_extract_all(DIQ_I$DM_age)
str_match_all(DIQ_I$DM_age, xage)
DIQ_I$DM_age_other <- mutate(DIQ_I$DM_age, xage)
DIQ_I$DM_age_other <- gsub("666", "1", DIQ_I$DM_age_other, fixed=TRUE)
DIQ_I$DM_age <- gsub(xage, NULL, DIQ_I$DM_age, fixed=TRUE)
DIQ_I$DM_age <- as.integer(DIQ_I$DM_age)
######
