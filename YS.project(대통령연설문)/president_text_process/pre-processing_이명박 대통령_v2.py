# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 08:49:54 2024

@author: OSP
"""

### 데이터 전처리

# pre_lee_2008.07.11_금강산_관광객_피살_사건.xlsx - 이명박
# pre_lee_2010.03.26_천안함피격1주일전부터.xlsx - 이명박
# pre_lee_2010.11.23_연평도포격1주일전부터.xlsx - 이명박

#%%
# 패키지
import pandas as pd
import numpy as np
import re

#%%

###  업로드 : csv파일 -> 데이터프레임

df1 = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_lee_2008.07.11_금강산_관광객_피살_사건.xlsx')
df2 = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_lee_2010.03.26_천안함피격1주일전부터.xlsx')
df3 = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_lee_2010.11.23_연평도포격1주일전부터.xlsx')

#%%

df = pd.concat([df1, df2, df3], ignore_index=True)

df
#%%

### 이명박 대통령

# 연설문 인덱싱

df = df.loc[:,'연설문']

#%%
# 연설문의 모든 행을 'line1'에 추가

line1 = []
for i in range(len(df)):
    line1.append(df[i])
print(line1)

#%%
# 리스트 -> 문자열로 변경 및 분할

df = str(line1)

#%%

# 영문자, 숫자, 한글, 공백을 제외한 모든 문자를 찾아 제거

import re
pattern = r'[^a-zA-Z0-9가-힣\s]'
df = re.sub(pattern, '', df)
df

#%%
# 리스트 -> 문자열로 변경 및 분할

df = str(df)

#%%
# 명사만 추출하기

from konlpy.tag import Komoran
komoran = Komoran()
df = komoran.nouns(df)

#%%
# 단어 빈도 개수 세기

from collections import Counter
df_words_counts = Counter(df)
print(df_words_counts)

#%%
# 단어 빈도 개수 기준 내림차순 정렬

df = df_words_counts.most_common()
# 상위 20개 항목 나열
top10 = df[:20]
top10


#%%

# 데이터 프레임 열 추가

df = pd.concat([df1, df2, df3], ignore_index=True)

#%% 
# 2. 이명박 연설문 : 열 추가 (일자, 연설자, 주제, 내용, 연설문)

df = pd.DataFrame(df)
df_column_1_name = '일자'
df_column_1_values = ['2008.07.04',
                       '2008.07.10',
                       '2008.07.11']

df_column_2_name = '연설자'
df_column_2_values = ['이명박',
                       '이명박',
                       '이명박',]

df_column_3_name = '주제'
df_column_3_values = ['none',
                       'none',
                       'none']

df_column_4_name = '내용'
df_column_4_values = ['반기문 UN 사무총장 방한 만찬사',
                       'F-15K 전력화 기념행사 축사',
                       '제18 국회 개원 연설']

df.insert(1, df_column_1_name, df_column_1_values)
df.insert(2, df_column_2_name, df_column_2_values)
df.insert(3, df_column_3_name, df_column_3_values)
df.insert(4, df_column_4_name, df_column_4_values)

# 열의 순서를 변경
new_order_lee_pre = ['일자', '연설자', '주제', '내용', '연설문']

# reindex() 메서드를 사용하여 열의 순서를 변경
df = df.reindex(columns = new_order_kim_pre)

print(df)

#%%

# 저장 경로 찾기
import os
current_directory = os.getcwd()
print("작업 디렉토리:", current_directory)

#%%

# 엑셀로 데이터프레임 출력

df.to_excel('이명박 대통령 연설문 정리.xlsx', index=False)

