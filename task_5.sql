-- SQL script to insert a single row into the 'customer' table in the alx_book_store database.

-- Ensure the correct database is selected.
USE ALX_BOOK_STORE;

INSERT INTO customer (
    customer_id,
    customer_name,
    email,
    address
)
VALUES (
    1,
    'Cole Baidoo',
    'cbaidoo@sandtech.com',
    '123 Happiness Ave.'
);