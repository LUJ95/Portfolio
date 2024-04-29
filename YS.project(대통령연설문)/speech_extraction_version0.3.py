# -*- coding: utf-8 -*-
"""
Created on Mon Apr  8 15:05:47 2024

@author: YS702
"""

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