# Entity Relationships

## Key Details

- **Customer ↔ Address**:
  - A customer can have multiple addresses.
  - The `IsDefault` field determines which address is the default.

- **Customer ↔ Payment**:
  - A customer can have multiple payment methods.
  - The `IsDefault` field identifies the default payment method for the customer.

- **Product ↔ Category**:
  - Products and categories have a many-to-many relationship.
  - The `ProductCategory` table links them.
  - Categories support hierarchy through the `ParentCategoryID` field, allowing subcategories.

- **Product ↔ Variation**:
  - A product can have multiple variations, such as size, colour, and material.
  - The `ProductVariation` table links products and variations.
  - The `StockQty` field in the `ProductVariation` table tracks the quantity of each variation.

- **Cart ↔ Product**:
  - A cart can contain multiple products, and a product can be in multiple carts.
  - The `CartItem` table tracks the relationship between carts and products, including the quantity of each product.

- **Cart ↔ Promotion**:
  - A cart can apply one promotion at a time.
  - The `Promotion` table includes fields for discount rates and validity periods (`StartDate` and `EndDate`).

- **Order ↔ Customer**:
  - Each order belongs to a customer.
  - The `Order` table tracks order details such as total price and timestamps.

- **Order ↔ Cart**:
  - Each order is created from a single cart.
  - The `CartID` field in the `Order` table references the associated cart.

- **Order ↔ OrderStatus**:
  - Each order has a single status (e.g., Pending, Shipped, Delivered).
  - The `OrderStatus` table stores these statuses.

- **Order ↔ Shipping**:
  - Each order has one associated shipping record.
  - The `Shipping` table stores details like the shipping method and price.

- **Product ↔ Review**:
  - Products and reviews have a many-to-many relationship.
  - The `ProductReview` table links reviews to products.

---

## Entity Relationships

| **Entity 1**       | **Relationship**      | **Entity 2**       | **Cardinality**  | **Description**                                                                                   |
|---------------------|-----------------------|---------------------|------------------|---------------------------------------------------------------------------------------------------|
| **Customer**        | has                  | **Address**         | 1-to-Many        | A customer can have multiple addresses.                                                          |
| **Address**         | belongs to           | **Customer**        | Many-to-1        | Each address is linked to a single customer.                                                     |
| **Customer**        | has                  | **Payment**         | 1-to-Many        | A customer can have multiple payment methods.                                                    |
| **Payment**         | belongs to           | **Customer**        | Many-to-1        | Each payment method belongs to one customer.                                                     |
| **Payment**         | uses                 | **PaymentType**     | Many-to-1        | Each payment references a specific payment type (e.g., Credit Card, PayPal).                     |
| **Customer**        | has                  | **Cart**            | 1-to-1           | Each customer has one cart at a time.                                                            |
| **Cart**            | contains             | **Product**         | Many-to-Many     | A cart can contain multiple products, and a product can be in multiple carts (via **CartItem**). |
| **Cart**            | applies              | **Promotion**       | Many-to-1        | A cart can apply one promotion at a time.                                                        |
| **CartItem**        | links                | **Cart**            | Many-to-1        | A cart item belongs to one cart.                                                                 |
| **CartItem**        | links                | **Product**         | Many-to-1        | A cart item references one product.                                                              |
| **Order**           | placed by            | **Customer**        | Many-to-1        | Each order is placed by one customer.                                                            |
| **Order**           | belongs to           | **Cart**            | 1-to-1           | Each order is created from a single cart.                                                        |
| **Order**           | has a status of      | **OrderStatus**     | Many-to-1        | Each order is associated with a specific order status (e.g., Pending, Shipped).                  |
| **Order**           | includes shipping via | **Shipping**       | 1-to-1           | Each order has one associated shipping record.                                                   |
| **Product**         | belongs to           | **Category**        | Many-to-Many     | A product can belong to multiple categories, and categories can contain multiple products (via **ProductCategory**). |
| **Product**         | has                  | **Variation**       | 1-to-Many        | A product can have multiple variations, such as size or colour.                                  |
| **Variation**       | shared with          | **ProductVariation**| Many-to-Many     | Variations (e.g., colours, sizes) can be shared across multiple products.                        |
| **Product**         | reviewed by          | **Review**          | Many-to-Many     | A product can have multiple reviews, and reviews can apply to multiple products (via **ProductReview**). |

---

## Diagram

Refer to the diagram below for a visual representation of the database entities and their relationships.

![Entity Relationship Diagram](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/Database%20Schema/ERD.png)

---
