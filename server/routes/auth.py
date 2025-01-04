import bcrypt
from fastapi import APIRouter, Depends, HTTPException
import uuid
from database import get_db
from models.user_mod import User
from pydantic_schemas.user_create import UserCreate
from pydantic_schemas.user_login import UserLogin


router=APIRouter()
@router.post("/Signup",status_code=201)
async def signup(user: UserCreate, db= Depends(get_db)):
    # Check if the user already exists
    existing_user = await User.filter(email=user.email).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="User with the same email already exists")

    # Add the new user to the database
    hashed_pw=bcrypt.hashpw(user.password.encode("utf-8"), bcrypt.gensalt())  # Hash the password
    new_user = await User.create(
        id=str(uuid.uuid4()),
        name=user.name,
        email=user.email,
        password=hashed_pw,  # Convert password to binary
    )
    return {
        "id": str(new_user.id),
        "name": new_user.name,
        "email": new_user.email,
    }

@router.post("/login")
async def login_user(user:UserLogin,db=Depends(get_db)):
    #check if user with same email already exists
    #user_db=existing_db
    existing_user=await User.filter(email=user.email).first()
    if not existing_user:
        raise HTTPException(status_code=400,detail='user does not exist')
    #gensalt will random letters to encrypt the password everytime 
    #check if the password matches or not 

    is_match=bcrypt.checkpw(user.password.encode(),existing_user.password) 
    if not is_match:
        raise HTTPException(status_code=400, detail='Incorrect password')
    return {
        "id": str(existing_user.id),
        "name": existing_user.name,
        "email": existing_user.email,
    }