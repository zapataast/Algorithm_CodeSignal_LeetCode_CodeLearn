/* Write yor T-SQL query statement below */
SELECT stock_name, 
    SUM(CASE WHEN operation = 'Sell' THEN price 
    WHEN operation = 'Buy' THEN -price
    END) as capital_gain_loss 
FROM Stocks
Group by stock_name
