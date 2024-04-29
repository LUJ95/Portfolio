# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 11:33:02 2024

@author: OSP
"""

### 데이터 전처리

# pre_moon_2020.06.16_연락사무소폭파1주일전부터.xlsx - 문재인
# pre_moon_2020.09.22_공무원피살1주일전부터.xlsx - 문재인

#%%
# 패키지
import pandas as pd
import numpy as np
import re

#%%

###  업로드 : csv파일 -> 데이터프레임

df1 = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_moon_2020.06.16_연락사무소폭파1주일전부터.xlsx')
df2 = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_moon_2020.09.22_공무원피살1주일전부터.xlsx')

#%%

df = pd.concat([df1, df2], ignore_index=True)

df
#%%

### 문재인 대통령

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
# 상위 10개 항목 나열
top10 = df[:10]
top10

#%%

# 데이터 프레임 열 추가

df = pd.concat([df1, df2], ignore_index=True)

#%%
# 3. 문재인 연설문 : 열 추가 (일자, 연설자, 주제, 내용, 연설문)

df = pd.DataFrame(df)
df_column_1_name = '일자'
df_column_1_values = ['2020.06.09',
                       '2020.06.10',
                       '2020.06.10',
                       '2020.06.15',
                       '2020.06.15',
                       '2020.09.14',
                       '2020.09.14',
                       '2020.09.16',
                       '2020.09.17',
                       '2020.09.18',
                       '2020.09.19',
                       '2020.09.19']

df_column_2_name = '연설자'
df_column_2_values = ['문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인',
                       '문재인']

df_column_3_name = '주제'
df_column_3_values = ['none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none',
                       'none']

df_column_4_name = '내용'
df_column_4_values = ['제30회 국무회의',
                      '제33주년 6·10민주항쟁 기념식',
                       '가봉 해상 피랍 국민 무사귀환 관련 메시지',
                       '수석·보좌관회의',
                       '6·15남북공동선언 20주년 기념식 영상 축사',
                       '수석·보좌관회의',
                       '해양경찰 격려 메시지',
                       '메이 전 영국 총리 접견',
                       '한국판 뉴딜 현장 방문④ 창원 스마트그린 산업단지',
                       '한국불교 지도자 초청 간담회',
                       '9·19평양공동선언 2주년 기념 메시지',
                       '제1회 청년의 날 기념식']

df.insert(1, df_column_1_name, df_column_1_values)
df.insert(2, df_column_2_name, df_column_2_values)
df.insert(3, df_column_3_name, df_column_3_values)
df.insert(4, df_column_4_name, df_column_4_values)

# 열의 순서를 변경
new_order_moon_pre = ['일자', '연설자', '주제', '내용', '연설문']

# reindex() 메서드를 사용하여 열의 순서를 변경
df = df.reindex(columns = new_order_moon_pre)

print(df)

#%%

# 저장 경로 찾기
import os
current_directory = os.getcwd()
print("작업 디렉토리:", current_directory)

#%%

# 엑셀로 데이터프레임 출력

df.to_excel('문재인 대통령 연설문 정리.xlsx', index=False)