# 📄 File: Dockerfile

# Use an official Python runtime as a parent image
# Using a specific version is good practice
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Set environment variables to prevent Python from writing .pyc files and to run in unbuffered mode
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies if any were needed (none for this project)
# RUN apt-get update && apt-get install -y ...

# Copy the requirements file into the container at /app
COPY ./requirements.txt /app/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the rest of the application's code into the container at /app
COPY . /app

# The command to run when the container starts.
# Note: We will override this in docker-compose.yml to run migrations first.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]