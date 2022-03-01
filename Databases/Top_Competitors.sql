SELECT f.Hacker_id , x.name
FROM (SELECT s.Hacker_id,  ROW_NUMBER() OVER (  --
      PARTITION BY s.Hacker_id
      ORDER By s.Hacker_id
      ) as row_num 
FROM Submissions s INNER JOIN Difficulty d 
ON d.score = s.score INNER JOIN Challenges c 
ON c.Challenge_id = s.Challenge_id 
WHERE c.difficulty_level = d.difficulty_level and s.score = d.score) as f INNER JOIN Hackers x 
ON x.hacker_id = f.hacker_id 
WHERE f.row_num >= 2
GROUP by f.Hacker_id , x.name
ORDER by count(f.row_num) desc ,f.Hacker_id
