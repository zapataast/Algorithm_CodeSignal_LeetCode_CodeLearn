/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */

SELECT
	-- Concatenate uppercase of category to the title in title case
	CONCAT(UPPER(name),': ',INITCAP(title)) AS label,  -- Үгийн эхний үсгийг том болгоно.
	-- Convert the description column to lowercase
	LOWER(description) AS description
FROM
	film
INNER JOIN category 
    ON category.category_id = film.category_id
ORDER BY 
	label;
