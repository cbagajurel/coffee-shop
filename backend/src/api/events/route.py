from fastapi import APIRouter
from .schema import EventSchema, EventResponseSchema

router = APIRouter()

@router.get("/")
async def get_events() -> EventResponseSchema:
    return {
        "results": [{"id": 1}, {"id": 2}, {"id": 3}],
        "total": 3
    }


@router.post("/")
async def create_event() -> EventSchema:
    return {"id": 4}


@router.get("/{event_id}")
async def get_event(event_id: int) -> EventSchema:
    return {"id": event_id}
