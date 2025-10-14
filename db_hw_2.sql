-- TASK_1

-- Відображення усіх овочів з калорійністю, менше вказаної.
SELECT fav_name, fav_kcal 
FROM fruits_and_vegetables 
WHERE fav_kcal < 50;

-- Відображення усіх фруктів з калорійністю у вказаному діапазоні.
SELECT fav_name, fav_kcal 
FROM fruits_and_vegetables 
WHERE fav_kcal BETWEEN 80 AND 100;

-- Відображення усіх овочів, у назві яких є вказане слово.
-- Наприклад, слово: капуста.
SELECT fav_name 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'vegetable' 
  AND fav_name ILIKE '%cabbage%';

-- Відображення усіх овочів та фруктів, у короткому описі яких є вказане слово. 
-- Наприклад, слово: гемоглобін.
SELECT fav_description 
FROM fruits_and_vegetables 
WHERE LOWER(fav_description) LIKE '%hemoglobin%';

-- Показати усі овочі та фрукти жовтого або червоного кольору.
SELECT fav_name, fav_color 
FROM fruits_and_vegetables 
WHERE LOWER(fav_color) LIKE '%red%' 
   OR LOWER(fav_color) LIKE '%yellow%';


-- TASK_2

-- Показати кількість овочів.
SELECT COUNT(*) AS vegetables_quantity 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'vegetable';

-- Показати кількість фруктів.
SELECT COUNT(*) AS fruits_quantity 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'fruit';

-- Показати кількість овочів та фруктів заданого кольору.
SELECT COUNT(*) AS fav_green_quantity 
FROM fruits_and_vegetables 
WHERE LOWER(fav_color) LIKE '%green%';

-- Показати кількість овочів та фруктів кожного кольору.
SELECT fav_color, COUNT(*) AS this_color_quantity 
FROM fruits_and_vegetables 
GROUP BY fav_color;

-- Показати мінімальну калорійність овочів та фруктів.
SELECT fav_type, MIN(fav_kcal) AS this_type_min_kcal 
FROM fruits_and_vegetables 
GROUP BY fav_type;

-- Показати максимальну калорійність овочів та фруктів.
SELECT fav_type, MAX(fav_kcal) AS this_type_max_kcal 
FROM fruits_and_vegetables 
GROUP BY fav_type;

-- Показати середню калорійність овочів та фруктів.
SELECT fav_type, AVG(fav_kcal) AS this_type_average_kcal 
FROM fruits_and_vegetables 
GROUP BY fav_type;

-- Показати фрукт з мінімальною калорійністю.
SELECT MIN(fav_kcal) AS fruit_min_kcal 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'fruit';  -- 30

SELECT fav_name AS fruit_with_min_kcal 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'fruit' 
  AND fav_kcal = 30;

-- Показати фрукт з максимальною калорійністю.
SELECT MAX(fav_kcal) AS fruit_max_kcal 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'fruit';  -- 89

SELECT fav_name AS fruit_with_max_kcal 
FROM fruits_and_vegetables 
WHERE LOWER(fav_type) = 'fruit' 
  AND fav_kcal = 89;