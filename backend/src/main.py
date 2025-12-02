from fastapi import FastAPI
from api.events import router as event_router


app = FastAPI()

app.include_router(event_router, prefix="/api/events")

@app.get("/")
async def root():
    return {"message me": "root hi"}

@app.get("/blog/{id}")
async def blog(id: int):
    return {"id": id}