# -*- coding: utf-8 -*-
"""
Created on Fri Apr 12 14:21:35 2024

@author: YS702
"""

import streamlit as st
from streamlit_folium import folium_static
import folium


selected_subpage = st.sidebar.radio("서브페이지 선택", ["서브페이지 1", "서브페이지 2"])

if selected_subpage == "서브페이지 1":
    st.title("서브페이지 1")
    # 서브페이지 1의 내용을 여기에 추가하세요.
elif selected_subpage == "서브페이지 2":
    st.title("서브페이지 2")


# 스트림릿 서브페이지 1
def page1():
    st.title("서브페이지 1")
    st.write("서브페이지 1 내용")

# 스트림릿 서브페이지 2
def page2():
    st.title("서브페이지 2")
    st.write("서브페이지 2 내용")

# 메인 페이지
def main():
    st.title("메인 페이지")
    
    # 클릭하면 서브페이지로 이동하는 마커 추가
    m = folium.Map(location=[37.5665, 126.9780], zoom_start=10)
    
    popup1 = folium.Popup("서울시청", parse_html=True)
    folium.Marker(location=[37.5665, 126.9780], popup=popup1, tooltip="서울시청", icon=folium.Icon(color='blue')).add_to(m)

    popup2 = folium.Popup("금강산", parse_html=True)
    folium.Marker(location=[38.6100, 125.7400], popup=popup2, tooltip="금강산", icon=folium.Icon(color='red')).add_to(m)
    
    folium_static(m)

# 페이지 라우팅
if 'page' not in st.session_state:
    st.session_state.page = 'main'

if st.session_state.page == 'page1':
    page1()
elif st.session_state.page == 'page2':
    page2()
else:
    main()
