# -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 14:55:42 2024

@author: YS702
"""
import lightgbm as lgb
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import mean_squared_error
import pickle
from sklearn.preprocessing import KBinsDiscretizer

base_dir = "C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/merged_data.xlsx"

df_learn = pd.read_excel(desired_path)

#%%

# 소멸위험등급을 수치형으로 변환
grade_mapping = {'A': 1, 'B': 2, 'C': 3, 'D': 4}
df_learn['소멸위험등급'] = df_learn['소멸위험등급'].map(grade_mapping)


all_features = list(df_learn.columns[2:81])

#df = df_learn[all_features]
# 추가 전처리
df_learn = df_learn.replace("Ⅹ",0)
# Object 타입 열들 numeric으로 변환

for col in df_learn.columns:
    if df_learn[col].dtype == 'object':
        df_learn[col] = pd.to_numeric(df_learn[col].str.replace('[\s,]', '', regex=True), errors='raise')


#%%


#%%

# 2021년 데이터를 테스트 데이터로 분리
test = df_learn[df_learn['행정구역'].str.contains('_2021')]

train = df_learn[~df_learn['행정구역'].str.contains('_2021')]

X_2020 = train[all_features]
X_2020 = X_2020.replace("Ⅹ",0)
for col in X_2020.columns:
    if X_2020[col].dtype == 'object':
        X_2020[col] = pd.to_numeric(X_2020[col].str.replace('[\s,]', '', regex=True), errors='raise')
y_2020 = train['소멸위험등급']

X_2021 = test[all_features]
X_2021 = X_2021.replace("Ⅹ",0)
for col in X_2021.columns:
    if X_2021[col].dtype == 'object':
        X_2021[col] = pd.to_numeric(X_2021[col].str.replace('[\s,]', '', regex=True), errors='raise')

y_2021 = test['소멸위험등급']


#%%



#%%

# 데이터셋 분할
X_train, X_test, y_train, y_test = train_test_split(X_2020, y_2020, test_size=0.2, random_state=42)

best_params = {'subsample': 0.8, 'n_estimators': 250, 'min_samples_split': 6, 'min_samples_leaf': 1, 'max_depth': 6, 'learning_rate': 0.07}



model = GradientBoostingClassifier(**best_params)


#%%

# 모델 학습
model.fit(X_train, y_train)

#%%


y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)

#%%
#pickle 저장
# 로드는 rb

with open('best_model.pkl', 'wb') as f:
    pickle.dump(model, f)

#%%        


X_train, X_test, y_train, y_test = train_test_split(X_2021, y_2021, test_size=0.2, random_state=42)

#%%

best_params = {'subsample': 0.8, 'n_estimators': 250, 'min_samples_split': 6, 'min_samples_leaf': 1, 'max_depth': 6, 'learning_rate': 0.07}



model = GradientBoostingClassifier(**best_params)


#%%
'''2021 등급 예측'''
# 2021 X, y 분리
X_2021 = test[all_features]
y_2021 = test['소멸위험등급']

#%%

y_pred = model.predict(X_2021)

mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)


#%%

#LGBM

# 데이터 로드 및 분할
X_train, X_test, y_train, y_test = train_test_split(X_2020, y_2020, test_size=0.2, random_state=42)

#%%

X_train, X_test, y_train, y_test = train_test_split(X_2021, y_2021, test_size=0.2, random_state=42)

#%%



best_params = {'subsample': 1.0, 
               'num_leaves': 50, 
               'n_estimators': 200, 
               'min_child_samples': 20, 
               'max_depth': 20, 
               'learning_rate': 0.1, 
               'colsample_bytree': 0.8}

# 모델 생성 및 학습
model = lgb.LGBMRegressor(**best_params)

#%%
model.fit(X_train, y_train)

#%%

# 예측 및 평가
y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print(f'Mean Squared Error: {mse}')


#%%

# 예측 및 정수 변환
y_pred = model.predict(X_test)
y_pred_int = np.round(y_pred).astype(int)

# 평가
mse = mean_squared_error(y_test, y_pred_int)
print(f'Mean Squared Error: {mse}')
