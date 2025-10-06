# from fastapi import FastAPI
#
#
# app = FastAPI()
#
#
# @app.post('/message')
# def message():
#     print('message function calling')
#
#
# @app.post('/function')
# def func():
#     print('func function calling')
#
#
# @app.post('/data')
# def get_data():
#     return {"result": "Hello from server"}
#
#
# @app.post("/mult2/{num}")
# def mult2(num: int):
#     result = 2 * num
#     return {'result': result}


# from fastapi import FastAPI
# from pydantic import BaseModel
#
#
# app = FastAPI()
#
# @app.post("/hello/{name}")
# def hello(name: str):
#     return {"message": f"Hello, {name}!"}
#
#
# class HelloName(BaseModel):
#     name: str
#
#
# @app.post("/hello_json")
# def hello_json(hello_name: HelloName):
#     name = hello_name.name
#     return {"message": f"Hello, {name}!"}

# Завдання 4
# Напишіть сервер для симуляції роботи бібліотеки.
# Дані про книги знаходяться у файлі books.json
# Напишіть модель на pydentic для книги з такими
# даними:
# ● id
# ● title
# ● author
# ● year
# ● pages
# Функціонал:
# 1. Отримання всіх книг
# ○ шлях – books
# ○ метод – GET
# 2. Отримання даних за ID книги
# ○ шлях – books/{book_id}
# ○ метод – GET
# 3. Додавання нової книги
# ○ шлях – books
# ○ метод – POST
# 4. Видалення книги за ID
# ○ шлях – books/{book_id}
# ○ метод – DELETE

from fastapi import FastAPI
from pydantic import BaseModel
import json


class Book(BaseModel):
    id: int
    title: str
    author: str
    year: int
    pages: int

app = FastAPI()

@app.get("/books")
def get_all_books(filename='books.json'):
    with open(filename, 'r', encoding='utf-8') as f:
        data = json.load(f)

    return data


@app.post("/books")
def add_new(book_json: Book, filename='books.json'):
    with open(filename, 'r', encoding='utf-8') as f:
        data = json.load(f)

    data[book_json.id] = book_json.dict()

    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)

























