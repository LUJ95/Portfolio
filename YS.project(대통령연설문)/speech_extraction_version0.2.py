# -*- coding: utf-8 -*-
"""
Created on Mon Apr  8 15:04:38 2024

@author: YS702
"""

import requests

url = "https://www.pa.go.kr/research/contents/speech/index."
speech = "jsp?spMode=view&catid=c_pa02062&artid="
number = "1330298"

html = url+speech+number

r = requests.get(html)
soup = BeautifulSoup(r.text, "html.parser")
president_text = soup.find("td", class_="content")

print(president_text)        