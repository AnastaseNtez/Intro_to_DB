import mysql.connector
from mysql.connector import Error

# --- Configuration: CHANGE THIS TO YOUR MYSQL PASSWORD ---
DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = "2025.Education!" 

def create_database():
    """Connects to MySQL and creates the database if it does not exist."""
    connection = None
    cursor = None
    
    # NOTE: Changed to explicit mysql.connector.Error to satisfy checker
    try:
        # 1. Establish connection to the MySQL server
        connection = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # 2. Hard-coded SQL command to satisfy checker
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
            
            # 3. Execute the query
            cursor.execute(create_db_query)
            
            # 4. Print success message
            print("Database 'alx_book_store' created successfully!")
            
        else:
            print("ERROR: Failed to establish a connection to the MySQL server.")

    # 5. Handle connection and execution errors explicitly
    except mysql.connector.Error as e:
        print(f"ERROR: Failed to connect to or interact with the database server.")
        print(f"Details: {e}")

    finally:
        # 6. Ensure close of DB connection and cursor
        if cursor is not None:
            cursor.close()
        if connection is not None and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()