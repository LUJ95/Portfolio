
import pp
import os

presidents = ['김대중']
speeches = []     
speeches_count = {}  # 대통령별 연설문 관련 엑셀 파일 및 개수 할당

for president in presidents:  
    folder_path = f'C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/데이터 전처리/{president}'
    speeches += pp.select_add_for_excel_from_folder(folder_path, '연설문')

    file_count = 0
    for file_name in os.listdir(folder_path):
        if file_name.endswith('.xlsx') or file_name.endswith('.xls'):
            file_count += 1
        speeches_count[president] = {'엑셀 파일 개수': file_count, '연설문 개수': len(speeches)}

print("대통령별 엑셀 파일 및 연설문 개수:")
for president, count_info in speeches_count.items():
    print(f"{president}: {count_info}")
print(f"총 {len(speeches)} 개의 연설문을 읽어왔습니다.")

#%%
###. 데이터 전처리 함수 pp.preprocess(df)
##. 기능
# - 리스트 -> 문자열로 변경 및 분할                  
# - 영문자, 숫자, 한글, 공백을 제외한 모든 문자를 찾아 제거
# - 불용어 제거
# - 명사만 추출하기
# - 단어 빈도 개수 세기
# - 1개 미만 단어 제외 및 내림차순 정렬
# - 상위 20개 항목 나열

df = speeches
df=pp.preprocess(df)

#%%
import pandas as pd
import wc

df = pd.DataFrame(df)
wc.make_wordcloud(df, 'wordcloud')











#%%

import os
import pp

presidents = ['이명박', '박근혜', '문재인', '김대중']
speeches_count = {}

for president in presidents:
    folder_path = f'C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/데이터 전처리/{president}'
    file_count = 0
    speeches = pp.select_add_for_excel_from_folder(folder_path, '연설문')
    for file_name in os.listdir(folder_path):
        if file_name.endswith('.xlsx') or file_name.endswith('.xls'):
            file_count += 1
    speeches_count[president] = {'엑셀 파일 개수': file_count, '연설문 개수': len(speeches)}

    print(f"{president}: 엑셀 파일 개수 - {file_count}, 연설문 개수 - {len(speeches)}")

print("대통령별 엑셀 파일 및 연설문 개수:")
print(speeches_count)
#%%

import pp

presidents = ['이명박', '박근혜', '김대중', '문재인']  # 폴더명 입력
column_name = '연설문'             # 엑셀파일 내 컬럼명 입력
speeches = []                      # 모든 연설문을 할당할 리스트

for president in presidents:  
    folder_path = f'C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/데이터 전처리/{president}'
    folder_speeches = pp.select_add_for_excel_from_folder(folder_path, column_name)
    speeches += folder_speeches

