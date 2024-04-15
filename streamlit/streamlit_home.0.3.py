# -*- coding: utf-8 -*-
"""
Created on Tue Apr  9 12:19:15 2024

@author: YS702
"""

import streamlit as st
from PIL import Image
import folium
from streamlit_folium import folium_static



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
            image_file = 'C:/myPyScraping/project/streamlit/금강산피살1주일전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='이명박 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/금강산피살1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='이명박 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2008.07.04 반기문 UN 사무총장 방한 만찬사(이명박)")
            st.write("2008.07.10 F-15K 전력화 기념행사 축사(이명박)")
            st.write("2008.07.11 제18 국회 개원 연설(이명박)")
        
        if selected_subpage == "천안함 피격 사건":
            st.title("2010.03.26 천안함 피격사건 발생")
            st.subheader(" 천안함 피격사건에 관한 간략한 설명 ")
            st.write("2010년 3월 26일 밤 9시 22분 대한민국 백령도 남서쪽 약 1km 지점에서 포항급 초계함인 PCC-772 천안함이 초계임무 수행 도중 조선인민군 해군 연어급 잠수정의 어뢰에 공격당해 선체가 반파되며 침몰한 사건이다. 피격 이후 인근 지역에서 작전 중이던 포항급 초계함인 PCC-778 속초함과 백령도 등지의 참수리급 고속정, 해경 함정에 의해 58명이 현장에서 구조되었으며 46명이 전사하였다. 이후 수색작전 중 3월 30일 한주호 준위가 잠수병으로 순직했고 4월 3일 천안함 수색을 돕던 쌍끌이 민간어선 98금양호가 상선과 충돌해 2명이 사망하고 7명이 실종되어 직/간접적으로 10명의 사망/실종자가 발생하였다. 천안함은 제1연평해전에 참가했던 함선이기도 하며, 실종·사망한 승조원 46명 중에는 제2연평해전에 참전해 부상을 입었던 박경수 중사도 포함되어 있다. 관련 속보 4월 15일 해저에 있던 천안함의 함미가 인양되었으며 4월 24일에는 함수가 인양되었다. 5월 20일 대한민국 국방부와 대한민국 정부는 침몰 당시 북한과 관계 없다고 발표하였지만 이후 그 원인에 대해 민군합동조사단 및 국제조사단의 조사를 거쳐 '북한 연어급 잠수함의 어뢰 공격'임을 확인하고 북한을 규탄하였다. 북한군에 대한 초계 대응에 실패하여 북한 잠수정이 남한의 바다에 침투하는 것을 허용해 버렸고 그 결과 어뢰 공격을 당해 침몰했다는 것이다.")
            image_file = 'C:/myPyScraping/project/streamlit/천안함피격1주일전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='이명박 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/천안함피격1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='이명박 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2010.03.22 제37차 라디오, 인터넷 연설 - 김수환 추기경과 법정 스님의 가르침을 잊지 않겠습니다.(이명박)")
            st.write("2010.03.25 천주교 춘천교구 김운회 교구장 착좌식 축하 메시지(이명박)")
        
        if selected_subpage == "연평도 포격전":
            st.title("2008.11.23 연평도 포격전 발생")
            st.subheader(" 연평도 포격전에 관한 간략한 설명 ")
            st.write("2010년 11월 23일 오후 2시 34분부터 대한민국의 영토인 연평도를 북한군이 선전포고도 없이 포격하는 것으로 시작된 전투. 또한 정전 협정 이래 최초로 발생한 민간 거주구역에 대한 공격이기도 하다. 이전까지의 군사적 도발과는 달리 민간인 거주지역이 포격을 당했고 군인은 물론 민간인 사망자까지 나온 상황이었기에 조금만 수습이 늦었어도 휴전이 깨질 수도 있었던 일촉즉발의 상황이었다.")
            image_file = 'C:/myPyScraping/project/streamlit/연평도포격1주일전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='이명박 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/연평도포격1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='이명박 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2010.11.15 제52차 라디오, 인터넷 연설 - G20 성공은 국민의 성공, 대한민국의 성공(이명박)")
        
    elif selected_subpage == "박근혜 대통령":
        selected_subpage = st.sidebar.radio("사건별 선택", ["DMZ 목함지뢰 매설 사건", "서부전선 포격 사건"])
        if selected_subpage == "DMZ 목함지뢰 매설 사건":
            st.title("2015.08.04 DMZ 목함지뢰 매설 사건 발생(설치추정일자 2015.07.26 ~ 2015.08.01)")
            st.subheader(" 남북공동연락 사무소 폭파사건에 관한 간략한 설명 ")
            st.write("2015년 8월 4일, 경기도 파주시 대한민국 육군 제1보병사단 예하 수색대대 부사관(하사) 2명이 비무장지대의 아군 추진철책 통로에서 북한군의 목함지뢰를 밟아 중상을 입은 사건.(설치 추정날짜는 2015.07.26~2015.08.01로 추정날짜로 부터 연설문 분석함.)")
            image_file = 'C:/myPyScraping/project/streamlit/목함지뢰2주전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='박근혜 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/목함지뢰2주전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='박근혜 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2015.07.21 인천 창조경제혁신센터 출범식(박근혜)")
            st.write("2015.07.23 몽골 민주화 25주년 기념행사(박근혜)")
            st.write("2015.07.23 제 15회 걸스카우트 국제야영 개영식(박근혜)")
            
        if selected_subpage == "서부전선 포격 사건":
            st.title("2015.08.20 서부전선 포격 사건 발생")
            st.subheader(" 서부전선 포격 사건에 관한 간략한 설명 ")
            st.write("조선인민군 육군이 2015년 8월 20일 오후 3시 52분경, 대한민국 경기도 연천군에 소재한 대한민국 육군 제28보병사단 지역에 있는 우리 측 대북 확성기를 목표로 하여 포격을 가한 사건이다. 이 사건으로 인해 연천군 일대에 진돗개 하나가 발령되었고 전군에 최고경계태세가 내려졌다. 연평도 포격전 이후 5년 만에 북한이 대한민국이 실효지배하는 곳에 직접적인 포격을 가한 사건이자, 1973년 이후 42년 만에 처음으로 북한이 도서지역을 제외한 남한 본토에 직접적인 포격을 가한 사건이었다. 최고의 경계태세가 내려진 끝에 조금만 지체되었어도 정말로 전쟁이 터질 뻔한 위기일발의 상황이었다.")
            image_file = 'C:/myPyScraping/project/streamlit/서부전선포격1주일전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='박근혜 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/서부전선포격1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='박근혜 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2015.08.14 제70주년 광복절 중앙경축식(박근혜)")   
        
        
    elif selected_subpage == "문재인 대통령":
        selected_subpage = st.sidebar.radio("사건별 선택", ["남북공동연락사무소 폭파사건", "서해 공무원 피살 사건"])
        if selected_subpage == "남북공동연락사무소 폭파사건":
            st.title("2020.06.16 남북공동연락 사무소 폭파사건 발생")
            st.subheader(" 남북공동연락 사무소 폭파사건에 관한 간략한 설명 ")
            st.write("2020년 6월 16일 오후 2시 49분경 북한 김정은 정권이 개성공단 내 남북공동연락사무소를 무단 폭파한 사건. 2018 제1차 남북정상회담 및 제7차 남북고위급회담 합의에 따라 대한민국 문재인 정부가 건설비용 약 180억 원을 전액 지불, 유지비와 사용료 포함, 총 235억 원 상당을 들여 북한 개성시에 세운 남북공동연락사무소를 북한이 폭파하겠다며 일방적으로 협박 통보한 지 사흘 뒤에 일어났다. 이는 북한이 판문점 선언과 9.19 군사합의를 사실상 파기했음을 의미한다. 철거 기술이 부족한 북한은 이 건물 하나를 폭파철거하는 데만 폭약을 엄청나게 때려박아 사용하였고, 그 까닭에 연락사무소 바로 옆에 있는 2007년 참여정부 시기에 지어진 개성공단 종합지원센터도 심각하게 훼손되었다.")
            image_file = 'C:/myPyScraping/project/streamlit/연락사무소폭파1주일전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='문재인 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/연락사무소폭파1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='문재인 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2020.06.09 제30회 국무회의(문재인)")
            st.write("2020.06.10 제33주년 6.10 민주항쟁 기념식(문재인)")
            st.write("2020.06.10 가봉 해상 피랍 국민 무사귀환 관련 메시지(문재인)")
            st.write("2020.06.15 수석.보좌관회의(문재인)")        
            st.write("2020.06.15 6.15남북공동선언 20주년 기념식 영상 축사(문재인)")        
        
        if selected_subpage == "서해 공무원 피살 사건":
            st.title("2020.09.21 서해 공무원 피살 사건 발생")
            st.subheader(" 서해 공무원 피살 사건에 관한 간략한 설명 ")
            st.write("2020년 9월 22일 밤에  서해 소연평도 인근 해역에서 어업지도활동을 하던 해양수산부 어업관리단 소속 전라남도 목포시 공무원인 남성 이대준씨가 연평도 인근 해역에서 실종되어, 실종 지점에서 북서쪽으로 38km 떨어진 북방한계선 이북의 북한 황해남도 강령군 등산곶 해안에서 조선인민군의 총격에 숨진 사건이다. 시신은 발견되지 않았다. 2020년 당시 정부였던 문재인 정부는 자진 월북으로 판단된다고 발표했지만, 2022년 6월 윤석열 정부에서 해경과 국방부는 월북 시도를 입증할 만한 증거가 없다며 2년 여만에 결과를 번복하였다. 2023년 12월 7일 감사원은 문재인 정부가 조직적으로 해당 사건을 은폐 및 조작한 혐의가 사실이라고 발표했다.")
            image_file = 'C:/myPyScraping/project/streamlit/공무원피살1주일전부터_bar.png'
            image_local = Image.open(image_file)
            st.image(image_local, width=850, caption='문재인 대통령 연설문 분석')
            
            image_file2 = 'C:/myPyScraping/project/streamlit/공무원피살1주일전부터_wc.png'
            image_local2 = Image.open(image_file2)
            st.image(image_local2, width=750, caption='문재인 대통령 연설문 분석')
            
            st.subheader("사용된 연설문")
            st.write("2020.09.14 수석.보좌관회의(문재인)")
            st.write("2020.09.14 해양경찰 격려 메시지(문재인)")
            st.write("2020.09.16 메이 전 영국 총리 접견(문재인)")
            st.write("2020.09.17 한국판 뉴딜 현장 방문 창원 스마트그린 산업단지(문재인)")        
            st.write("2020.09.18 한국불교 지도자 초청 간담회(문재인)") 
            st.write("2020.09.19 9.19 평양공동선언 2주년 기념 메시지(문재인)")        
            st.write("2020.09.19 제 1회 청년의 날 기념식(문재인)")        

