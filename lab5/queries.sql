/** a **/
SELECT
    c.CustomerName,
    SUM(od.Quantity * od.UnitPrice) AS totalRevenue
FROM
    Customers c
    INNER JOIN Orders o ON o.CustomerID = c.CustomerID
    INNER JOIN OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
    c.CustomerName
ORDER BY
    totalRevenue DESC;

/** b **/
SELECT
    c.Country,
    SUM(od.Quantity * od.UnitPrice) AS totalRevenue
FROM
    Customers c
    INNER JOIN Orders o ON o.CustomerID = c.CustomerID
    INNER JOIN OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
    c.Country
ORDER BY
    totalRevenue DESC;

/** c **/
SELECT
    p.CategoryID,
    SUM(od.Quantity * od.UnitPrice) AS totalRevenue
FROM
    Customers c
    INNER JOIN Orders o ON o.CustomerID = c.CustomerID
    INNER JOIN OrderDetails od ON od.OrderID = o.OrderID
    INNER JOIN Products p ON p.ProductID = od.ProductID
GROUP BY
    p.CategoryID
ORDER BY
    totalRevenue DESC;

/** d **/
SELECT
    c.CustomerName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerName
ORDER BY
    TotalSpent DESC
LIMIT
    1;

/** e **/
SELECT
    ShipCountry,
    AVG(OrderValue) AS AvgOrderValue
FROM
    (
        SELECT
            o.OrderID,
            o.ShipCountry,
            SUM(od.Quantity * od.UnitPrice) AS OrderValue
        FROM
            Orders o
            JOIN OrderDetails od ON o.OrderID = od.OrderID
        GROUP BY
            o.OrderID,
            o.ShipCountry
    )
GROUP BY
    ShipCountry
ORDER BY
    AvgOrderValue DESC
LIMIT
    1;

/** f **/
SELECT
    p.CategoryID,
    AVG(p.UnitPrice) AS AvgProductPrice
FROM
    Products p
GROUP BY
    p.CategoryID
ORDER BY
    AvgProductPrice DESC
LIMIT
    1;

/** g **/
SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity
FROM
    Products p
    JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY
    p.ProductName
ORDER BY
    TotalQuantity DESC;

/** h **/
SELECT
    c.CustomerName,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
GROUP BY
    c.CustomerName,
    p.ProductName
ORDER BY
    c.CustomerName,
    p.ProductName;

/** i **/
SELECT
    c.CustomerName,
    o.ShipCity,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE
    o.ShipCity = 'New York'
GROUP BY
    c.CustomerName,
    o.ShipCity
ORDER BY
    TotalRevenue DESC;

/** j **/
SELECT
    c.CustomerName
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
GROUP BY
    c.CustomerName
HAVING
    COUNT(DISTINCT p.CategoryID) > 1;

/** k **/
SELECT
    c.CustomerName
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
WHERE
    p.CategoryID = 1
GROUP BY
    c.CustomerName;

/** l **/
SELECT
    p.ProductName
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
WHERE
    c.Country = 'USA'
GROUP BY
    p.ProductName;

/** m **/
SELECT
    c.CustomerName,
    SUM(od.Quantity) AS TotalQuantity
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerName
ORDER BY
    TotalQuantity DESC
LIMIT
    1;

/** n **/
SELECT
    c.CustomerName,
    MAX(p.UnitPrice) AS MaxUnitPrice
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
GROUP BY
    c.CustomerName
ORDER BY
    MaxUnitPrice DESC;