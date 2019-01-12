#data's url
data.url <- "https://opendata.epa.gov.tw/ws/Data/UV/?$format=json"

#Save place
data.file <-  paste0("C://Users/user/Desktop/107/R/HW3/",Sys.Date(),"_",format(Sys.time(),"%H"),"hr.json")

#download it
download.file(url = data.url, destfile = data.file)

#install.packages("jsonlite") #install一次就好但每次都要引入lib

#import json library
library(jsonlite)

#抓每筆資料
day1.file <- fromJSON("2018-10-06_14hr.json")
day2.file <- fromJSON("2018-10-07_15hr.json")
day3.file <- fromJSON("2018-10-08_14hr.json")
day4.file <- fromJSON("2018-10-09_14hr.json")
day5.file <- fromJSON("2018-10-10_14hr.json")
day6.file <- fromJSON("2018-10-11_14hr.json")

#轉成dataframe
day1 <- as.data.frame(day1.file) 
day2 <- as.data.frame(day2.file)
day3 <- as.data.frame(day3.file)
day4 <- as.data.frame(day4.file)
day5 <- as.data.frame(day5.file)
day6 <- as.data.frame(day6.file)

#準備time label
time <-c("2018-10-06_14hr.json","2018-10-07_15hr.json","2018-10-08_14hr.json","2018-10-09_14hr.json","2018-10-10_14hr.json","2018-10-11_14hr.json")

#抓新竹的uvi
uvi <- c(day1[6,'UVI'],day2[6,'UVI'],day3[6,'UVI'],day4[6,'UVI'],day5[6,'UVI'],day6[6,'UVI'])

#寫成dataframe
data <- data.frame(time, uvi)
                   
library(ggplot2)
#make plot
ggplot(data=data,aes(x=time, y=uvi,group = 1 )) + geom_line()

