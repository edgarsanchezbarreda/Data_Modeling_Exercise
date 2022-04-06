-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers(id) ON DELETE CASCADE,
  seat TEXT NOT NULL,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  airline TEXT NOT NULL,
  leaving TEXT NOT NULL,
  going TEXT NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');


INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline, leaving, going)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC, United States', 'Seattle, United States'),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo, Japan', 'London, United Kingdom'),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles, United States', 'Las Vegas, United States'),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle, United States', 'Mexico City, Mexico'),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris, France', 'Casablanca, Morocco'),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai, UAE', 'Beijing, China'),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York, United States', 'Charlotte, United States'),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids, United States', 'Chicago, United States'),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte, United States', 'New Orleans, United States'),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo, Brazil', 'Santiago, Chile');