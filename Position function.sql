SELECT 
	-- Select only the street name from the address table
	SUBSTRING(address,POSITION(' ' IN address)+1) as address
FROM 
	address;
