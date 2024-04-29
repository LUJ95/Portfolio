# -*- coding: utf-8 -*-
"""
Created on Mon Apr  8 15:02:32 2024

@author: YS702
"""

import requests

base_url = "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1310351"

r = requests.get(base_url)
soup = BeautifulSoup(r.text, "html.parser")
president_text = soup.find("td", class_="content")
       

print(president_text)