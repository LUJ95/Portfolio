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

# Gradient Boosting Regressor 모델 초기화
model = GradientBoostingClassifier()


# 하이퍼파라미터 범위 설정
param_dist = {
    'n_estimators': np.arange(50, 500, 50),
    'learning_rate': np.linspace(0.01, 0.2, 20),
    'max_depth': np.arange(3, 10, 1),
    'min_samples_split': np.arange(2, 10, 1),
    'min_samples_leaf': np.arange(1, 10, 1),
    'subsample': np.linspace(0.5, 1.0, 6)
}


# RandomizedSearchCV 설정


random_search = RandomizedSearchCV(model, param_distributions=param_dist, n_iter=5, cv=5, scoring='neg_mean_squared_error', random_state=42, n_jobs=-1, error_score='raise')


# 모델 학습
random_search.fit(X_train, y_train)


# 최적의 하이퍼파라미터 출력
print("Best hyperparameters:", random_search.best_params_)

# 최적의 모델로 예측 및 평가
best_model = random_search.best_estimator_
y_pred = best_model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)


#%%
"""

# 데이터 표시
st.write("## 머신러닝 데이터셋")
st.write(data.head())

selected_features = '소멸위험지수', '교원_1인당_학생수_유치원', '교원_1인당_학생수_초등학교', '교원_1인당_학생수_중학교', '교원_1인당_학생수_고등학교', '유치원_학급당 학생 수 (명)', '초등학교_학급당 학생 수 (명)', '중학교_학급당 학생 수 (명)', '고등학교_학급당 학생 수 (명)', '학교교과 교습학원 (개)', '평생직업 교육학원 (개)', '사설학원당 학생수 (명)', '유치원생 수' , '초등학생 수', '종합병원', '병원', '의원', '치과병(의)원', '한방병원', '한의원', '인구 천명당 의료기관병상수(개)', '총병상수 (개)', '하수도보급률', '상수도보급률'
label = '소멸위험등급'   

# 입력 변수 선택

all_features = list(data.columns[:-1])
selected_features = [feature for feature in all_features if st.checkbox(f"{feature}", value=True)]

label = st.selectbox("타겟변수 선택", options=data.columns[:-1])

"""
#%%
"""
# 모델 학습 및 하이퍼파라미터 최적화
if st.button("모델 학습"):
    if not selected_features:
        st.error("적어도 하나의 특징을 선택해야 합니다.")
    else:
        
        grade_mapping = {'A': 1, 'B': 2, 'C': 3, 'D': 4}
        data['소멸위험등급'] = data['소멸위험등급'].map(grade_mapping)
        
        data.replace('-', 0, inplace=True)
        
        encoder = LabelEncoder()
        encoder.fit(data['시도별'])
        data['시도별'] = encoder.transform(data['시도별'])
        
        X = data[selected_features]
        y = data[label]

        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
        
        # GradientBoostingClassifier 모델
        model = GradientBoostingClassifier()
        
        # 하이퍼파라미터 그리드
        param_dist = {
            'n_estimators': randint(50, 200),
            'learning_rate': uniform(0.01, 0.3),
            'max_depth': randint(1, 10),
            'min_samples_split': randint(2, 10),
            'min_samples_leaf': randint(1, 10),
            'subsample': uniform(0.0, 1.0)
        }
        
        # RandomizedSearchCV 설정
        random_search = RandomizedSearchCV(model, param_distributions=param_dist, n_iter=100, cv=5, random_state=42, error_score='raise')
        random_search.fit(X_train, y_train)
        
        # 최적 모델
        best_model = random_search.best_estimator_
        y_pred = best_model.predict(X_test)
        
        accuracy = accuracy_score(y_test, y_pred)
        st.write(f"최적 모델 정확도: {accuracy:.2f}")
        st.write("최적 하이퍼파라미터:", random_search.best_params_)
        
        # 변수 중요도 계산
        importances = best_model.feature_importances_
        feature_importance = pd.Series(importances, index=selected_features)
        st.write("## 변수 중요도")
        st.bar_chart(feature_importance)
"""        
#%%        

all_features = list(df_learn.columns[:-1])


# 사용자 입력으로 예측
st.write("## 사용자 입력으로 예측")
user_input = [st.number_input(f"{feature}", value=0.0) for feature in all_features]

if st.button("예측"):
    user_input = np.array(user_input).reshape(1, -1)
    prediction = best_model.predict(user_input)
    st.write(f"예측 결과: {prediction[0]}")
    
    
