CREATE PROCEDURE booksCatalogs()
BEGIN
    SELECT   
    SUBSTRING(xml_doc, LOCATE('<author>',xml_doc)+8, LOCATE('</author>', xml_doc)-LOCATE('<author>',xml_doc)-8) AS gg 
    FROM catalogs
    ORDER BY gg
    ;
END
