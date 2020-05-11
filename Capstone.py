# -*- coding: utf-8 -*-
"""
Created on Sun Mar  8 15:42:01 2020

@author: kpatters
"""

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report




df = pd.read_csv('C:/Users\KPATTERS/VirtualBox VMs/SAS University Edition/myfolder/WA_Fn-UseC_-Telco-Customer-Churn.csv')
print(df.head())

df['gender'] = df['gender'].replace(['Female','Male'],[0,1])

df['Partner'] = df['Partner'].replace(['No','Yes'],[0,1])
df['Dependents'] = df['Dependents'].replace(['No','Yes'],[0,1])
df['PhoneService'] = df['PhoneService'].replace(['No','Yes'],[0,1])
df['MultipleLines'] = df['MultipleLines'].replace(['No','Yes', 'No phone service'],[0,1,2])
df['InternetService'] = df['InternetService'].replace(['DSL','Fiber optic','No'],[0,1,2])
df['OnlineSecurity'] = df['OnlineSecurity'].replace(['No','Yes','No internet service'],[0,1,2])
df['OnlineBackup'] = df['OnlineBackup'].replace(['No','Yes','No internet service'],[0,1,2])
df['DeviceProtection'] = df['DeviceProtection'].replace(['No','Yes','No internet service'],[0,1,2])
df['TechSupport'] = df['TechSupport'].replace(['No','Yes','No internet service'],[0,1,2])
df['StreamingTV'] = df['StreamingTV'].replace(['No','Yes','No internet service'],[0,1,2])
df['StreamingMovies'] = df['StreamingMovies'].replace(['No','Yes','No internet service'],[0,1,2])
df['Contract'] = df['Contract'].replace(['Month-to-month','One year','Two year'],[0,1,2])
df['PaperlessBilling'] = df['PaperlessBilling'].replace(['No','Yes'],[0,1])
df['PaymentMethod'] = df['PaymentMethod'].replace(['Electronic check','Mailed check','Bank transfer (automatic)','Credit card (automatic)'],[0,1,2,3])
df['Churn'] = df['Churn'].replace(['No','Yes'],[0,1])
df['TotalCharges'] = df['TotalCharges'].replace([' '],[0])

print(df.head())

df.to_csv('C:/Users\KPATTERS/VirtualBox VMs/SAS University Edition/myfolder/churn_data.csv')


df = df[['gender',
'SeniorCitizen',
'Partner',
'Dependents',
'tenure',
'PhoneService',
'InternetService',
'MultipleLines',
'OnlineSecurity',
'OnlineBackup',
'DeviceProtection',
'TechSupport',
'StreamingTV',
'StreamingMovies',
'Contract',
'PaperlessBilling',
'PaymentMethod',
'MonthlyCharges',
'TotalCharges',
'Churn'
]]

df.fillna(0)






