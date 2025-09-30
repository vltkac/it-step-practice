import json
import pickle
import os


class MusicLibrary:
    def __init__(self):
        self.music_data = {}
        print('Music library was initiated.\n')

    def add_new_band(self, new_band_name: str):
        if set(new_band_name) == set(' '):
            raise ValueError('Band name can\'t contain only space symbols.')

        if new_band_name not in self.music_data.keys():
            self.music_data[new_band_name] = []
            print('New band was added.\n')
            return

        raise ValueError(f'{new_band_name} was already added to the library.')

    def add_new_album(self, existing_band_name: str, new_album_name: str):
        if set(new_album_name) == set(' '):
            raise ValueError('Album name can\'t contain only space symbols.')

        if existing_band_name in self.music_data.keys():
            if new_album_name not in self.music_data[existing_band_name]:
                self.music_data[existing_band_name].append(new_album_name)
                print(f'{new_album_name} was added to the band {existing_band_name}.\n')
                return
            raise ValueError(f'{new_album_name} is already in the band {existing_band_name}.')
        raise ValueError(f'{existing_band_name} was not yet added to the library.')

    def save_music_data_to_json(self, json_file_name='data.json'):
        if not json_file_name.endswith('.json'):
            raise ValueError('File name must end with ".json".')

        if not self.music_data:
            raise ValueError('Your current library data is empty. File was not created.')

        with open(json_file_name, 'w', encoding='utf-8') as f:
            json.dump(self.music_data, f, ensure_ascii=False, indent=4)

        print(f'{json_file_name} was created in your current working directory.\n')

    def load_data_from_json(self, json_file_name: str):
        if json_file_name.endswith('.json') and os.path.exists(json_file_name):
            with open(json_file_name, 'r', encoding='utf-8') as f:
                data = json.load(f)

            if isinstance(data, dict):
                self.music_data = data
                print(f'Data was loaded from {json_file_name} to your library.\n')
                return
            raise ValueError('Invalid format.')
        raise FileNotFoundError('File not found.')

    def save_data_to_pickle(self, pickle_file_name='data.pkl'):
        if pickle_file_name.endswith('.pkl'):
            with open(pickle_file_name, 'wb') as f:
                pickle.dump(self.music_data, f)
                print(f'Data was saved to {pickle_file_name}.\n')
                return
        raise ValueError('File name must end with ".pkl".')

    def load_data_from_pickle(self, pickle_file_name):
        if pickle_file_name.endswith('.pkl') and os.path.exists(pickle_file_name):
            with open(pickle_file_name, 'rb') as f:
                data = pickle.load(f)

                if isinstance(data, dict):
                    self.music_data = data
                    print(f'Data was loaded from {pickle_file_name} to your library.\n')
                    return
            raise ValueError('Invalid format.')
        raise FileNotFoundError('File not found.')