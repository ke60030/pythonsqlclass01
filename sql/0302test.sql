select now() as 現在時間

CREATE DATABASE test;

--DROP DATABASE test;


CREATE TABLE IF NOT EXISTS student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20)
);
