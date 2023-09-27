-- В подключенном MySQL репозитории создать базу данных “Друзья человека”

CREATE DATABASE `Друзья человека`;

-- Создать таблицы с иерархией из диаграммы в БД

USE `Друзья человека`;

CREATE TABLE Dogs
(
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE
);

CREATE TABLE Cats
(
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE
);

CREATE TABLE Hamsters
(
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE
);

CREATE TABLE Horses
(
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE
);

CREATE TABLE Camels
(
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE
);

CREATE TABLE Donkeys
(
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE
);

-- Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения

INSERT INTO Cats (id, Name, Commands, Date_of_birth)
VALUES (1, 'Marusya', 'stand up', date'2018-10-24'), (2, 'Darina', 'come up', date'2021-05-14'), (3, 'Barsik', 'sit', date'2021-06-27');

INSERT INTO Dogs (id, Name, Commands, Date_of_birth)
VALUES (4, 'Mark', 'stand up', date'2015-02-20'), (5, 'Derny', 'come up', date'2020-02-18'), (6, 'Sapsan', 'run', date'2015-08-13');

INSERT INTO Hamsters (id, Name, Commands, Date_of_birth)
VALUES (7, 'Nuri', 'come up', date'2022-11-04'), (8, 'Marina', 'run', date'2022-05-02'), (9, 'Amster', 'sit', date'2021-11-07');

INSERT INTO Horses (id, Name, Commands, Date_of_birth)
VALUES (10, 'Persik', 'go slowly', date'2014-03-16'), (11, 'Grey', 'go slowly', date'2012-11-22'), (12, 'Surreen', 'go slowly', date'2017-01-19');

INSERT INTO Camels (id, Name, Commands, Date_of_birth)
VALUES (13, 'Kavin', 'trot', date'2019-05-21'), (14, 'Ret', 'trot', date'2017-12-20'), (15, 'Leyn', 'trot', date'2014-03-04');

INSERT INTO Donkeys (id, Name, Commands, Date_of_birth)
VALUES (16, 'Narim', 'go awey', date'2018-02-11'), (17, 'Tukki', 'run', date'2012-10-02'), (18, 'Luk', 'run', date'2013-07-28');

-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.

TRUNCATE TABLE Camals;

SELECT * FROM Horses
UNION SELECT * FROM Donkeys
AS `Pack animals`;

-- Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
-- но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице.

CREATE TABLE `Young animals`
SELECT id, Name, Commands, Date_of_birth,
(YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) AS Age
FROM Dogs
WHERE (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) > 1
UNION 
SELECT id, Name, Commands, Date_of_birth,
(YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) AS Age
FROM Cats
WHERE (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) > 1
UNION 
SELECT id, Name, Commands, Date_of_birth,
(YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) AS Age
FROM Hamsters
WHERE (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) > 1
UNION 
SELECT id, Name, Commands, Date_of_birth,
(YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) AS Age
FROM Horses
WHERE (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) > 1
UNION 
SELECT id, Name, Commands, Date_of_birth,
(YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) AS Age
FROM Camels
WHERE (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) > 1
UNION 
SELECT id, Name, Commands, Date_of_birth,
(YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) AS Age
FROM Donkeys
WHERE (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(Date_of_birth)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Date_of_birth,5)) > 1
ORDER BY id; 

ALTER TABLE `Young animals` ADD COLUMN FullAge VARCHAR (30);
UPDATE `Young animals` SET FullAge = (CONCAT(TIMESTAMPDIFF(YEAR, Date_of_birth, CURRENT_DATE),' Years ', 
			TIMESTAMPDIFF(MONTH, Date_of_birth, CURRENT_DATE) % 12, ' месяцев '));

-- Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
		
CREATE TABLE `All animals` (
id INT,
Name VARCHAR(45),
Commands VARCHAR(45),
Date_of_birth DATE,
TableName ENUM('Dogs', 'Cats', 'Hamsters', 'Horses', 'Camels', 'Donkeys')
);

INSERT INTO `All animals` (id, Name, Commands, Date_of_birth, TableName)
SELECT id, Name, Commands, Date_of_birth, 'Dogs'
FROM Dogs;

INSERT INTO `All animals` (id, Name, Commands, Date_of_birth, TableName)
SELECT id, Name, Commands, Date_of_birth, 'Cats'
FROM Cats;

INSERT INTO `All animals` (id, Name, Commands, Date_of_birth, TableName)
SELECT id, Name, Commands, Date_of_birth, 'Hamsters'
FROM Hamsters;

INSERT INTO `All animals` (id, Name, Commands, Date_of_birth, TableName)
SELECT id, Name, Commands, Date_of_birth, 'Horses'
FROM Horses;

INSERT INTO `All animals` (id, Name, Commands, Date_of_birth, TableName)
SELECT id, Name, Commands, Date_of_birth, 'Camels'
FROM Camels;

INSERT INTO `All animals` (id, Name, Commands, Date_of_birth, TableName)
SELECT id, Name, Commands, Date_of_birth, 'Donkeys'
FROM Donkeys;
		
