SELECT w.id, p.age, w.coins_needed, w.power
FROM Wands w JOIN wands_property p 
ON w.code = p.code 
WHERE w.coins_needed = (
SELECT coins_needed
FROM wands d 
WHERE p.code = d.code and w.power = d.power
order by coins_needed 
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY ) AND p.is_evil != 1
ORDER By w.power desc, p.age desc
                           
