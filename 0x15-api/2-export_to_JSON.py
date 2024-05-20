#!/usr/bin/python3
"""
Script that exports data in JSON format using the provided REST API.
"""

import json
import requests
import sys

if __name__ == "__main__":
    employee_id = int(sys.argv[1])
    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    response = requests.get(url)
    employee_name = response.json().get("username")

    todos_url = f"https://jsonplaceholder.typicode.com/todos"
    todos_response = requests.get(todos_url, params={"userId": employee_id})
    todos = todos_response.json()

    employee_data = []
    for task in todos:
        employee_data.append({
            "task": task.get("title"),
            "completed": task.get("completed"),
            "username": employee_name
        })

    json_data = {employee_id: employee_data}

    json_filename = f"{employee_id}.json"
    with open(json_filename, "w") as json_file:
        json.dump(json_data, json_file)
