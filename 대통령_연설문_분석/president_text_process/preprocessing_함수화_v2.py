# -*- coding: utf-8 -*-
"""
Created on Thu Apr 11 17:02:11 2024

@author: OSP
"""
#%%

import pp

# 폴더 경로 및 열 이름 지정하면, 해당 폴더 안에 있는 모든 엑셀파일의 지정열을 하나의 리스트로 묶음

folder_paths = ['이명박','박근혜','문재인','김대중']
column_names = ['연설문']
speeches = []
for folder_path, column_name in zip(folder_paths, column_names):
    speeches += extract_column_from_excel_files(f'C:/Users/OSP/Desktop/미니프로젝트/대통령 연설문 분석/데이터 전처리/{folder_path}', column_name)

speeches = pp.select_add_for_excel_from_folder(folder_path, column_name)

#%%

df = speeches
pp.preprocess(df)
