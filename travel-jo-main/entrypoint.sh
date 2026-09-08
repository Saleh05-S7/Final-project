#!/bin/sh

# Construct the database URI directly from Compose environment variables
export DATABASE_URL="postgresql://${DB_USER}:${DB_PASS}@database:5432/${DB_NAME}"

# Run database migrations
alembic upgrade head

# Start the Flask backend
gunicorn -w 4 -b 0.0.0.0:5000 app.server:app
