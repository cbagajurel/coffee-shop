from typing import List
from pydantic import BaseModel

class EventSchema(BaseModel):
    id: int

class EventResponseSchema(BaseModel):
    results: List[EventSchema]
    total: int