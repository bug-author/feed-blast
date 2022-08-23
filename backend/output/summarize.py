import requests
import json

with open('news.json', 'r', encoding='utf8') as in_file:
    data = json.load(in_file)


print(data)