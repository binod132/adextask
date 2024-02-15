"""Module providing flask app."""
import socket
from flask import Flask, jsonify, render_template

app = Flask(__name__)

def fetchdetails():
    """Function to fetch host and IP"""
    hostname = socket.gethostname()
    host_ip = socket.gethostbyname(hostname)
    return str(hostname), str(host_ip)

@app.route("/")
def hello_world():
    """Function to render home page"""
    return render_template('home.html')

@app.route("/health")
def health():
    """Function for health page"""
    return jsonify (
        status = "UP"
    )
@app.route("/details")
def details():
    """Function for details page"""
    hostname, host_ip = fetchdetails()
    return render_template('index.html', hostname= hostname, ip=host_ip)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
