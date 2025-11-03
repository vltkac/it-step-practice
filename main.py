# 1. Напишіть програму, яка приймає два цілих числа від
# користувача і виводить суму діапазону чисел між ними.

# def get_range_sum(verbose=True):
#     try:
#         first_num = int(input('Please enter first number: '))
#         second_num = int(input('Please enter second number: '))
#     except ValueError:
#         print('Please enter integer')
#         return
#
#     output = sum(range(first_num, second_num + 1))
#
#     if verbose:
#         print(f'Sum of the range ({first_num}, {second_num}) {output}')
#
#     return output

# 2. Напишіть програму, для знаходження суми всіх парних
# чисел від 1 до 100.

# total = 0
#
# for num in range(1, 101):
#     if num % 2 == 0:
#         total += num
#
# print(total)

# 3. Напишіть програму, яка приймає рядок від користувача і
# виводить кожну літеру рядка на окремому рядку.

# user_string = input('Please enter something: ')
#
# for char in user_string:
#     print(char)

# 4. Напишіть програму, яка створює список цілих чисел та
# виводить новий список, який містить лише парні числа з
# вихідного списку.

# from random import randint
#
#
# numbers_count = int(input('Please enter the length of the list: '))
#
# numbers = []
#
# for _ in range(numbers_count):
#     numbers.append(randint(0, 100))
#
# numbers = list(filter(lambda n: n % 2 == 0, numbers))
#
# print(numbers)

# 5. Напишіть функцію, яка приймає список рядків від
# користувача і повертає новий список, що містить лише
# рядки, що починаються з великої літери.


# capital_strings = []
#
# while True:
#     user_input = input('Write something. To stop click ENTER: ').strip()
#
#     if not user_input:
#         break
#
#     if user_input[0].isupper():
#         capital_strings.append(user_input)
#
# print(capital_strings)

# 6. Напишіть функцію, яка приймає список рядків від
# користувача і повертає новий список, що містить лише
# рядки, які містять слово "Python".

# import re
#
#
# python_strings = []
#
# while True:
#     user_input = input('Write something. To stop click ENTER: ').strip()
#
#     if not user_input:
#         break
#
#     if re.findall(r'\bPython\b', user_input):
#         python_strings.append(user_input)
#
# print(python_strings)

# 7. (додаткове на кристалики) Напишіть програму, яка
# створює словник, де ключами є слова, а значеннями - їхні
# визначення. Дозвольте користувачу додавати, видаляти
# та шукати слова у цьому словнику.

# encyclopedia = {}
#
# while True:
#     print('To add the word and its definition click (1)\n'
#           'To remove the word and its definition click (2)\n'
#           'To search the word and its definition click (3)\n'
#           'To exit click (4) \n')
#
#     user_choice = input().strip()
#
#     if user_choice == '1':
#         new_word = input('Please enter a new word: ').strip().capitalize()
#         definition = input('Please enter a word\'s definition: ').strip()
#
#         encyclopedia[new_word] = definition
#
#         print(f'\nThe word {new_word} was added\n')
#     elif user_choice == '2':
#         remove_word = input('Please enter a word to remove: ').strip().capitalize()
#         try:
#             encyclopedia.pop(remove_word)
#         except KeyError:
#             print('No such word was found')
#             continue
#
#         print(f'\nThe word {remove_word} was removed\n')
#     elif user_choice == '3':
#         search_word = input('Please enter a word: ').strip().capitalize()
#
#         try:
#             print(f'{search_word} --- {encyclopedia[search_word]}')
#         except KeyError:
#             print('\nNo such word was found\n')
#     elif user_choice == '4':
#         print('Thank you for usage')
#         break
#     else:
#         print('Wrong option')

# 8. (додаткове на кристалики)Використовуючи лямбдафункцію, напишіть вираз, який сортує список кортежів
# за другим елементом кожного кортежу (наприклад, [(1,
# 3), (3, 2), (2, 1)]).

# def sort_tuples_by_second_element(data: list):
#     return sorted(data, key=lambda pair: pair[1])


# OOP
# from datetime import datetime
#
#
# websites = set()
#
#
# class WebPage:
#     def __init__(self, page_title: str, page_content: str):
#         self.page_title = page_title
#         self.page_content = page_content
#         self.date_of_publication = datetime.now().date()
#
#         print('\nNew page was created\n')
#
#     def display_page_info(self):
#         print(f'\nPage title: {self.page_title}. Page content: {self.page_content}. Date of the publication: {self.date_of_publication}\n')
#
#
# class WebSite:
#     def __init__(self, dns: str, url: str):
#         self.dns = dns
#         self.url = url
#         self.pages = []
#
#         print('\nNew site was created\n')
#
#     def _get_all_pages_names(self):
#         return [page.page_title for page in self.pages]
#
#     def display_site_info(self):
#         print(f'\nWebSite name: {self.dns}. URL: {self.url}. Pages: {', '.join(self._get_all_pages_names())}\n')
#
#     def add_new_page(self, page: WebPage):
#         self.pages.append(page)
#         print('\nPage was added\n')
#
#     def remove_page(self, page: WebPage):
#         self.pages.remove(page)
#         print('\nPage was removed\n')
#
#
# while True:
#     print('To create a new WebSite click (1)\n'
#           'To add a new page to the WebSite (2)\n'
#           'To remove a page from the WebSite (3)\n'
#           'To display info about WebSite click (4)\n'
#           'To exit click (5) \n')
#
#     user_choice = input('Please enter your option: ').strip()
#
#     if user_choice == '1':
#         this_dns = input('Please enter a WebSite DNS: ').strip()
#         this_url = input('Please enter a WebSite URL: ').strip()
#
#         websites.add(WebSite(this_dns, this_url))
#     elif user_choice == '2':
#         this_page_title = input('Please enter a WebPage title: ').strip()
#         this_page_content = input('Please enter a WebPage content: ').strip()
#         this_site_dns = input('Please enter a WebSite DNS where to add a page: ').strip()
#
#         for site in websites:
#             if site.dns == this_site_dns:
#                 site.add_new_page(WebPage(this_page_title, this_page_content))
#     elif user_choice == '3':
#         this_page_title = input('Please enter a WebPage title: ').strip()
#         this_site_dns = input('Please enter a WebSite DNS where to remove a page: ').strip()
#
#         for site in websites:
#             if site.dns == this_site_dns:
#                 for page in site.pages:
#                     if page.page_title == this_page_title:
#                         site.remove_page(page)
#     elif user_choice == '4':
#         this_site_dns = input('Please enter a WebSite DNS where to add a page: ').strip()
#
#         for site in websites:
#             if site.dns == this_site_dns:
#                 site.display_site_info()
#     elif user_choice == '5':
#         print('\nThank you for usage\n')
#         break
#     else:
#         print('\nWrong choice\n')