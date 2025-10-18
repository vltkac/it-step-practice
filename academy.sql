-- postgres database query tool
CREATE DATABASE ACADEMY;

--------------------------------------------------
-- ACADEMY database query tool

-- создание таблицы кафедр и введение значений

CREATE TABLE DEPARTMENTS (
	DEP_ID SERIAL NOT NULL PRIMARY KEY,
	DEP_FINANCING INT NOT NULL CHECK (DEP_FINANCING >= 0) DEFAULT 0,
	DEP_NAME VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO DEPARTMENTS (DEP_FINANCING, DEP_NAME) VALUES
	(120000, 'Department of Software Engineering'),
	(95000, 'Department of Microeconomics'),
	(87000, 'Department of Civil Law'),
	(78000, 'Department of Social Psychology'),
	(160000, 'Department of Anatomy and Physiology'),
	(88000, 'Department of Urban Design'),
	(72000, 'Department of English Philology'),
	(94000, 'Department of Theoretical Physics'),
	(91000, 'Department of International Relations'),
	(83000, 'Department of World History');

-- создание таблицы факультетов и введение значений

CREATE TABLE FACULTIES (
	FAC_ID SERIAL NOT NULL PRIMARY KEY,
	FAC_DEAN VARCHAR(255) NOT NULL CHECK (FAC_DEAN != ''),
	FAC_NAME VARCHAR(100) NOT NULL CHECK (FAC_NAME != '') UNIQUE
);

INSERT INTO FACULTIES (FAC_DEAN, FAC_NAME) VALUES
	('Dr. Michael Peterson', 'Faculty of Computer Science'),
	('Prof. Anna Kowalska', 'Faculty of Economics'),
	('Dr. Robert Nowak', 'Faculty of Law'),
	('Prof. Maria Zielińska', 'Faculty of Psychology'),
	('Dr. Tomasz Lewandowski', 'Faculty of Medicine'),
	('Prof. Katarzyna Wiśniewska', 'Faculty of Architecture'),
	('Dr. Piotr Kamiński', 'Faculty of Linguistics'),
	('Prof. Jan Majewski', 'Faculty of Physics and Mathematics'),
	('Dr. Ewa Nowicka', 'Faculty of Political Science'),
	('Prof. Andrzej Wójcik', 'Faculty of History and Culture');

-- создание таблицы групп и введение значений

CREATE TABLE GROUPS (
	GROUP_ID SERIAL NOT NULL PRIMARY KEY,
	GROUP_NAME VARCHAR(10) NOT NULL CHECK (GROUP_NAME != '') UNIQUE,
	GROUP_RATING INT NOT NULL CHECK (GROUP_RATING BETWEEN 0 AND 5),
	GROUP_YEAR INT NOT NULL CHECK (GROUP_YEAR BETWEEN 1 AND 5)
);

INSERT INTO GROUPS (GROUP_NAME, GROUP_RATING, GROUP_YEAR) VALUES
	('CS-101', 5, 1),
	('CS-202', 4, 2),
	('LAW-103', 3, 1),
	('MED-205', 5, 2),
	('ECO-304', 4, 3),
	('PSY-402', 5, 4),
	('ARC-301', 3, 3),
	('LING-204', 4, 2),
	('HIS-501', 5, 5),
	('POL-403', 4, 4);

-- создание таблицы учителей и введение значений

CREATE TABLE TEACHERS (
	TEACH_ID SERIAL NOT NULL PRIMARY KEY,
	TEACH_EMPLOYMENT_DATE DATE NOT NULL CHECK (TEACH_EMPLOYMENT_DATE >= '1990-01-01'),
	TEACH_IS_ASSISTANT BOOL NOT NULL DEFAULT FALSE,
	TEACH_IS_PROFESSOR BOOL NOT NULL DEFAULT FALSE,
	TEACH_NAME VARCHAR(100) NOT NULL CHECK (TEACH_NAME != ''),
	TEACH_SURNAME VARCHAR(100) NOT NULL CHECK (TEACH_SURNAME != ''),
	TEACH_POSITION VARCHAR(100) NOT NULL CHECK (TEACH_POSITION != ''),
	TEACH_PREMIUM INT NOT NULL CHECK (TEACH_PREMIUM >= 0) DEFAULT 0,
	TEACH_SALARY INT NOT NULL CHECK (TEACH_SALARY > 0)
);

INSERT INTO TEACHERS (TEACH_EMPLOYMENT_DATE, TEACH_IS_ASSISTANT, TEACH_IS_PROFESSOR, TEACH_NAME, TEACH_SURNAME, TEACH_POSITION, TEACH_PREMIUM, TEACH_SALARY) VALUES
	('1995-09-01', TRUE, FALSE, 'Anna', 'Kowalska', 'Assistant Professor', 2000, 8000),
	('2000-03-15', FALSE, TRUE, 'Piotr', 'Nowak', 'Professor', 5000, 12000),
	('2010-08-20', TRUE, FALSE, 'Maria', 'Wiśniewska', 'Assistant', 1500, 7000),
	('2005-01-10', FALSE, TRUE, 'Tomasz', 'Lewandowski', 'Professor', 4000, 11000),
	('2018-02-05', TRUE, FALSE, 'Ewa', 'Zielińska', 'Assistant', 1000, 6500),
	('1999-07-12', FALSE, TRUE, 'Jan', 'Kamiński', 'Professor', 4500, 11500),
	('2015-09-01', TRUE, FALSE, 'Katarzyna', 'Wójcik', 'Assistant', 1200, 6800),
	('2003-04-22', FALSE, TRUE, 'Robert', 'Majewski', 'Professor', 4200, 11200),
	('2020-10-01', TRUE, FALSE, 'Agnieszka', 'Sikora', 'Assistant', 800, 6000),
	('2007-11-15', FALSE, TRUE, 'Michał', 'Kaczmarek', 'Professor', 3900, 10800),
	('1992-06-01', TRUE, FALSE, 'Monika', 'Nowicka', 'Assistant', 2200, 8500),
	('2001-09-12', FALSE, TRUE, 'Łukasz', 'Wojciechowski', 'Professor', 4600, 11600),
	('2012-03-01', TRUE, FALSE, 'Joanna', 'Król', 'Assistant', 1300, 6900),
	('1998-08-05', FALSE, TRUE, 'Andrzej', 'Kubiak', 'Professor', 4100, 11100),
	('2009-02-20', TRUE, FALSE, 'Natalia', 'Pawlak', 'Assistant', 1100, 6700),
	('2004-07-01', FALSE, TRUE, 'Paweł', 'Grabowski', 'Professor', 4300, 11300),
	('2017-09-15', TRUE, FALSE, 'Magdalena', 'Zawadzka', 'Assistant', 900, 6200),
	('1996-05-12', FALSE, TRUE, 'Grzegorz', 'Jankowski', 'Professor', 4000, 11000),
	('2013-10-01', TRUE, FALSE, 'Aleksandra', 'Szymańska', 'Assistant', 1000, 6600),
	('2002-11-20', FALSE, TRUE, 'Mariusz', 'Krawczyk', 'Professor', 4400, 11400),
	('2016-04-10', TRUE, FALSE, 'Barbara', 'Kamińska', 'Assistant', 950, 6300),
	('1994-08-25', FALSE, TRUE, 'Rafał', 'Górski', 'Professor', 4700, 11800),
	('2011-09-01', TRUE, FALSE, 'Patrycja', 'Michalska', 'Assistant', 1250, 7000),
	('2006-03-15', FALSE, TRUE, 'Dariusz', 'Woźniak', 'Professor', 4200, 11200),
	('2019-02-01', TRUE, FALSE, 'Karolina', 'Kozłowska', 'Assistant', 850, 6100),
	('2008-06-10', FALSE, TRUE, 'Artur', 'Maj', 'Professor', 4300, 11300),
	('2014-09-01', TRUE, FALSE, 'Sylwia', 'Olszewska', 'Assistant', 1150, 6800),
	('1997-01-12', FALSE, TRUE, 'Marek', 'Piotrowski', 'Professor', 4600, 11600),
	('2021-09-01', TRUE, FALSE, 'Joanna', 'Czarnecka', 'Assistant', 750, 6000),
	('2000-05-05', FALSE, TRUE, 'Tadeusz', 'Sikorski', 'Professor', 4500, 11500);

-- 1. Вивести таблицю кафедр, але розташувати її поля у зворотному порядку.
SELECT DEP_NAME, DEP_FINANCING, DEP_ID
FROM DEPARTMENTS;

-- 2. Вивести назви груп та їх рейтинги з уточненнями до назв полів відповідно до назви таблиці.
SELECT 
	GROUP_NAME AS "Name of the group", 
	GROUP_RATING AS "Rating of the group"
FROM GROUPS;

-- 3. Вивести для викладачів їх прізвища, відсоток ставки по відношенню до надбавки та відсоток ставки по відношенню до зарплати (сума ставки та надбавки).
SELECT 
	TEACH_SURNAME AS "Teacher's surname", 
	TEACH_SALARY / NULLIF(TEACH_PREMIUM, 0) * 100 AS "Rate of the teacher's basic salary compared to the premium in %",
	TEACH_SALARY * 100 / (TEACH_PREMIUM + TEACH_SALARY) AS "Rate of the teacher's basic salary compared to the total wage in %"
FROM TEACHERS;

-- 4. Вивести таблицю факультетів одним полем у такому форматі: «The dean of faculty [faculty] is [dean].».
SELECT 
	'The dean of faculty ' || FAC_NAME || ' is ' || FAC_DEAN || '.' AS "Faculty's dean information"
FROM FACULTIES;

-- 5. Вивести прізвища професорів, ставка яких перевищує 10500.
SELECT 
	TEACH_SURNAME AS "Teachers whose basic salary exceeds 10500"
FROM TEACHERS
WHERE TEACH_SALARY >= 10500;

-- 6. Вивести назви кафедр, фонд фінансування яких менший, ніж 50000 або більший за 80000.
SELECT 
	DEP_NAME AS "Departments which financing is below 50000 or above 80000"
FROM DEPARTMENTS
WHERE DEP_FINANCING <= 50000 OR DEP_FINANCING >= 80000;

-- 7. Вивести назви факультетів, окрім факультету «Computer Science»
SELECT 
	FAC_NAME
FROM FACULTIES
WHERE FAC_NAME NOT ILIKE '%computer science%';

-- 8. Вивести прізвища та посади викладачів, які не є професорами.
SELECT 
	TEACH_SURNAME AS "Teacher's surname", 
	TEACH_POSITION AS "Teacher's position"
FROM TEACHERS
WHERE NOT TEACH_IS_PROFESSOR;

-- 9. Вивести прізвища, посади, ставки та надбавки асистентів, надбавка яких у діапазоні від 1600 до 5500.
SELECT 
	TEACH_SURNAME AS "Teacher's surname", 
	TEACH_POSITION AS "Teacher's position", 
	TEACH_SALARY AS "Teacher's basic salary", 
	TEACH_PREMIUM AS "Teacher's bonus"
FROM TEACHERS
WHERE TEACH_IS_ASSISTANT AND TEACH_PREMIUM BETWEEN 1600 AND 5500;

-- 10. Вивести прізвища та ставки асистентів.
SELECT 
	TEACH_SURNAME AS "Teacher's surname", 
	TEACH_SALARY AS "Teacher's basic salary"
FROM TEACHERS
WHERE TEACH_IS_ASSISTANT;

-- 11. Вивести прізвища та посади викладачів, які були прийняті на роботу до 01.01.2000.
SELECT 
	TEACH_SURNAME AS "Teacher's surname", 
	TEACH_POSITION AS "Teacher's position"
FROM TEACHERS
WHERE TEACH_EMPLOYMENT_DATE < '2000-01-01';

-- 12. Вивести назви кафедр, які в алфавітному порядку розміщені до кафедри «Software Development». 
-- У меня все кафедры начинаются с 'Department of '. Вопрос, можно ли это как-то обойти через regex? Ну и без удаления таблицы и перезаполнения поля

-- 13. Вивести прізвища асистентів із зарплатою (сума ставки та надбавки) не більше 12000.
SELECT 
	TEACH_SURNAME AS "Teacher's surname"
FROM TEACHERS
WHERE TEACH_SALARY + TEACH_PREMIUM <= 12000;

-- 14. Вивести назви груп 5-го курсу з рейтингом у діапазоні від 2 до 4.
SELECT 
	GROUP_NAME AS "Name of the group"
FROM GROUPS
WHERE GROUP_YEAR = 5 AND GROUP_RATING BETWEEN 2 AND 4;

-- 15. Вивести прізвища асистентів зі ставкою менше, ніж 10000 або надбавкою менше, ніж 2000.
SELECT 
	TEACH_SURNAME AS "Teacher's surname"
FROM TEACHERS
WHERE (TEACH_SALARY < 10000 OR TEACH_PREMIUM < 2000) 
	AND TEACH_IS_ASSISTANT;