# -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 14:55:42 2024

@author: YS702
"""

import streamlit as st
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import accuracy_score
from scipy.stats import uniform, randint
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import mean_squared_error
import pickle

base_dir = "C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/machine_learning_basedata_v0.2.xlsx"

df_learn = pd.read_excel(desired_path)

#%%

# 소멸위험등급을 수치형으로 변환
grade_mapping = {'A': 1, 'B': 2, 'C': 3, 'D': 4}
df_learn['소멸위험등급'] = df_learn['소멸위험등급'].map(grade_mapping)

df_learn.replace('-', 0, inplace=True)

# 특징 변수(X)와 타겟 변수(y) 분리
X = df_learn[['소멸위험지수', '교원_1인당_학생수_유치원', '교원_1인당_학생수_초등학교', '교원_1인당_학생수_중학교', '교원_1인당_학생수_고등학교', '유치원_학급당 학생 수 (명)', '초등학교_학급당 학생 수 (명)', '중학교_학급당 학생 수 (명)', '고등학교_학급당 학생 수 (명)', '학교교과 교습학원 (개)', '평생직업 교육학원 (개)', '사설학원당 학생수 (명)', '유치원생 수' , '초등학생 수', '종합병원', '병원', '의원', '치과병(의)원', '한방병원', '한의원', '인구 천명당 의료기관병상수(개)', '총병상수 (개)', '하수도보급률', '상수도보급률']]  # 독립변수
y = df_learn['소멸위험등급']                              # 종속변수


#%%

print(df_learn.isnull().sum())  # 결측치 확인


#%%

# 데이터셋 분할
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

best_params = {'subsample': 0.9, 'n_estimators': 100, 'min_samples_split': 5, 'min_samples_leaf': 9, 'max_depth': 8, 'learning_rate': 0.05}



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

with open('best_model.pkl', 'wb') as f:
    pickle.dump(model, f)

#%%        

# pickle 파일로부터 모델 로드
with open('best_model.pkl', 'rb') as f:
    loaded_model = pickle.load(f)

# 로드된 모델로 예측 수행
y_pred = loaded_model.predict(X_test)

all_features = list(df_learn.columns[3:])


# 사용자 입력으로 예측
st.write("## 사용자 입력으로 예측")
user_input = [st.slider(f"{feature}", min_value=0.0, max_value=100.0, value=0.0) for feature in all_features]

if st.button("예측"):
    user_input = np.array(user_input).reshape(1, -1)
    prediction = best_model.predict(user_input)
    st.write(f"예측 결과: {prediction[0]}")
    
    



#%%

# -*- coding: utf-8 -*-
"""
Created on Wed Jul 31 11:50:34 2024

@author: jcp
"""

# 탑재할 샘플 모델

import sklearn
import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn.model_selection import RandomizedSearchCV

df = pd.read_csv("./preprocessed/merged_data.csv", index_col=0)

# LabelEncoder 클래스를 불러옵니다.
from sklearn.preprocessing import LabelEncoder

# LabelEncoder를 객체로 생성합니다.
le = LabelEncoder()

# fit_transform()으로 라벨인코딩을 수행합니다.
df['소멸위험등급'] = le.fit_transform(df['소멸위험등급'])

# 추가 전처리
df = df.replace("Ⅹ",0)
# Object 타입 열들 numeric으로 변환
cols = df.columns[1:]
for col in df.columns[1:]:
    if df[col].dtype == 'object':
        df[col] = pd.to_numeric(df[col].str.replace('[\s,]', '', regex=True), errors='raise')
        
# %%
'''스케일링'''
# Robust 스케일링
from sklearn.preprocessing import RobustScaler
scaler = RobustScaler()
scaled = scaler.fit_transform(df.iloc[:, 1:-2])
df.iloc[:, 1:-2] = pd.DataFrame(scaled, columns = df.iloc[:, 1:-2].columns)

# %%

# 2021년 데이터를 테스트 데이터로 분리
test = df[df['행정구역'].str.contains('_2021')]

train = df[~df['행정구역'].str.contains('_2021')]

X = train.iloc[:, 1:-2]
y = train['소멸위험등급']

# %%


X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y, random_state=1)


# %%

# LightGBM
import lightgbm as lgb
from sklearn.model_selection import RandomizedSearchCV
from sklearn.metrics import accuracy_score

# LightGBM 모델 초기화
lgb_clf = lgb.LGBMClassifier(random_state=1)
'''
num_leaves: 트리의 잎사귀 수.
learning_rate: 학습률.
n_estimators: 트리의 수.
max_depth: 트리의 최대 깊이.
min_child_samples: 리프 노드의 최소 샘플 수.
subsample: 데이터의 일부를 샘플링할 비율.
colsample_bytree: 각 트리를 학습할 때 사용하는 특성의 비율.'''
# 하이퍼파라미터 공간 정의
param_dist_lgb = {
    'num_leaves': [31, 50, 70],
    'learning_rate': [0.01, 0.1, 0.2],
    'n_estimators': [100, 200, 300],
    'max_depth': [-1, 10, 20],
    'min_child_samples': [5, 10, 20],
    'subsample': [0.6, 0.8, 1.0],
    'colsample_bytree': [0.6, 0.8, 1.0]
}

# RandomizedSearchCV 수행
rand_search_lgb = RandomizedSearchCV(lgb_clf, param_distributions=param_dist_lgb, n_iter=50, cv=5, scoring='accuracy', random_state=1)
rand_search_lgb.fit(X_train, y_train.values.ravel())  # y_train.values.ravel()는 y_train을 1차원 배열로 변환합니다.

print('Best parameters:', rand_search_lgb.best_params_)
print('Best score:', round(rand_search_lgb.best_score_, 4))



# 최적의 모델로 평가
best_lgb_model = rand_search_lgb.best_estimator_
y_pred_lgb = best_lgb_model.predict(X_test)
print(f"LightGBM Accuracy: {accuracy_score(y_test, y_pred_lgb):.4f}")

# 예측 결과의 혼동 행렬과 분류 리포트 출력 (선택 사항)
from sklearn.metrics import confusion_matrix, classification_report

conf_matrix = confusion_matrix(y_test, y_pred_lgb)
print("Confusion Matrix:")
print(conf_matrix)

class_report = classification_report(y_test, y_pred_lgb)
print("Classification Report:")
print(class_report)

# %%
'''2021 등급 예측'''
# 2021 X, y 분리
X_2021 = test.iloc[:,1:-2]
y_2021 = test['소멸위험등급']


y_pred = best_lgb_model.predict(X_2021)

print(f"LightGBM Accuracy: {accuracy_score(y_2021, y_pred):.4f}")

# %%
import joblib

joblib.dump(best_lgb_model, 'lgb.pkl')

# gbm_pickle = joblib.load('lgb.pkl')