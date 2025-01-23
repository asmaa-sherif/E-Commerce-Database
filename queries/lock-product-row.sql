-- Lock the Entire Row for Product ID = 211
START TRANSACTION;

-- Lock the entire row
SELECT *
FROM Product
WHERE ProductID = 211
FOR UPDATE;

-- No updates can be made to the row for ProductID = 211
COMMIT;

