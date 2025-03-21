from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DBURL='postgresql://postgres:password@localhost:5433/testU'
engine=create_engine(DBURL)
SessionLocal=sessionmaker(autocommit=False,autoflush=False,bind=engine)

def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()