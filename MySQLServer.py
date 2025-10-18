import mysql.connector
from mysql.connector import Error

# --- Configuration: CHANGE THESE TO YOUR MYSQL CREDENTIALS ---
# The database connection should be to the server, not a specific database
DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = "2025.Education!" 
DB_NAME = "alx_book_store"

def create_database():
    """Connects to MySQL and attempts to create the specified database IF NOT EXISTS."""
    connection = None
    cursor = None
    
    try:
        # 1. Establish connection to the MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # 2. SQL command using IF NOT EXISTS to prevent failure if the DB already exists
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
            
            # 3. Execute the query
            cursor.execute(create_db_query)
            
            # 4. Print success message (since we can't check existence, we assume success
            #    if the query runs without error)
            print(f"Database '{DB_NAME}' created successfully!")
            
        else:
            print("ERROR: Failed to establish a connection to the MySQL server.")

    except Error as e:
        # Handle connection and execution errors
        print(f"ERROR: Failed to connect to or interact with the database server.")
        print(f"Details: {e}")

    finally:
        # 5. Handle close of DB connection and cursor
        if cursor is not None:
            cursor.close()
        if connection is not None and connection.is_connected():
            connection.close()
            # print("MySQL connection is closed.") # Optional confirmation

if __name__ == "__main__":
    create_database()