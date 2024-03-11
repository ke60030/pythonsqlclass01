/*foreign key (branch_id) references branch(branch_id)*/

--foreign key -限制一致性


CREATE TABLE IF NOT EXISTS 客戶(
	客戶_id SERIAL,
	客戶名稱 VARCHAR(255) NOT NULL,
	PRIMARY KEY(客戶_id)
);


CREATE TABLE IF NOT EXISTS 聯絡人(
	聯絡人id SERIAL,
	客戶id INT,
	聯絡人姓名 VARCHAR(255) NOT NULL,
	電話 VARCHAR(15),
	郵件 VARCHAR(100),
	PRIMARY KEY (聯絡人id),
	FOREIGN KEY (客戶id) REFERENCES 客戶(客戶_id)
	/*若沒寫以下限制，客戶(客戶_id)不能被刪除*/
	--ON DELETE SET NULL /* 客戶(客戶_id)有被刪的話，(聯絡人)客戶id會寫NULL值*/
	--ON DELETE CASCADE  /*階層式移除-客戶(客戶_id)有被刪的話，(聯絡人)客戶id有對應到的值彙整筆刪除*/
);

DROP TABLE IF EXISTS 聯絡人;
DROP TABLE IF EXISTS 客戶;
SELECT * FROM 客戶;
SELECT * FROM 聯絡人;

INSERT INTO 客戶(客戶名稱)
VALUES('遠傳電信'),
	  ('台灣大車隊');

INSERT INTO 聯絡人(客戶id,聯絡人姓名,電話,郵件)
VALUES (1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
	   (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
	   (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');

/*DELETE FROM 客戶 
WHERE 客戶_id = 1;*/

SELECT 聯絡人id,聯絡人姓名,電話,郵件
FROM 聯絡人 LEFT JOIN 客戶 ON 聯絡人.客戶id =客戶.客戶_id
WHERE 客戶名稱 ='遠傳電信'

-------------------------------------

CREATE TABLE basket_a(
	a INT PRIMARY KEY,
	fruit_a VARCHAR(100) NOT NULL
);

CREATE TABLE basket_b(
	b INT PRIMARY KEY,
	fruit_b VARCHAR(100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

SELECT * FROM basket_a
SELECT * FROM basket_b

/*inner join*/
SELECT a,fruit_a,b,fruit_b 
FROM basket_a INNER JOIN basket_b ON fruit_a=fruit_b
/*LEFT JOIN*/
SELECT a,fruit_a,b,fruit_b 
FROM basket_a LEFT JOIN basket_b ON fruit_a=fruit_b

SELECT a,fruit_a,b,fruit_b 
FROM basket_a LEFT JOIN basket_b ON fruit_a=fruit_b
WHERE b IS NULL

/*RIGHT JOIN*/
SELECT a,fruit_a,b,fruit_b 
FROM basket_a RIGHT JOIN basket_b ON fruit_a=fruit_b

SELECT a,fruit_a,b,fruit_b 
FROM basket_a RIGHT JOIN basket_b ON fruit_a=fruit_b
WHERE a IS NULL

/*FULL OUTER JOIN*/
SELECT a,fruit_a,b,fruit_b 
FROM basket_a FULL OUTER JOIN basket_b ON fruit_a=fruit_b

SELECT a,fruit_a,b,fruit_b 
FROM basket_a FULL OUTER JOIN basket_b ON fruit_a=fruit_b
WHERE a IS NULL OR b IS NULL


-------------------------------------------


DROP TABLE IF EXISTS stations;
DROP TABLE IF EXISTS gate_count;

CREATE TABLE IF NOT EXISTS stations(
	編號 INT PRIMARY KEY,
	名稱 VARCHAR(20),
	英文名稱 VARCHAR(50),
	地名 VARCHAR(20),
	英文地名 VARCHAR(50),
	地址 VARCHAR(255),
	英文地址 VARCHAR(255),
	電話 VARCHAR(20),
	gps  VARCHAR(50),
	youbike BOOL
);

SELECT * FROM  stations

SELECT COUNT(*) AS 筆數
FROM stations;

--DROP TABLE IF EXISTS gate_count
	
CREATE TABLE IF NOT EXISTS gate_count(
	id SERIAL,
	日期 DATE NOT NULL,
	站點編號 INT,
	進站人數 INT DEFAULT 0, /*預設若無資料時寫入0*/
	出站人數 INT DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY (站點編號) REFERENCES stations(編號)
	ON DELETE SET NULL
	ON UPDATE CASCADE /*stations若有更新這裡也要一併更新*/
);

select * from gate_count

SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號=編號

/*取出基隆市有那些火車站*/
SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 地址 LIKE '基隆市%';

SELECT DISTINCT 名稱
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 地址 LIKE '基隆%';

/*取出基隆火車站2022年3月1日資料,'2022-03-01'*/
SELECT * 
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱='基隆' AND 日期='2022-03-01';

SELECT  日期,進站人數,出站人數,名稱,地名,地址,youbike
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱='基隆' AND 日期='2022-03-01';

/*取出基隆火車站2022年3月份資料,時間由小到大排序*/
SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱 IN('基隆','臺北') AND 日期 BETWEEN '2022-03-01' AND '2022-03-31' 
ORDER BY 日期;

SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
FROM gate_count LEFT JOIN stations ON 站點編號=編號
ORDER BY 進站人數 DESC
LIMIT 10;













