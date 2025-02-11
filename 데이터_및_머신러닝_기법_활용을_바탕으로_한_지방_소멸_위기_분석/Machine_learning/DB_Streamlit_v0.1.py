# -*- coding: utf-8 -*-
"""
Created on Thu Aug  1 10:39:44 2024

@author: YS702
"""
import streamlit as st
import pandas as pd
from sqlalchemy import create_engine

#%%
    
# 데이터베이스 연결 URL 형식
# DATABASE_URL = 'mysql+pymysql://username:password@localhost:3306/database'
DATABASE_URL = 'mysql+pymysql://shin:1234@192.168.71.233:3306/extinction'
engine = create_engine(DATABASE_URL)

#%%

# SQL 쿼리 정의
sql = "SELECT * FROM extinction.cofog_education"

education = pd.read_sql_query(sql, engine)



# 데이터 표시
st.write("## DB 데이터")
st.write(education)