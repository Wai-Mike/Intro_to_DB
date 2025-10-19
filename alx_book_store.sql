-- Database: alx_book_store
-- Online Bookstore Database Schema

-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Authors table: Stores information about authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100),
    biography TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Customers table: Stores information about customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Books table: Stores information about books available in the bookstore
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    publication_date DATE,
    genre VARCHAR(100),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Orders table: Stores information about orders placed by customers
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    shipping_address TEXT,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Order_Details table: Stores information about the books included in each order
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Insert sample data for Authors
INSERT INTO Authors (author_name, birth_date, nationality, biography) VALUES
('J.K. Rowling', '1965-07-31', 'British', 'Author of the Harry Potter series'),
('George Orwell', '1903-06-25', 'British', 'Author of 1984 and Animal Farm'),
('Harper Lee', '1926-04-28', 'American', 'Author of To Kill a Mockingbird'),
('Mark Twain', '1835-11-30', 'American', 'Author of The Adventures of Tom Sawyer and Huckleberry Finn'),
('Jane Austen', '1775-12-16', 'British', 'Author of Pride and Prejudice and Sense and Sensibility');

-- Insert sample data for Customers
INSERT INTO Customers (customer_name, email, phone, address, city, country) VALUES
('John Smith', 'john.smith@email.com', '+1-555-0123', '123 Main St', 'New York', 'USA'),
('Sarah Johnson', 'sarah.johnson@email.com', '+1-555-0124', '456 Oak Ave', 'Los Angeles', 'USA'),
('Michael Brown', 'michael.brown@email.com', '+1-555-0125', '789 Pine St', 'Chicago', 'USA'),
('Emily Davis', 'emily.davis@email.com', '+1-555-0126', '321 Elm St', 'Boston', 'USA'),
('David Wilson', 'david.wilson@email.com', '+1-555-0127', '654 Maple Ave', 'Seattle', 'USA');

-- Insert sample data for Books
INSERT INTO Books (title, author_id, isbn, price, publication_date, genre, stock_quantity, description) VALUES
('Harry Potter and the Philosopher''s Stone', 1, '978-0747532699', 12.99, '1997-06-26', 'Fantasy', 50, 'The first book in the Harry Potter series'),
('1984', 2, '978-0451524935', 9.99, '1949-06-08', 'Dystopian Fiction', 30, 'A dystopian social science fiction novel'),
('To Kill a Mockingbird', 3, '978-0061120084', 11.99, '1960-07-11', 'Fiction', 25, 'A novel about racial injustice and childhood innocence'),
('The Adventures of Tom Sawyer', 4, '978-0486400778', 8.99, '1876-12-01', 'Adventure', 40, 'A story about a young boy growing up along the Mississippi River'),
('Pride and Prejudice', 5, '978-0141439518', 10.99, '1813-01-28', 'Romance', 35, 'A romantic novel of manners');

-- Insert sample data for Orders
INSERT INTO Orders (customer_id, total_amount, status, shipping_address, notes) VALUES
(1, 25.98, 'delivered', '123 Main St, New York, USA', 'Gift wrapping requested'),
(2, 20.98, 'shipped', '456 Oak Ave, Los Angeles, USA', 'Express delivery'),
(3, 12.99, 'processing', '789 Pine St, Chicago, USA', ''),
(4, 32.97, 'pending', '321 Elm St, Boston, USA', ''),
(5, 8.99, 'delivered', '654 Maple Ave, Seattle, USA', '');

-- Insert sample data for Order_Details
INSERT INTO Order_Details (order_id, book_id, quantity, unit_price) VALUES
(1, 1, 1, 12.99),
(1, 2, 1, 9.99),
(2, 3, 1, 11.99),
(2, 4, 1, 8.99),
(3, 1, 1, 12.99),
(4, 1, 1, 12.99),
(4, 2, 1, 9.99),
(4, 3, 1, 11.99),
(5, 4, 1, 8.99);