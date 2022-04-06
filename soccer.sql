DROP DATABASE league_db;
CREATE DATABASE league_db;

\c league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    city TEXT UNIQUE NOT NULL,
    coach TEXT,
    ranking INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    position TEXT,
    is_starter BOOLEAN,
    team_id INTEGER REFERENCES teams(id) ON DELETE CASCADE
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    yrs_of_exp INTEGER DEFAULT 5
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    date TEXT NOT NULL,
    team1_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    team2_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referees(id) ON DELETE CASCADE,
    winner BOOLEAN NOT NULL
);

CREATE TABLE goals_scored (
    player_id INTEGER REFERENCES players(id) ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches(id) ON DELETE CASCADE,
    time TEXT
);

CREATE TABLE season_dates(
    id SERIAL PRIMARY KEY,
    division TEXT UNIQUE NOT NULL,
    start TEXT NOT NULL,
    end_season TEXT NOT NULL
);

INSERT INTO teams (name, city, coach)
VALUES
('Knighthawks', 'Palmdale', 'Edgar Sanchez'),
('Falcons', 'Lancaster', 'Carlos Lopez'),
('Bulldogs', 'Quartz Hill', 'Alberto Arias'),
('Lobos', 'Littlerock', 'Oscar Barreda');

INSERT INTO players (name, position, is_starter, team_id)
VALUES
('Ronaldinho', 'midfielder', TRUE, 3),
('Pele', 'forward', TRUE, 1),
('Maradona', 'midfielder', FALSE, 2),
('Neymar', 'left wing', TRUE, 4),
('Messi', 'forward', FALSE, 2),
('Cristiano Ronaldo', 'forward', FALSE, 3),
('Guillermo Ochoa', 'goalie', TRUE, 1),
('Thiago Silva', 'defender', TRUE, 4);

INSERT INTO referees (name, yrs_of_exp)
VALUES
('Kevin Hart', 12),
('Snoop Dogg', 20);

INSERT INTO matches (date, team1_id, team2_id, referee_id, winner)
VALUES('2020-05-05', 1, 3, 2, TRUE),
('2020-06-16', 2, 4, 1, TRUE),
('2020-12-25', 1, 4, 1, FALSE),
('2021-01-01', 3, 2, 2, TRUE);

INSERT INTO goals_scored (player_id, team_id, match_id, time)
VALUES
(1, 3, 1, '20:01'),
(2, 1, 1, '45:35'),
(2, 1, 1, '56:56'),
(3,2,2,'20:45'),
(2,2,4,'45:16');

INSERT INTO season_dates (division, start, end_season)
VALUES 
('Spring', '2020-03-20', '2020-06-20'),
('Winter', '2020-12-21', '2021-03-19');