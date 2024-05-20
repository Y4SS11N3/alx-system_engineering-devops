#!/usr/bin/python3
"""
Script that exports data for all employees in JSON format using the provided
REST API.
"""

import json
import requests

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users"
    response = requests.get(url)
    users = response.json()

    todos_url = "https://jsonplaceholder.typicode.com/todos"
    todos_response = requests.get(todos_url)
    todos = todos_response.json()

    result = {}
    for user in users:
        user_id = user.get("id")
        username = user.get("username")
        user_todos = [todo for todo in todos if todo.get("userId") == user_id]

        user_data = []
        for task in user_todos:
            user_data.append({
                "username": username,
                "task": task.get("title"),
                "completed": task.get("completed")
            })

        result[user_id] = user_data

    json_filename = "todo_all_employees.json"
    with open(json_filename, "w") as json_file:
        json.dump(result, json_file)
