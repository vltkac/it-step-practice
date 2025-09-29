import json
import pickle
import os


class Student:
    def __init__(self, name: str, specialization: str):
        if name.isalpha() and specialization:
            self.name = name.capitalize().strip()
            self.specialization = specialization.capitalize().strip()
            self.grades = []
            print('New student added.\n')
        else:
            raise ValueError('Please enter student\'s name with letters.')

    def add_grade(self, grade: int):
        if isinstance(grade, int):
            self.grades.append(grade)
            print('New grade was added.\n')
        else:
            raise ValueError('Please enter digit as a grade\'s value.')

    def display_info(self):
        avg_grade = sum(self.grades) / len(self.grades)
        print(f'Name: {self.name}, specialization: {self.specialization}, average grade: {avg_grade:.1f}')

    def save_json(self):
        file_name = self._get_json_file_name()

        json_data = {
            'specialization': self.specialization,
            'grades': self.grades
        }

        with open(file_name, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, indent=4, ensure_ascii=False)

        print(f'Data saved to {file_name}')

    def _get_json_file_name(self):
        return f'student_data_{self.name}.json'

    def load_from_json(self):
        file_name = self._get_json_file_name()

        if os.path.exists(file_name):
            with open(file_name, 'r', encoding='utf-8') as f:
                data = json.load(f)
        else:
            print('No student was added to database.\n')
            return

        self.specialization = data['specialization']
        self.grades = data['grades']

        print('Student was upgraded.\n')


student = Student('Vlad', 'L4B')
student.add_grade(5)
student.add_grade(4)
student.add_grade(2)

student1 = Student('Liza', 'Cosmetology')
student1.add_grade(5)
student1.add_grade(4)
student1.add_grade(4)

student2 = Student('Ann', 'Economics')
student2.add_grade(5)
student2.add_grade(5)
student2.add_grade(5)

students = [student, student1, student2]

for student in students:
    student.load_from_json()
    student.display_info()

student1.display_info()
student2.display_info()

with open('students.pkl', 'wb') as f:
    pickle.dump(students, f)


with open('students.pkl', 'rb') as f:
    data = pickle.load(f)


for student in data:
    student.display_info()


with open('students.json', 'w', encoding='utf-8') as f:
    json.dump(students, f, indent=4, ensure_ascii=False)