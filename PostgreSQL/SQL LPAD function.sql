SELECT
	LPAD(postal_code::text, 8 ,'0') as zip
  	--LPAD функцыг ашиглан стрингийн урд болон хойно нь тэмдэг, үсэг нэмж болно . 
  	--::text нь тоог стрингрүү хөрвүүлж байна. 
FROM
	customers
ORDER by
	zip
;
