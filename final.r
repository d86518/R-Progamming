#Final project - 預測交大明年男女比

#交大學士班入學男女比
NCTU<-matrix(c(1:10), nrow = 10, ncol = 1)
#[,1]<-男 前五train 後五test
NCTU[,1]<-c(2.512
            ,2.611
            ,2.346
            ,2.305 
            ,2.185
            ,2.316
            ,2.227 
            ,2.458 
            ,2.254 
            ,2.195)

#全國大專校院學士班入學男女比
ALL<-matrix(c(1:20), nrow = 10, ncol = 1)
ALL[,1]<-c(1.04415372
           ,1.035662886
           ,1.02793001
           ,1.021907623
           ,1.01726889
           ,1.002646939
           ,0.988729756
           ,0.983779237
           ,0.976290986
           ,0.97547662)

#當年出生男女比(Ex:104學年入學，86年出生)
BORN<-matrix(c(1:20), nrow = 10, ncol = 1)
BORN[,1]<-c(1.103,1.104,1.099,1.081,1.089,1.079,1.088,1.089,1.087,1.095)


#TOTAL =  總DATA
train<-matrix(c(1:15), nrow = 5, ncol = 3)
test<-matrix(c(1:10), nrow = 5, ncol = 2)
#train:test = 5:5
train[,1]<-NCTU[1:5,1] #tr
train[,2]<-ALL[1:5,1] #tr
train[,3]<-BORN[1:5,1] #tr
#test[,1]<-NCTU[6:10,1] #t
test[,1]<-ALL[6:10,1] #t
test[,2]<-BORN[6:10,1]  #t
train <- data.frame(train)
test <- data.frame(test)
#weight<- data.frame(weight)

#linear regression NCTU = ALL + BORN
BG_per <- lm(X1 ~ X2 + X3 , data = train ) 
summary(BG_per)
prediction <- predict(BG_per, data = test )
print(sum(abs(prediction-NCTU[6:10,1])))


#train:test = 6:4
train2<-matrix(c(1:18), nrow = 6, ncol = 3)
test2<-matrix(c(1:8), nrow = 4, ncol = 2)
train2[,1]<-NCTU[1:6,1] #tr
train2[,2]<-ALL[1:6,1] #tr
train2[,3]<-BORN[1:6,1] #tr
test2[,1]<-ALL[7:10,1] #t
test2[,2]<-BORN[7:10,1]  #t
train2 <- data.frame(train2)
test2 <- data.frame(test2)

#linear regression NCTU = ALL + BORN
BG_per <- lm(X1 ~ X2 +X3,data = train2 ) 
summary(BG_per)
#y = 3.563*X2 + 6.068*X3 -7.902
prediction <- 3.563*ALL[7:10,1] + 6.068*BORN[7:10,1]-7.902
print(sum(abs(prediction-NCTU[7:10,1])))


#train:test = 8:2
train1<-matrix(c(1:8), nrow = 8, ncol = 3)
test1<-matrix(c(1:4), nrow = 2, ncol = 2)
train1[,1]<-NCTU[1:8,1] #tr
train1[,2]<-ALL[1:8,1] #tr
train1[,3]<-BORN[1:8,1] #tr
test1[,1]<-ALL[9:10,1] #t
test1[,2]<-BORN[9:10,1]  #t
train1 <- data.frame(train1)
test1 <- data.frame(test1)

#linear regression NCTU = ALL + BORN
BG_per <- lm(X1 ~ X2 +X3,data = train1 ) 
summary(BG_per)

prediction <- -0.02791*ALL[9:10,1] + 10.36500*BORN[9:10,1]-8.91507
print(sum(abs(prediction-NCTU[9:10,1])))


#linear regression NCTU = 1.2*ALL + BORN
#train[,1]<-NCTU[1:5,1] #tr
#train[,2]<-1.5*ALL[1:5,1] #tr
#train[,3]<-BORN[1:5,1] #tr
#test[,1]<-NCTU[6:10,1] #t
#test[,1]<-ALL[6:10,1] #t
#test[,2]<-BORN[6:10,1]  #t
#train <- data.frame(train)
#test <- data.frame(test)
#weight<- data.frame(weight)

#BG_per <- lm(X1 ~ X2 + X3 , data = train ) 
#summary(BG_per)
#prediction <- predict(BG_per, data = test )
#print(sum(abs(prediction-NCTU[6:10,1])))