#!/usr/bin/python3
"""
A module that contains the function count_words
"""
import requests


def count_words(subreddit, word_list, after=None, count={}):
    """
    Queries the Reddit API recursively and returns a dictionary containing
    the counts of given keywords found in the titles of all hot articles
    for a given subreddit.
    """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"User-Agent": "MyBot/0.0.1"}
    params = {"limit": 100, "after": after}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        posts = data["data"]["children"]

        for post in posts:
            title = post["data"]["title"].lower()
            for word in word_list:
                count[word] = count.get(word, 0) + title.split().count(word)

        after = data["data"]["after"]
        if after is not None:
            return count_words(subreddit, word_list, after, count)

        sorted_count = sorted(count.items(), key=lambda x: (-x[1], x[0]))
        for word, frequency in sorted_count:
            if frequency > 0:
                print("{}: {}".format(word, frequency))
    else:
        return None
