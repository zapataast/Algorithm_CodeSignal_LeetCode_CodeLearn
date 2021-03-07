CREATE PROCEDURE testCheck()
    SELECT id, IF(given_answer = correct_answer, 'correct' , 
    if(given_answer = 0,'incorrect',"no answer")) AS checks
    FROM answers
    ORDER BY id;
