-- Insert multiple rows into customers table in alx_book_store database
-- This script will be executed with: mysql -u username -p alx_book_store < task_6.sql

USE alx_book_store;

INSERT INTO customers (customer_id, customer_name, email, address) 
VALUES 
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');
