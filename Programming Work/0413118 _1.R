packageNames <- c("titanic", "dplyr", "ggplot2")
install.packages(packageNames)
library(titanic)
library(dplyr)
library(ggplot2)

ggplot(data=titanic_train,aes(x=SibSp))+geom_density()
