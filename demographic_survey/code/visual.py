# -*- coding: utf-8 -*-
"""
Created on Sat May 25 03:32:31 2024

@author: pjc62
"""
def reg():
    import matplotlib.font_manager as fm
    import os

    user_name = os.getlogin()

    fontpath = [f'C:/Users/{user_name}/AppData/Local/Microsoft/Windows/Fonts']
    font_files = fm.findSystemFonts(fontpaths=fontpath)
    for fpath in font_files:
        
        fm.fontManager.addfont(fpath)
'''
시각화 - 이미지 저장
'''
def make_charts(loc):
    import pandas as pd
    
    # 전처리 파일 로드
    folder_path = "./data/result/"
    file = '{}_월별_평균거래가_이동데이터.xlsx'.format(loc)
    df = pd.read_excel(folder_path+file, index_col=0)
    
    corr = df.corr()
    
    corr_order = df.corr().loc['총전입 (명)':,'평균가'].abs().sort_values(ascending=False)
    corr_order
    
    import matplotlib.pyplot as plt
    import seaborn as sns
    
    plt.rc('font', family='NanumBarunGothic')
    plt.rcParams['figure.dpi'] = 140
    reg()
    
    # 이미지 저장할 폴더
    img_path = './img/'
    
    # 상관계수 히트맵
    plt.figure(figsize=(20, 20))  # 그래프 크기 설정
    
    sns.heatmap(data=corr, annot=True, 
                fmt='.2f', linewidths=.5, cmap='Blues', 
                annot_kws={"size": 20})  # 상관 계수 글꼴 크기 확대
    
        # x축, y축 레이블 크기 조정
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    plt.savefig(img_path + '{}_상관계수_히트맵.png'.format(loc))
    plt.show()
    
    # 월평균가 분포
    sns.displot(x='평균가',kind='hist', data=df)
    plt.savefig(img_path + '{}_월평균가_분포도.png'.format(loc))
    plt.show()
    
    
    
    '''
    피처 스케일링
    '''
    from sklearn.preprocessing import MinMaxScaler
    scaler=MinMaxScaler()
    
    df_scaled = df.iloc[:,:]
    scaler.fit(df_scaled)
    df_scaled = scaler.transform(df_scaled)
    
    df.iloc[:, :] = df_scaled[:,:]
    df.head()
    
    
    df.index = df.index.astype(str).map(lambda x: x + '0' if len(x) < 7 else x) # 10월 처리
    df.index = df.index.str[2:4]+ df.index.astype(str).str[4:] # x축 변환
    # 선 그래프 그리기
    plt.figure(figsize=(16,10))
    
    fig, ax = plt.subplots(figsize=(16,8))
    ax.plot(df.index, df['평균가'], label='월평균가')
    ax.plot(df.index, df['순이동 (명)'],label='순이동')
    
    ax.legend()
    ax.set_title('{} 월평균가/순이동 추이'.format(loc))
    plt.xticks(range(0,135,3),df.index[::3],rotation=45)
    fig.savefig(img_path + '{}_월평균-순이동_추이.png'.format(loc))
    fig.show()
    
    
    # 선 그래프 그리기
    plt.figure(figsize=(16,10))
    
    fig, ax = plt.subplots(figsize=(16,8))
    ax.plot(df.index, df['평균가'], label='월평균가')
    ax.plot(df.index, df['총전입 (명)'],label='전입',color='green')
    
    ax.legend()
    ax.set_title('{} 월평균가/전입 추이'.format(loc))
    plt.xticks(range(0,135,3),df.index[::3],rotation=45)
    fig.savefig(img_path + '{}_월평균-전입_추이.png'.format(loc))
    fig.show()
    
    # 선 그래프 그리기
    plt.figure(figsize=(16,10))
    
    fig, ax = plt.subplots(figsize=(16,8))
    ax.plot(df.index, df['평균가'], label='월평균가')
    ax.plot(df.index, df['총전출 (명)'], label='전출', color='red')
    
    ax.legend()
    ax.set_title('{} 월평균가/전출 추이'.format(loc))
    plt.xticks(range(0,135,3),df.index[::3],rotation=45)
    fig.savefig(img_path + '{}_월평균-전출_추이.png'.format(loc))
    fig.show()
    
    # 선 그래프 그리기
    plt.figure(figsize=(16,10))
    
    fig, ax = plt.subplots(figsize=(16,8))
    ax.plot(df.index, df['평균가'], label='월평균가')
    ax.plot(df.index, df['시도내이동-시군구내 (명)'], label='시도내이동-시군구내', color='violet')
    
    ax.legend()
    ax.set_title('{} 월평균가/시도내이동 추이'.format(loc))
    plt.xticks(range(0,135,3),df.index[::3],rotation=45)
    fig.savefig(img_path + '{}_월평균-시도내이동_추이.png'.format(loc))
    fig.show()