# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 15:00:53 2024

@author: YS702
"""
#%%

import pandas as pd
import os
from scipy.stats import pearsonr


base_dir = f"C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/소멸종합v0.1.xlsx"
desired_path_edu = f"{base_dir}/머신러닝_RawData/교육종합_v0.2.xlsx"
desired_path_health = f"{base_dir}/머신러닝_RawData/보건종합v0.1.xlsx"
desired_path_water = f"{base_dir}/머신러닝_RawData/상하수도종합_v0.2.xlsx"

# ranges = ['2015', '2016', '2017', '2018', '2019', '2020', '2021']

for range in ranges:
    df_name = f"df_machine_{range}"
    globals()[df_name] = pd.read_excel(desired_path, sheet_name=f"{range}")


df_extinction = pd.read_excel(desired_path)
df_edu = pd.read_excel(desired_path_edu)
df_health = pd.read_excel(desired_path_health)
df_water = pd.read_excel(desired_path_water)


df_machine_all_sero = pd.concat([df_extinction, df_edu, df_health, df_water], axis=0)
df_machine_all_garo = pd.concat([df_extinction, df_edu], axis=1)



#%%

df_machine_all_garo_dropped = df_machine_all_garo.drop("행정구역(동읍면)별", axis=1)

#%%

df_machine_all_garo_1 = pd.concat([df_machine_all_garo_dropped, df_health, df_water], axis=1)


#%%

output_file_path = f"{base_dir}/머신러닝_RawData/machine_learning_basedata_v0.1.xlsx"

df_machine_all_garo_1.to_excel(output_file_path, index=False)


#%%

ranges = ['2015', '2016', '2017', '2018', '2019', '2020', '2021']

for range in ranges:
    desired_path = f"{base_dir}/머신러닝_RawData/업종/업종_{range}_전국.xlsx"
    df_name = f"df_sectors_{range}"
    globals()[df_name] = pd.read_excel(desired_path)
    df_name_drop = f"df_sectors_{range}_drop"
    globals()[df_name_drop] = globals()[df_name].drop(globals()[df_name].index[229:245])
    
#%%    
    
df_machine_all_sero = pd.concat([df_sectors_2015_drop, df_sectors_2016_drop, df_sectors_2017_drop, df_sectors_2018_drop, df_sectors_2019_drop, df_sectors_2020_drop, df_sectors_2021_drop], axis=0)
df_machine_all_garo = pd.concat([df_sectors_2015_drop, df_sectors_2016_drop, df_sectors_2017_drop, df_sectors_2018_drop, df_sectors_2019_drop, df_sectors_2020_drop, df_sectors_2021_drop], axis=1)
    

output_file_path = f"{base_dir}/머신러닝_RawData/업종종합_v0.1.xlsx"

df_machine_all_sero.to_excel(output_file_path, index=False)

#%%



df_machine_all = pd.concat([df_machine_2015, df_machine_2016, df_machine_2017, df_machine_2018, df_machine_2019, df_machine_2020, df_machine_2021], axis=0)

#%%

import pandas as pd

# 샘플 데이터프레임 생성
df1 = pd.DataFrame({
   'A': [1, 2, 3],
   'B': [4, 5, 6]
}, index=['a', 'b', 'c'])

df2 = pd.DataFrame({
   'C': [7, 8, 9],
   'D': [10, 11, 12]
}, index=['a', 'b', 'c'])

# 두 데이터프레임을 합치기
df_combined = pd.concat([df1, df2], axis=1)

print(df_combined)

#%%

import pandas as pd

# 샘플 데이터프레임 생성
df1 = pd.DataFrame({
   'A': [1, 2, 3],
   'B': [4, 5, 6]
}, index=['a', 'b', 'c'])

df2 = pd.DataFrame({
   'C': [7, 8, 9],
   'D': [10, 11, 12]
}, index=['a', 'b', 'c'])

# 인덱스를 열로 이동
df1_reset = df1.reset_index().rename(columns={'index': 'Index'})
df2_reset = df2.reset_index().rename(columns={'index': 'Index'})

# 두 데이터프레임을 합치기
df_combined = pd.merge(df1_reset, df2_reset, on='Index')

print(df_combined)

#%%

import pandas as pd
import os
from scipy.stats import pearsonr

ranges = ['2015', '2016', '2017', '2018', '2019', '2020', '2021']

base_dir = f"C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/상하수도보급률_{range}_전국.xlsx"

for range in ranges:
    desired_path = f"{base_dir}/머신러닝_RawData/상하수도보급률_{range}_전국.xlsx"
    df_name = f"df_machine_{range}"
    globals()[df_name] = pd.read_excel(desired_path)
        
#%%    
    
df_machine_2015 = df_machine_2015.drop('Unnamed: 4', axis=1)

#%%

df_machine_all = pd.concat([df_machine_2015, df_machine_2016, df_machine_2017, df_machine_2018, df_machine_2019, df_machine_2020, df_machine_2021], axis=0)


#%%

output_file_path = f"{base_dir}/머신러닝_RawData/상하수도종합.xlsx"


df_machine_all.to_excel(output_file_path, index=False)

#%%

import pandas as pd
import os
from scipy.stats import pearsonr

ranges = ['2015', '2016', '2017', '2018', '2019', '2020', '2021']

base_dir = f"C:/Users/YS702/Desktop/LAST_PROJECT/"

desired_path = f"{base_dir}/머신러닝_RawData/교육_{range}_전국.xlsx"

for range in ranges:
    desired_path = f"{base_dir}/머신러닝_RawData/교육_{range}_전국.xlsx"
    df_name = f"df_machine_{range}"
    globals()[df_name] = pd.read_excel(desired_path)
        
#%%


df_machine_all = pd.concat([df_machine_2015, df_machine_2016, df_machine_2017, df_machine_2018, df_machine_2019, df_machine_2020, df_machine_2021], axis=0)


#%%     

output_file_path = f"{base_dir}/머신러닝_RawData/교육종합.xlsx"


df_machine_all.to_excel(output_file_path, index=False)


#%%        
        
        # 원하는 경로와 폴더 이름 설정
        desired_path = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data"
        plus_folder_name = f"{air_name}_양의상관관계"  # 원하는 폴더 이름
        minus_folder_name = f"{air_name}_음의상관관계"  # 원하는 폴더 이름
        plus_corr = '양의상관관계'
        minus_corr = '음의상관관계'
        
        
#%%        
        if correlation_value > 0:
            os.makedirs(os.path.join(desired_path, plus_folder_name), exist_ok=True)
            output_file_path_utf_8 = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{city_name}/{city_name}_{air_name}_correlation(utf-8).csv"
            output_file_path_euc_kr = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{city_name}/{city_name}_{air_name}_correlation(euc-kr).csv"
            output_file_corr_path_utf_8 = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{air_name}_{plus_corr}/{city_name}_{air_name}_correlation(utf-8).csv"
            output_file_corr_path_euc_kr = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{air_name}_{plus_corr}/{city_name}_{air_name}_correlation(euc-kr).csv"
            
            # to_csv 함수를 사용하여 UTF-8 인코딩으로 CSV 파일 저장
            result_df.to_csv(output_file_path_utf_8, index=True, encoding='utf-8')
            result_df.to_csv(output_file_path_euc_kr, index=True, encoding='euc-kr')
            result_df.to_csv(output_file_corr_path_utf_8, index=True, encoding='utf-8')
            result_df.to_csv(output_file_corr_path_euc_kr, index=True, encoding='euc-kr')
    
        if correlation_value < 0:
            os.makedirs(os.path.join(desired_path, minus_folder_name), exist_ok=True)
            output_file_path_utf_8 = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{city_name}/{city_name}_{air_name}_correlation(utf-8).csv"
            output_file_path_euc_kr = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{city_name}/{city_name}_{air_name}_correlation(euc-kr).csv"
            output_file_corr_path_utf_8 = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{air_name}_{minus_corr}/{city_name}_{air_name}_correlation(utf-8).csv"
            output_file_corr_path_euc_kr = f"C:/Users/YS702/Desktop/LAST_PROJECT/대기질_인구밀도_산점도/{air_name}_도시별_Analytics_Data/{air_name}_{minus_corr}/{city_name}_{air_name}_correlation(euc-kr).csv"
            
            # to_csv 함수를 사용하여 UTF-8 인코딩으로 CSV 파일 저장
            result_df.to_csv(output_file_path_utf_8, index=True, encoding='utf-8')
            result_df.to_csv(output_file_path_euc_kr, index=True, encoding='euc-kr')
            result_df.to_csv(output_file_corr_path_utf_8, index=True, encoding='utf-8')
            result_df.to_csv(output_file_corr_path_euc_kr, index=True, encoding='euc-kr')
            
            
#%%
#실험실

import pandas as pd

# 예시 데이터프레임 생성
A = pd.DataFrame({'col1': [1, 2], 'col2': [3, 4]})
B = pd.DataFrame({'col1': [5, 6], 'col2': [7, 8]})

# 위아래로 결합
result = pd.concat([A, B], axis=0)

# 좌우로 결합
result_side_by_side = pd.concat([A, B], axis=1)

print(result)
print(result_side_by_side)

