import json
import os
from pydantic import BaseModel
from fastapi import FastAPI


class Movie(BaseModel):
    id: int
    title: str
    director: str
    year: int


app = FastAPI()

@app.get("/movies/{movie_id}")
def get_movie_data(movie_id: int):
    try:
        with open('films.json', 'r', encoding='utf-8') as f:
            source_data = json.load(f)

        return source_data.get(str(movie_id))

    except FileNotFoundError:
        print('No file films.json in the current working directory')
        return None


@app.get("/new_id")
def get_movie_new_id():
    if not os.path.exists('get_movie_new_id.json'):
        with open('get_movie_new_id.json', 'w') as f:
            json.dump([0], f)

    with open('get_movie_new_id.json', 'r') as f:
        id_last = json.load(f)
        current_id = id_last[0] + 1

    with open('get_movie_new_id.json', 'w') as f:
        json.dump([current_id], f)

    return current_id


@app.post("/movies")
def post_new_movie(movie: Movie):
    if not os.path.exists('films.json'):
        with open('films.json', 'w', encoding='utf-8') as f:
            json.dump({}, f)

    with open('films.json', 'r', encoding='utf-8') as f:
        data = json.load(f)

    data[str(movie.id)] = movie.dict()

    with open('films.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)


@app.delete("/movies/{movie_id}")
def delete_movie(movie_id: int):
    try:
        with open('films.json', 'r', encoding='utf-8') as f:
            source_data = json.load(f)

        try:
            source_data.pop(str(movie_id))
            with open('films.json', 'w', encoding='utf-8') as f:
                json.dump(source_data, f, ensure_ascii=False, indent=4)

        except KeyError:
            print('Searched movie id was not found')

    except FileNotFoundError:
        print('No file films.json found in the current working directory')