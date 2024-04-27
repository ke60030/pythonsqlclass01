
CREATE TABLE IF NOT EXISTS 站點資訊(
	站點編號 VARCHAR(10),
	站點名稱 VARCHAR(30) NOT NULL,
	行政區 VARCHAR(10) NOT NULL,
	站點地址 VARCHAR(50),
	lat NUMERIC(15,11),
	lng NUMERIC(15,11),
	PRIMARY KEY(站點編號)
);

SELECT * FROM 站點資訊;

CREATE TABLE IF NOT EXISTS youbike(
	日期 TIMESTAMP,
	編號 VARCHAR(10),
	總車輛 INTEGER,
	可借 INTEGER,
	可還 INTEGER,
	活動 BOOLEAN,
	PRIMARY KEY(日期,編號),
	FOREIGN KEY(編號) REFERENCES 站點資訊(站點編號)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

SELECT * FROM youbike;

--DROP TABLE youbike;
--DROP TABLE 站點資訊;

SELECT count(*) AS 筆數
FROM youbike;

/*先測試這筆，才可以了解下面*/
SELECT MAX(日期),編號
FROM youbike
GROUP BY 編號;

/*取出最新時間youbike資料*/
SELECT 日期,站點資訊,站點名稱,行政區,站點地址,lat,lng,總車輛,可借,可還,可借,活動
FROM youbike
JOIN 站點資訊 ON youbike.編號 = 站點資訊.站點編號
WHERE (日期,編號) IN (
		SELECT MAX(日期),編號
		FROM youbike
		GROUP BY 編號
);

/*取出行政區*/
SELECT 行政區
FROM 站點資訊
GROUP BY 行政區;


/*取出最新時間youbike資料,依據行政區*/
SELECT 日期,站點資訊.站點名稱,行政區,站點地址,lat,lng,總車輛,可借,可還,可借,活動
FROM youbike
JOIN 站點資訊 ON youbike.編號 = 站點資訊.站點編號
WHERE (日期,編號) IN (
	SELECT MAX(日期),編號
	FROM youbike
	GROUP BY 編號
) AND 行政區 = '大安區';


















