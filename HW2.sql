SELECT * FROM flights WHERE (departure_airport = 'KZN' AND arrival_airport = 'MQF');

SELECT * FROM flights 
WHERE AGE(scheduled_arrival, scheduled_departure) = '00:25:00' 
AND departure_airport != ANY('{"SVO", "VKO", "DME"}'::character[]);

SELECT * FROM flights f
JOIN airports_data ad1
ON (f.departure_airport = ad1.airport_code AND ad1.timezone = 'Europe/Moscow')
JOIN airports_data ad2
ON (f.arrival_airport = ad2.airport_code AND ad2.timezone = 'Europe/Moscow');
