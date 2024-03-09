
/*聚合函數：COUNT,SUM*/

/*取出payment的所有客戶的costomer_id(不重複)*/
SELECT customer_id ,COUNT(*) AS 筆數
FROM payment
GROUP BY customer_id

/*取出payment的所有客戶的的應收帳款總合,SUM()*/
SELECT customer_id,SUM(amount) AS 總和
FROM payment
GROUP BY customer_id
ORDER BY 總和 DESC

/**/
select * from customer

SELECT first_name ||' ' || last_name AS full_name,
	   SUM(amount) AS 總和
FROM payment LEFT JOIN customer ON payment.customer_id=customer.customer_id
GROUP BY full_name
ORDER BY 總和 DESC

SELECT first_name ||' '|| last_name AS full_name,/*2個欄位組成字串使用||符號*/
	   SUM(amount) AS 總和
FROM payment LEFT JOIN customer USING (customer_id)/*因為欄位名稱相同所以使用USING*/
GROUP BY full_name
HAVING SUM(amount) >=200 /*過濾，條件要輸聚合函數*/
ORDER BY 總和 DESC;








