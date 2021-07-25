/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */

SELECT 
	id AS id, 
	-- Format the value of title column
	INITCAP(REGEXP_REPLACE(TRIM(BOTH title),'\s+',' ','g')) AS title 
  -- REGEXP_REPLACE функц нь үгнүүдийн хоорондох хоосон зайнуудыг устгаж 1 л хоосон зай үлдээдэг.
  -- TRIM Сонгогдсон үгсийн баруун болон зүүн талын хоосон зайнуудыг устгадаг
    -- LEADING | TRAILING | BOTH гэсэн 3 сонголттой
FROM titles;
