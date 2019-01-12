install.packages("httr")
install.packages("XML")
library(httr)
library(XML)
html <- htmlParse(GET("https://disp.cc/m/"))


ht_title <- xpathSApply(html, "//div[@class='ht_title']", xmlValue)
ht_desc <- xpathSApply(html, "//div[@class='ht_desc']", xmlValue)
htall<-ht_title
hrefs <- xpathSApply(html, "//div/a", xmlGetAttr, 'href')
for(i in c(1:length(ht_title))){
  htall[i]<-paste(ht_title[i],"\n",ht_desc[i],"\n",paste0("disp.cc/m/",hrefs[i]),"\n","-----")
} 

file.path <- "post_10XX.txt"
write.table(htall, file=file.path, sep="\n",row.names = F, col.names = T)
