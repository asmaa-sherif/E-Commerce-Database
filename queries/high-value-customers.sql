-- Write a SQL query to retrieve a list of customers who have placed orders totaling more than $500 in the past month.
-- Include customer names and their total order amounts. 
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    SUM(o.TotalPrice) AS TotalOrderAmount
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.orderDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) -- Orders placed in the past month
GROUP BY 
    c.CustomerID, c.Name
HAVING 
    SUM(o.TotalPrice) > 500  -- Total order amount exceeds $500
ORDER BY 
    TotalOrderAmount DESC;  -- Sort by highest spending customers
