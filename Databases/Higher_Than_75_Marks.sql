SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID asc  --Баруун талын 3 үсгээр нь sort-лож байна.
