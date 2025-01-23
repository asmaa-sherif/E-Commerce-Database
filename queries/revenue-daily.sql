-- Write an SQL query to generate a daily report of the total revenue for a specific date.
SELECT 
    o.OrderDate AS ReportDate,
    SUM(o.TotalPrice) AS TotalRevenue
FROM 
    Orders o
WHERE 
    o.OrderDate = '2025-01-23'  -- Replace with the desired date
GROUP BY 
    o.OrderDate;

