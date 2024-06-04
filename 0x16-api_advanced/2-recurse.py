#!/usr/bin/python3
"""
A module that contains the function recurse
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Queries the Reddit API recursively and returns a list containing
    the titles of all hot articles for a given subreddit.
    """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"User-Agent": "MyBot/0.0.1"}
    params = {"limit": 100, "after": after}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        hot_list += [post["data"]["title"]
                     for post in data["data"]["children"]]
        after = data["data"]["after"]
        if after is not None:
            return recurse(subreddit, hot_list, after)
        return hot_list
    else:
        return None
