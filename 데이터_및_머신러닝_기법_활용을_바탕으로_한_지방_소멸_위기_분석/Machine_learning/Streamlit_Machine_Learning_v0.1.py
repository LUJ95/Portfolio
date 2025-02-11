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

# 데이터 로드
@st.cache
def load_data():
    url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
    data = pd.read_csv(url)
    return data

data = load_data()

# 데이터 표시
st.write("## Iris 데이터셋")
st.write(data.head())

# 입력 변수 선택
all_features = list(data.columns[:-1])
selected_features = [feature for feature in all_features if st.checkbox(f"{feature}", value=True)]

label = st.selectbox("레이블 선택", options=data.columns[-1:])

# 모델 학습 및 하이퍼파라미터 최적화
if st.button("모델 학습"):
    if not selected_features:
        st.error("적어도 하나의 특징을 선택해야 합니다.")
    else:
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
            'subsample': uniform(0.5, 1.0)
        }
        
        # RandomizedSearchCV 설정
        random_search = RandomizedSearchCV(model, param_distributions=param_dist, n_iter=100, cv=5, random_state=42)
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

# 사용자 입력으로 예측
st.write("## 사용자 입력으로 예측")
user_input = [st.number_input(f"{feature}", value=0.0) for feature in selected_features]

if st.button("예측"):
    user_input = np.array(user_input).reshape(1, -1)
    prediction = best_model.predict(user_input)
    st.write(f"예측 결과: {prediction[0]}")