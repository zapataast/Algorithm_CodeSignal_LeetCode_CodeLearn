SELECT id , 
SUM(CASE 
    WHEN month = 'Jan' THEN revenue
    ELSE null
END) as 'Jan_Revenue',
SUM(CASE 
    WHEN month = 'Feb' THEN revenue
    ELSE null
END) as 'Feb_Revenue',
SUM(CASE 
    WHEN month = 'Mar' THEN revenue
    ELSE null
END) as 'Mar_Revenue' , 
SUM(CASE 
    WHEN month = 'Apr' THEN revenue
    ELSE null
END) as 'Apr_Revenue',
SUM(CASE 
    WHEN month = 'May' THEN revenue
    ELSE null
END) as 'May_Revenue',
SUM(CASE 
    WHEN month = 'Jun' THEN revenue
    ELSE null
END) as 'Jun_Revenue',
SUM(CASE 
    WHEN month = 'Jul' THEN revenue
    ELSE null
END) as 'Jul_Revenue',
SUM(CASE 
    WHEN month = 'Aug' THEN revenue
    ELSE null
END) as 'Aug_Revenue',
SUM(CASE 
    WHEN month = 'Sep' THEN revenue
    ELSE null
END) as 'Sep_Revenue',
SUM(CASE 
    WHEN month = 'Oct' THEN revenue
    ELSE null
END) as 'Oct_Revenue',
SUM(CASE 
    WHEN month = 'Nov' THEN revenue
    ELSE null
END) as 'Nov_Revenue',
SUM(CASE 
    WHEN month = 'Dec' THEN revenue
    ELSE null
END) as 'Dec_Revenue'

FROM Department
GROUP BY id
;
