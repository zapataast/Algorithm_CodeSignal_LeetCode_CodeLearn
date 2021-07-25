/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */


SELECT
    f.title as title,
    to_char(r.rental_date,'YYYY-MM-DD HH24:MI:SS') rental_date,
    f.rental_duration as rental_duration,
    
    to_char(r.rental_date + INTERVAL '1 day'*rental_duration ,'YYYY-MM-DD HH24:MI:SS') expected_return_date,
       
    to_char(r.return_date, 'YYYY-MM-DD HH24:MI:SS') return_date
FROM inventory as i
	INNER JOIN rental as r
        on i.inventory_id = r.inventory_id
	INNER JOIN film as f
        on f.film_id = i.film_id
ORDER BY 
    title,rental_date, return_date;
