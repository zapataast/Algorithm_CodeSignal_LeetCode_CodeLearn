CREATE PROCEDURE suspectsInvestigation()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    select id, name, surname
    from Suspect
    where surname LIKE 'Gre_n' and height <= 170 and name like 'B%';
EN
