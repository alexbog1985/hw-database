INSERT INTO genre (title)
VALUES ('Поп-музыка'),
       ('Хип-хоп'),
       ('Рок'),
       ('R&B');
       
INSERT INTO musician (name)
VALUES ('Руки Вверх!'),
       ('Zivert'),
       ('Eminem'),
       ('Jay-Z'),
       ('Ария'),
       ('Кино'),
       ('The Weeknd');
       
INSERT INTO genre_musician
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (3, 6),
       (4, 7);
      
INSERT INTO album (title, pr_year)
VALUES ('Сделай погромче!', 1998),
       ('Сияй', 2018),
       ('Venom', 2018);
      
INSERT INTO album_musician 
VALUES (1, 1),
       (2, 2),
       (3, 3);
      
INSERT INTO track (title, duration, album_id)
VALUES ('Venom', 4*60+29, 3),
       ('Еще хочу', 3*60+25, 2),
       ('Зеленые волны', 3*60+43, 2),
       ('Сияй', 3*60+25, 2),
       ('Океан', 3*60+25, 2),
       ('Крошка моя', 4*60+2, 1),
       ('My song', 3*60+25, 1);
      
      
INSERT INTO collections (title, pr_year)
VALUES ('All', 2020),
       ('best', 2020),
       ('some kind of collection', 2019),
       ('final collection', 2021);
      
INSERT INTO track_collection (track_id, collect_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (1, 2),
       (3, 2),
       (2, 3),
       (6, 3),
       (2, 4),
       (5, 4);