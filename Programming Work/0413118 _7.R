training<-rbind(iris[1:40,],iris[51:90,],iris[101:140,])
testing<-rbind(iris[41:50,],iris[91:100,],iris[141:150,])
model <- lm(formula = Sepal.Length ~Sepal.Width+Petal.Length+Petal.Width, data = training)
prediction <- predict(model, testing)
rms <- prediction - testing[,1]    
rms <- sqrt(sum(rms*rms)/30)
print(rms)
