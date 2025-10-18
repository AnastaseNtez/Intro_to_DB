-- SQL script to insert a single row into the 'Customers' table in the alx_book_store database.

-- Ensure the correct database is selected.
USE ALX_BOOK_STORE;

INSERT INTO CUSTOMERS (
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    ADDRESS
)
VALUES (
    1,
    'Cole Baidoo',
    'cbaidoo@sandtech.com',
    '123 Happiness Ave.'
);
