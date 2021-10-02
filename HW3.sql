-- set client_encoding='win1251';
CREATE DATABASE taxi;
\c taxi;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15),
    bonuses INTEGER DEFAULT 300,
    trips INTEGER DEFAULT 0
);

CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    model VARCHAR(30) NOT NULL,
    plate VARCHAR(15) NOT NULL
);

CREATE TABLE drivers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL,
    rating REAL NOT NULL,
    vehicle_id INTEGER UNIQUE REFERENCES vehicles(id),
    trips INTEGER DEFAULT 0
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    driver_id INTEGER NOT NULL REFERENCES drivers(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    price INTEGER NOT NULL,
    trip_date DATE NOT NULL
);


-- users filling
INSERT INTO users (name) VALUES ('Almaz');
INSERT INTO users (name) VALUES ('Rasim');
INSERT INTO users (name) VALUES ('Aidar');
INSERT INTO users (name) VALUES ('Rizvan');
INSERT INTO users (name) VALUES ('Jack');
INSERT INTO users (name) VALUES ('Alexander');
INSERT INTO users (name) VALUES ('Nikita');
INSERT INTO users (name) VALUES ('Elena');
INSERT INTO users (name) VALUES ('Marya');
INSERT INTO users (name) VALUES ('Viktor');

-- vehicles filling
INSERT INTO vehicles (model, plate) VALUES ('Toyota Camry', 'Ê375ÀÐ716');
INSERT INTO vehicles (model, plate) VALUES ('Hyundai Accent', 'Ð384ÒÑ116');
INSERT INTO vehicles (model, plate) VALUES ('Volkswagen Polo', 'Ì440ÎÐ716');
INSERT INTO vehicles (model, plate) VALUES ('Renault Logan', 'Ó864ÑÂ116');
INSERT INTO vehicles (model, plate) VALUES ('Hyundai Solaris', 'Ð348ÂÌ116');
INSERT INTO vehicles (model, plate) VALUES ('Volkswagen Polo', 'Å370ÊÑ116');
INSERT INTO vehicles (model, plate) VALUES ('Toyota Corolla', 'Õ698ÌÅ716');
INSERT INTO vehicles (model, plate) VALUES ('Kia Rio', 'Â409ÒÌ116');
INSERT INTO vehicles (model, plate) VALUES ('Chevrolet Lacetti', 'Ó073ÂÊ716');
INSERT INTO vehicles (model, plate) VALUES ('Lada Granta', 'Â714ÐÎ716');

-- drivers filling
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Ruslan', 5.0, 6, 67);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Andrey', 4.9, 1, 34);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Evan', 4.7, 7, 87);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Aleksey', 4.5, 5, 44);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Danila', 4.9, 3, 214);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Kirill', 4.8, 8, 117);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Olga', 5, 9, 45);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Egor', 4.9, 4, 68);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Ivan', 4.6, 2, 129);
INSERT INTO drivers (name, rating, vehicle_id, trips) VALUES ('Petr', 4.8, 10, 41);

-- orders filling
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (4, 6, 118, '2021-09-22');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (4, 2, 479, '2021-09-21');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (8, 5, 85, '2021-09-04');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (2, 10, 74, '2021-09-11');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (6, 2, 98, '2021-09-16');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (4, 6, 354, '2021-09-05');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (5, 8, 301, '2021-09-14');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (10, 1, 102, '2021-09-21');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (8, 3, 198, '2021-09-18');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (2, 7, 253, '2021-09-17');
INSERT INTO orders (driver_id, user_id, price, trip_date) VALUES (7, 4, 442, '2021-09-15');