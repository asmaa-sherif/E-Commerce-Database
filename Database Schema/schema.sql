-- E-Commerce Database Schema

-- Table: Customer
CREATE TABLE Customer (
    CustomerID UUID PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: Address
CREATE TABLE Address (
    AddressID UUID PRIMARY KEY,
    CustomerID UUID NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    AddressLine1 VARCHAR(255) NOT NULL,
    AddressLine2 VARCHAR(255),
    IsDefault SMALLINT DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

-- Table: PaymentType
CREATE TABLE PaymentType (
    PaymentTypeID UUID PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL,
    IsActive DATE
);

-- Table: Payment
CREATE TABLE Payment (
    PaymentID UUID PRIMARY KEY,
    CustomerID UUID NOT NULL,
    PaymentTypeID UUID NOT NULL,
    AccountNumber VARCHAR(20),
    SecurityCode VARCHAR(4),
    ExpiryDate DATE,
    IsDefault SMALLINT DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (PaymentTypeID) REFERENCES PaymentType(PaymentTypeID)
);

-- Table: Cart
CREATE TABLE Cart (
    CartID UUID PRIMARY KEY,
    CustomerID UUID NOT NULL,
    PromotionID UUID,
    Discount NUMERIC(10, 2),
    TotalPrice NUMERIC(10, 2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (PromotionID) REFERENCES Promotion(PromotionID)
);

-- Table: CartItem
CREATE TABLE CartItem (
    CartItemID UUID PRIMARY KEY,
    CartID UUID NOT NULL,
    ProductID UUID NOT NULL,
    Quantity INTEGER NOT NULL,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

-- Table: Promotion
CREATE TABLE Promotion (
    PromotionID UUID PRIMARY KEY,
    Code VARCHAR(100),
    DiscountRate VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

-- Table: Product
CREATE TABLE Product (
    ProductID UUID PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price NUMERIC(10, 2) NOT NULL,
    ImageURL TEXT,
    ShortDesc VARCHAR(100),
    LongDesc TEXT,
    Availability SMALLINT DEFAULT 1,
    ShippingCost NUMERIC(10, 2),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: Category
CREATE TABLE Category (
    CategoryID UUID PRIMARY KEY,
    ParentCategoryID UUID,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255),
    FOREIGN KEY (ParentCategoryID) REFERENCES Category(CategoryID)
);

-- Table: ProductCategory
CREATE TABLE ProductCategory (
    ProductCategoryID UUID PRIMARY KEY,
    ProductID UUID NOT NULL,
    CategoryID UUID NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE
);

-- Table: Variation
CREATE TABLE Variation (
    VariationID UUID PRIMARY KEY,
    ProductID UUID,
    Material VARCHAR(100),
    Size VARCHAR(100),
    Color VARCHAR(100)
);

-- Table: ProductVariation
CREATE TABLE ProductVariation (
    ProductVariationID UUID PRIMARY KEY,
    ProductID UUID NOT NULL,
    VariationID UUID NOT NULL,
    StockQty INTEGER NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (VariationID) REFERENCES Variation(VariationID) ON DELETE CASCADE
);

-- Table: OrderStatus
CREATE TABLE OrderStatus (
    StatusID UUID PRIMARY KEY,
    StatusName VARCHAR(100) NOT NULL
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID UUID PRIMARY KEY,
    CustomerID UUID NOT NULL,
    CartID UUID NOT NULL,
    StatusID UUID NOT NULL,
    TotalPrice NUMERIC(10, 2),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID)
);

-- Table: Shipping
CREATE TABLE Shipping (
    ShippingID UUID PRIMARY KEY,
    OrderID UUID NOT NULL,
    ShippingMethod VARCHAR(100),
    Price NUMERIC(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);

-- Table: Review
CREATE TABLE Review (
    ReviewID UUID PRIMARY KEY,
    ProductID UUID NOT NULL,
    CustomerID UUID NOT NULL,
    Rating SMALLINT NOT NULL,
    Comments TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Table: ProductReview
CREATE TABLE ProductReview (
    ProductReviewID UUID PRIMARY KEY,
    ProductID UUID NOT NULL,
    ReviewID UUID NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID) ON DELETE CASCADE
);
