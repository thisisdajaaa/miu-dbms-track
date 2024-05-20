/*************************
  Dataset is inserted to the tables using store procedure
  Store procedure are as follows;
 */
--Store procedure to insert customers
BEGIN
    -- Declare variables
    DECLARE i INT DEFAULT 1;
    -- Start the loop
    WHILE i < 100000 DO
        INSERT INTO customers (customerID,name, email)
        VALUES(i,CONCAT('Customer', i), CONCAT('Email',i,'@gmail.com'));
        SET i = i + 1;
END WHILE;
END


--Store procedure to insert products
BEGIN
    -- Declare variables
    DECLARE i INT DEFAULT 1;
    -- Start the loop
    WHILE i < 100000 DO
        INSERT INTO products (productID,name, price,description)
        VALUES(i,CONCAT('Product', i), i*2.5, CONCAT('Description',i));
        SET i = i + 1;
END WHILE;
END


--Store procedure to insert purchase
BEGIN
    -- Declare variables
    DECLARE i INT DEFAULT 1;
    -- Start the loop
    WHILE i < 100000 DO
        INSERT INTO purchases (purchaseID,customerID,productID, quantity,purchaseDate)
        VALUES(i, i, i, 3,'2024-10-10');
        SET i = i + 1;
END WHILE;
END