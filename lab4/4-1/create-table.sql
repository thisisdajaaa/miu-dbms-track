CREATE TABLE category (
    category_id int NOT NULL UNIQUE,
    category_name varchar(255)
);

CREATE TABLE product (
    product_id int NOT NULL UNIQUE,
    product_name varchar(255),
    price int,
    category_id int,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);