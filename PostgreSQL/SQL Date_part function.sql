/* 
	TO_DATE - string-ыг date болгож хөрвүүлнө.
	SELECT DATE_PART('year',TIMESTAMP '2017-01-01'); OUTPUT // 2017
	SELECT DATE_PART('dow',TIMESTAMP '2017-03-18 10:20:30') dow; // 7 хоногийн хэддэх өдөр вэ гэдгийг буцаана
	SELECT DATE_PART('doy',TIMESTAMP '2017-03-18 10:20:30') doy; // 365 хоногийн хэддэх өдөр вэ гэдгийг буцаана
*/

SELECT 
	name,
	event_date
FROM
	events
WHERE 
	(SELECT
	MAX(TO_DATE(event_date,'YYYY-MM-DD'))
	FROM
	events) - TO_DATE(event_date,'YYYY-MM-DD') > 0
AND
	(SELECT
	MAX(TO_DATE(event_date,'YYYY-MM-DD'))
	FROM
	events) - TO_DATE(event_date,'YYYY-MM-DD') <= 7

ORDER BY 
	event_date desc , name;
