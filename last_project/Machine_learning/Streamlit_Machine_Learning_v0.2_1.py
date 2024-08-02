# -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 15:08:04 2024

@author: YS702
"""

import streamlit as st
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import accuracy_score
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from scipy.stats import uniform, randint

base_dir = "C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/machine_learning_basedata_v0.2.xlsx"

data = pd.read_excel(desired_path)

# 데이터 표시
st.write("## 머신러닝 데이터셋")
st.write(data.head())

# 입력 변수 선택
all_features = list(data.columns[:-1])
selected_features = [feature for feature in all_features if st.checkbox(f"{feature}", value=True)]

label = st.selectbox("타겟변수 선택", options=data.columns[:-1])

# 모델 학습 및 하이퍼파라미터 최적화
if st.button("모델 학습"):
    if not selected_features:
        st.error("적어도 하나의 특징을 선택해야 합니다.")
    else:
        X = data[selected_features]
        y = data[label]

        # 결측치 확인
        if X.isnull().values.any() or y.isnull().values.any():
            st.error("데이터에 결측치가 있습니다. 결측치를 처리해주세요.")
        else:
            # 문자열 데이터를 OneHotEncoding
            categorical_features = X.select_dtypes(include=['object']).columns.tolist()
            numerical_features = X.select_dtypes(exclude=['object']).columns.tolist()

            preprocessor = ColumnTransformer(
                transformers=[
                    ('num', 'passthrough', numerical_features),
                    ('cat', OneHotEncoder(), categorical_features)
                ])

            # GradientBoostingClassifier 모델
            model = Pipeline(steps=[
                ('preprocessor', preprocessor),
                ('classifier', GradientBoostingClassifier())
            ])

            # 하이퍼파라미터 그리드
            param_dist = {
                'classifier__n_estimators': randint(50, 200),
                'classifier__learning_rate': uniform(0.01, 0.3),
                'classifier__max_depth': randint(1, 10),
                'classifier__min_samples_split': randint(2, 10),
                'classifier__min_samples_leaf': randint(1, 10),
                'classifier__subsample': uniform(0.5, 1.0)
            }

            # RandomizedSearchCV 설정
            random_search = RandomizedSearchCV(
                model,
                param_distributions=param_dist,
                n_iter=100,
                cv=5,
                random_state=42,
                error_score='raise'  # 에러 메시지 출력
            )

            try:
                X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
                random_search.fit(X_train, y_train)

                # 최적 모델
                best_model = random_search.best_estimator_
                y_pred = best_model.predict(X_test)

                accuracy = accuracy_score(y_test, y_pred)
                st.write(f"최적 모델 정확도: {accuracy:.2f}")
                st.write("최적 하이퍼파라미터:", random_search.best_params_)

                # 변수 중요도 계산
                importances = best_model.named_steps["classifier"].feature_importances_
                onehot_columns = random_search.best_estimator_.named_steps['preprocessor'].transformers_[1][1].get_feature_names_out(categorical_features)
                all_columns = numerical_features + list(onehot_columns)
                feature_importance = pd.Series(importances, index=all_columns)
                st.write("## 변수 중요도")
                st.bar_chart(feature_importance)

            except ValueError as e:
                st.error(f"모델 학습 중 오류 발생: {e}")

# 사용자 입력으로 예측
st.write("## 사용자 입력으로 예측")
user_input = [st.number_input(f"{feature}", value=0.0) for feature in selected_features]

if st.button("예측"):
    try:
        user_input = np.array(user_input).reshape(1, -1)
        prediction = best_model.predict(user_input)
        st.write(f"예측 결과: {prediction[0]}")
    except NameError:
        st.error("모델이 아직 학습되지 않았습니다.")
    except ValueError as e:
        st.error(f"예측 중 오류 발생: {e}")