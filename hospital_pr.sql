CREATE TABLE DEPARTMENTS (
	ID SERIAL NOT NULL PRIMARY KEY,
	BUILDING INT NOT NULL CHECK(BUILDING BETWEEN 1 AND 5),
	FINANCING INT NOT NULL CHECK(FINANCING >= 0),
	NAME VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO DEPARTMENTS (BUILDING, FINANCING, NAME)
VALUES
	(1, 150000, 'Кардиология'),
	(2, 120000, 'Неврология'),
	(3, 180000, 'Хирургия'),
	(4, 95000,  'Педиатрия'),
	(5, 110000, 'Травматология'),
	(2, 130000, 'Онкология'),
	(3, 160000, 'Офтальмология');

CREATE TABLE DISEASES (
	ID SERIAL NOT NULL PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL CHECK(NAME != '') UNIQUE,
	SEVERITY INT NOT NULL CHECK(SEVERITY >= 1) DEFAULT 1
);

INSERT INTO DISEASES (NAME, SEVERITY)
VALUES
	('Грипп', 2),
	('Пневмония', 4),
	('Мигрень', 2),
	('Инфаркт миокарда', 5),
	('Перелом кости', 3),
	('Диабет', 4),
	('Астма', 3),
	('Гипертония', 3),
	('Гастрит', 2),
	('Язва желудка', 4),
	('Артрит', 3),
	('Аппендицит', 4),
	('Ожирение', 2),
	('Рак лёгких', 5),
	('Депрессия', 3),
	('Анемия', 2),
	('Гепатит B', 4),
	('Псориаз', 2),
	('Коронавирусная инфекция', 4),
	('Инсульт', 5);

CREATE TABLE DOCTORS (
	ID SERIAL NOT NULL PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL CHECK(NAME != ''),
	PHONE CHAR(10),
	SALARY INT NOT NULL CHECK(SALARY > 0),
	SURNAME VARCHAR(255) NOT NULL CHECK(SURNAME != '')
);

INSERT INTO DOCTORS (NAME, SURNAME, PHONE, SALARY)
VALUES
	('Алексей', 'Иванов', '9001234567', 85000),
	('Мария', 'Петрова', '9002345678', 92000),
	('Дмитрий', 'Сидоров', '9003456789', 87000),
	('Ольга', 'Кузнецова', '9004567890', 94000),
	('Игорь', 'Смирнов', '9005678901', 88000),
	('Анна', 'Волкова', '9006789012', 96000),
	('Сергей', 'Новиков', '9007890123', 91000),
	('Елена', 'Федорова', '9008901234', 97000),
	('Андрей', 'Морозов', '9009012345', 89000),
	('Наталья', 'Алексеева', '9010123456', 93000),
	('Павел', 'Лебедев', '9011234567', 85000),
	('Татьяна', 'Семенова', '9012345678', 92000),
	('Роман', 'Егоров', '9013456789', 87000),
	('Ирина', 'Николаева', '9014567890', 94000),
	('Константин', 'Орлов', '9015678901', 88000),
	('Юлия', 'Макарова', '9016789012', 96000),
	('Михаил', 'Зайцев', '9017890123', 91000),
	('Светлана', 'Соловьева', '9018901234', 97000),
	('Артем', 'Борисов', '9019012345', 89000),
	('Виктория', 'Васильева', '9020123456', 93000),
	('Кирилл', 'Павлов', '9021234567', 85000),
	('Екатерина', 'Ковалёва', '9022345678', 92000),
	('Никита', 'Тарасов', '9023456789', 87000),
	('Валентина', 'Беляева', '9024567890', 94000),
	('Максим', 'Гусев', '9025678901', 88000),
	('Лариса', 'Киселева', '9026789012', 96000),
	('Александр', 'Романов', '9027890123', 91000),
	('Алёна', 'Мартынова', '9028901234', 97000),
	('Владимир', 'Савельев', '9029012345', 89000),
	('Дарья', 'Фролова', '9030123456', 93000),
	('Григорий', 'Чернов', '9031234567', 85000),
	('Марина', 'Абрамова', '9032345678', 92000),
	('Олег', 'Степанов', '9033456789', 87000),
	('Надежда', 'Карпова', '9034567890', 94000),
	('Борис', 'Сорокин', '9035678901', 88000),
	('Вера', 'Анисимова', '9036789012', 96000),
	('Станислав', 'Куликов', '9037890123', 91000),
	('Евгения', 'Медведева', '9038901234', 97000),
	('Леонид', 'Гаврилов', '9039012345', 89000),
	('Полина', 'Данилова', '9040123456', 93000);

CREATE TABLE EXAMINATIONS (
	ID SERIAL NOT NULL PRIMARY KEY,
	DAYOFWEEK INT NOT NULL CHECK(DAYOFWEEK BETWEEN 1 AND 7),
	ENDTIME TIME NOT NULL CHECK(ENDTIME > STARTTIME),
	NAME VARCHAR(100) NOT NULL CHECK(NAME != '') UNIQUE,
	STARTTIME TIME NOT NULL CHECK(STARTTIME BETWEEN '08:00' AND '18:00')
);

INSERT INTO EXAMINATIONS (DAYOFWEEK, STARTTIME, ENDTIME, NAME)
VALUES
	(1, '08:00', '08:30', 'Общий осмотр'),
	(1, '08:45', '09:15', 'Измерение давления'),
	(1, '09:30', '10:00', 'Снятие ЭКГ'),
	(2, '08:00', '08:40', 'Рентген грудной клетки'),
	(2, '09:00', '09:30', 'УЗИ брюшной полости'),
	(2, '10:00', '10:30', 'Проверка зрения'),
	(3, '08:30', '09:00', 'Измерение сахара в крови'),
	(3, '09:15', '09:45', 'Анализ крови'),
	(3, '10:00', '10:30', 'Анализ мочи'),
	(3, '10:45', '11:15', 'Флюорография'),
	(4, '08:00', '08:30', 'Проверка слуха'),
	(4, '08:45', '09:15', 'Осмотр терапевта'),
	(4, '09:30', '10:00', 'Консультация кардиолога'),
	(4, '10:15', '10:45', 'Консультация невролога'),
	(4, '11:00', '11:30', 'Консультация хирурга'),
	(5, '08:00', '08:40', 'МРТ головного мозга'),
	(5, '09:00', '09:30', 'КТ грудной клетки'),
	(5, '09:45', '10:15', 'Эндоскопия'),
	(5, '10:30', '11:00', 'Колонскопия'),
	(5, '11:15', '11:45', 'Маммография'),
	(6, '08:00', '08:30', 'Осмотр дерматолога'),
	(6, '08:45', '09:15', 'Осмотр офтальмолога'),
	(6, '09:30', '10:00', 'Осмотр эндокринолога'),
	(6, '10:15', '10:45', 'Осмотр отоларинголога'),
	(6, '11:00', '11:30', 'Осмотр гастроэнтеролога'),
	(7, '08:00', '08:30', 'Физиотерапия'),
	(7, '08:45', '09:15', 'ЛФК'),
	(7, '09:30', '10:00', 'Массаж спины'),
	(7, '10:15', '10:45', 'Психологическая консультация'),
	(7, '11:00', '11:30', 'Контрольный осмотр');

CREATE TABLE WARDS (
	ID SERIAL NOT NULL PRIMARY KEY,
	DEPARTMENT_ID INT REFERENCES DEPARTMENTS(ID) NOT NULL,
	FLOOR INT NOT NULL CHECK(FLOOR >= 1),
	NAME VARCHAR(20) NOT NULL CHECK(NAME != '') UNIQUE
);

INSERT INTO WARDS (DEPARTMENT_ID, FLOOR, NAME)
VALUES
	(1, 1, 'Палата №101'),
	(1, 2, 'Палата №102'),
	(2, 1, 'Палата №201'),
	(2, 2, 'Палата №202'),
	(3, 1, 'Палата №301'),
	(3, 2, 'Палата №302'),
	(3, 3, 'Палата №303'),
	(4, 1, 'Палата №401'),
	(4, 2, 'Палата №402'),
	(4, 3, 'Палата №403'),
	(5, 1, 'Палата №501'),
	(5, 2, 'Палата №502'),
	(6, 1, 'Палата №601'),
	(6, 2, 'Палата №602'),
	(6, 3, 'Палата №603'),
	(7, 1, 'Палата №701'),
	(7, 2, 'Палата №702'),
	(7, 3, 'Палата №703'),
	(7, 4, 'Палата №704'),
	(7, 5, 'Палата №705');


-- Добавление столбика PREMIUM в таблицу DOCTORS

ALTER TABLE DOCTORS
ADD COLUMN PREMIUM INT NOT NULL CHECK(PREMIUM >= 0) DEFAULT 0;

-- Заполнение столбца случайными значениями (0-1000)
-- UPDATE - изменения в существующих ячейках

UPDATE DOCTORS
SET PREMIUM = 1000 * RANDOM();

CREATE TABLE SPECIALIZATION(
	ID SERIAL NOT NULL PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL CHECK(NAME != '') UNIQUE
);

INSERT INTO SPECIALIZATION (NAME)
VALUES
('Терапевт'),
('Хирург'),
('Кардиолог'),
('Невролог'),
('Педиатр'),
('Эндокринолог'),
('Офтальмолог'),
('Дерматолог'),
('Отоларинголог'),
('Психиатр'),
('Онколог'),
('Гастроэнтеролог'),
('Уролог'),
('Гинеколог'),
('Ревматолог');

CREATE TABLE DOCTORS_SPECIALIZATION(
	ID SERIAL NOT NULL PRIMARY KEY,
	DOCTOR_ID INT NOT NULL REFERENCES DOCTORS(ID),
	DSPECIALIZATION_ID INT NOT NULL REFERENCES SPECIALIZATION(ID)
);

INSERT INTO DOCTORS_SPECIALIZATION (DOCTOR_ID, DSPECIALIZATION_ID)
SELECT DISTINCT
    (floor(random() * 40) + 1)::int AS doctor_id,
    (floor(random() * 15) + 1)::int AS specialization_id
FROM generate_series(1, 200)
LIMIT 90;

SELECT *
FROM DoctorsSpecializations;

-- ВИВЕСТИ ЛІКАРІВ ТА ЇХНІ СПЕЦІАЛІЗАЦІЇ

SELECT D.NAME, S.NAME
FROM DOCTORS_SPECIALIZATION DS
	JOIN DOCTORS D ON DS.DOCTOR_ID = D.ID
	JOIN Specialization S ON DS.DSPECIALIZATION_ID = S.ID;



SELECT D.SURNAME, D.NAME, string_agg(S.NAME, ', ')
FROM DoctorsSpecializations DS
	JOIN DOCTORS D ON DS.DOCTOR_ID = D.ID
	JOIN Specializations S ON DS.Specialization_Id = S.ID
GROUP BY D.SURNAME, D.NAME;

ALTER TABLE DOCTORS_SPECIALIZATION
RENAME COLUMN DSPECIALIZATION_ID TO SPECIALIZATION_ID;

SELECT *
FROM DOCTORS_SPECIALIZATION;










-- Спонсори (Sponsors)
-- ■ Ідентифікатор (Id). Унікальний ідентифікатор
-- спонсора.
-- ▷ Тип даних — int.
-- ▷ Автоприріст.
-- ▷ Не містить null-значення.
-- ▷ Первинний ключ.
-- ■ Назва (Name). Назва спонсора.
-- ▷ Тип даних — varchar(100).
-- ▷ Не містить null-значення.
-- ▷ Не може бути порожньою.
-- ▷ Має бути унікальною.

CREATE TABLE Sponsors(
	ID SERIAL NOT NULL PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL UNIQUE CHECK(NAME != '')
);

INSERT INTO Sponsors (NAME)
VALUES
('Pfizer'),
('Johnson & Johnson'),
('Novartis'),
('Roche'),
('Sanofi'),
('AstraZeneca'),
('Bayer'),
('Siemens Healthineers'),
('GE Healthcare'),
('Philips Healthcare');


-- Пожертвування (Donations)
-- ■ Ідентифікатор (Id). Унікальний ідентифікатор пожертвування.
-- ▷ Тип даних — int.
-- ▷ Автоприріст.
-- ▷ Не містить null-значення.
-- ▷ Первинний ключ.
-- ■ Сума (Amount). Сума пожертвування.
-- ▷ Тип даних для зберігання грошових значень.
-- ▷ Не містить null-значення.
-- ▷ Не може бути меншою або дорівнювати 0.
-- ■ Дата (Date). Дата пожертвування.
-- ▷ Тип даних для зберігання дати.
-- ▷ Не містить null-значення.
-- ▷ Не може бути більшою за поточну дату.
-- ▷ Значення за замовчуванням — поточна дата.
-- ■ Ідентифікатор відділення (DepartmentId). Відділення,
-- якому було надано пожертвування.
-- ▷ Тип даних — int.
-- ▷ Не містить null-значення.
-- ▷ Зовнішній ключ.
-- ■ Ідентифікатор спонсора (SponsorId). Спонсор, який
-- зробив пожертвування.
-- ▷ Тип даних — int.
-- ▷ Не містить null-значення.
-- ▷ Зовнішній ключ.

CREATE TABLE Donations(
	ID SERIAL NOT NULL PRIMARY KEY,
	AMOUNT INT NOT NULL CHECK(AMOUNT > 0),
	DONATION_DATE DATE NOT NULL CHECK(DONATION_DATE <= CURRENT_DATE) DEFAULT CURRENT_DATE,
	Department_Id INT NOT NULL REFERENCES DEPARTMENTS(ID),
	Sponsor_Id INT NOT NULL REFERENCES Sponsors(ID)
);

INSERT INTO Donations (AMOUNT, DONATION_DATE, Department_Id, Sponsor_Id)
VALUES
(52000, '2024-01-18', 1, 1),
(31000, '2024-02-02', 2, 2),
(45000, '2024-02-25', 3, 3),
(23000, '2024-03-10', 4, 4),
(61000, '2024-03-28', 5, 5),
(37000, '2024-04-12', 6, 6),
(28000, '2024-04-25', 7, 7),
(19000, '2024-05-09', 1, 8),
(33000, '2024-05-21', 2, 9),
(47000, '2024-06-05', 3, 10),
(25000, '2024-06-19', 4, 1),
(36000, '2024-07-03', 5, 2),
(41000, '2024-07-16', 6, 3),
(27000, '2024-07-30', 7, 4),
(49000, '2024-08-12', 1, 5),
(22000, '2024-08-26', 2, 6),
(38000, '2024-09-08', 3, 7),
(26000, '2024-09-22', 4, 8),
(54000, '2024-10-06', 5, 9),
(31000, '2024-10-19', 6, 10),
(47000, '2024-11-02', 7, 1),
(29000, '2024-11-16', 1, 2),
(35000, '2024-11-29', 2, 3),
(40000, '2024-12-13', 3, 4),
(21000, '2024-12-27', 4, 5),
(56000, '2025-01-10', 5, 6),
(32000, '2025-01-24', 6, 7),
(43000, '2025-02-07', 7, 8),
(25000, '2025-02-21', 1, 9),
(51000, '2025-03-06', 2, 10);

SELECT *
FROM DONATIONS DON
	JOIN Sponsors S ON S.ID = DON.Sponsor_Id
	JOIN DEPARTMENTS DEP ON DEP.ID = DON.Department_Id;
