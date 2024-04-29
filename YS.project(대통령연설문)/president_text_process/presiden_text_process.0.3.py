# -*- coding: utf-8 -*-
"""
Created on Thu Apr 11 10:38:36 2024

@author: YS702
"""

import pandas as pd
import re
from konlpy.tag import Komoran
from collections import Counter
import wc
import bar_wc
import os
import matplotlib.pyplot as plt

def president_process(file_path):
    # CSV 파일을 데이터프레임으로 업로드
    df = pd.read_excel(file_path)

    file_name = re.search(r'[^\\/]+$', file_path).group(0)
    file_name_without_extension = re.sub(r'\.[^.\/]+$', '', file_name)

    # 연설문 인덱싱
    df = df.loc[:,'연설문']

    # 연설문의 모든 행을 'line1'에 추가
    line1 = [line for line in df]

    # 리스트 -> 문자열로 변경 및 분할
    df = ' '.join(line1)

    # 영문자, 숫자, 한글, 공백을 제외한 모든 문자를 찾아 제거
    pattern = r'[^a-zA-Z0-9가-힣\s]'
    df = re.sub(pattern, '', df)

    # 명사만 추출하기
    komoran = Komoran()
    df = komoran.nouns(df)

    # 단어 빈도 개수 세기
    df_words_counts = Counter(df)

    # 단어 빈도 개수 기준 내림차순 정렬
    df = df_words_counts.most_common()
    df = pd.DataFrame(df, columns=["word", "count"])
    selected = df['word'].str.len() > 1
    new_df = df[selected]

    # 상위 10개 항목 나열
    top10 = new_df[:20]

    # 시각화 함수 호출
    wc.make_wordcloud(top10, f'{file_name_without_extension}')
    bar_wc.bar_wordcount(top10['word'], top10['count'], f'{file_name_without_extension}')

    # CSV 파일 저장
    df.to_excel(f'{file_name_without_extension}_단어빈도.xlsx', index=False)

    return df

# 파일 경로
file_path = 'C:/myPyScraping/project/president_text_process/공무원피살1주일전부터.xlsx'

# 함수 호출
president_process(file_path)



