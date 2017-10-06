-- run this file with psql -a -f migrations.sql
CREATE DATABASE record_collections;

\c record_collections;

CREATE TABLE users (id SERIAL PRIMARY KEY,
email VARCHAR(255), password_digest VARCHAR(255),
screen_name VARCHAR(255));

CREATE TABLE albums (id SERIAL PRIMARY KEY, name VARCHAR(255), artist VARCHAR(255), release_year INTEGER, image_url VARCHAR(255),
 detail_url VARCHAR(255), discogs_id INT);

CREATE TABLE users_records (
id SERIAL PRIMARY KEY,
user_id INTEGER,
album_id INTEGER);

ALTER TABLE users_records ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_records ADD FOREIGN KEY (album_id) REFERENCES albums (id);

ALTER TABLE users ADD token VARCHAR(255);

CREATE TABLE wishes (id SERIAL PRIMARY KEY, name VARCHAR(255), artist VARCHAR(255), release_year INTEGER, image_url VARCHAR(255),
 detail_url VARCHAR(255), discogs_id INT);

CREATE TABLE users_wishes (
id SERIAL PRIMARY KEY,
user_id INTEGER,
album_id INTEGER);

ALTER TABLE users_wishes ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_wishes ADD FOREIGN KEY (album_id) REFERENCES albums (id);