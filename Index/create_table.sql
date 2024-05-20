CREATE TABLE customers (
      customerID INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100),
      email VARCHAR(100)
);

CREATE TABLE products (
     productID INT PRIMARY KEY,
     name VARCHAR(100),
     price DECIMAL(10, 2),
     description TEXT
);


CREATE TABLE purchases
(
    purchaseID   INT PRIMARY KEY,
    customerID   INT,
    productID    INT,
    quantity     INT,
    purchaseDate DATE
);

CREATE TABLE purchasesIndex
(
    purchaseID   INT PRIMARY KEY,
    customerID   INT,
    productID    INT,
    quantity     INT,
    purchaseDate DATE,
    FOREIGN KEY(productID) REFERENCES products(productID) on delete cascade on update cascade,
    FOREIGN KEY(customerID) REFERENCES customers(customerID) on delete cascade on update cascade
);
