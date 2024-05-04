/** a **/
SELECT
    *
FROM
    product;

/** b **/
SELECT
    product.product_id,
    product.product_name,
    category.category_id,
    category.category_name
FROM
    product
    INNER JOIN category ON product.category_id = category.category_id
WHERE
    category_name = 'Clothing';

/** c **/
SELECT
    product_name,
    price
FROM
    product
WHERE
    price < 100;

/** d **/
UPDATE
    product
SET
    price = 1399
WHERE
    product_name = 'MacBook Pro';

/** e **/
DELETE FROM
    product
WHERE
    product_name = 'Dining Table';

/** f **/
SELECT
    product.product_name,
    product.price
FROM
    product
    INNER JOIN category ON product.category_id = category.category_id
WHERE
    category_name = 'Electronics';

/** g **/
SELECT
    product_name
FROM
    product
WHERE
    price > 500;

/** h **/
SELECT
    product_name,
    price
FROM
    product
ORDER BY
    price DESC
LIMIT
    3;

/** i **/
UPDATE
    product
    INNER JOIN category ON product.category_id = category.category_id
SET
    product.price = product.price * 0.10 + product.price
WHERE
    category.category_name = 'Clothing';

/** j **/
DELETE FROM
    product
WHERE
    price < 50;

/** k **/
SELECT
    product_name,
    price
FROM
    product
ORDER BY
    price DESC;

/** l **/
SELECT
    product.product_name,
    category.category_name
FROM
    product
    INNER JOIN category ON product.category_id = category.category_id
ORDER BY
    category.category_name ASC;

/** m **/
DELETE FROM
    product
WHERE
    category_id IN (
        SELECT
            category_id
        FROM
            category
        WHERE
            category_name = 'Home'
    );

/** n **/
SELECT
    product_name,
    price
FROM
    product
WHERE
    price >= 100
    AND price <= 500;

/** o **/
UPDATE
    product
    INNER JOIN category ON product.category_id = category.category_id
SET
    product.price = product.price - product.price * 0.05
WHERE
    category.category_name = 'Electronics';