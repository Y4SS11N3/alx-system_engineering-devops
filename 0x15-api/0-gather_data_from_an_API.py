#!/usr/bin/python3

"""
Script that returns information about an employee's TODO list progress
using the provided REST API.
"""

import requests
import sys

if __name__ == "__main__":
    employee_id = int(sys.argv[1])
    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    response = requests.get(url)
    employee_data = response.json()
    employee_name = employee_data.get("name")

    todos_url = f"https://jsonplaceholder.typicode.com/todos"
    todos_response = requests.get(todos_url, params={"userId": employee_id})
    todos = todos_response.json()

    total_tasks = len(todos)
    completed_tasks = [todo for todo in todos if todo.get("completed")]
    done_tasks = len(completed_tasks)

    print(
        f"Employee {employee_name} is done with tasks "
        f"({done_tasks}/{total_tasks}):"
    )
    for task in completed_tasks:
        print(f"\t {task.get('title')}")
