select now() as 現在時間

CREATE DATABASE test;

--DROP DATABASE test;


CREATE TABLE IF NOT EXISTS student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20)
);

--DROP TABLE student
--DROP TABLE artists;
CREATE TABLE IF NOT EXISTS artists(
	id SERIAL PRIMARY KEY,
	name VARCHAR(200)
);


SELECT *
FROM artists;

CREATE TABLE IF NOT EXISTS city(
	id SERIAL,
	name VARCHAR(30),
	popular INT,
	PRIMARY KEY (id)
);

SELECT *
FROM city;









