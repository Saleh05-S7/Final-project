import os
from sqlalchemy import create_engine
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://postgres:postgres@database:5432/travel_db")
engine = create_engine(DATABASE_URL)

