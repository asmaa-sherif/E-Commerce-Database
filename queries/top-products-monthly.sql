 -- Write an SQL query to generate a monthly report of the top-selling products in a given month.
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(oi.Quantity) AS TotalQuantitySold
FROM 
    OrderItem oi
JOIN 
    Product p ON oi.ProductID = p.ProductID
JOIN 
    Orders o ON oi.OrderID = o.OrderID
WHERE 
    MONTH(o.OrderDate) = 1  -- Replace 1 with the desired month (e.g., January)
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    TotalQuantitySold DESC
LIMIT 10;  -- Shows the top 10 selling products

