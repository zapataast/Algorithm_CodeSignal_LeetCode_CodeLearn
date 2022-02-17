SELECT b.N , 
CASE 
    WHEN b.P is null THEN "Root"
    WHEN (SELECT SUM(CASE WHEN b.N = c.P THEN 1 ELSE 0 END) FROM BST as c)!=0 THEN "Inner"
    ELSE "Leaf"
END as gg
FROM BST as b
ORDER By b.N
