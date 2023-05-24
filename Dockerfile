# Use an official Python runtime as the base image
FROM python:3.8-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install the required dependencies
RUN apk --no-cache add build-base
RUN apk --no-cache add jpeg-dev zlib-dev
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Expose the port that the Flask app will listen on
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]

