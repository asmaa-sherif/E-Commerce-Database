-- Can you design a query to suggest popular products in the same category for the same author, excluding the Purchsed product from the recommendations?
SELECT p.product_id,
      p.name
  FROM product p
  LEFT JOIN order_details od -- left join to get all products including the not purchased ones
  ON p.productID = od.productID
  WHERE p.categoryID =
      (SELECT p2.categoryID
       FROM product p2
       WHERE productID = '261') -- Get CategoryID
  AND p.author_id =
      (SELECT p2.authorID
       FROM product p2
       WHERE productID = '261') -- Get AuthorID
  AND p.product_id NOT IN
      (SELECT od.product_id
       FROM orders o
       JOIN orderDetails od ON o.orderID = od.orderID
       WHERE o.customerID = '18')-- Get Purchased Products
  GROUP BY p.productID,
           p.name
  ORDER BY sum(od.quantity)DESC, sum(od.quantity*od.unit_price)
  LIMIT 5;
