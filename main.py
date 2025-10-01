import threading
import os
import json
import re


#1


def get_max(nums: list):
    print('Function get_max started.')

    output = max(nums)

    print(f'Function get_max stopped.}')
    return output


def get_min(nums: list):
    print('Function get_min started.')

    output = min(nums)

    print(f'Function get_min stopped.')
    return output


def get_nums():
    arg_nums = []

    while True:
        num = input('Enter a number to add to the list or click enter to finish: ').strip()

        if num == '':
            return arg_nums

        try:
            num = int(num)
        except TypeError as err:
            print(f'Please enter an integer number: {err}')
            continue

        arg_nums.append(num)


numbers = get_nums()

thread1 = threading.Thread(target=get_max, args=(numbers,))
thread2 = threading.Thread(target=get_min, args=(numbers,))

thread1.start()
thread2.start()


#2


def get_nums():
    arg_nums = []

    while True:
        num = input('Enter a number to add to the list or click enter to finish: ').strip()

        if num == '':
            return arg_nums

        try:
            num = int(num)
        except TypeError as err:
            print(f'Please enter an integer number: {err}')
            continue

        arg_nums.append(num)


def get_sum(nums: list):
    print('Function get_sum started.')

    output = sum(nums)

    print(f'Function get_sum stopped.\n'
          f'Total sum of the elements from the list: {output}')

    return output


def get_average(nums: list):
    print('Function get_average started.')

    output = sum(nums) / len(nums)

    print(f'Function get_average stopped.\n'
          f'Average value of the elements from the list: {output}')

    return output


numbers = get_nums()


thread1 = threading.Thread(target=get_sum, args=(numbers, ))
thread2 = threading.Thread(target=get_average, args=(numbers, ))

thread1.start()
thread2.start()


#3


def get_data_from_directory():
    directory_name = input('Please enter the full path to the file (including file itself): ')

    if not os.path.exists(directory_name):
        raise FileNotFoundError

    with open(directory_name, 'r', encoding='utf-8') as f:
        data = f.read()

    if not data:
        raise ValueError('File can not be empty.')

    data = data.split(', ')
    data = list(map(lambda element: int(element), data))

    print(f'Data from {directory_name} was saved.\n')
    return data


def get_even(nums: list):
    return list(filter(lambda num: num % 2 == 0, nums))


def get_odd(nums: list):
    return list(filter(lambda num: num % 2, nums))


def get_current_working_directory():
    return os.getcwd()


def save_even_nums_to_cwd(data: list):
    even_numbers = get_even(data)

    with open(f'{get_current_working_directory()}\\even_nums.json', 'w', encoding='utf-8') as f:
        json.dump(even_numbers, f, indent=2, ensure_ascii=False)

    print(f'Even numbers were saved. '
          f'Total amount: {len(even_numbers)}')


def save_odd_nums_to_cwd(data: list):
    odd_numbers = get_odd(data)

    with open(f'{get_current_working_directory()}\\odd_nums.json', 'w', encoding='utf-8') as f:
        json.dump(odd_numbers, f, indent=2, ensure_ascii=False)

    print(f'Odd numbers were saved. '
          f'Total amount: {len(odd_numbers)}')


numbers = get_data_from_directory()

thread1 = threading.Thread(target=save_even_nums_to_cwd, args=(numbers, ))
thread2 = threading.Thread(target=save_odd_nums_to_cwd, args=(numbers, ))

thread1.start()
thread2.start()


# 4


def get_full_path():
    full_path = input('Please enter an absolute path to the file: ')

    if not os.path.exists(full_path):
        raise FileNotFoundError

    return full_path


def open_file_and_search_word(full_path: str, search_word: str):
    with open(full_path, 'r', encoding='utf-8') as f:
        data = f.read().lower()

    all_matches = re.findall(search_word.lower(), data)

    print(f'Word {search_word} met {len(all_matches)} time(-s) in the {full_path}')
    return all_matches


path = get_full_path()
word = 'Hello'

thread1 = threading.Thread(target=open_file_and_search_word, args=(path, word))

thread1.start()