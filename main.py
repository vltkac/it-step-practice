from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
import json


try:
    with open('credentials.json', 'r', encoding='utf-8') as file:
        data = json.load(file)
        login = data.get('login')
        password = str(data.get('password'))
except FileNotFoundError:
    print("Credentials file not found.")
    exit(1)
except json.JSONDecodeError:
    print("Error decoding JSON from the credentials file.")
    exit(1)

DATABASE_URL = f"postgresql+psycopg2://{login}:{password.replace('%', '%25').replace('(', '%28').replace(')', '%29')}@localhost:5432/academy"
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

# ▷ вивести інформацію про всі навчальні групи
def display_groups():
    result = session.execute(text("SELECT * FROM groups"))

    for column in result.keys():
        print(f'{column:<15}', end=' ')
    print()

    for row in result:
        for item in row:
            print(f'{item:<15}', end=' ')
        print()


# ▷ вивести інформацію про конкретного викладача
def display_teacher(teacher_surname):
    teachers = session.execute(text("SELECT teach_surname FROM teachers")).fetchall()
    if lower(teacher_surname) not in [lower(teach.teach_surname) for teach in teachers]:
        print('Teacher not found')
        return

    result = session.execute(
        text(f"SELECT * FROM teachers WHERE teach_surname = '{teacher_surname}'")
    )

    for column in result.keys():
        print(f'{column:<22}', end=' ')
    print()

    for row in result:
        for item in row:
            print(f'{str(item):<22}', end=' ')
        print()


# ▷ вивести назви груп, що належать до конкретного факультету
def display_groups_of_faculty(faculty_name):
    try:
        faculties = session.execute(text("SELECT fac_name FROM faculties")).fetchall()
        if lower(faculty_name) not in [lower(fac.fac_name) for fac in faculties]:
            raise ValueError('Faculty not found')
    except ValueError as err:
        print(err)
        return

    result = session.execute(
        text(f"""
            SELECT g.group_name 
            FROM groups g
            JOIN departments d ON d.dep_id = g.department_id
            JOIN faculties f ON f.fac_id = d.faculty_id
            WHERE f.fac_name = '{faculty_name}'
        """)
    )

    print(f"Groups of the {faculty_name}:")
    for row in result:
        print(row.group_name)


# ▷ вивести назви предметів, які викладає конкретний викладач
def display_subjects_of_teacher(teacher_name_surname):
    try:
        name = teacher_name_surname.split()[0].capitalize()
        surname = teacher_name_surname.split()[1].capitalize()
    except IndexError:
        print('Please provide both name and surname of the teacher. Example: "Anna Kowalska"')
        return

    teachers = session.execute(text("SELECT teach_name, teach_surname FROM teachers")).fetchall()
    if (lower(name), lower(surname)) not in [(lower(teach.teach_name), lower(teach.teach_surname)) for teach in teachers]:
        print('Teacher not found')
        return

    result = session.execute(
        text(f"""
            SELECT s.name 
            FROM subjects s
            JOIN lectures l ON l.subject_id = s.id
            JOIN teachers t ON t.teach_id = l.teacher_id
            WHERE t.teach_name = '{name}'
                AND t.teach_surname = '{surname}'            
        """)
    )

    print(f"Subjects taught by {name} {surname}:")
    for row in result:
        print(row.name)