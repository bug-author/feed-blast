'''
huggingface api puts a temporary ban on multipe api requets

- simple proxy rotation does not work

- decoded_summaries.pkl are the summaries generated from
  pegasus pre-trained transformer model from huggingface
  on google colab
  
- the pre trained model is around 2.2 GB so not sure how to host

- this is for testing and prototyping

- final solution should be a reasonable custom transformer or attention
  based implementation hosted 24/7
'''
import pickle
from pprint import pprint


def load_pkl():
    with open('./decoded_summaries.pkl', 'rb') as in_file:
        return pickle.load(in_file)


if __name__ == '__main__':
    decoded_summaries = load_pkl()
    pprint(decoded_summaries)
