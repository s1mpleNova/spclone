from fastapi import APIRouter, FastAPI, HTTPException
from pydantic import BaseModel
from tortoise import Tortoise, fields
from tortoise.models import Model
from tortoise.contrib.fastapi import register_tortoise
import uuid
from database import init_db
from routes import auth

app=FastAPI()
app.include_router(auth.router,prefix='/auth')


#initialize the database
init_db(app)