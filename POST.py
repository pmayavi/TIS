import requests
import json

# Define the JSON data you want to send
data = {
    "title": "Forrest Gump",
    "length": 8520,
    "year": 1994,
    "director": "Robert Zemeckis",
    "actors": [
        {"name": "Tom Hanks"},
        {"name": "Robin Wright"},
        {"name": "Gary Sinise"},
        {"name": "Mykelti Williamson"},
        {"name": "Sally Field"},
        {"name": "Michael Conner Humphreys"},
    ],
}

# Define the URL of your Flask server endpoint
url = "http://localhost:5000/api/v1.0/films"  # Replace with your actual URL

# Set the Content-Type header to specify that you're sending JSON
headers = {"Content-Type": "application/json"}

# Use the requests library to send the POST request
response = requests.post(url, data=json.dumps(data), headers=headers)

# Check the response from the server
if response.status_code == 201:
    print("POST request successful!")
    print(response.text)  # This will print the response from the server
else:
    print("POST request failed with status code:", response.status_code)
