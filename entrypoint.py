from app import create_app

# Import the settings module (default.py)
from config.default import *

app = create_app(__name__)

if __name__ == "__main__":
    app.run()
