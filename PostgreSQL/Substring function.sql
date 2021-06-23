SELECT
	substring(first_name,1,1) AS letter, 
	count(first_name) AS count
FROM 
	customer
GROUP BY 
	letter
ORDER BY 
	letter;
