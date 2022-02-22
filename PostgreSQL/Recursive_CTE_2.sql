WITH RECURSIVE alphabet AS (
	SELECT 
		-- Initialize letter to A
		65 AS number_of_letter
	-- Statement to combine the anchor and the recursive query
  	UNION ALL
	SELECT 
		-- Add 1 each iteration
		number_of_letter + 1 as number_of_letter
	-- Select from the defined CTE alphabet
	FROM 
		alphabet
	-- Limit the alphabet to A-Z
  	WHERE number_of_letter < 90 )

--Select the alphabet from A to Z
SELECT CHR(number_of_letter) AS character
FROM alphabet ;
