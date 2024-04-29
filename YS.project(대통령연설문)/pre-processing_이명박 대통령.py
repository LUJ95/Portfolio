# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 08:49:54 2024

@author: OSP
"""

### 데이터 전처리

# A: 2002.06.29북_경비정_NLL침범,제2연평해전.xlsx - 김대중
# B: 2008.07.11금강산_관광객_피살_사건.xlsx - 이명박
# C: 2020.06.16남북공동연락사무소_폭파_사건.xlsx - 문재인

#%%
# 패키지
import pandas as pd
import numpy as np
import re

#%%
# 1. df2 :김대중
# 2. df2 : 이명박
# 3. df3 : 문재인

###  업로드 : csv파일 -> 데이터프레임

df1 = pd.read_excel('C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/A.xlsx')
df2 = pd.read_excel('C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/B.xlsx')
df3 = pd.read_excel('C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/C.xlsx')

df1.head(2)
df2.head(2)
df3.head(2)

#%%

### 이명박 대통령

# 연설문 인덱싱

df2 = df2.loc[:,'연설문']

#%%
# 연설문의 모든 행을 'line1'에 추가

line1 = []
for i in range(len(df2)):
    line1.append(df2[i])
print(line1)

#%%
# 리스트 -> 문자열로 변경 및 분할

df2 = str(line1)

#%%

# 영문자, 숫자, 한글, 공백을 제외한 모든 문자를 찾아 제거

import re
pattern = r'[^a-zA-Z0-9가-힣\s]'
df2 = re.sub(pattern, '', df2)
df2

#%%
# 리스트 -> 문자열로 변경 및 분할

df2 = str(df2)

#%%
# 명사만 추출하기

from konlpy.tag import Komoran
komoran = Komoran()
df2 = komoran.nouns(df2)

#%%
# 단어 빈도 개수 세기

from collections import Counter
df2_words_counts = Counter(df2)
print(df2_words_counts)

#%%
# 단어 빈도 개수 기준 내림차순 정렬

df2 = df2_words_counts.most_common()
# 상위 10개 항목 나열
top10 = df2[:10]
top10