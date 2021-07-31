/*
  AGE(r.return_date, r.rental_date) - // 0 years 0 mons 3 days 20 hours 46 mins 0.00 secs   // ::text ашиглан гаралты гөөрчилж болно  //3 days 20:46:00
*/

SELECT 
	-- Show full name of customer, full_name = first name + " " + last_name
	CONCAT(first_name,' ', last_name) AS customer_name,
	f.title AS title,
	-- Rental_date from rental tables
	Concat(r.rental_date::date, ' ', r.rental_date::time(0)) AS rental_date,
	-- Extract the day of week date part from the rental_date
	DATE_PART('dow',r.rental_date)::int as dayofweek,
	-- Remember the last exercise of AGE function to get rental_days
	AGE(r.return_date, r.rental_date)::text as rental_days,
	-- Use DATE_TRUNC to get days from the AGE function when get value from rental_days and fill it to the blank
	CASE
		WHEN  DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) >  f.rental_duration * INTERVAL '1' day 
		THEN 'TRUE'
	ELSE 'FALSE'
	END AS past_due 
FROM 
	film AS f
		INNER JOIN inventory as i
        on i.film_id = f.film_id
		INNER JOIN rental as r 
		on r.inventory_id = i.inventory_id
		INNER JOIN customer as c 
		on c.customer_id = r.customer_id

-- Use an INTERVAL for the upper bound of the rental_date 
WHERE 
	rental_date > '2005-05-01' 
ORDER BY 
	customer_name, f.title, r.rental_date
;



