# -*- coding: utf-8 -*-
"""
Created on Mon Jul 31 01:51:39 2023

@author: ZZ01OK862
"""

import pandas as pd
import numpy as np
import random

dataframe1 = pd.read_excel('Jeans_excel.xlsx')
print(dataframe1)

range_value = 50
random_values = np.random.uniform(dataframe1['Mean'] - range_value, dataframe1['Mean'] + range_value)
print(random_values)

range_value2 = 60
random_values2 = np.random.uniform(dataframe1['Mean'] - range_value2, dataframe1['Mean'] + range_value2)
print(random_values2)

range_value3 = 75
random_values3 = np.random.uniform(dataframe1['Mean'] - range_value3, dataframe1['Mean'] + range_value3)
print(random_values3)

rating= [random.uniform(0,5) for i in range(278)]
print(rating)

sales= [random.randint(100,300) for i in range(277)]
print(sales)

cost= [random.uniform(100,150) for i in range(277)]
print(cost)