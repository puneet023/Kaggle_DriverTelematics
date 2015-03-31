getwd()
setwd('E:/Analytics/kaggle/aza driver telematic analysis')

data <- read.csv('data_final.csv', header = TRUE)
str(data)

data <- data[, -1]


#displacement x vector

data['DisplacementX'] <- NULL

for (i in 1:length(data$x_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$DisplacementX[i] = 0
  } else {
    data$DisplacementX[i] = data$x_cord[i] - data$x_cord[i-1]
  }
}

#displacement y vector

data['DisplacementY'] <- NULL

for (i in 1:length(data$y_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$DisplacementY[i] = 0
  } else {
    data$DisplacementY[i] = data$y_cord[i] - data$y_cord[i-1]
  }
}


#absolute displacement

data['distance_traveled'] <- NULL

for (i in 1:length(data$x_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$distance_traveled[i] = 0
  } else {
    data$distance_traveled[i] = sqrt((data$x_cord[i] - data$x_cord[i-1])^2 + (data$y_cord[i] - data$y_cord[i-1])^2)
  }
}

summary(data$distance_traveled)

data$movement_car <- NULL
data$movement_car[data$distance_traveled > 2] <- 'Moving'
data$movement_car[data$distance_traveled <= 2] <- 'Stop'

#velocity X component

data['VelocityX'] <- NULL

for (i in 1:length(data$x_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$VelocityX[i] = 0
  } else {
    data$VelocityX[i] = data$DisplacementX[i] - data$DisplacementX[i-1]
  }
}

#velocity Y component

data['VelocityY'] <- NULL

for (i in 1:length(data$y_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$VelocityY[i] = 0
  } else {
    data$VelocityY[i] = data$DisplacementY[i] - data$DisplacementY[i-1]
  }
}


#acceleration X component

data['AccelerationX'] <- NULL

for (i in 1:length(data$x_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$AccelerationX[i] = 0
  } else {
    data$AccelerationX[i] = data$VelocityX[i] - data$VelocityX[i-1]
  }
}

#acceleration Y component

data['AccelerationY'] <- NULL

for (i in 1:length(data$y_cord)){
  if (data$x_cord[i] == 0 & data$y_cord[i] == 0){
    data$AccelerationY[i] = 0
  } else {
    data$AccelerationY[i] = data$VelocityY[i] - data$VelocityY[i-1]
  }
}

write.csv(data, 'E:/Analytics/kaggle/aza driver telematic analysis/data_metrics.csv')

str(data)

