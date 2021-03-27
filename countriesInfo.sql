CREATE PROCEDURE countriesInfo()
BEGIN
    SELECT COUNT(name) as number, (sum(population)/count(name)) as average, sum(population) as total
    FROM countries;
END
