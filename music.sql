-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE collaborations (
  song_id INTEGER REFERENCES songs(id) ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers(id) ON DELETE CASCADE
);



INSERT INTO artists (name)
VALUES
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Destinys Child');

INSERT INTO producers (name)
VALUES
('Roy Thomas Baker'),
('Walter Adanasieff'),
('Darkchild');

INSERT INTO songs (title, duration_in_seconds, release_date, album)
VALUES
('Bohemian Rhapsody', 355, '10-31-1975', 'Middle of Nowhere'),
('One Sweet Day', 282, '11-14-1995', 'Daydream'),
('Say My Name', 240, '11-07-1999', 'The Writing is on The Wall');

INSERT INTO collaborations (song_id, artist_id, producer_id)
VALUES
(1,1,1),
(2,2,2),
(2,3,2),
(3,4,3);