-- Database: alx_book_store
-- Online Bookstore Database Schema

-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Authors table: Stores information about authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Customers table: Stores information about customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Books table: Stores information about books available in the bookstore
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Orders table: Stores information about orders placed by customers
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Details table: Stores information about the books included in each order
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data for Authors
INSERT INTO Authors (author_name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Harper Lee'),
('Mark Twain'),
('Jane Austen');

-- Insert sample data for Customers
INSERT INTO Customers (customer_name, email, address) VALUES
('John Smith', 'john.smith@email.com', '123 Main St'),
('Sarah Johnson', 'sarah.johnson@email.com', '456 Oak Ave'),
('Michael Brown', 'michael.brown@email.com', '789 Pine St'),
('Emily Davis', 'emily.davis@email.com', '321 Elm St'),
('David Wilson', 'david.wilson@email.com', '654 Maple Ave');

-- Insert sample data for Books
INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 12.99, '1997-06-26'),
('1984', 2, 9.99, '1949-06-08'),
('To Kill a Mockingbird', 3, 11.99, '1960-07-11'),
('The Adventures of Tom Sawyer', 4, 8.99, '1876-12-01'),
('Pride and Prejudice', 5, 10.99, '1813-01-28');

-- Insert sample data for Orders
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2024-01-15'),
(2, '2024-01-16'),
(3, '2024-01-17'),
(4, '2024-01-18'),
(5, '2024-01-19');

-- Insert sample data for Order_Details
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 4, 1),
(3, 1, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(5, 4, 1);