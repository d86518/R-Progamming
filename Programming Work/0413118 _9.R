install.packages("jsonlite")
library(jsonlite)
install.packages("ggplot2")
library(ggplot2)

data.url <- "https://www.readr.tw/project-api/election-board/candidates_terms?election_year=2018&page=1&type=mayors&max_results=100"
data.file <- "mayors_page1.json"
download.file(url = data.url, destfile = data.file)

data <- fromJSON(data.file)
mayor_party<-c(data$results$party[58],data$results$party[59],data$results$party[60],data$results$party[64])
verified_amount<-c(data$results$verified_board_amount[58],data$results$verified_board_amount[59],data$results$verified_board_amount[60]+data$results$verified_board_amount[63],data$results$verified_board_amount[64])
mayor <- data.frame(
  mayor_party,verified_amount
)
c1<-0
c2<-0
c3<-0
c4<-0

for (i in c(1:19)){
  data2.url <- paste0("https://www.readr.tw/project-api/election-board/candidates_terms?election_year=2018&page=",i,"&type=councilors&max_results=100")
  data2.file <- "mayors_page1.json"
  download.file(url = data2.url, destfile = data2.file)
  data2 <- fromJSON(data2.file)
  for (j in c(1:length(data2$results$district))){
   if(!is.na(data2$results$district[j])){
     if (data2$results$district[j]=="內湖、南港"){
       if(data2$results$party[j]=="民主進步黨"){
          c1<-c1+data2$results$verified_board_amount[j]
        }
       else if(data2$results$party[j]=="中國國民黨"){
         c2<-c2+data2$results$verified_board_amount[j]
         }
       else if(data2$results$party[j]=="時代力量"){
         c3<-c3+data2$results$verified_board_amount[j]
         }
       else if(data2$results$party[j]=="親民黨"){
         c4<-c4+data2$results$verified_board_amount[j]
         }
      } 
    }
  }
}

councilors_party<-c("民主進步黨","中國國民黨","時代力量","親民黨")
verified_amount2<-c(c1,c2,c3,c4)
councilors <- data.frame(
  councilors_party,verified_amount2
)

#Execute independently
##plot of mayor
ggplot(mayor, aes(x=mayor_party, y=verified_amount, color=mayor_party)) +
  geom_bar(stat="identity", fill="white")

##plot of councilors
ggplot(councilors, aes(x=councilors_party, y=verified_amount2, color=councilors_party)) +
  geom_bar(stat="identity", fill="white")
