
#1 compute rate for table2 and table4a+table4b and perform operations:
#a extract number of TB cases per country per year
#b extract matching population per country per year
#c divide cases by population and multiply by 10,000
#d store back in appropriate place
library(dplyr)
library(tidyr)
table2 <- spread(table2,key=type,value=count) %>%
  mutate(rate=cases/population*10000)
table2
table4a <- table4a%>%gather(`1999`,`2000`,key="year",value="cases")
table4b <- table4b%>%gather(`1999`,`2000`,key="year2",value="population")
table4b$country <- NULL
table4b$year2 <- NULL
table4 <- cbind(table4a, table4b)
table4 <- table4%>%mutate(rate=cases/population*10000)%>%arrange(country)
table4

#2 why does this code fail?
table4a%>%gather(1999,2000,key="year",value="cases")
# There are no quotation marks ('  ') around the year values 1999 and 2000. Currently 1999
  # and 2000 are column headers and are therefore characters and not integers. This can be
  # demonstrated by performing the correct operation and evaluating the structure of the
  # column containing the year values:
str(((table4a%>%gather('1999','2000',key="year",value="cases"))$year))
# then we see that the year column is given as a character and not as an integer. In
  # retrospect we can see that the quotation marks are necessary for 1999 and 2000 in their
  # position as headers.

#3
library(nycflights13)
library(tidyverse)
library(lubridate)

nrow(filter(flights, is.na(dep_time), is.na(arr_time)))
# 8255 rows with NAs
# function to convert variables into date and time
dt <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_new <- flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>% # need to remove NAs
  mutate(
    dep_time = dt(year, month, day, dep_time),
    arr_time = dt(year, month, day, arr_time),
    sched_dep_time = dt(year, month, day, sched_dep_time),
    sched_arr_time = dt(year, month, day, sched_arr_time)
  ) %>%
  select(dep_delay, ends_with("time"))

#a How does distribution of flight times within a day change over
  # course of a year?
# new table by month and categorizing flights by AM, PM, evening
flights_a <- flights_new %>%
  mutate(month = month(sched_dep_time), time_day=ifelse(hour(sched_dep_time)<12, 'AM',
                                      ifelse(hour(sched_dep_time)>18, 'EVE', 'PM')))
# data frame of the number of flights with scheduled departure times 00:00-12:00 (AM),
# 12:00-18:00 (PM), and 18:00-24:00 (EVE) by month
summary <- as.data.frame(matrix(0, 12, 4))
colnames(summary) <- c("MONTH", "AM", "PM", "EVE")
summary[,1] <- c("JAN", "FEB", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUG",
                 "SEP", "OCT", "NOV", "DEC")
for (i in 1:12) {
  summary[i,2] <- nrow(filter(flights_a, month==i, time_day=='AM'))
  summary[i,3] <- nrow(filter(flights_a, month==i, time_day=='PM'))
  summary[i,4] <- nrow(filter(flights_a, month==i, time_day=='EVE'))}
summary
# Month to month there is not a large difference between flights before noon, between
  # noon and 6PM and after 6PM except for the month of February presumably because of
  # the fewer days in the month.
######OR
flights_dt %>%
  mutate(time = hour(dep_time) * 100 + minute(dep_time),
         mon = as.factor(month
                         (dep_time))) %>%
  ggplot(aes(x = time, group = mon, colour = mon)) +
  geom_freqpoly(binwidth = 100)
flights_dt %>%
  mutate(time = hour(dep_time) * 100 + minute(dep_time),
         mon = as.factor(month
                         (dep_time))) %>%
  ggplot(aes(x = time, y = ..density.., group = mon, colour = mon)) +
  geom_freqpoly(binwidth = 100)

#b compare dep_time, sched_dep_time, and dep_delay. Are they consistent.
  # explain findings
