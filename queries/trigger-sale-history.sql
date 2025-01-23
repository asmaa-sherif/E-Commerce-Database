-- Write a Trigger to Create a Sale History
-- When a new order is inserted into the Orders table, this trigger will automatically generate a sale history record, capturing the order date, customer, product, total amount, and quantity.
-- Assuming a SaleHistory table exists with the following columns:
-- SaleHistoryID (Primary Key), OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount

CREATE TRIGGER AfterOrderInsert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    -- Insert sale history for all items in the order
    INSERT INTO SaleHistory (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount)
    SELECT 
        NEW.OrderID,          -- The newly inserted order's ID
        NEW.CustomerID,       -- Customer ID from the order
        oi.ProductID,         -- Product ID from the order items
        NEW.OrderDate,        -- Order date
        oi.Quantity,          -- Quantity of the product
        (oi.Quantity * p.Price) AS TotalAmount -- Total amount = quantity * product price
    FROM 
        OrderItem oi
    JOIN 
        Product p ON oi.ProductID = p.ProductID
    WHERE 
        oi.OrderID = NEW.OrderID; -- Match the newly inserted order
END;

