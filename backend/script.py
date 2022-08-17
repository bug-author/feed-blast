import requests
from bs4 import BeautifulSoup

HEADERS = {
    "User-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"
    }

RSS_FEED = "https://en.dailypakistan.com.pk/rss/local-news"

def fetch_rss(url):
    try:
        r = requests.get(url, headers=HEADERS)
        soup = BeautifulSoup(r.content, features='xml')
        
        news = soup.find_all("item")
        # print(soup)
        for n in news:
            title = n.find('title').text
            link = n.find('link').text
            description = n.find('description').text
            media = n.find('media:thumbnail')
            print(title)
            print(link)
            print(description)
            if media:
                print(media['url'])
            print("-"*50)

    except Exception as e:
        print(e)

fetch_rss(RSS_FEED)