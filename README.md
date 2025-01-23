# **E-Commerce Database**

## **Overview**
This repository contains the design and implementation of a robust e-commerce database system. It includes:
- **Database Schema**: The structure for managing entities such as customers, products, orders, payments, and more.
- **Entity Relationships**: A detailed explanation of how entities interact within the database.
- **SQL Queries**: Scripts for creating the database, managing data, and performing common and advanced operations.

The system is designed to handle core e-commerce functionalities, such as:
- Customer and address management.
- Product categorisation and variations.
- Cart and order processing.
- Payment methods and promotions.
- Shipping and order status tracking.

---

## **Structure**

### **Database-Schema**
- [`Schema.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/Database%20Schema/schema.sql): SQL script for creating tables.
- [`ER-diagram.png`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/Database%20Schema/ERD.png): Entity-Relationship diagram of the database.
- [`Relationships.md`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/Database%20Schema/relationships.md): Detailed documentation of entity relationships.

### **Queries**
The `queries` folder contains individual SQL scripts for various tasks:
- **Reporting Queries**:
  - [`revenue-daily.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/queries/revenue-daily.sql): SQL for daily revenue report.
  - [`top-products-monthly.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/queries/top-products-monthly.sql): SQL for monthly top-selling products.
  - [`high-value-customers.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/queries/high-value-customers.sql): SQL for identifying high-value customers.
- **Updated Database Schema**:
  - [`insert-author-table.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/queries/high-value-customers.sql): SQL script for creating the Author table.
- **Search Queries**:
  - [`search-products-camera.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/queries/search-products-camera.sql): Search for products with the word "camera".
- **Recommendation Queries**:
  - [`recommend-products.sql`](https://github.com/asmaa-sherif/E-Commerce-Database/blob/main/queries/recommend-products.sql): Suggest popular products in the same category by the same author.

---

