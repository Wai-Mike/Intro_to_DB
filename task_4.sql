-- Get full description of the books table from alx_book_store database
-- This script will be executed with: mysql -u username -p alx_book_store < task_4.sql

USE alx_book_store;

SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'alx_book_store' 
    AND TABLE_NAME = 'Books'
ORDER BY 
    ORDINAL_POSITION;
