SELECT CASE WHEN s2.grade1 < 8 THEN null ELSE s2.name END as name2 , s2.grade1 , s2.marks
FROM (SELECT (SELECT GRADE FROM GRADES WHERE min_mark <= s.marks and s.marks <= max_mark ) as grade1, s.name, s.marks
FROM students s) as s2 
order by s2.grade1 desc, name2 ,s2.marks
