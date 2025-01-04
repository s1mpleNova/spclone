# Tortoise ORM Model for User
from tortoise import Model,fields
import uuid


class User(Model):  
    id = fields.UUIDField(pk=True, default=uuid.uuid4)  # Primary key as UUID
    name = fields.CharField(max_length=100)
    email = fields.CharField(max_length=100, unique=True)
    password = fields.BinaryField()  # Storing password as binary (hashed)

    class Meta:
        table = "users"  # Name of the database table