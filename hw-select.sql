-- 2.1 Название и продолжительность самого длительного трека
SELECT title, MAX(duration) as max_duration
  FROM track
 GROUP BY title
 -- Добавил сортировку по уменьшению, чтобы максимальный результат был всегда первым.
 -- Мне кажется так проще чем с вложенным запросом, тем более можно быстро изменить запрос на несколько треков с максимальной-минимальной длиной.
 ORDER BY max_duration DESC
 LIMIT 1;

-- 2.2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT title, duration 
  FROM track
 WHERE duration >= 3.5*60;

-- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title, pr_year
  FROM collections
 WHERE pr_year BETWEEN 2017 
   AND 2020;

-- 2.4 Исполнители, чьё имя состоит из одного слова.
SELECT name
  FROM musician
 WHERE name NOT LIKE '% %';

-- 2.5 Название треков, которые содержат слово «мой» или «my».
SELECT title
  FROM track
 WHERE STRING_TO_ARRAY(
       LOWER(title), ' '
       ) && ARRAY['my', 'мой']

    
-- 3.1 Количество исполнителей в каждом жанре.
SELECT g.title, COUNT(name)
  FROM musician m 
  JOIN genre_musician gm ON m.id = gm.musician_id
  JOIN genre g ON g.id = genre_id
 GROUP BY g.title
 
-- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.title)
  FROM track t
  JOIN album a ON a.id = t.album_id
 WHERE a.pr_year BETWEEN 2018
   AND 2020
 
 -- 3.3 Средняя продолжительность треков по каждому альбому.
 SELECT a.title, AVG(duration) AS average_duration
   FROM track t 
   JOIN album a ON a.id = t.album_id
  GROUP BY a.title
  
  -- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.
  SELECT name
    FROM musician m
    WHERE name NOT IN
          (SELECT name
           FROM musician m
           JOIN album_musician am ON m.id = am.musician_id 
           JOIN album a ON a.id = am.album_id 
           WHERE a.pr_year = 2020
          );
   
    
   
 -- 3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
   
 SELECT c.title
   FROM collections c
   JOIN track_collection tc ON c.id = tc.collect_id
   JOIN track t ON t.id = tc.track_id 
   JOIN album a ON t.album_id = a.id 
   JOIN album_musician am ON a.id = am.album_id 
   JOIN musician m ON m.id = am.musician_id
  WHERE m.name = 'Руки Вверх!'