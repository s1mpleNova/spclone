from fastapi import FastAPI
from tortoise import Tortoise
from tortoise.contrib.fastapi import register_tortoise

app = FastAPI()

# Database URL
DATABASE_URL = "postgres://postgres:password@localhost:5433/musicapp"
# Register Tortoise ORM with FastAPI
def init_db(app):
    try:
        register_tortoise(
        app,
        db_url=DATABASE_URL,
        modules={"models": ["models.user_mod"]},
        generate_schemas=False,  # Automatically create database schema
        add_exception_handlers=True,)

        print("connected")
        Tortoise.close_coonnections()
    except Exception as e:
        print("error ",e)

async def get_db():
    await Tortoise.init(db_url=DATABASE_URL,modules={"models": ["main"]},
    )
    try:
        yield init_db(app)
    finally:
        await Tortoise.close_connections()
    