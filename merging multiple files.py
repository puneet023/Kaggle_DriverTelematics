# -*- coding: utf-8 -*-
"""
Created on Fri Feb 27 00:23:33 2015

@author: Puneet
"""


import pandas as pd
import os
import numpy as np
os.getcwd()
import csv


#driver 1
os.chdir('E:/Analytics/kaggle/aza driver telematic analysis/drivers/drivers/1')

trip_no = range(1,201)
pieces = []
columns = ['x_cord', 'y_cord']

for trip in trip_no:
    path = '%d.csv' % trip
    frame = pd.read_csv(path, names = columns)
    frame['trip_no'] = trip
    frame['driver_no'] = 1
    pieces.append(frame)    
rides_driver_1 = pd.concat(pieces, ignore_index = True)

rides_driver_1[-10:]



#driver 2
os.chdir('E:/Analytics/kaggle/aza driver telematic analysis/drivers/drivers/2')

trip_no = range(1,201)
columns = ['x_cord', 'y_cord']
pieces = []

for trip in trip_no:
    path = '%d.csv' % trip
    frame = pd.read_csv(path, names = columns)
    frame['trip_no'] = trip
    frame['driver_no'] = 2
    pieces.append(frame)
rides_driver_2 = pd.concat(pieces, ignore_index = True)
    

#driver 3
os.chdir('E:/Analytics/kaggle/aza driver telematic analysis/drivers/drivers/3')

trip_no = range(1,201)
columns = ['x_cord', 'y_cord']
pieces = []

for trip in trip_no:
    path = '%d.csv' % trip
    frame = pd.read_csv(path, names = columns)
    frame['trip_no'] = trip
    frame['driver_no'] = 3
    pieces.append(frame)
rides_driver_3 = pd.concat(pieces, ignore_index = True)

#driver 10
os.chdir('E:/Analytics/kaggle/aza driver telematic analysis/drivers/drivers/10')

trip_no = range(1,201)
columns = ['x_cord', 'y_cord']
pieces = []

for trip in trip_no:
    path = '%d.csv' % trip
    frame = pd.read_csv(path, names = columns)
    frame['trip_no'] = trip
    frame['driver_no'] = 10
    pieces.append(frame)
rides_driver_10 = pd.concat(pieces, ignore_index = True)


#driver 11
os.chdir('E:/Analytics/kaggle/aza driver telematic analysis/drivers/drivers/11')

trip_no = range(1,201)
columns = ['x_cord', 'y_cord']
pieces = []

for trip in trip_no:
    path = '%d.csv' % trip
    frame = pd.read_csv(path, names = columns)
    frame['trip_no'] = trip
    frame['driver_no'] = 11
    pieces.append(frame)
rides_driver_11 = pd.concat(pieces, ignore_index = True)




#appending the driver 1 & driver 2 data
data_1 = rides_driver_1.append(rides_driver_2, ignore_index = True)
data_2 = data_1.append(rides_driver_3, ignore_index = True)
data_3 = data_2.append(rides_driver_10, ignore_index = True)
data_final = data_3.append(rides_driver_11, ignore_index = True) 
data_final = data_final[data_final.x_cord != 'x']

###############################################################################

data_final.to_csv("data_final.csv")




data.x_cord.astype('int')
data.y_cord.astype('int')
data.convert_objects(convert_numeric = True)

data.x_cord[1]


index_value = range(1,261906)
for i in index_value:
    if data.x_cord[i] == 0 & data.y_cord[i] == 0:
        data['distance_traveled'] = 0
    else:
        data['distance_traveled'] = np.sqrt((data.x_cord[i] - data.x_cord[i-1])^2 + (data.y_cord[i] - data.y_cord[i-1])^2)
return data[:10]
        
data.y_cord[1] == 0
type(data.x_cord[2])









   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    