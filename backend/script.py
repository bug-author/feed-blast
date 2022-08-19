import requests
from bs4 import BeautifulSoup
import html

HEADERS = {
    "User-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"
    }

RSS_FEED = "https://tribune.com.pk/feed/latest"

def fetch_rss(url):
    try:
        r = requests.get(url, headers=HEADERS)
        soup = BeautifulSoup(r.content, features='xml')
        
        news = soup.find_all("item")
        # print(soup)
        for i, n in enumerate(news):
            title = n.find('title').text
            link = n.find('link').text
            date = n.find('pubDate').text
            content = n.find('content:encoded').text
            image = n.find('image')
           
            # print(title)
            # print(link)
            # print(date)
            # print(html.unescape(content))
            print(list(image.children)[1]["src"])
            # print(f"Item Number: {i+1}")
            print("-"*50)

    except Exception as e:
        print(e)

fetch_rss(RSS_FEED)