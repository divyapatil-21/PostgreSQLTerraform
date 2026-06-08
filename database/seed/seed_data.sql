INSERT INTO customers (customer_name,email)
SELECT 'Divya Patil','divya@example.com'
WHERE NOT EXISTS (
    SELECT 1 FROM customers WHERE email='divya@example.com'
);

INSERT INTO products (product_name,price)
SELECT 'Laptop',55000
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE product_name='Laptop'
);

INSERT INTO products (product_name,price)
SELECT 'Mouse',500
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE product_name='Mouse'
);

INSERT INTO orders (customer_id,product_id,quantity)
SELECT 1,1,1
WHERE NOT EXISTS (
    SELECT 1 FROM orders
);
