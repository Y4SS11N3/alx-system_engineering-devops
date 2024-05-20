#!/usr/bin/python3

'''Script to retrieve employee TODO list progress from an API.'''

import re
import requests
import sys

API_BASE_URL = 'https://jsonplaceholder.typicode.com'
'''Base URL of the API.'''

if __name__ == '__main__':
    if len(sys.argv) > 1:
        if re.fullmatch(r'\d+', sys.argv[1]):
            employee_id = int(sys.argv[1])
            employee_url = f'{API_BASE_URL}/users/{employee_id}'
            employee_res = requests.get(employee_url).json()
            tasks_url = f'{API_BASE_URL}/todos'
            tasks_res = requests.get(tasks_url).json()
            employee_name = employee_res.get('name')
            employee_tasks = [
                task for task in tasks_res
                if task.get('userId') == employee_id
            ]
            completed_tasks = [
                task for task in employee_tasks if task.get('completed')
            ]

            print(f'Employee {employee_name} is done with tasks'
                  f'({len(completed_tasks)}/{len(employee_tasks)}):')
            for task in completed_tasks:
                print(f'\t {task.get("title")}')
