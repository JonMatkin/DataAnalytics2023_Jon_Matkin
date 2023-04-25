# -*- coding: utf-8 -*-
"""
Created on Fri Mar 17 11:01:56 2023

@author: matkij
"""

import pandas as pd

data_full = pd.read_csv(r'C:\Users\matkij\Documents\ITWS 6600 Data Analytics\2020_JP_TS_Level4.csv')
print(data_full.head())
#%%
#print(data_full['DateTime'])
data_full[['Date', 'Time']] = data_full['DateTime'].str.split(' ', expand=True)
#%%
data_date_time_expanded = data_full.drop(columns=['DateTime'])
data_date_time_expanded[['Month','Day','Year']] = data_date_time_expanded['Date'].str.split('/', expand=True)

#%%
data_useful = data_date_time_expanded.drop(columns=['Date'])
data_mar_apr = data_useful.loc[data_useful['Month'].isin(['3','4'])]
#%%
data_mar_apr.to_csv(r'C:\Users\matkij\Documents\ITWS 6600 Data Analytics\JP_mar_apr_data.csv', index=False)