library(dplyr)
library(tidyr)
library(stringr)
flights_depdelay <- flights[,1:6]
flights_depdelay <- mutate(flights_depdelay, sched_hour=sched_dep_time%/%100,
                           sched_min=sched_dep_time%%100) %>%
  mutate(dep_hour=dep_time%/%100,dep_min=dep_time%%100) %>%
  mutate(delay_hour=dep_delay%/%60, delay_min=dep_delay%%60) %>%
  unite(new_sched_dep, sched_hour, sched_min, sep=":", remove=TRUE) %>%
  unite(new_dep, dep_hour, dep_min, sep=":", remove=TRUE) %>%
  unite(new_delay, delay_hour, delay_min, sep=":", remove=TRUE) %>%
  mutate(calc_dep_delay=hm(new_dep)-hm(new_sched_dep)) %>%
  mutate(dep_delay_match=hm(new_delay)==calc_dep_delay)
# created new column with the calculated departure delay based on the times
# and a second new logical column if the two departure delay columns match
nrow(flights_depdelay)
  # both=336776
table(flights_depdelay$dep_delay_match)["TRUE"]
  # first=327314; second=228744
table(flights_depdelay$dep_delay_match)["FALSE"]
  # first=1207; second=99777
sum(is.na(flights_depdelay$dep_delay_match))
  # both=8255
#######OR
# add dep_delay to sched_dep_time to get calc_dep_time
# need to multiply dep_delay by 60 b/c R thinks the number is seconds
flights_b <- mutate(flights_new, calc_dep_time = sched_dep_time + dep_delay*60) %>%
  mutate(dep_time_match = dep_time==calc_dep_time)
table(flights_b$dep_time_match)["TRUE"]
table(flights_b$dep_time_match)["FALSE"]
flights_b_false <- filter(flights_b, dep_time_match==FALSE)
# there are 1205 flights that do not match
# upon viewing the data in this table it appears
# like the majority of FALSE occurred when the sched_dep_time was just before midnight
  # and actual dep_time was just after midnight and the day did not update
  # the data makes it look like the dep_time was almost 24 hours prior to sched_dep_time

#c confirm hypothesis that early departures of flights in minutes 20-30 and
  # 50-60 are caused by scheduled flights that leave early
  # Hint: create binary variable that tells whether or not flight is delayed
flights_c <- mutate(flights_new, early = ifelse(dep_delay<0, 1, 0)) %>%
  # column for flights that leave early
  mutate(minute = minute(sched_dep_time) %/% 10) %>%
  filter(early==1)
  # making column of the 10s digit from the minutes to simplify filtering
nrow(flights_c) # 183444 early flights
flights_c_time <- filter(flights_c, minute==2 | minute==5)
nrow(flights_c_time) # 54026 early flights in minutes 20-30 and 50-60
#######OR
flights_dt %>%
  mutate(early = dep_delay < 0,
         minute = minute(sched_dep_time)) %>%
  group_by(minute) %>%
  summarise(early = mean(early)) %>%
  ggplot(aes(x = minute, y = early)) +
  geom_point()
flights_dt %>%
  mutate(early = dep_delay < 0,
         minute = minute(sched_dep_time) %% 10) %>%
  group_by(minute) %>%
  summarise(early = mean(early)) %>%
  ggplot(aes(x = minute, y = early)) +
  geom_point()

#4 scrape webpage to extract useful info: https://geiselmed.dartmouth.edu/qbs/
library(rvest)
# Read web page
webpage <- read_html("https://geiselmed.dartmouth.edu/qbs/")
h1_text <- webpage %>% html_nodes("h1") %>% html_text()
h2_text <- webpage %>% html_nodes("h2") %>% html_text()
h3_text <- webpage %>% html_nodes("h3") %>% html_text()
h4_text <- webpage %>% html_nodes("h4") %>% html_text()
ul_text <- webpage %>% html_nodes("ul") %>% html_text()
li_text <- webpage %>% html_nodes("li") %>% html_text()
p_text <- webpage %>% html_nodes("p") %>% html_text()
