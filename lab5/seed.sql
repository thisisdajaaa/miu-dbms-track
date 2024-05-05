INSERT INTO
    Customers (CustomerID, CustomerName, ContactName, Country)
VALUES
    (1, 'Alice Smith', 'Alice', 'USA'),
    (2, 'Bob Johnson', 'Bob', 'UK'),
    (3, 'Charlie Brown', 'Charlie', 'Germany'),
    (4, 'David Green', 'David', 'Australia'),
    (5, 'Eve White', 'Eve', 'Canada');

INSERT INTO
    Products (
        ProductID,
        ProductName,
        SupplierID,
        CategoryID,
        UnitPrice
    )
VALUES
    (1, 'Product A', 1, 1, 25.50),
    (2, 'Product B', 2, 1, 40.00),
    (3, 'Product C', 3, 2, 15.75),
    (4, 'Product D', 1, 3, 22.50),
    (5, 'Product E', 4, 2, 35.00),
    (6, 'Product F', 5, 3, 19.99),
    (7, 'Product G', 2, 1, 29.99),
    (8, 'Product H', 3, 1, 45.50),
    (9, 'Product I', 4, 2, 12.99),
    (10, 'Product J', 5, 1, 38.00),
    (11, 'Product K', 1, 1, 27.99),
    (12, 'Product L', 2, 2, 18.00),
    (13, 'Product M', 3, 3, 24.50),
    (14, 'Product N', 4, 2, 33.00),
    (15, 'Product O', 5, 1, 16.99);

INSERT INTO
    Orders (
        OrderID,
        CustomerID,
        OrderDate,
        ShipCity,
        ShipCountry
    )
VALUES
    (1, 1, '2024-05-04', 'New York', 'USA'),
    (2, 2, '2024-05-05', 'London', 'UK'),
    (3, 3, '2024-05-06', 'Berlin', 'Germany'),
    (4, 4, '2024-05-07', 'Sydney', 'Australia'),
    (5, 5, '2024-05-08', 'Toronto', 'Canada'),
    (6, 1, '2024-05-09', 'Los Angeles', 'USA'),
    (7, 2, '2024-05-10', 'Manchester', 'UK'),
    (8, 3, '2024-05-11', 'Munich', 'Germany'),
    (9, 4, '2024-05-12', 'Melbourne', 'Australia'),
    (10, 5, '2024-05-13', 'Vancouver', 'Canada');

INSERT INTO
    OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 1, 2, 25.50),
    (1, 2, 1, 40.00),
    (2, 3, 3, 15.75),
    (2, 4, 1, 22.50),
    (3, 5, 4, 35.00),
    (3, 6, 2, 19.99),
    (4, 7, 1, 29.99),
    (4, 8, 2, 45.50),
    (5, 9, 1, 12.99),
    (5, 10, 1, 38.00),
    (6, 11, 3, 27.99),
    (6, 12, 2, 18.00),
    (7, 13, 1, 24.50),
    (7, 14, 2, 33.00),
    (8, 15, 2, 16.99),
    (8, 1, 1, 25.50),
    (9, 2, 2, 40.00),
    (9, 3, 1, 15.75),
    (10, 4, 1, 22.50),
    (10, 5, 3, 35.00);