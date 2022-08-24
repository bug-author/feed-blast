import json
import pickle


def read_news():
    with open('news.json', 'r', encoding='utf8') as in_file:
        data = json.load(in_file)

    return data


def read_summaries():
    with open('bart-large-cnn-generated-summaries.pkl', 'rb') as pkl_in:
        summaries = pickle.load(pkl_in)
        return summaries


def summarize(data, gen_summaries):
    i = 0
    for news_list in data.values():
        for news_article in news_list:
            news_url = news_article['link']
            summary = gen_summaries[i]
            news_article['summary'] = summary
            i += 1

    return data


def save_news(news):
    with open('./summarized_news.json', 'w', encoding='utf-8') as out_json:
        json.dump(news, out_json, ensure_ascii=False)


if __name__ == '__main__':
    data = read_news()
    gen_summaries = read_summaries()
    summarized_news = summarize(data, gen_summaries)
    save_news(summarized_news)
