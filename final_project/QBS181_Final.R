library(tidyverse)
library(lubridate)
library(dplyr)
library(tidyr)
library(knitr)
library(kableExtra)
library(RODBC)

#1
#a
# import new data file
IC_BP <- read.csv("IC_BP.csv")
# convert BPAlerts to BPStatus
IC_BP$BPStatus <- IC_BP$BPAlerts
IC_BP$BPAlerts <- NULL
# view random 10 rows
kable(IC_BP[sample(nrow(IC_BP), 10),])
# scaled table
kable(IC_BP[sample(nrow(IC_BP), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

#b
# making dichotomous variable
IC_BP <- mutate(IC_BP, BPStatus = ifelse(BPStatus=='Hypo1'|BPStatus=='Normal', 1, 0))
# view random 10 rows
kable(IC_BP[sample(nrow(IC_BP), 10),])
# scaled table
kable(IC_BP[sample(nrow(IC_BP), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

#c
# importing Demographics table from SQL
myconn <- odbcConnect("dartmouth1", "tschwedhelm", "tschwedhelm@qbs181")
demo <- sqlQuery(myconn, "select * from Demographics")
# convert key columns to same heading to facilitate merge
demo$ID <- demo$contactid
# merge tables
IC_BP <- IC_BP %>% inner_join(demo, by="ID")
# delete unnecessary columns
IC_BP$contactid <- NULL
IC_BP$gh1 <- NULL
IC_BP$gh2 <- NULL
IC_BP$gh3 <- NULL
IC_BP$gh4 <- NULL
IC_BP$gh5 <- NULL
IC_BP$pf02 <- NULL
IC_BP$test <- NULL
# view random 10 rows
kable(IC_BP[sample(nrow(IC_BP), 10),])
# scaled table
kable(IC_BP[sample(nrow(IC_BP), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

#d
# str(IC_BP) shows that variable ObservedTime is a factor - will need to convert to date/time
IC_BP$ObservedTime <- as.Date(IC_BP$ObservedTime, format="%m/%d/%y")
# column of first BP measurement per patient ID
IC_BPd <- IC_BP %>% group_by(ID) %>% mutate(mindate = min(ObservedTime))
# create 12 week intervals
IC_BPd <- IC_BPd %>% mutate(interval = ifelse(mindate==ObservedTime, 0,
                            ifelse(ObservedTime-mindate>0&ObservedTime-mindate<=12, 1,
                            ifelse(ObservedTime-mindate>12&ObservedTime-mindate<=24, 2,
                            ifelse(ObservedTime-mindate>24&ObservedTime-mindate<=36, 3,
                            ifelse(ObservedTime-mindate>36&ObservedTime-mindate<=48, 4, 5))))))
IC_BPd <- IC_BPd %>% group_by(ID) %>% group_by(interval) %>% mutate(avgSBP = mean(SystolicValue))
IC_BPd <- IC_BPd %>% group_by(ID) %>% group_by(interval) %>% mutate(avgDBP = mean(Diastolicvalue))
# view random 10 rows
kable(IC_BPd[sample(nrow(IC_BPd), 10),])
# scaled table
kable(IC_BPd[sample(nrow(IC_BPd), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

# delete duplicated rows based on ID and interval
IC_BPd <- IC_BPd[!duplicated(IC_BPd[,c('ID','interval')]),]
IC_BPd$SystolicValue <- NULL
IC_BPd$Diastolicvalue <- NULL
IC_BPd$ObservedTime <- NULL
# view random 10 rows
kable(IC_BPd[sample(nrow(IC_BPd), 10),])
# scaled table
kable(IC_BPd[sample(nrow(IC_BPd), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

# e and f
# filter for IDs uncontrolled at start or controlled at the end then find the duplicates
IC_BPef <- IC_BPd %>% filter((BPStatus==0 & interval==0)|(BPStatus==1 & interval==1))
IC_BPef <- IC_BPef[duplicated(IC_BPef$ID),]
kable(IC_BPef[sample(nrow(IC_BPef), 10),])
# scaled table
kable(IC_BPef[sample(nrow(IC_BPef), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

#3
# import Demographics, ChronicConditiosn, and Text tables from SQL
myconn <- odbcConnect("dartmouth1", "tschwedhelm", "tschwedhelm@qbs181")
demo <- sqlQuery(myconn, "select * from Demographics")
conditions <- sqlQuery(myconn, "select * from ChronicConditions")
text <- sqlQuery(myconn, "select * from Text")
# convert key columns to same heading to facilitate merge
demo$ID <- demo$contactid
conditions$ID <- conditions$tri_patientid
text$ID <- text$tri_contactId
# merge tables
newdemo <- demo %>% inner_join(conditions, by="ID") %>% inner_join(text, by="ID")
# delete unnecessary columns
newdemo$contactid <- NULL
newdemo$tri_patientid <- NULL
newdemo$tri_contactId <- NULL
newdemo$gh1 <- NULL
newdemo$gh2 <- NULL
newdemo$gh3 <- NULL
newdemo$gh4 <- NULL
newdemo$gh5 <- NULL
newdemo$pf02 <- NULL
newdemo$test <- NULL
# select latest sent date per ID - TextSentDate was imported as POXIXct
newdemo2 <- newdemo %>% group_by(ID) %>% summarize(TextSentDate=max(TextSentDate)) %>%
  inner_join(newdemo, by=c("ID"="ID", "TextSentDate"="TextSentDate"))
# remove duplicate calls on same last day by patient
newdemo2 <- newdemo2[!duplicated(newdemo2$ID),]
# view random 10 rows
kable(newdemo2[sample(nrow(newdemo2), 10),])
# scaled table
kable(newdemo2[sample(nrow(newdemo2), 10),], format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down")

