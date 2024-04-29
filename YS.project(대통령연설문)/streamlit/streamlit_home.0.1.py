# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 12:19:15 2024

@author: YS702
"""

import streamlit as st
from PIL import Image



st.title("[분전팀], 대통령 연설문 분석, 2002~2020년 북한 주요도발 사건을 중심으로")

st.sidebar.title("메뉴")
selected_page = st.sidebar.radio("페이지 선택", ["홈으로", "대통령", "지도", "날짜","사건명"])

if selected_page == "홈으로":
    st.write("이곳은 홈입니다.")
    st.subheader("- 홈으로: 홈으로 이동합니다.")
    st.subheader("- 대통령: 대통령을 기준으로 정보를 나눕니다.")
    st.subheader("- 지도: 지도를 기준으로 사건을 나눕니다.")
    st.subheader("- 날짜: 날짜를 기준으로 사건을 나눕니다")
    st.subheader("- 사건명: 사건명을 기준으로 사건을 나눕니다")
elif selected_page == "대통령":
    st.sidebar.subheader("대통령 하위 페이지")
    selected_subpage = st.sidebar.radio("대통령 선택", ["김대중 대통령", "이명박 대통령","박근혜 대통령", "문재인 대통령"])
    if selected_subpage == "김대중 대통령":
        st.title("2002.06.29 북 경비정 NLL 침범, 제2 연평해전 발생")
        st.subheader(" 제2 연평해전에 관한 간략한 설명 ")
        st.write("제2연평해전(第二延坪海戰)은 2002년 6월 29일 연평도 근해 북방한계선 부근 해상에서 일어난 남북한 간의 군사적 충돌이다. 대한민국 해군 고속정에 대한 북한 해군 경비정의 기습 공격으로 시작되어 30분가량 진행된 이 전투에서 양측 모두 피해를 입었다. 북한군의 선제 공격을 당한 대한민국 해군의 참수리 357호는 교전 후 예인도중 침몰하였고, 정장을 포함한 승무원 6명이 전사하고 18명이 부상당하는 인명피해를 겪었다. 조선인민군 해군소속 등산곶 684호도 대한민국 해군의 반격으로 전투후 상당한 피해를 입고 예인됐다. 제2연평해전으로 조선인민군 해군 13명이 전사하고, 25명이 부상당했다.2002년 한일 월드컵 열기로 들떠있던 와중에 일어난 역사적 사료에 기록된 사건으로 대한민국 내에서는 서해 북방한계선 침범시 차단 기동에 대한 논란이 일었으며, 이후 차단기동은 교전수칙에서 삭제되었다.")
        image_file = 'C:/myPyScraping/project/streamlit/제2연평해전1주일전부터_bar.jpg'
        image_local = Image.open(image_file)
        st.image(image_local, width=850, caption='김대중 대통령 연설문 분석')
        
        image_file2 = 'C:/myPyScraping/project/streamlit/제2연평해전1주일전부터_wc.png'
        image_local2 = Image.open(image_file2)
        st.image(image_local2, width=750, caption='김대중 대통령 연설문 분석')
        
        st.subheader("사용된 연설문")
        st.write("2002.06.23 햇볕정책과 한반도 평화정착(김대중)")
        st.write("2002.06.23 한반도에 불고 있는 긍정적 변화(김대중)")
        st.write("2002.06.24 참전용사들의 희생과 헌신이 아니었다면(김대중)")
        st.write("2002.06.24 화해자로서의 아시아(김대중)")
        st.write("2002.06.28 행동과 인내(김대중)")
        st.write("2002.06.28 한국 언론의 위상(김대중)")
        
        
    elif selected_subpage == "이명박 대통령":
        selected_subpage = st.sidebar.radio("사건별 선택", ["금강산 관광객 피살사건", "천안함 피격 사건","연평도 포격전"])
        if selected_subpage == "금강산 관광객 피살사건":
            st.title("2008.07.11 금강산 관광객 피살사건 발생")
            st.subheader(" 금강산 관광객 피살사건에 관한 간략한 설명 ")
            st.write("금강산 관광객 피격 사망 사건은 2008년 7월 11일 오전 4시 50분경 조선민주주의인민공화국 금강산관광지구에서 53세의 대한민국 국적 여성 관광객 박왕자 씨가 조선인민군에 의해 피살된 사건이다. 조선민주주의인민공화국 측은 피살자가 군사 경계지역을 침범하였다고 주장했다. 시신을 부검한 의료진은 인민군 초병이 무방비 상태의 민간인인 피살자를 등 뒤에서 조준사격했을 가능성이 높다고 발표했다.")
            image_file = 'C:/myPyScraping/project/streamlit/금강산피살1주일전부터_bar.jpg'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='이명박 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/금강산피살1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='이명박 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2008.07.04 반기문 UN 사무총장 방한 만찬사(이명박)")
            st.write("2008.07.10 F-15K 전력화 기념행사 축사(이명박)")
            st.write("2008.07.11 제18 국회 개원 연설(이명박)")
        
    elif selected_subpage == "박근혜 대통령":
        st.write("박근혜 대통령")
    elif selected_subpage == "문재인 대통령":
        st.write("문재인 대통령")

elif selected_page == "지도":
    st.write("이곳은 지도 페이지입니다.")
elif selected_page == "날짜":
    st.write("이곳은 날짜 페이지입니다.")
elif selected_page == "사건명":
    st.write("이곳은 사건명 페이지입니다.")
    

