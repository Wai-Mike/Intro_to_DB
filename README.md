# ALX Book Store Database

A comprehensive database schema for an online bookstore system built with MySQL.

## Database Schema

This project implements a complete database schema for managing an online bookstore with the following entities:

### Tables

1. **Authors** - Stores author information
   - Primary Key: `author_id`
   - Fields: name, birth_date, nationality, biography

2. **Books** - Stores book information
   - Primary Key: `book_id`
   - Foreign Key: `author_id` (references Authors)
   - Fields: title, ISBN, price, publication_date, genre, stock_quantity

3. **Customers** - Stores customer information
   - Primary Key: `customer_id`
   - Fields: name, email, phone, address, city, country

4. **Orders** - Stores order information
   - Primary Key: `order_id`
   - Foreign Key: `customer_id` (references Customers)
   - Fields: order_date, total_amount, status, shipping_address

5. **Order_Details** - Stores order line items
   - Primary Key: `orderdetailid`
   - Foreign Keys: `order_id` (references Orders), `book_id` (references Books)
   - Fields: quantity, unit_price, subtotal (calculated)

## Features

- ✅ Proper foreign key relationships
- ✅ Data validation with CHECK constraints
- ✅ UNIQUE constraints for email and ISBN
- ✅ CASCADE delete for referential integrity
- ✅ Sample data for testing
- ✅ Generated columns for calculated fields
- ✅ ENUM types for status fields

## Usage

1. Run the SQL script in your MySQL database:
   ```sql
   source alx_book_store.sql;
   ```

2. The script will:
   - Create the database
   - Create all tables with proper constraints
   - Insert sample data

## Sample Data

The database includes sample data for:
- 5 Authors (J.K. Rowling, George Orwell, Harper Lee, Mark Twain, Jane Austen)
- 5 Customers with complete contact information
- 5 Books with ISBN, pricing, and inventory
- 5 Orders with various statuses
- 9 Order detail records

## Database Design

The schema follows normalized database design principles:
- First Normal Form (1NF): All attributes contain atomic values
- Second Normal Form (2NF): No partial dependencies
- Third Normal Form (3NF): No transitive dependencies

## Technologies Used

- MySQL
- SQL
- Database Design
- Relational Database Management
