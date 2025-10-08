-- создание столбцов
CREATE TABLE FRUITS_AND_VEGETABLES (
	FAV_ID SERIAL PRIMARY KEY,
	FAV_NAME VARCHAR(20),
	FAV_TYPE VARCHAR(10),
	FAV_COLOR VARCHAR(30),
	FAV_KCAL INT,
	FAV_DESCRIPTION VARCHAR(150)	
);

-- заполнение столбцов...
INSERT INTO FRUITS_AND_VEGETABLES (
	FAV_NAME,
	FAV_TYPE,
	FAV_COLOR,
	FAV_KCAL,
	FAV_DESCRIPTION
)
-- ...сгенерированными значениями
VALUES
	('Apple', 'Fruit', 'Red/Green', 52, 'A sweet and crunchy fruit, rich in fiber and vitamin C.'),
	('Banana', 'Fruit', 'Yellow', 89, 'Soft, high in potassium, great for quick energy.'),
	('Orange', 'Fruit', 'Orange', 47, 'Citrus fruit known for its vitamin C content.'),
	('Strawberry', 'Fruit', 'Red', 33, 'Juicy berry rich in antioxidants.'),
	('Watermelon', 'Fruit', 'Green/Red', 30, 'Refreshing and hydrating fruit, mostly water.'),
	('Kiwi', 'Fruit', 'Brown/Green', 41, 'Tart fruit rich in vitamin C and fiber.'),
	('Pineapple', 'Fruit', 'Brown/Yellow', 50, 'Tropical fruit with a tangy-sweet taste.'),
	('Mango', 'Fruit', 'Orange/Yellow', 60, 'Sweet tropical fruit, high in vitamins A and C.'),
	('Grapes', 'Fruit', 'Green/Purple', 69, 'Small juicy berries, source of natural sugars.'),
	('Pear', 'Fruit', 'Green/Yellow', 57, 'Soft fruit with a sweet, grainy texture.'),
	('Carrot', 'Vegetable', 'Orange', 41, 'Root vegetable rich in beta-carotene.'),
	('Broccoli', 'Vegetable', 'Green', 34, 'Cruciferous vegetable high in vitamins K and C.'),
	('Tomato', 'Vegetable', 'Red', 18, 'Juicy and versatile, technically a fruit but used as a vegetable.'),
	('Cucumber', 'Vegetable', 'Green', 16, 'Crisp, hydrating vegetable with mild flavor.'),
	('Potato', 'Vegetable', 'Brown/Yellow', 77, 'Starchy root, a staple food worldwide.'),
	('Onion', 'Vegetable', 'White/Yellow', 40, 'Aromatic vegetable used in many dishes.'),
	('Spinach', 'Vegetable', 'Green', 23, 'Leafy vegetable rich in iron and vitamins.'),
	('Pepper', 'Vegetable', 'Red/Green/Yellow', 31, 'Colorful vegetable, sweet or spicy.'),
	('Eggplant', 'Vegetable', 'Purple', 25, 'Soft and spongy vegetable used in Mediterranean cuisine.'),
	('Cabbage', 'Vegetable', 'Green/Purple', 25, 'Leafy vegetable often used in salads and soups.');

-- вывод всей информации из таблицы
SELECT *
FROM FRUITS_AND_VEGETABLES;

-- вывод всех овощей
SELECT *
FROM FRUITS_AND_VEGETABLES
WHERE FAV_TYPE = 'Vegetable';

-- вывод всех фруктов
SELECT *
FROM FRUITS_AND_VEGETABLES
WHERE FAV_TYPE = 'Fruit';

-- вывод всех названий фруктов и овощей
SELECT FAV_NAME
FROM FRUITS_AND_VEGETABLES;

-- вывод всех уникальных цветов
SELECT DISTINCT FAV_COLOR
FROM FRUITS_AND_VEGETABLES;

-- вывод всех фруктов красного цвета
SELECT FAV_NAME
FROM FRUITS_AND_VEGETABLES
WHERE FAV_TYPE = 'Fruit' AND FAV_COLOR = 'Red';

-- вывод всех овощей зеленого цвета
SELECT FAV_NAME
FROM FRUITS_AND_VEGETABLES
WHERE FAV_TYPE = 'Vegetable' AND FAV_COLOR = 'Green';