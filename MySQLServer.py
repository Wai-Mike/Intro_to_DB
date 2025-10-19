#!/usr/bin/env python3
"""
MySQL Database Creation Script for ALX Book Store
Creates the alx_book_store database in MySQL server
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    """
    Creates the alx_book_store database in MySQL server
    """
    connection = None
    cursor = None
    
    try:
        # Connect to MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',  # Change this to your MySQL username
            password=''   # Change this to your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            print("Database 'alx_book_store' created successfully!")
            
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        
    finally:
        # Close database connection
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    create_database()
