CREATE PROCEDURE netIncome()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT YEAR(date) as year ,
    QUARTER(date) as quarter , 
    SUM(cast(profit as signed) - cast(loss as signed)) as net_profit
    from accounting
    group by quarter, year
    order by year
    ;
END
