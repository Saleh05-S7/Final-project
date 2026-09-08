# Travel Jordan - Tourism Discovery Web App

## Description
Travel Jordan is a comprehensive web application designed to help users discover, explore, and save popular tourist destinations across Jordan. Whether you are looking for historical sites like Petra, natural wonders like the Dead Sea, or cultural hotspots in Amman, Travel Jordan provides a curated list with rich search capabilities. Users can create an account, log in securely, and maintain a personal list of favorite locations.

## Key Features
- **User Authentication:** Secure user registration, password hashing, and login using Flask sessions.
- **Discover & Search:** Search for places using text queries, or filter by location, place type (e.g., Historical, Natural), and minimum rating.
- **Favorites System:** Users can easily bookmark their favorite places and manage them in their personalized profile dashboard.
- **Auto-Seeding Database:** The application automatically populates the PostgreSQL database from a structured JSON file on startup.
- **Interactive UI:** Dynamic frontend interfaces powered by Jinja2 templates and asynchronous REST API requests.

## Technologies Used
- **Backend:** Python 3, Flask
- **Database:** PostgreSQL
- **ORM & Migrations:** SQLAlchemy Core, Alembic
- **Frontend:** HTML, CSS, JavaScript, Jinja2 Templates
- **Security:** bcrypt Password hashing, session-based user authentication.

## Project Structure
- `app/server.py`: The main Flask application entry point containing view routes and REST API endpoints.
- `app/models.py`: Database schema definitions using SQLAlchemy Core.
- `app/db.py`: Database connection configuration and engine creation.
- `app/auth.py`: Logic for user registration, password hashing, and login validation.
- `app/favorites.py` & `app/search.py`: Business logic for querying/filtering places and managing user favorites.
- `app/main.py`: A utility script to parse `places.json` and seed or update the database.
- `app/templates/` & `app/static/`: Frontend HTML views, stylesheets, and client-side JavaScript.
- `alembic/` & `alembic.ini`: Database migration environment and configurations.

## Setup Instructions

### Prerequisites
- Python 3.8+ installed
- PostgreSQL installed and running on your local machine

### 1. Database Setup
Ensure PostgreSQL is running and create a new database named `travel_db`.
```sql
CREATE DATABASE travel_db;
```
*(Note: If you use a different username, password, or port, update the `DATABASE_URL` connection string inside `app/db.py`).*

### 2. Environment Setup
Navigate to the root directory and set up a Python virtual environment:
```bash
# Navigate to the project directory
cd travel-jo

# Create the virtual environment
python -m venv venv

# Activate it (Windows)
venv\Scripts\activate
# Activate it (macOS/Linux)
source venv/bin/activate

# Install required dependencies
pip install flask sqlalchemy psycopg2-binary alembic bcrypt
```

### 3. Database Migrations
Initialize the database tables (`users`, `places`, `favorites`) by applying the Alembic migrations:
```bash
alembic upgrade head
```

### 4. Run the Application
Start the Flask server. The application has a built-in mechanism that will automatically seed the `places.json` data into your database on the first request if the table is empty.
```bash
# Make sure you are in the root 'travel-jo' directory so module imports work correctly
python -m app.server
```
*(Alternatively, you can manually seed the data by running `python -m app.main` before starting the server).*

The application will be accessible locally at `http://127.0.0.1:5000/`.

## How It Works
1. Navigate to the application URL in your browser. You will be prompted to the **Login** or **Register** page.
2. After logging in, you will access the **Search** dashboard where all available places in Jordan are listed.
3. Use the sidebar filters to narrow down places by text keywords, geographical regions, category type, and rating.
4. Click the heart icon on any place card to add or remove it from your personal favorites list.
5. Visit your **Profile** to securely view and manage all of your saved tourist destinations.