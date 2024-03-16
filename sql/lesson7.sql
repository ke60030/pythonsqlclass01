--OEM  物件導向方式撰寫sql
--subquery

/*進站人數最多的一筆*/
SELECT * 
FROM gate_count LEFT JOIN stations ON 站點編號=編號

SELECT *
FROM gate_count
WHERE 進站人數 =MAX(進站人數)--查詢失敗，因為統計FUNCTION不能放在WHERE後面

SELECT MAX(進站人數)
FROM gate_count

SELECT * 
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 進站人數 =(SELECT MAX(進站人數)
				FROM gate_count);

/*各站點進站人數最多的一筆*/

SELECT 站點編號,進站人數
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE (站點編號,進站人數) IN (
	SELECT 站點編號,MAX(進站人數)
	FROM gate_count
	GROUP BY 站點編號
);

SELECT DISTINCT 站點編號,進站人數
FROM gate_count LEFT JOIN stations ON 站點編號 = 編號
WHERE (站點編號,進站人數) IN(
	SELECT 站點編號,MAX(進站人數)
	FROM gate_count
	GROUP BY 站點編號
);








