CREATE PROCEDURE booksCatalogs()
BEGIN
    SELECT SUBSTRING(xml_doc, 
    LOCATE(CONCAT('<', 'author', '>'), xml_doc) + LENGTH(CONCAT('<', 'author', '>')),
    (LOCATE(CONCAT('</', 'author', '>'),xml_doc))-(LOCATE(CONCAT('<', 'author', '>'), xml_doc) + LENGTH(CONCAT('<', 'author', '>'))))    AS gg
    FROM catalogs
    ORDER BY gg
    ;
END
