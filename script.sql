SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders 
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_indexes
WHERE tablename = 'customers';

SELECT * FROM pg_indexes
WHERE tablename = 'books';

SELECT * FROM pg_indexes
WHERE tablename = 'orders';

EXPLAIN ANALYZE SELECT customers.customer_id, quantity
FROM customers, orders
WHERE customers.customer_id = orders.customer_id
AND quantity > 18;

CREATE INDEX orders_quantity_more_than_ten_idx ON orders(quantity)
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT customers.customer_id, quantity
FROM customers, orders
WHERE customers.customer_id = orders.customer_id
AND quantity > 18;

EXPLAIN ANALYZE SELECT * FROM customers
WHERE customer_id = 9999;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

SELECT * FROM
pg_indexes
WHERE tablename = 'customers';

EXPLAIN ANALYZE SELECT * FROM customers
WHERE customer_id = 9999;

CLUSTER customers USING customers_pkey; 

SELECT * FROM customers
LIMIT 10;

CREATE INDEX orders_customer_id_book_id_idx ON  orders(customer_id, book_id);

SELECT * FROM
pg_indexes
WHERE tablename = 'orders';

DROP INDEX IF EXISTS  orders_customer_id_book_id_idx;

SELECT * FROM
pg_indexes
WHERE tablename = 'orders';

CREATE INDEX orders_customer_id_book_id_quantity_idx ON  orders(customer_id, book_id, quantity);

CREATE INDEX
books_author_title_idx ON books(author, title);

EXPLAIN ANALYZE SELECT * FROM orders
WHERE ((quantity * price_base) > 100);

CREATE INDEX orders_total_price ON orders((quantity * price_base));

EXPLAIN ANALYZE SELECT * FROM orders
WHERE ((quantity * price_base) > 100);

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;

DROP INDEX IF EXISTS books_author_idx;


CREATE INDEX customers_last_name_first_name_email_address ON customers (last_name, first_name, email_address);

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;