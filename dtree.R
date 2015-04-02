setwd("E:/Analytics/kaggle/aza driver telematic analysis/Kaggle_DriverTelematics")

train <- read.csv("train2_with_thenumber.csv", header = TRUE)
str(train)
summary(train$Constantspeed)
train$driver <- as.factor(train$driver)


test <- read.csv('test2_with_thenumber.csv', header = TRUE)
str(test)
test$driver <- as.factor(test$driver)

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

#baseline tree
fit <- rpart(train$driver ~ mean_velocity + mean_acceleration + mean_distance + num_stop + high_speed + car_return, train, method="class")
fancyRpartPlot(fit)
summary(fit)
test$fit_predict <- predict(fit, newdata = test, type = "class")
table(test$driver, test$fit_predict)


fit_1 <- rpart(train$driver ~ mean_velocity + mean_acceleration + mean_distance + num_stop + high_speed + car_return, train, method="class", cp = 0.000001)
par(mfrow=c(1,2)) 
rsq.rpart(fit_1)
fit_1$cptable[which.min(fit_1$cptable[,"xerror"]),"CP"]

fit_2 <- rpart(train$driver ~ mean_velocity + mean_acceleration + mean_distance + num_stop + high_speed + car_return, train, method="class", cp = 0.007026419)
par(mfrow=c(1,1)) 
fancyRpartPlot(fit_2)
summary(fit_2)

test$fit_predict_2 <- predict(fit_2, newdata = test, type = "class")


########################## CV and ROC
library(caret)


# Tuning the data set - k fold cross validation
ctrl<-trainControl(method ="cv", number = 5)

## Model 2 - Decision Tress in K fold cross validation
fit_cv<- train(driver ~ mean_velocity + mean_acceleration + mean_distance + num_stop + high_speed + car_return, data = train, method = "rpart", trControl = ctrl)
fit_predict_cv <- predict.train(fit_cv, test, type = 'class')

table(test$driver, test$fit_predict_cv)


###########################################################################
#multi class roc calculation

aucs = c()
plot(x=NA, y=NA, xlim=c(0,1), ylim=c(0,1),
     xlab='True Positive Rate',
     ylab='False Positive Rate',
     bty='n')

for (type.id in 1:3) {
  type = as.factor(iris.train$Species == lvls[type.id])
  
  nbmodel = NaiveBayes(type ~ ., data=iris.train[, -5])
  nbprediction = predict(nbmodel, iris.test[,-5], type='raw')
  
  score = nbprediction$posterior[, 'TRUE']
  actual.class = iris.test$Species == lvls[type.id]
  
  pred = prediction(score, actual.class)
  nbperf = performance(pred, "tpr", "fpr")
  
  roc.x = unlist(nbperf@x.values)
  roc.y = unlist(nbperf@y.values)
  lines(roc.y ~ roc.x, col=type.id+1, lwd=2)
  
  nbauc = performance(pred, "auc")
  nbauc = unlist(slot(nbauc, "y.values"))
  aucs[type.id] = nbauc
}

lines(x=c(0,1), c(0,1))

mean(aucs)
