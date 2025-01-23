-- Write a SQL query to search for all products with the word "camera" in either the product name or description.
SELECT 
    ProductID,
    Name AS ProductName,
    ShortDesc AS ShortDescription,
    LongDesc AS LongDescription,
    Price
FROM 
    Product
WHERE 
    ProductName LIKE '%camera%' OR
    ShortDescription LIKE '%camera%' OR
    LongDescription LIKE '%camera%';
