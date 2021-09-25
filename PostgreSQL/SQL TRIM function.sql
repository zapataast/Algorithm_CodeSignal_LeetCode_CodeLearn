/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */

SELECT 
	id AS id, 
	INITCAP(REGEXP_REPLACE(TRIM(BOTH title),'\s+',' ','g')) AS title 
  	-- REGEXP_REPLACE функц нь үгнүүдийн хоорондох хоосон зайнуудыг устгаж 1 л хоосон зай үлдээдэг.
  	-- TRIM Сонгогдсон үгсийн баруун болон зүүн талын хоосон зайнуудыг устгадаг
	-- LTRIM('4723/1 MySakila Drive','1234567890/#. ')  -- гэвэл эхний үгний зүүн талаас нь устгаж гаралтанд: 'MySakila Drive' гэж гарна.
    	-- LEADING | TRAILING | BOTH гэсэн 3 сонголттой
FROM titles;
