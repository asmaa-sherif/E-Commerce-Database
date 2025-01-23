-- The Author table will store details about product authors. This is useful if you want to track which author (or brand) is responsible for creating a product and for querying products by specific authors.

CREATE TABLE Author (
    AuthorID UUID PRIMARY KEY,     -- Unique identifier for the author
    Name VARCHAR(255) NOT NULL,    -- Name of the author/brand
    Email VARCHAR(255),            -- Optional: Contact email
    Bio TEXT,                      -- Optional: A brief description of the author
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Record creation timestamp
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Last update timestamp
);

-- Add AuthorID to Product Table
ALTER TABLE Product
ADD COLUMN AuthorID UUID NOT NULL,
ADD CONSTRAINT FK_Product_Author
FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE;


