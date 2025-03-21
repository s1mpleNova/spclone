from sqlalchemy import TEXT, VARCHAR, Column, LargeBinary, create_engine

from models.base import Base

class User(Base):
    __tablename__='users2'
    id=Column(TEXT,primary_key=True)
    name=Column(VARCHAR(100))
    email=Column(VARCHAR(100))
    password=Column(LargeBinary)
