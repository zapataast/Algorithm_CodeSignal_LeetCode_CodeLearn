SELECT round(cast((SELECT count(*)
From activity as a1 inner join activity as a2 
on a1.event_date != a2.event_date
where a1.player_id = a2.player_id and DATEDIFF(day, a2.event_date, a1.event_date) = 1 
and a2.event_date = (SELECT TOP 1 a3.event_date 
FROM activity as a3
WHere a3.player_id = a1.player_id
order by a3.event_date)) as DECIMAL(5, 2))/ (Select count(Distinct player_id) from Activity),2) as fraction
