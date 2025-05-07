#contains all the auth related routes like signup and login
import uuid
import bcrypt
from fastapi import Depends, HTTPException
from models.user import User
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from database import get_db
from pydantic_schemas.user_login import UserLogin
from sqlalchemy.orm import Session
 #to not create an instance of fastapi for each route we use the apirouter by fastapi 
 #to access it create an instance of it as shown below
router = APIRouter()


@router.post('/signup')
def signup(user:UserCreate,db:Session=Depends(get_db)):
    #check if user exists
    user_db=db.query(User).filter(User.email==user.email).first()
    if user_db:
        raise HTTPException(400,'bad request')
    
#if user doesnt exist then we need to add the user
#the add function takes an input of the instance of the user class and we need to pass the id,name,pass etc properties 
    #we need to hash the password in order to not get the error cant escape str to binary
    # user.password.encrypt to encrypt the password if the current user  
    hash_pw=bcrypt.hashpw(user.password.encode(),bcrypt.gensalt(16))
    user_db=User(id=str(uuid.uuid4()),name=user.name,email=user.email,password=hash_pw)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db

@router.post('/login')
def login_user(user:UserLogin,db:Session=Depends(get_db)):
    user_db=db.query(User).filter(User.email==user.email).first() #check email
    if not user_db:
        raise HTTPException(400,"user not found")
    
    password=bcrypt.checkpw(user.password.encode(),user_db.password) #check password gives the value as boolean 
    #as the op is boolean we check if the value is true
    if not password:
        raise HTTPException(400,'incorrect password')
    return(user_db)