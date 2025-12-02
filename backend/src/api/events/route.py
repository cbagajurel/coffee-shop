from fastapi import APIRouter
from .schema import EventSchema

router = APIRouter()

@router.get("/")
async def get_events():
    return {"message": "Events"}

@router.get("/{event_id}")
async def get_event(event_id: int):
    return {"message": f"Event {event_id}"}
