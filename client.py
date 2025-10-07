import requests


def get_movie_data(movie_id: int):
    response = requests.get(f'http://localhost:8000/movies/{movie_id}')

    if response.ok:
        print(response.json())
    else:
        print(response.text)


def post_new_movie(title: str, director: str, year: int):
    id_response = requests.get('http://localhost:8000/new_id')

    if not id_response.ok:
        print(id_response.text)
        return

    new_id = id_response.json()

    new_movie = {
        'id': new_id,
        'title': title,
        'director': director,
        'year': year
    }

    response = requests.post('http://localhost:8000/movies', json=new_movie)

    if response.ok:
        print('New movie was added')
    else:
        print(response.text)


def delete_movie(movie_id: int):
    response = requests.delete(f"http://localhost:8000/movies/{movie_id}")

    if response.ok:
        print('Movie was deleted')
    else:
        print(response.text)


def main():
    while True:
        user_option = input('To display movie data by its id click (1)\nTo add new movie click (2)\nTo delete movie click (3)\nTo stop client click (4)\n').strip()

        if user_option == '1':
            search_id = int(input('Please enter valid movie id: ').strip())
            get_movie_data(search_id)
        elif user_option == '2':
            new_title = input('Please enter the title: ').strip()
            new_director = input('Please enter the director: ').strip()
            new_year = int(input('Please enter the year of production: ').strip())
            post_new_movie(new_title, new_director, new_year)
        elif user_option == '3':
            delete_id = int(input('Please enter valid movie id: ').strip())
            delete_movie(delete_id)
        elif user_option == '4':
            print('Thank you for using!')
            break


if __name__ == '__main__':
    main()