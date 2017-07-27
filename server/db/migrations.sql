CREATE DATABASE record_collections;

\c record_collections;

CREATE TABLE users (id SERIAL PRIMARY KEY,
email VARCHAR(255), password_digest VARCHAR(255),
screen_name VARCHAR(255));

CREATE TABLE albums (id SERIAL PRIMARY KEY, name VARCHAR(255), artist VARCHAR(255), release_year INTEGER, image_url VARCHAR(255),
 detail_url VARCHAR(255));

CREATE TABLE users_records (
id SERIAL PRIMARY KEY,
id_users INTEGER,
id_albums INTEGER);

ALTER TABLE users_records ADD FOREIGN KEY (id_users) REFERENCES users (id);
ALTER TABLE users_records ADD FOREIGN KEY (id_albums) REFERENCES albums (id);