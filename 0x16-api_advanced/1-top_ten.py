#!/usr/bin/python3
"""
A module that contains the function top_ten
"""
from requests import get


def top_ten(subreddit):
    """
    Queries the Reddit API and prints the titles of the
    first 10 hot posts listed for a given subreddit.
    """
    if subreddit is None or not isinstance(subreddit, str):
        print(None)
        return

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"User-Agent": "MyBot/0.0.1"}
    params = {"limit": 10}
    response = get(url, headers=headers, params=params, allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        try:
            for post in data["data"]["children"]:
                print(post["data"]["title"])
        except KeyError:
            print(None)
    else:
        print(None)
