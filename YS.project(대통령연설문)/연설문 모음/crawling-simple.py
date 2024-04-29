# -*- coding: utf-8 -*-

# 1401641
# 1310440
# 8980개

#%%

# 제2연평해전
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1309257",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1309258",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1309260",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1309259",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1309262",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1309261"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 금강산 관광객 피살 사건
# 사건이 오전 5시에 일어났으므로 당일 연설문은 제외
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1310208",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1310209"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 천안함 피격 사건
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1330395",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1330298"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 연평도 포격 사건
# 표본이 1개밖에 없는 데다가 8일전 연설문임
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1330411"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 목함지뢰 매설 사건
# 사건의 특성 상 범위를 넓혀서 
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1400325",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1400326",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1400327"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 서부전선 포격 사건
# 표본이 1개밖에 존재하지 않음
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1400332"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 연락망 폭파 사건
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401939",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401216",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401215",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401940",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401217"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)

#%%

# 공무원 피살 사건
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_presidential_speech(base_url):
    r = requests.get(base_url)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return "연설문을 찾을 수 없습니다."
    else:
        return "페이지를 가져올 수 없습니다."

def save_to_excel(speeches, filename="presidential_speeches.xlsx"):
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

base_urls = [
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401955",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401258",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401259",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401260",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401261",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401262",
    "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1401263"
    ]

speeches = []
for url in base_urls:
    speech = scrape_presidential_speech(url)
    speeches.append(speech)

save_to_excel(speeches)