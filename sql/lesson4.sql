
CREATE DATABASE dvdrental

/*constraints限制*/

DROP TABLE student;

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20),
	score INT
);

SELECT *
FROM student

新增資料
/* INSERT INTO 表格名稱 VALUES(欄位名稱)
RETURNING * 回傳新增結果值
*/

INSERT INTO student VALUES(1,'小白','英語','50')

INSERT INTO student VALUES(2,'小白','歷史')
RETURNING *

INSERT INTO student(name,major) VALUES('小白','地理')
RETURNING *

/*新增多筆*/
INSERT INTO student (name,major) 
VALUES('小藍','歷史'),('小紅','自然')


INSERT INTO student VALUES(1, '小白','英語',50);
INSERT INTO student VALUES(2, '小黃','生物',90);
INSERT INTO student VALUES(3, '小綠','歷史',70);
INSERT INTO student VALUES(4, '小藍','英語',80);
INSERT INTO student VALUES(5, '小黑','化學',20);

SELECT * FROM student LIMIT 2

/*ORDER BY ASC 由小到大
  ORDER BY DESC 由大到小
  LIMIT 限制筆數*/

SELECT name AS 姓名,major AS 主修
FROM student;

SELECT *
FROM  student
ORDER BY score DESC 
LIMIT 3;

SELECT *
FROM  student
ORDER BY score ASC 
LIMIT 2;

SELECT *
FROM student
WHERE major ='英語'
ORDER BY score DESC
LIMIT 1;

SELECT *
FROM student
WHERE major='英語' AND score < 60;

SELECT *
FROM student
WHERE major = '英語' or score > 60;

SELECT *
FROM student
WHERE major ='英語' OR major='生物' OR major='歷史';

SELECT *
FROM student
WHERE major IN ('英語','生物','歷史');

SELECT *
FROM student
WHERE score >=80 AND score<= 100;

SELECT *
FROM student
WHERE score BETWEEN 80 AND 100;

SELECT *
FROM student
WHERE NOT name='小黃'

SELECT *
FROM student
WHERE name LIKE '小%'

SELECT *
FROM student
WHERE name LIKE '%黃%'

UPDATE student
SET major='生物'
WHERE student_id=3

select * from student

DELETE FROM student
WHERE name='小黃' AND major='生物'






