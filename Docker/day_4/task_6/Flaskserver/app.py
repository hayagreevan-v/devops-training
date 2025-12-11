import os
from flask import Flask
import mysql.connector


name = os.getenv("NAME","Hex")

host = os.getenv("MYSQL_HOST")
dbname = os.getenv("MYSQL_DBNAME")
user = os.getenv("MYSQL_USER")
password = os.getenv("MYSQL_PASSWORD")

app = Flask(__name__)


@app.route("/")
def hello_world():
    try:
        cnx = mysql.connector.connect(host=host, port=3306, user=user, password=password, database=dbname)
        # Get a cursor
        cur = cnx.cursor()

        # Execute a query
        cur.execute("SELECT CURDATE()")

        # Fetch one result
        row = cur.fetchone()
        print("Current date is: {0}".format(row[0]))

        # Close connection
        cnx.close()

        return f"<p>Hello, World! from {name} - Database connected Successfully</p>"
    except:
        return f"<p>Hello, World! from {name} - Database connection failed</p>"