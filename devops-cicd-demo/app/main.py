from fastapi import FastAPI

app = FastAPI(title="Simple CI/CD Demo Service")


@app.get("/")
def read_root():
    """Basic endpoint that confirms the service is running."""
    return {"message": "Hello from FastAPI, running in Docker!"}


@app.get("/health")
def health_check():
    """Used by the pipeline / container to check the service is alive."""
    return {"status": "ok"}
