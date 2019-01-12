packageNames <- c("ggplot2")
install.packages(packageNames)
library(ggplot2)
data.url <- "https://quality.data.gov.tw/dq_download_csv.php?nid=91734&md5_url=ef2c4d2409b03c7a6a1ca4452bb96832"
data.file <- "dataset.csv"
download.file(url = data.url, destfile = data.file,)
data <- read.csv(data.file, header=TRUE, sep=",")
data$MergeName <- paste(data$County, data$SiteName)
data.selected  <- data[data$MonitorDate=="2018/9/27 ¤U¤È 04:00:00"&data$ItemEngName=="NO2",]
ggplot(data=data.selected, aes(x=MergeName, y=Concentration)) + geom_bar(stat="identity")
