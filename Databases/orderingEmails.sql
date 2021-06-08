CREATE PROCEDURE orderingEmails()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    
    SELECT id, email_title,  
    CASE 
        WHEN size < 1024 THEN CONCAT(TRUNCATE(size/1024,0), " Kb")
        WHEN size < 1048576 AND size >= 1024 THEN CONCAT(TRUNCATE(size/1024,0), " Kb")
        WHEN size >= 1048576 THEN CONCAT(TRUNCATE(size/1024/1024,0), " Mb")
    END as short_size 
    
    FROM emails
    ORDER BY size DESC;
    
END
