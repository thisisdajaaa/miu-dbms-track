CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShipCity VARCHAR(255),
    ShipCountry VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    SupplierID INT,
    CategoryID INT,
    UnitPrice DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);