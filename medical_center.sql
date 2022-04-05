DROP DATABASE medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE medical_center (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT UNIQUE
);

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    specialty TEXT
);

CREATE TABLE medical_team (
    id SERIAL PRIMARY KEY,
    medical_center_id INTEGER REFERENCES medical_center(id) ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors(id) ON DELETE CASCADE
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    birthdate DATE
);

CREATE TABLE doctor_patient_relationship(
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors(id) ON DELETE CASCADE
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    description VARCHAR(30)
);

CREATE TABLE diagnosis (
    diseases_id INTEGER REFERENCES diseases(id) ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE
);


INSERT INTO medical_center (name, location)
VALUES
('Kaiser Permanente', 'Lancaster, California'),
('Pacific Hospital', 'Sun Valley, California');

INSERT INTO doctors (name, specialty)
VALUES
('Hilda Arias', 'Pediactrics'),
('Priya Singh', 'Oncology');


INSERT INTO patients (name, birthdate)
VALUES
('Edgar Sanchez', '1995-03-28'),
('Benjamin Sanchez', '2020-06-16');

INSERT INTO diseases (name, description)
VALUES
('Asthma', 'Lung Disease'),
('Colic', 'Fussy baby');