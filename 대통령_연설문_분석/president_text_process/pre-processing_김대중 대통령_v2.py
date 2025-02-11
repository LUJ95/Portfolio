# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 11:21:48 2024

@author: OSP
"""

### 데이터 전처리

# pre_kim_2002.06.29_제2연평해전1주일전부터.xlsx - 김대중

#%%
# 패키지
import pandas as pd
import numpy as np
import re

#%%

###  업로드 : csv파일 -> 데이터프레임

df = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_kim_2002.06.29_제2연평해전1주일전부터.xlsx')
    
#%%

### 김대중 대통령

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

df = pd.read_excel('C:/Users/OSP/Desktop/YS.Project-master/연설문/pre_kim_2002.06.29_제2연평해전1주일전부터.xlsx')

#%%
# 1. 김대중 연설문 : 열 추가 (일자, 연설자, 주제, 내용, 연설문)

df = pd.DataFrame(df)
df_column_1_name = '일자'
df_column_1_values = ['2002.06.23',
                       '2002.06.23',
                       '2002.06.24',
                       '2002.06.24',
                       '2002.06.28',
                       '2002.06.28']

df_column_2_name = '연설자'
df_column_2_values = ['김대중',
                       '김대중',
                       '김대중',
                       '김대중',
                       '김대중',
                       '김대중']

df_column_3_name = '주제'
df_column_3_values = ['햇볕정책과 한반도 평화정착',
                       '한반도에 불고 있는 긍정적 변화',
                       '참전용사들의 희생과 헌신이 아니었다면',
                       '화해자로서의 아시아',
                       '행동과 인내',
                       '한국 언론의 위상']

df_column_4_name = '내용'
df_column_4_values = ['6·25 제52주년 민족의 화해와 일치를 위한 대미사 축하 메시지',
                       '중국 CCTV 회견',
                       '6·25 참전용사 위로연 연설',
                       '아시아종교인평화회의(ACRP) 제6차 총회 축하 메시지',
                       '라우 독일 대통령을 위한 만찬 연설',
                       '홍석현 세계신문협회장 취임 축하 메시지']

df.insert(1, df_column_1_name, df_column_1_values)
df.insert(2, df_column_2_name, df_column_2_values)
df.insert(3, df_column_3_name, df_column_3_values)
df.insert(4, df_column_4_name, df_column_4_values)

# 열의 순서를 변경
new_order_kim_pre = ['일자', '연설자', '주제', '내용', '연설문']

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

df.to_excel('김대중 대통령 연설문 정리.xlsx', index=False)
