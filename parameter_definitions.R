setwd("~/Cours/MSBA/Decision Making Technology/project")
metric<-read.csv("data_metrics.csv")

metric$velocity<-sqrt(metric$VelocityX^2+metric$VelocityY^2)
metric$Acceleration<-sqrt(metric$AccelerationX^2+metric$AccelerationY^2)

i1=(metric$driver_no==1)
metric_driver1<-metric[i1,]

i2=(metric$driver_no==2)
metric_driver2<-metric[i2,]

i3=(metric$driver_no==3)
metric_driver3<-metric[i3,]

i4=(metric$driver_no==10)
metric_driver4<-metric[i4,]

i5=(metric$driver_no==11)
metric_driver5<-metric[i5,]

##########
# Creation of the dataframe by driver

# definition of the variable
driver_no<-c(1,2,3,10,11)
mean_distance<-c(mean(metric_driver1$distance_traveled),mean(metric_driver2$distance_traveled),mean(metric_driver3$distance_traveled),mean(metric_driver4$distance_traveled),mean(metric_driver5$distance_traveled))
max_distance_traveled<-c(max(metric_driver1$distance_traveled),max(metric_driver2$distance_traveled),max(metric_driver3$distance_traveled),max(metric_driver4$distance_traveled),max(metric_driver5$distance_traveled))
min_distance_traveled<-c(min(metric_driver1$distance_traveled),min(metric_driver2$distance_traveled),min(metric_driver3$distance_traveled),min(metric_driver4$distance_traveled),min(metric_driver5$distance_traveled))
mean_velocity<-c(mean(metric_driver1$velocity),mean(metric_driver2$velocity),mean(metric_driver3$velocity),mean(metric_driver4$velocity),mean(metric_driver5$velocity))
max_velocity<-c(max(metric_driver1$velocity),max(metric_driver2$velocity),max(metric_driver3$velocity),max(metric_driver4$velocity),max(metric_driver5$velocity))
min_velocity<-c(min(metric_driver1$velocity),min(metric_driver2$velocity),min(metric_driver3$velocity),min(metric_driver4$velocity),min(metric_driver5$velocity))
mean_acceleration<-c(mean(metric_driver1$Acceleration),mean(metric_driver2$Acceleration),mean(metric_driver3$Acceleration),mean(metric_driver4$Acceleration),mean(metric_driver5$Acceleration))
max_acceleration<-c(max(metric_driver1$Acceleration),max(metric_driver2$Acceleration),max(metric_driver3$Acceleration),max(metric_driver4$Acceleration),max(metric_driver5$Acceleration))
min_acceleration<-c(min(metric_driver1$Acceleration),min(metric_driver2$Acceleration),min(metric_driver3$Acceleration),min(metric_driver4$Acceleration),min(metric_driver5$Acceleration))
number_of_stop<-c(sum(metric_driver1$velocity==0)/nrow(metric_driver1)*100,sum(metric_driver2$velocity==0)/nrow(metric_driver2)*100,sum(metric_driver3$velocity==0)/nrow(metric_driver3)*100,sum(metric_driver4$velocity==0)/nrow(metric_driver4)*100,sum(metric_driver5$velocity==0)/nrow(metric_driver5)*100)

# creation of the data frame
Driver<-data.frame(driver_no=driver_no,mean_distance=mean_distance,max_distance_traveled=max_distance_traveled, min_distance_traveled=min_distance_traveled, 
                   mean_velocity=mean_velocity,max_velocity=max_velocity, min_velocity=min_velocity,
                   mean_acceleration=mean_acceleration,max_acceleration=max_acceleration, min_acceleration=min_acceleration, 
                   number_of_stop=number_of_stop)

#############
# divide each driver between the different trips

# for the driver 1
trip_num<-vector()

mean_dist_vec1<-vector()
mean_vel_vec1<-vector()
mean_acc_vec1<-vector()

for (i in 1:200)
{
  j=(metric_driver1$trip_no==i)
  trip_num[i]<-i
  mean_dist_vec1[i]<-mean(metric_driver1$distance_traveled[j])
  mean_vel_vec1[i]<-mean(metric_driver1$velocity[j])
  mean_acc_vec1[i]<-mean(metric_driver1$Acceleration[j])
}
Driver1<-data.frame(trip_num=trip_num,mean_distance=mean_dist_vec1,mean_velocity=mean_vel_vec1,mean_acceleration=mean_acc_vec1)

# for the driver 2
trip_num<-vector()

mean_dist_vec2<-vector()
mean_vel_vec2<-vector()
mean_acc_vec2<-vector()

for (i in 1:200)
{
  j=(metric_driver2$trip_no==i)
  trip_num[i]<-i
  mean_dist_vec2[i]<-mean(metric_driver2$distance_traveled[j])
  mean_vel_vec2[i]<-mean(metric_driver2$velocity[j])
  mean_acc_vec2[i]<-mean(metric_driver2$Acceleration[j])
}
Driver2<-data.frame(trip_num=trip_num,mean_distance=mean_dist_vec2,mean_velocity=mean_vel_vec2,mean_acceleration=mean_acc_vec2)

# for the driver 3
trip_num<-vector()

mean_dist_vec3<-vector()
mean_vel_vec3<-vector()
mean_acc_vec3<-vector()

for (i in 1:200)
{
  j=(metric_driver3$trip_no==i)
  trip_num[i]<-i
  mean_dist_vec3[i]<-mean(metric_driver3$distance_traveled[j])
  mean_vel_vec3[i]<-mean(metric_driver3$velocity[j])
  mean_acc_vec3[i]<-mean(metric_driver3$Acceleration[j])
}
Driver3<-data.frame(trip_num=trip_num,mean_distance=mean_dist_vec3,mean_velocity=mean_vel_vec3,mean_acceleration=mean_acc_vec3)

# for the driver 4
trip_num<-vector()

mean_dist_vec4<-vector()
mean_vel_vec4<-vector()
mean_acc_vec4<-vector()

for (i in 1:200)
{
  j=(metric_driver4$trip_no==i)
  trip_num[i]<-i
  mean_dist_vec4[i]<-mean(metric_driver4$distance_traveled[j])
  mean_vel_vec4[i]<-mean(metric_driver4$velocity[j])
  mean_acc_vec4[i]<-mean(metric_driver4$Acceleration[j])
}
Driver4<-data.frame(trip_num=trip_num,mean_distance=mean_dist_vec4,mean_velocity=mean_vel_vec4,mean_acceleration=mean_acc_vec4)

# for the driver 5
trip_num<-vector()

mean_dist_vec5<-vector()
mean_vel_vec5<-vector()
mean_acc_vec5<-vector()

for (i in 1:200)
{
  j=(metric_driver5$trip_no==i)
  trip_num[i]<-i
  mean_dist_vec5[i]<-mean(metric_driver5$distance_traveled[j])
  mean_vel_vec5[i]<-mean(metric_driver5$velocity[j])
  mean_acc_vec5[i]<-mean(metric_driver5$Acceleration[j])
}
Driver5<-data.frame(trip_num=trip_num,mean_distance=mean_dist_vec5,mean_velocity=mean_vel_vec5,mean_acceleration=mean_acc_vec5)

# plot the drives 
j1=metric_driver1$trip_no==1
metric_driver1_trip1<-metric_driver1[j1,]
install.packages("ade4")
library(ade4)

test<-data.frame(X=metric_driver1_trip1$x_cord,Y=metric_driver1_trip1$y_cord)
s.traject(test,factor(rep(1, nrow(test))),edge=TRUE,clabel=0,cpoint=0,pch=-5,sub="first traject")
