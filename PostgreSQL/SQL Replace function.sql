/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */

SELECT 
	-- Replace whitespace in the film title with an underscore
	Replace(title,' ','_') AS title
FROM film; 
