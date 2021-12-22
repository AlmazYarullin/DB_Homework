CREATE DATABASE hotels_service;
\c hotels_service;

CREATE TABLE hotel (
	hotel_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	category VARCHAR(255),
);

CREATE TABLE room (
	room_id SERIAL PRIMARY KEY,
	room_number INT,
	place_count INT,
	category VARCHAR(255),
	hotel_id INT CONSTRAINT UNIQUE REFERENCES hotel (hotel_id) ON DELETE CASCADE
);

CREATE TABLE position (
	position_id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

CREATE TABLE staffer (
	staffer_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	position_id INT REFERENCES position (position_id) ON DELETE SET NULL,
	hotel_id INT CONSTRAINT UNIQUE REFERENCES hotel (hotel_id) ON DELETE CASCADE
);

CREATE TABLE clean (
	clean_id SERIAL PRIMARY KEY,
	clean_time TIMESTAMP NOT NULL,
	staffer_id INT REFERENCES staffer (staffer_id),
	room_id INT REFERENCES room (room_id)
);

CREATE TABLE guest (
	guest_id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	documents VARCHAR(255),
	contacts VARCHAR(255)
);

CREATE TABLE living (
	living_id SERIAL,
	period DATETIME NOT NULL,
	payment INT NOT NULL,
	foreign_guest_id INT REFERENCES guest (guest_id),
	foreign_room_id INT REFERENCES room (room_id)
);
