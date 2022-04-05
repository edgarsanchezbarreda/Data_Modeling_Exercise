DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    city TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions(id) ON DELETE CASCADE
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    title TEXT UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text VARCHAR(280) NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    location TEXT,
    region_id INTEGER REFERENCES regions(id) ON DELETE CASCADE
);

INSERT INTO regions (city)
VALUES
('San Francisco'), ('Seattle');

INSERT INTO users (username, password, preferred_region_id)
VALUES
('basketballfan123', 'HelloWorld123', 1),
('dogwalker456', 'somepassword456', 2),
('sqlluvr789', 'springboard789', 1);

INSERT INTO categories (title, description)
VALUES
('original_post', 'A post that is created by a user, that does not include any reposts'),
('repost', 'A forwarded post that originally came from another user');

INSERT INTO posts (title, text, user_id, location, region_id)
VALUES
('Great Game!', 'Wow, that was an awesome game, it came down to the wire!', 1, 'Fishermans Warf', 1),
('Looking for a new puppy.', 'I am in search of a new puppy, preferably something on the smaller side!', 2, 'Ballard', 2),
('I love SQL!', 'I am currently learning SQL in my coding bootcamp and so far I love it!', 3, 'Queen Anne', 2);