import os
from flask import Flask

name = os.getenv("NAME","Hex")

app = Flask(__name__)

@app.route("/")
def hello_world():
    return f"<p>Hello, World! from {name}</p>"