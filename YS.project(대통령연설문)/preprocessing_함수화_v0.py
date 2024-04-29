from konlpy.tag import Komoran
from collections import Counter
import re
import wc
import bar_wc
import time
import os
import pandas as pd

def extract_column_from_excel_files(folder_path, column_name):
    # 모든 엑셀 파일을 저장할 리스트
    combined_column = []
    
    # 폴더 내의 파일 목록 가져오기
    file_list = os.listdir(folder_path)
    
    # 각 파일에 대해 처리
    for file_name in file_list:
        # 파일 경로 생성
        file_path = os.path.join(folder_path, file_name)
        
        # 파일 확장자가 엑셀인지 확인
        if file_name.endswith('.xlsx') or file_name.endswith('.xls'):
            # 엑셀 파일을 데이터프레임으로 불러오기
            df = pd.read_excel(file_path)
            
            # 지정된 열(column)을 추출하여 리스트에 추가
            if column_name in df.columns:
                selected_column = df[column_name].tolist()
                combined_column.extend(selected_column)
    
    return combined_column

# 함수 호출
df = extract_column_from_excel_files('C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/시각화/대통령','연설문')

def preprocess_and_visualize(df):
    # 리스트 -> 문자열로 변경 및 분할
    text = ' '.join(df)
    
    # 영문자, 숫자, 한글, 공백을 제외한 모든 문자를 찾아 제거
    pattern = r'[^a-zA-Z가-힣\s]'
    text = re.sub(pattern, '', text)  
    
    # 불용어 제거
    text = re.sub(r'니다', '', text)
    
    # 명사만 추출하기
    komoran = Komoran()
    nouns = komoran.nouns(text)
    
    # 단어 빈도 개수 세기
    df_words_counts = Counter(nouns)
        
    # 1개 미만 단어 제외 및 내림차순 정렬
    df = df_words_counts.most_common()
    df = pd.DataFrame(df, columns=["word", "count"])
    selected = df['word'].str.len() > 1
    new_df = df[selected]
    
    # 상위 20개 항목 나열
    top20 = new_df[:20]

    # 엑셀로 데이터프레임 출력
    top20.to_excel('대통령 연설문 정리2.xlsx', index=False)

    # 시각화: 워드클라우드 & 바 차트

    bar_wc.bar_wordcount(top20['word'], top20['count'])
       
    
# 함수호출
preprocess_and_visualize(df)
