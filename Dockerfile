# Step 1: Start from a small official Python image
FROM python:3.12-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy only the dependency list first (keeps Docker's build cache efficient)
COPY requirements.txt .

# Step 4: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the application code
COPY app/ ./app/

# Step 6: Document which port the service listens on
EXPOSE 8000

# Step 7: Command to run when the container starts
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
