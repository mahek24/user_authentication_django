# Use the official Python image from the Docker Hub as a base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /auth_system

# Install dependencies
COPY requirements.txt /auth_system/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . /auth_system/

# Expose port 8000 for the Django application
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
