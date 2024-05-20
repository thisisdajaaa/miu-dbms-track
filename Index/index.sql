-- Create indexes on customer table
CREATE INDEX idx_customer_name ON customers(name);

-- Create indexes on product table
CREATE INDEX idx_product_name ON products(name);
