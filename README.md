# E-Commerce Database

## Overview
This repository contains the design and implementation of a scalable and flexible e-commerce database. It includes:
- **Database Schema**: The design and SQL scripts for creating the database structure.
- **SQL Queries**: Sample queries for managing data, performing analytics, and creating the database.

## Structure
- **db-schema**: Contains the database schema and relationships.
  - [`schema.sql`](db-schema/schema.sql): SQL script for creating tables.
  - [`er-diagram.png`](db-schema/er-diagram.png): Entity-Relationship diagram of the database.
  - [`relationships.md`](db-schema/relationships.md): Detailed documentation of entity relationships.
- **queries**: Contains example SQL queries.
  - [`create-database.sql`](queries/create-database.sql): Script to initialise the database.
  - [`sample-queries.sql`](queries/sample-queries.sql): Queries for common operations like retrieving customers, products, and orders.
  - [`advanced-queries.sql`](queries/advanced-queries.sql): Advanced SQL queries for analytics and reporting.

## Quick Start
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/e-commerce-database.git
   cd e-commerce-database


 
## Entity Relationships

### Overview
This e-commerce system consists of several entities that interact to manage customers, products, orders, and more. Below is a summary of the relationships between entities:

| **Entity 1**       | **Relationship**  | **Entity 2**       | **Cardinality** | **Description**                                 |
|---------------------|-------------------|---------------------|-----------------|-------------------------------------------------|
| Customer            | has              | Address             | 1-to-many       | A customer can have multiple addresses.         |
| Address             | belongs to       | Customer            | many-to-1       | Each address belongs to one customer.           |
| Customer            | has              | Payment             | 1-to-many       | A customer can have multiple payment methods.   |
| Payment             | belongs to       | Customer            | many-to-1       | Each payment method belongs to one customer.    |
| Product             | belongs to       | Category            | many-to-many    | A product can belong to multiple categories.    |
| Category            | has              | Product             | many-to-many    | A category can contain multiple products.       |
| Product             | has              | Variation           | 1-to-many       | A product can have multiple variations.         |
| Variation           | belongs to       | Product             | many-to-1       | Each variation belongs to one product.          |
| Cart                | contains         | Product             | many-to-many    | A cart can contain multiple products.           |
| Order               | belongs to       | Customer            | many-to-1       | Each order belongs to one customer.             |

### Entity Relationship Diagram
![ER Diagram](path_to_er_diagram_image.png)

### Key Details
- **Customer ↔ Address**:
  - A customer can have multiple addresses.
  - The `IsDefault` field determines which address is the default.
- **Product ↔ Category**:
  - Products and categories have a many-to-many relationship.
  - The `ProductCategory` table links them.
- **Product ↔ Variation**:
  - A product can have multiple variations, such as size or colour.
  - Each variation belongs to one product.


