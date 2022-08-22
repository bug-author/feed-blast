import datetime
import json
from urllib import response
import requests
from bs4 import BeautifulSoup
import html
import os


HEADERS = {
    "User-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"
    }


RSS_FEED = "https://tribune.com.pk/feed/latest"

def fetch_rss(url):
    all_news = []
    output_json = {}
    # {
    #     date: [
    #         {},
    #         {}, 
    #         {},
    #     ]
    # }

    try:
        r = requests.get(url, headers=HEADERS)
        soup = BeautifulSoup(r.content, features='xml')
        
        news = soup.find_all("item")
        
        for n in news:
            title = n.find('title').text
            link = n.find('link').text
            date = n.find('pubDate').text
            content = n.find('content:encoded').text
            image = n.find('image')
            
            article = {
                'headline' : str(title),
                'link' : str(link),
                'date_published' : str(date),
                'details' : str(html.unescape(content)),
                'image_url' : str(list(image.children)[1]["src"])
            }

            all_news.append(article) 

        current_timestamp = str(datetime.datetime.now())

        output_json[current_timestamp] = all_news

        return output_json
    except Exception as e: 
        return e



def save_to_test_locally(output):

    if 'output' not in os.listdir():
        os.mkdir('output')
    
    os.chdir('output')

    with open('news.json', 'a', encoding='utf-8') as out_json:
        json.dump(output, out_json, ensure_ascii=False)

if __name__ == "__main__":

    response = fetch_rss(RSS_FEED)

    if isinstance(response, dict):
        save_to_test_locally(response)
    else:
        print(response)