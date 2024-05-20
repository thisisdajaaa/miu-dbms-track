-- Q1 ---

SELECT
    p.purchaseID,
    c.customerID,
    pr.productID,
    p.quantity,
    p.purchaseDate
FROM
    purchases p
        JOIN
    customers c ON p.customerID = c.customerID
        JOIN
    products pr ON p.productID = pr.productID
WHERE pr.name='Product99999';

-- Q2 --

SELECT
    p.purchaseID,
    c.customerID,
    pr.productID,
    p.quantity,
    p.purchaseDate
FROM
    purchasesIndex p
        JOIN
    customers c ON p.customerID = c.customerID
        JOIN
    products pr ON p.productID = pr.productID
WHERE pr.name='Product99999';


-- Q3 --

SELECT
    p.purchaseID,
    c.customerID,
    pr.productID,
    p.quantity,
    p.purchaseDate
FROM
    purchasesIndex p
        JOIN
    customers c ON p.customerID = c.customerID
        JOIN
    products pr ON p.productID = pr.productID
WHERE pr.name='Product99999' and  c.name='Customer99999';


-----Q4. UPDATE ---
UPDATE customers SET name='Alice Bob' WHERE name='Alice';

-----Q5. DELETE ---
DELETE FROM customers WHERE name='Customer4444';
DELETE FROM customers WHERE name='Alice Bob';

-----Q6. INSERT ---
INSERT INTO customers(customerID,name,email)
values(100001,'Alice','alice@gmail.com');

INSERT INTO customers(customerID,name,email)
values(100002,'Bob','bob@gmail.com');

