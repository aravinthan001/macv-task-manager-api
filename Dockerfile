# 📄 File: Dockerfile (Final, Corrected Version)

FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# THIS IS THE NEW, CRITICAL LINE THAT FIXES THE IMPORT ERROR
ENV PYTHONPATH /app

# Copy and install requirements
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the rest of the application code
COPY . /app

# The command to run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]