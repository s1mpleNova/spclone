from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from tortoise import Tortoise, fields
from tortoise.models import Model
from tortoise.contrib.fastapi import register_tortoise
import uuid

app = FastAPI()

# Database URL
DATABASE_URL = "postgres://postgres:password@localhost:5433/musicapp"

# Pydantic Model for User creation
class UserCreate(BaseModel):
    name: str
    email: str
    password: str

# Tortoise ORM Model for User
class User(Model):  
    id = fields.UUIDField(pk=True, default=uuid.uuid4)  # Primary key as UUID
    name = fields.CharField(max_length=100)
    email = fields.CharField(max_length=100, unique=True)
    password = fields.BinaryField()  # Storing password as binary (hashed)

    class Meta:
        table = "users"  # Name of the database table

# Route to handle user signup
@app.post("/Signup")
async def signup(user: UserCreate):
    # Check if the user already exists
    existing_user = await User.filter(email=user.email).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="User with the same email already exists")

    # Add the new user to the database
    new_user = await User.create(
        id=uuid.uuid4(),
        name=user.name,
        email=user.email,
        password=user.password.encode("utf-8"),  # Convert password to binary
    )
    return {
        "id": str(new_user.id),
        "name": new_user.name,
        "email": new_user.email,
    }

# Register Tortoise ORM with FastAPI
register_tortoise(
    app,
    db_url=DATABASE_URL,
    modules={"models": ["main"]},
    generate_schemas=True,  # Automatically create database schema
    add_exception_handlers=True,
)
