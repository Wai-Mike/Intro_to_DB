-- Insert single row into customers table in alx_book_store database
-- This script will be executed with: mysql -u username -p alx_book_store < task_5.sql

USE alx_book_store;

INSERT INTO customers (customer_id, customer_name, email, address) 
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');
