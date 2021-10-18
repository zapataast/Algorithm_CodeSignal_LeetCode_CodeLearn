CREATE PROCEDURE soccerGameSeries()
BEGIN
    SELECT
    CASE 
        WHEN SUM(CASE WHEN first_team_score	> second_team_score THEN 1 end) > SUM(CASE WHEN first_team_score < second_team_score THEN 1 END) THEN 1
        WHEN SUM(CASE WHEN first_team_score	> second_team_score then 1 end) < SUM(CASE WHEN first_team_score < second_team_score THEN 1 END) THEN 2
        WHEN SUM(first_team_score) > SUM(second_team_score) THEN 1
        WHEN SUM(first_team_score) < SUM(second_team_score) THEN 2
        
        WHEN SUM(CASE WHEN (match_host=2) THEN first_team_score END) > SUM(CASE WHEN (match_host=1) THEN second_team_score END) THEN 1
        WHEN SUM(CASE WHEN (match_host=2) THEN first_team_score END) < SUM(CASE WHEN (match_host=1) THEN second_team_score END) THEN 2 
       
        ELSE 0
    END as winner
    
    FROM scores;
EN