elif selected_page == "지도":
    st.write("이곳은 사건들을 지도에 표시해놓은 페이지입니다.")
    def main():
        # Streamlit 앱의 제목 설정
        st.title("지도에 사건들 표시하기")

        # Folium을 사용하여 맵 생성
        m = folium.Map(location=[37.5665, 126.9780], zoom_start=6)  # 서울을 중심으로 맵 생성

        # 위치를 표시할 마커 추가
        popup1 = folium.Popup("2010.11.23 연평도 포격전", parse_html=True)
        folium.Marker(location = [37.66667, 125.69639], popup=popup1).add_to(m)
        folium.Marker(location = [38.4856974, 128.0201249], popup="2008.7. 11.금강산 관광객 피살 사건").add_to(m)
        folium.Marker(location = [37.9167, 124.6167], popup="2010.03.26 천안함 피격 사건").add_to(m)
        folium.Marker(location = [37.97517115413078, 126.75246446613146], popup="2015.08.04 DMZ 목함지뢰 매설 사건").add_to(m)
        folium.Marker(location = [38.23531848251452, 127.0448995145359], popup="2015.08.20 서부전선 포격 사건").add_to(m)
        folium.Marker(location = [37.65, 125.7167], popup="2020.06.16 남북공동연락사무소 폭파 사건").add_to(m)
        folium.Marker(location = [37.65, 125.7167], popup="2020.09.21 서해 공무원 피살 사건").add_to(m)
        # Folium 맵을 Streamlit에 표시
        folium_static(m)

    if __name__ == "__main__":
        main()
    

    



