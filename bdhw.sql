CREATE TABLE IF NOT EXISTS musician (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_musician (
	genre_id    INTEGER REFERENCES genre(id),
	musician_id INTEGER REFERENCES musician(id),
	            CONSTRAINT gm_pk 
	            PRIMARY KEY (genre_id, musician_id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	title   VARCHAR(60) NOT NULL,
	pr_year SMALLINT    NOT NULL
);

CREATE TABLE IF NOT EXISTS album_musician (
	album_id    INTEGER REFERENCES album(id),
	musician_id INTEGER REFERENCES musician(id),
	            CONSTRAINT am_pk 
	            PRIMARY KEY (album_id, musician_id)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	title    VARCHAR(60) NOT NULL,
	duration INTEGER     NOT NULL,
	album_id INTEGER     REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collections (
	id SERIAL PRIMARY KEY,
	title   VARCHAR(60) NOT NULL,
	pr_year SMALLINT    NOT NULL
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id   INTEGER REFERENCES track(id),
	collect_id INTEGER REFERENCES collections(id),
	           CONSTRAINT tc_pk 
	           PRIMARY KEY (track_id, collect_id)
);
