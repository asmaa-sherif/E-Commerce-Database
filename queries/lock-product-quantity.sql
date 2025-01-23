-- Lock the Field Quantity for Product ID = 211
START TRANSACTION;

-- Lock the specific field
SELECT Quantity
FROM Product
WHERE ProductID = 211
FOR UPDATE;

-- No updates can be made to the Quantity field for ProductID = 211
COMMIT;

