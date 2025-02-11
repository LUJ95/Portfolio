# -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 15:59:44 2024

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

# 범주형 변수를 가진 리스트를 생성합니다.
cities = ['서울', '부산', '인천', '대구', '광주', '서울_2015', '서울_2016']

base_dir = "C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/machine_learning_basedata_v0.2.xlsx"

data = pd.read_excel(desired_path)


# LabelEncoder 객체를 생성합니다.
encoder = LabelEncoder()

# fit 메소드를 사용하여 레이블 인코딩을 학습합니다.
encoder.fit(data['시도별'])

# transform 메소드를 사용하여 데이터를 변환합니다.
encoded_cities = encoder.transform(data['시도별'])

print('Encoded Cities:', encoded_cities)
print('Original Cities:', encoder.inverse_transform(encoded_cities))