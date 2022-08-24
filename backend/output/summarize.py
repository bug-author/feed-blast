import time
import requests
import json


URL = "https://hf.space/embed/Alifarsi/news_summarizer/+/api/predict/"


def read_news():
    with open('news.json', 'r', encoding='utf8') as in_file:
        data = json.load(in_file)

    return data


def get_summary(article_url):
    r = requests.post(url=URL,
                      json={
                          "data": [
                              article_url
                          ]
                      }
                      )
    print(r.json())
    try:
        ret = r.json()['data'][0]
    except:
        ret = "FAILED"

    return ret


def summarize(data):
    for news_list in data.values():
        for news_article in news_list:
            news_url = news_article['link']
            summary = get_summary(news_url)
            time.sleep(5)
            news_article['summary'] = summary

    return data


def save_news(news):
    with open('./summarized_news.json', 'w', encoding='utf-8') as out_json:
        json.dump(news, out_json, ensure_ascii=False)


if __name__ == '__main__':
    data = read_news()
    summarized_news = summarize(data)
    save_news(summarized_news)
