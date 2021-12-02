/*Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code.*/

SELECT 
	b.book_id AS book_id, 
	CONCAT(m.sur_name,' ',m.first_name) as member,
	f.name as facility,
	b.slots*f.guest_cost AS cost
FROM
	bookings as b	
		INNER JOIN facilities as f 
		on b.fac_id = f.fac_id
		INNER JOIN members as m 
		on m.mem_id = b.mem_id
WHERE (b.slots * f.guest_cost) > 30 AND b.mem_id = 1
ORDER BY b.book_id

;
