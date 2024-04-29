# -*- coding: utf-8 -*-

# 이명박 대통령 연설문 총집합
def scrape_presidential_speech(speech_id):
    import requests
    from bs4 import BeautifulSoup

    from requests.adapters import HTTPAdapter
    from requests.packages.urllib3.util.retry import Retry
    
    base_url = "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid={}"
    url = base_url.format(speech_id)
    
    # Create a session with retry logic
    session = requests.Session()
    retry = Retry(connect=5, backoff_factor=0.5)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)

    try:
        r = session.get(url)
        r.raise_for_status()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching speech {speech_id}: {e}")
        return ""  # Return empty string if there's an error

    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return ""  # If speech is not found, return empty string
    else:
        print(f"Error fetching speech {speech_id}: Status code {r.status_code}")
        return ""  # If page cannot be fetched, return empty string

def save_to_excel(speeches, filename="이명박연설문총모음1.xlsx"):
    import pandas as pd
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

# n = 2000
start_id = 1310127
# end_id = start_id + n
end_id = 1310336

speeches = []
for speech_id in range(start_id, end_id + 1):
    speech = scrape_presidential_speech(speech_id)
    if len(speech) > 0:  # Check if speech length is greater than 0
        speeches.append(speech)

save_to_excel(speeches)

#%%

# id값 범위가 너무 넓고 불규칙해서 부득이하게 2개 범위로 나눔
def scrape_presidential_speech(speech_id):
    import requests
    from bs4 import BeautifulSoup

    from requests.adapters import HTTPAdapter
    from requests.packages.urllib3.util.retry import Retry
    
    base_url = "https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid={}"
    url = base_url.format(speech_id)
    
    # Create a session with retry logic
    session = requests.Session()
    retry = Retry(connect=5, backoff_factor=0.5)
    adapter = HTTPAdapter(max_retries=retry)
    session.mount('http://', adapter)
    session.mount('https://', adapter)

    try:
        r = session.get(url)
        r.raise_for_status()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching speech {speech_id}: {e}")
        return ""  # Return empty string if there's an error

    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        president_text = soup.find("td", class_="content")
        if president_text:
            return president_text.get_text(strip=True)
        else:
            return ""  # If speech is not found, return empty string
    else:
        print(f"Error fetching speech {speech_id}: Status code {r.status_code}")
        return ""  # If page cannot be fetched, return empty string

def save_to_excel(speeches, filename="이명박연설문총모음2.xlsx"):
    import pandas as pd
    df = pd.DataFrame({"연설문": speeches})
    df.to_excel(filename, index=False)

# n = 2000
start_id = 1330066
# end_id = start_id + n
end_id = 1331000

speeches = []
for speech_id in range(start_id, end_id + 1):
    speech = scrape_presidential_speech(speech_id)
    if len(speech) > 0:  # Check if speech length is greater than 0
        speeches.append(speech)

save_to_excel(speeches)