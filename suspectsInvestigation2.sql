CREATE PROCEDURE suspectsInvestigation2()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    select id , name, surname
    From Suspect 
    where height <= 170 or surname not like 'Gre_n' or name not like 'B%';
EN
