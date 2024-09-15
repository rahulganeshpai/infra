import uvicorn
from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(CORSMiddleware,
                   allow_origins=["*"],
                   allow_credentials=True,
                   allow_methods=["*"],
                   allow_headers=["*"])

# Display message
@app.get("/")
async def display_message():
    try:
            return "Hello World 2"
    except BaseException as error:
        return f"""{error}"""

uvicorn.run(app, host='0.0.0.0', port=8080)
