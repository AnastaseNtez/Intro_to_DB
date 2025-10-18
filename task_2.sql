-- Select the database to ensure all subsequent statements are applied here.
-- This command must be executed first after the database is created.
USE alx_book_store;

-- --------------------------------------------------------
-- 1. AUTHORS Table
-- Stores information about the authors.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- --------------------------------------------------------
-- 2. BOOKS Table
-- Stores information about the books available in the store.
-- Contains a foreign key linking to the Authors table.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- --------------------------------------------------------
-- 3. CUSTOMERS Table
-- Stores customer details for processing orders.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- --------------------------------------------------------
-- 4. ORDERS Table
-- Stores summary information for each customer order.
-- Contains a foreign key linking to the Customers table.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- --------------------------------------------------------
-- 5. ORDER_DETAILS Table
-- Stores the specific items (books) within each order.
-- This is a junction table linking Orders and Books.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
