import bcrypt
from fastapi import FastAPI
from models.base import Base
from  routes import auth
from database import engine
app=FastAPI()

#we are including the router variable created in the auth.py file in the routes folder
app.include_router(auth.router,prefix='/auth')


Base.metadata.create_all(engine)